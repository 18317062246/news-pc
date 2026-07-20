/**
 * @Author: Steven.yu
 * @Description: 业务逻辑资讯模块
 * @CreateTime: 2020/07/02 09:36:34
 */
package com.news.web.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.google.common.collect.Lists;
import com.news.web.config.ApiConfig;
import com.news.web.config.BizComConfig;
import com.news.web.model.NewsRelated;
import com.news.web.model.NewsType;
import com.news.web.model.common.AopResult;
import com.news.web.model.common.CommonFootInfo;
import com.news.web.model.common.CommonHouseResult;
import com.news.web.model.esf.ESFResult;
import com.news.web.model.param.InsertLogParam;
import com.news.web.model.xiaoqu.XiaoQuResult;
import com.news.web.model.xinfang.XinfangResult;
import com.news.web.service.NewsService;
import com.news.web.util.CommonUtil;
import com.news.web.util.HttpUtil;
import com.news.web.util.StringResource;
import com.news.web.util.parser.NewsParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@SuppressWarnings("all")
@RequiredArgsConstructor
public class NewsServiceImpl implements NewsService {

    private final RestTemplate restTemplate;
    private final ApiConfig apiConfig;
    private final HttpUtil httpUtil;
    private final BizComConfig bizComConfig;

    @Value("${api.domain}")
    public String apiurl;
    @Value("${api.xinfang.other.city}")
    public String xinfangOtherCityAddress;
    @Value("${api.xinfang.sz.city}")
    public String xinfangSZCityAddress;
    @Value("${api.esf.other.city}")
    public String esfOtherCityAddress;
    @Value("${api.esf.sz.city}")
    public String esfSZCityAddress;
    @Value("${api.xiaoqu.other.city}")
    public String xiaoquOtherCityAddress;
    @Value("${api.xiaoqu.sz.city}")
    public String xiaoquSZCityAddress;

    @Value("${deal.url}")
    public String dealurl;


    private static final String RESULT = "Result";
    private static final String TOTAL = "Total";

    private static final String CITYEN = "cityen";
    private static final String LOCATION = "location";
    private static final String TYPE_ID = "typeid";
    /**
     * 是否存在房源信息
     */
    private static final String ARTICLE_LIST_IS_NULL = "请求文章列表为空=>{}";

    /**
     *
     * @param cityen 城市简称
     * @param location 位置信息
     * @return 通过城市简称和位置信息获取栏目列表
     */
    @Override
    public List<NewsType> typeList(String cityen, String location) {
        Map map = new HashMap();
        map.put(CITYEN, cityen);
        map.put("platform", "pc");
        map.put(LOCATION, location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl
                + "GetColumnList?cityen={cityen}&platform={platform}&location={location}", JSONObject.class, map);
        String data = JSON.toJSONString(jSONObject.get(RESULT));
        List<NewsType> types = JSON.parseArray(data, NewsType.class);
        if (CollectionUtils.isEmpty(types)) {
            log.error("请求栏目列表为空=>{}", types);
        }
        return types;
    }

    /**
     * @param cityen 城市简称
     * @return 根据城市简称获取成交走势信息
     */
    @SuppressWarnings("all")
    @Override
    public List<Map> getDealPathInfo(String cityen) {
        Map map = new HashMap();
        map.put("dg", 418);
        map.put("bj", 419);
        map.put("nj", 420);
        map.put("fs", 421);
        map.put("zq", 422);
        map.put("gz", 426);
        map.put("hz", 437);
        if (StringUtils.isEmpty(cityen)) {
            return null;
        }
        Integer dealNo = (Integer) map.get(cityen);
        JSONObject deal = restTemplate.getForObject(dealurl + "?mediaId=" + dealNo, JSONObject.class);
        List<Map> dealinfos = JSON.parseArray(JSON.toJSONString(deal.get(RESULT)), Map.class);
        if (null == dealinfos || dealinfos.isEmpty()) {
            return null;
        }
        return dealinfos;
    }

