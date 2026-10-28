package com.news.web.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import java.util.*;

/** JSON boundary for the Nuxt client. Existing JSP routes remain available. */
@RestController
@RequestMapping("/pc-api/v1/{city}")
public class PcApiController {
    private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(PcApiController.class);
    private final RestTemplate restTemplate;
    private final String apiDomain;
    private final Set<String> blockedCities;
    public PcApiController(RestTemplate restTemplate, @Value("${api.domain}") String apiDomain,
                           @Value("${notallow.citys:}") String blockedCities) {
        this.restTemplate = restTemplate;
        this.apiDomain = apiDomain.endsWith("/") ? apiDomain : apiDomain + "/";
        this.blockedCities = new HashSet<>(Arrays.asList(blockedCities.split(",")));
    }
    private void validateCity(String city) {
        if (!city.matches("[a-z]{2,12}") || blockedCities.contains(city))
            throw new ApiFailure(HttpStatus.NOT_FOUND, "该城市暂未开放");
    }
    private JSONObject fetch(String city, String path, Map<String, Object> params) {
        validateCity(city);
        UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(apiDomain + path)
                .queryParam("cityen", city).queryParam("platform", "pc");
        params.forEach((key, value) -> { if (value != null) uri.queryParam(key, value); });
        JSONObject result = restTemplate.getForObject(uri.build().encode().toUri(), JSONObject.class);
        if (result == null || Boolean.FALSE.equals(result.getBoolean("Success")) || !result.containsKey("Result"))
            throw new ApiFailure(HttpStatus.BAD_GATEWAY, "资讯数据暂时不可用");
        return result;
    }
    @GetMapping("/columns")
    public Map<String, Object> columns(@PathVariable String city) {
        JSONArray columns = fetch(city, "getcolumnlist", Collections.emptyMap()).getJSONArray("Result");
        if (columns == null) columns = new JSONArray();
        // Match the existing Beijing homepage's hidden office column.
        if ("bj".equals(city)) {
            for (int i = columns.size() - 1; i >= 0; i--) {
                if (Integer.valueOf(659).equals(columns.getJSONObject(i).getInteger("Id"))) columns.remove(i);
            }
        }
        return Collections.singletonMap("columns", columns);
    }
    @GetMapping("/news")
    public Map<String, Object> news(@PathVariable String city,
            @RequestParam(defaultValue="1") int page, @RequestParam(defaultValue="10") int pageSize,
            @RequestParam(required=false) Integer typeId, @RequestParam(defaultValue="") String keyword) {
        if (page < 1 || page > 10000 || pageSize < 1 || pageSize > 50 || keyword.length() > 100 || (typeId != null && typeId < 1))
            throw new ApiFailure(HttpStatus.BAD_REQUEST, "分页或搜索参数不正确");
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("page", page); params.put("pagesize", pageSize); params.put("upper", 1);
        params.put("order", 0); params.put("isdesc", 1);
        params.put("typeid", keyword.trim().isEmpty() ? typeId : null);
        if (!keyword.trim().isEmpty()) params.put("title", keyword.trim());
        JSONObject response = fetch(city, "getnewslist", params);
        JSONObject data = response.getJSONObject("Result");
        if (data == null) throw new ApiFailure(HttpStatus.BAD_GATEWAY, "资讯数据格式异常");
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("items", data.getJSONArray("NewsList") == null ? Collections.emptyList() : data.getJSONArray("NewsList"));
        result.put("total", response.getInteger("Total") == null ? 0 : response.getInteger("Total"));
        result.put("page", page); result.put("pageSize", pageSize);
        return result;
    }
    @GetMapping("/news/{id}")
    public Map<String, Object> detail(@PathVariable String city, @PathVariable long id) {
        if (id < 1 || id > Integer.MAX_VALUE) throw new ApiFailure(HttpStatus.BAD_REQUEST, "文章编号不正确");
        JSONObject response = fetch(city, "getnewscontent", Collections.singletonMap("newsid", id));
        JSONObject article = response.getJSONObject("Result");
        if (article == null || article.getString("Title") == null || article.getString("Title").trim().isEmpty())
            throw new ApiFailure(HttpStatus.NOT_FOUND, "文章不存在");
        if (Integer.valueOf(0).equals(article.getInteger("Upper")))
            throw new ApiFailure(HttpStatus.GONE, "文章已下架");
        return Collections.singletonMap("article", article);
    }
    // Keep API errors out of the legacy JSP ControllerAdvice.
    @ExceptionHandler(ApiFailure.class)
    public ResponseEntity<Map<String, String>> failure(ApiFailure e) {
        return ResponseEntity.status(e.status).body(Collections.singletonMap("message", e.getMessage()));
    }
    @ExceptionHandler(RestClientException.class)
    public ResponseEntity<Map<String, String>> unavailable(RestClientException e) {
        return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(Collections.singletonMap("message", "资讯服务连接失败，请稍后再试"));
    }
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, String>> invalid(Exception e) {
        log.error("PC API request failed", e);
        HttpStatus status = e instanceof org.springframework.web.method.annotation.MethodArgumentTypeMismatchException
                ? HttpStatus.BAD_REQUEST : HttpStatus.BAD_GATEWAY;
        return ResponseEntity.status(status).body(Collections.singletonMap("message", status == HttpStatus.BAD_REQUEST ? "请求参数不正确" : "资讯服务响应异常"));
    }
    private static class ApiFailure extends RuntimeException {
        final HttpStatus status;
        ApiFailure(HttpStatus status, String message) { super(message); this.status = status; }
    }
}