    /**
     * @param cityen 城市简称
     * @param typeIds 栏目id
     * @param page 当前页
     * @param pagesize 行数据
     * @param order 排序
     * @param key 关键字
     * @param location 位置信息
     * @return  获取指定栏目的资讯新闻列表信息
     */
    @Override
    public JSONObject newsList(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key, String location) {
        //获取指定栏目的资讯新闻列表信息
        JSONObject jSONObject = getNewListByType(cityen, typeIds, page,pagesize, order, key, location);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error(ARTICLE_LIST_IS_NULL, newsList);
        }
        return newsList;
    }

    @Override
    public JSONObject newsList(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key, String location, String mark) {
        //获取指定栏目的资讯新闻列表信息
        JSONObject jSONObject = getNewListByType(cityen, typeIds, page,pagesize, order, key, location,mark);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error(ARTICLE_LIST_IS_NULL, newsList);
        }
        return newsList;
    }

    /**
     * @param cityen 城市简称
     * @param typeIds 栏目id
     * @param page 当前页
     * @param pagesize 行数据
     * @param order 排序
     * @param key 关键字
     * @param location 位置信息
     * @return  获取指定栏目的资讯新闻的总条数
     */
    @Override
    public Integer getNewListByTypeTotal(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key, String location) {
        //获取指定栏目的资讯新闻列表信息
        JSONObject jSONObject = getNewListByType(cityen, typeIds, page,pagesize, order, key, location);
        Integer total = (Integer) jSONObject.get(TOTAL);
        return total;
    }

    /**
     * @param cityen 城市简称
     * @param typeIds 栏目id
     * @param page 当前页
     * @param pagesize 行数据
     * @param order 排序
     * @param key 关键字
     * @param location 位置信息
     * @return  获取指定栏目的资讯新闻列表信息
     */
    private JSONObject  getNewListByType(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key, String location) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        List<Integer> empty = new ArrayList<>();
        typeIds = ObjectUtils.isEmpty(typeIds) ? empty : typeIds;
        map.put(TYPE_ID, typeIds.toString().replaceAll("\\[", "").replaceAll("\\]", ""));
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        map.put("pubdate", CommonUtil.getCurrentMills());
        if (StringUtils.hasText(key)) {
            map.put(TYPE_ID, null);
        }
        map.put("title", key);
        map.put("description", key);
        map.put(LOCATION, location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=pc&typeid={typeid}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}&location={location}&pubdate={pubdate}"
                , JSONObject.class, map);
        return jSONObject;
    }

    private JSONObject getNewListByType(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key, String location ,String mark) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        List<Integer> empty = new ArrayList<>();
        typeIds = ObjectUtils.isEmpty(typeIds) ? empty : typeIds;
        map.put(TYPE_ID, typeIds.toString().replaceAll("\\[", "").replaceAll("\\]", ""));
        map.put("page", page);
        map.put("pagesize", pagesize);
        if (cityen.equals("sh")){
            order = 3;
        }
        map.put("order", order);
        map.put("pubdate", CommonUtil.getCurrentMills());
        if (StringUtils.hasText(key)) {
            map.put(TYPE_ID, null);
        }
        map.put("title", key);
        map.put("description", key);
        map.put(LOCATION, location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=pc&typeid={typeid}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}&location={location}&pubdate={pubdate}"
                , JSONObject.class, map);
        return jSONObject;
    }


    /**
     * @param cityen 城市简称
     * @param page 当前页
     * @param pagesize 行数据
     * @param desc 排序方式
     * @return 取最新的资讯列表信息
     */
    public  JSONObject newsList(String cityen, Integer page, Integer pagesize, Integer desc) {
        String serviceUrl = String.format(apiurl + "GetNewsList?cityen=%s&platform=pc&page=%s&pagesize=%s&isDesc=%s&pubdate=%s" , cityen , page , pagesize  , desc , CommonUtil.getCurrentMills());
        //发出http请求
        try {
            String json = httpUtil.get(serviceUrl);
            if(org.apache.commons.lang3.StringUtils.isNoneBlank(json)){
                AopResult<JSONObject> jsonObjectResult = JSON.parseObject(json , AopResult.class);
                JSONObject jSONObject = jsonObjectResult.getResult();
                return jSONObject;
            }else {
                return null;
            }
        } catch (IOException e) {
            return null;
        }
    }

    /**
     * @param cityen 城市简称
     * @param typeId 百科栏目id
     * @param location 位置信息
     * @param page 当前页
     * @param pagesize 行数据
     * @param order 排序
     * @param key 关键字
     * @returnc 获取百科数据列表信息
     */
    @Override
    public JSONObject newsListByBaike(String cityen, Integer typeId , String location, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        map.put(LOCATION, location);
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        map.put("title", key);
        map.put("description", key);
        map.put("pubdate", CommonUtil.getCurrentMills());

        if(!ObjectUtils.isEmpty(typeId)){
            map.put("typeid", typeId);
        }

        StringBuffer sql = new StringBuffer("GetNewsList?cityen={cityen}&platform=pc&location={location}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}&pubdate={pubdate}");
        if(!ObjectUtils.isEmpty(typeId)){
            sql.append("&typeid={typeid}");
        }
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        sql.toString()
                , JSONObject.class, map);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error(ARTICLE_LIST_IS_NULL, newsList);
        }
        return newsList;
    }

    /**
     * @param xinfangTypes 新房房源集合
     * @param cityen 城市简称
     * @return 通过新房房源集合获取新房房源信息
     */
    @Override
    public List<CommonHouseResult> getXinFangInfo(List<NewsRelated> xinfangTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = Lists.newArrayList();
        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();

        //定义一个服务接口，用于获取房源数据
        String serviceUrl;
        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的新房接口
            serviceUrl = xinfangSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = xinfangOtherCityAddress;
        }

        //循环新房集合,取出新房数据
        xinfangTypes.stream().forEach(l -> {
            map.put(CITYEN, cityen);
            map.put("EstExtId", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject(serviceUrl + "?cityen={cityen}&EstExtId={EstExtId}&platform=pc", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_LIST_IS_NULL, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                XinfangResult xinfangResult = JSON.parseObject(data, XinfangResult.class);
                if(!Objects.isNull(xinfangResult)){
                    xinfangResult.setNewsId(l.getNewsid());
                    xinfangResult.setOid(l.getOid());
                }
                resultList.add(new CommonHouseResult(xinfangResult , null , null));

            }
        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    /**
     * @param ershoufangTypes 二手房房源集合
     * @param cityen 城市简称
     * @return 通过二手房房源集合获取二手房房源信息
     */
    @Override
    @SuppressWarnings("all")
    public List<CommonHouseResult> getErshouFangInfo(List<NewsRelated> ershoufangTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = Lists.newArrayList();
        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);

        //定义一个服务接口，用于获取房源数据
        String serviceUrl;
        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的二手房接口
            serviceUrl = esfSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = esfOtherCityAddress;
        }

        //循环新房集合,取出新房数据
        ershoufangTypes.stream().forEach(l -> {
            map.put("adsNo", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject(serviceUrl + "?cityen={cityen}&AdsNo={adsNo}&platform=pc", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_LIST_IS_NULL, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                ESFResult esfResult = JSON.parseObject(data, ESFResult.class);
                if(!Objects.isNull(esfResult)){
                    //如果价格不为空，就对价格进行格式化
                    if(esfResult.getSalePrice() != null && esfResult.getSalePrice() > 0D) {
                        //将数据进行格式化
                        BigDecimal db = new BigDecimal(esfResult.getSalePrice());
                        String plainString = db.toPlainString();
                        String salePrice = plainString.substring(0, plainString.lastIndexOf("0000"));
                        esfResult.setSalePriceString(salePrice);
                        esfResult.setSalePrice(Double.parseDouble(salePrice));
                    }
                    esfResult.setNewsId(l.getNewsid());
                    esfResult.setOid(l.getOid());
                }
                //将esfResult添加到结果集中
                resultList.add(new CommonHouseResult(null , esfResult , null));
            }
        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    /**
     * @param xiaoquTypes 小区房源集合
     * @param cityen 城市简称
     * @return 通过小区房源集合获取小区房源信息
     */
    @Override
    public List<CommonHouseResult> getXiaoQuInfo(List<NewsRelated> xiaoquTypes , String cityen){
        //定义一个需要返回的集合对象
        List<CommonHouseResult> resultList = Lists.newArrayList();

        //访问接口需要传入的map
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        //定义一个服务接口，用于获取房源数据
        String serviceUrl;

        if(Objects.equals(cityen , "sz")){//如果是深圳，使用深圳的小区接口
            serviceUrl = xiaoquSZCityAddress;
        }else {//否则就使用其他城市公用的新房接口
            serviceUrl = xiaoquOtherCityAddress;
        }

        //循环新房集合,取出新房数据
        xiaoquTypes.stream().forEach(l -> {
            map.put("estateCode", l.getOid());
            JSONObject jSONObject = restTemplate.getForObject(serviceUrl + "?cityen={cityen}&EstateCode={estateCode}&platform=pc&ImageWidth=375&ImageHeight=250", JSONObject.class, map);
            JSONObject newsList = jSONObject.getJSONObject(RESULT);
            if (CollectionUtils.isEmpty(newsList)) {
                log.error(ARTICLE_LIST_IS_NULL, newsList);
            }
            if(!CollectionUtils.isEmpty(newsList)){
                String data = JSON.toJSONString(jSONObject.get(RESULT));
                XiaoQuResult xiaoQuResult = JSON.parseObject(data, XiaoQuResult.class);
                if(!Objects.isNull(xiaoQuResult)){
                    //如果价格不为空，就对价格进行格式化
                    if(xiaoQuResult.getSaleAvgPrice() != null && xiaoQuResult.getSaleAvgPrice() > 0D) {
                        //将数据进行格式化
                        //对平均价进行四舍五入
                        long saleAvgPrice = Math.round(xiaoQuResult.getSaleAvgPrice());
                        xiaoQuResult.setSaleAvgPriceString(saleAvgPrice);
                    }

                    xiaoQuResult.setOid(l.getOid());
                }
                //将esfResult添加到结果集中
                resultList.add(new CommonHouseResult(null , null , xiaoQuResult));
            }

        });
        //将结果集进行过滤
        List<CommonHouseResult> results = resultList.stream().filter(Objects::nonNull).collect(Collectors.toList());
        return CollectionUtils.isEmpty(results) ? Collections.emptyList() : results;
    }

    @Override
    public void insertLog(HttpServletRequest request , String cityShort, Integer newsId , String title , String downloadChannel) {
        //获取请求头
        String ua = request.getHeader(StringResource.USER_AGENT);
        String cityCode = "";
        String appName = "";
        String userId = "";
        String jPushId = "";
        String postId = "";
        String sourceChild = " ";
        String trackId = "";
        Integer begin = 0;
        Integer end = 0;
        String oringUri = request.getRequestURI();
        cityCode = StringResource.getCityCode(cityShort);
        //获取用户ip
        String ClientIP = request.getRemoteAddr();
        //那cookie中的信息
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies
            ) {
                //获取UserID
                if (c.getName().equals(StringResource.CK_USER) || c.getName().equals(StringResource.CK_USER_WAP)) {
                    String value = c.getValue();
                    begin = value.indexOf(StringResource.BIG_U);
                    end = value.indexOf(StringResource.AND);
                    userId = value.substring(begin, end);
                }
                //获取trackID
                if (c.getName().equals(StringResource.COOKIE_NAME)) {
                    trackId = c.getValue();
                }
            }
        }
        //获取AppName
        if (ua.contains(StringResource.WINDOWS) || ua.contains(StringResource.INTEL_MAC_OS)) {
            appName = StringResource.PC;
        } else if (ua.contains(StringResource.LIKE_MAC_OS) || ua.contains(StringResource.ANDROID)) {
            if (ua.contains(StringResource.SALE_HOUSE) && ua.contains(StringResource.LIKE_MAC_OS)) {
                appName =StringResource.APP_IOS;
            } else if (ua.contains(StringResource.SALE_HOUSE) && ua.contains(StringResource.ANDROID)) {
                appName = StringResource.APP_ANDROID;
            } else if (ua.contains(StringResource.MICRO_MESSENGER)) {
                appName = StringResource.WE_CHAT;
            } else {
                appName = StringResource.WAP;
            }
        }
        //封装对象
        InsertLogParam param = NewsParser.build(appName , cityCode , ClientIP , jPushId , String.valueOf(newsId) , postId , sourceChild , trackId , userId , title , downloadChannel);
        try{
            String abc=httpUtil.post(String.format(StringResource.INSERT_VIEW_HISTORY_REQUEST_BY_RABBIT , apiConfig.getUrl()) , param);
        } catch (IOException e) {

        }
    }

    @Override
    public CommonFootInfo getFootInfo(String cityen) {
        // 新增ccdata biz后台并无此城市 由于配置统一直接读取上海城市配置
        if ("ccdata".equals(cityen)){
            cityen = "sh";
        }
        try {
            String json = httpUtil.get(String.format(bizComConfig.getFootUrl(), cityen));
            return JSON.parseObject(json, new TypeReference<AopResult<CommonFootInfo>>() {
            }).getResult();
        } catch (IOException e) {
            return null;
        }
    }
}
