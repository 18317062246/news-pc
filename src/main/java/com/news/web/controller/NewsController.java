package com.news.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.news.web.model.NewsType;
import com.news.web.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 咨询
 */
@Slf4j
@Controller
public class NewsController {


    @Autowired
    private RestTemplate restTemplate;
    @Value("${api.domain}")
    public String apiurl;
    @Value("${static.url}")
    public String staticurl;
    @Value("${static.version}")
    public String ver;
    @Value("${deal.url}")
    public String dealurl;
    @Value("${deal.citys}")
    public String dealCitys;

    private static final String GUANG_ZHOU = "gz";
    private static final String WU_HAN = "wh";
    private static final String CHANG_SHA = "cs";
    private static final String NEWS_LIST = "NewsList";
    private static final String RESULT = "Result";
    private static final String PUBLIC_COL = "东三省共用频道";
    private static final String LOOP = "轮播广告位";
    /**
     * 热门专题
     */
    private static final String HOT = "热门专题";
    private static final String RIGHT = "right";
    private static final String BAIKE = "baike";
    private static final String CENTANET = "jtyy";


    /**
     * @param: cityen 城市
     * @param: type 文章类型
     * @description: 资讯城市首页
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-26
     */
    @GetMapping(value = {"/{cityen}", "/{cityen}/c{type}"})
    public String index(Model model,
                        @PathVariable(name = "cityen") String cityen,
                        @PathVariable(name = "type", required = false) Integer type) {
        setCommon(model, cityen);
        //获取栏目类型
        List<NewsType> types = typeList(cityen, null);
        List<NewsType> jtTypes = typeList(CENTANET, null);
        if (types.isEmpty()) {
            log.error("栏目类型空值=>{}", cityen);
            return "index";
        }
        List<NewsType> baiketype = typeList(cityen, "baike");
        model.addAttribute("baiketype", !baiketype.isEmpty());
        //过滤右侧栏目type
        List<NewsType> rightType = new ArrayList<>();
        rightType = types.stream().filter(t -> RIGHT.equals(t.getLocation())).collect(Collectors.toList());

        List<Map> leftNews = new ArrayList<>();
        for (NewsType t : types) {
            if (!RIGHT.equals(t.getLocation())) {
                //栏目id获取左侧文章列表
                JSONObject result = newsList(cityen, Arrays.asList(t.getId()), 1, 10, null, null);
                if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                    List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
                    leftNews.addAll(news);
                }
            }
        }

        //右侧上部文章
        List<NewsType> rightTypeAdd=new ArrayList<>();
        List<Map> rightNews = new ArrayList<>();
        for(NewsType right:rightType){
            if(PUBLIC_COL.equals(right.getColumnsName())){
                for(NewsType ri:right.getChildList()){
                    rightTypeAdd.add(ri);
                }
                continue;
            }
            rightTypeAdd.add(right);
        }
        rightTypeAdd.forEach(item -> {
            JSONObject right = newsList(cityen, Arrays.asList(item.getId()), 1, 10, null, null);
            if (!ObjectUtils.isEmpty(right.get(NEWS_LIST))) {
                rightNews.addAll(JSON.parseArray(JSON.toJSONString(right.get(NEWS_LIST)), Map.class));
            }
        });
        //右侧下部集团jt文章
        List<Map> centaNews = new ArrayList<>();
        if (null != jtTypes && !jtTypes.isEmpty()) {
            List<NewsType> jt = jtTypes.get(0).getChildList();
            //rightType.addAll(jt);
            for (NewsType t : jt) {
                JSONObject right = newsList(CENTANET, Arrays.asList(t.getId()), 1, 5, null, null);
                if (!ObjectUtils.isEmpty(right.get(NEWS_LIST))) {
                    centaNews.addAll(JSON.parseArray(JSON.toJSONString(right.get(NEWS_LIST)), Map.class));
                }
            }
        }
            /*rightNews.forEach(item->{
                if(item.get(""))
            });*/
        model.addAttribute("rightNews", rightNews);
        model.addAttribute("centaNews", centaNews);
        //}
        //成交走势信息
        if (dealCitys.contains(cityen)) {
            Map dealinfo = getDealPathInfo(cityen);
            model.addAttribute("dealinfo", dealinfo);
        }
        model.addAttribute("types", types);
        model.addAttribute("jtTypes", jtTypes);
        model.addAttribute("rightType", rightTypeAdd);
        model.addAttribute("tabtype", types.get(0).getId());
        model.addAttribute("news", leftNews);
        if (GUANG_ZHOU.equals(cityen)) {
            //广州资讯主页
            return "index_gz";
        }
        return "index";
    }

    /**
     * 获取成交走势
     *
     * @param cityen
     * @return
     */
    private Map getDealPathInfo(String cityen) {
        Map map = new HashMap();
        map.put("dg", 418);
        map.put("bj", 419);
        map.put("nj", 420);
        map.put("fs", 421);
        map.put("zq", 422);
        if (StringUtils.isEmpty(cityen)) {
            return null;
        }
        Integer dealNo = (Integer) map.get(cityen);
        JSONObject deal = restTemplate.getForObject(dealurl + "?mediaId=" + dealNo, JSONObject.class);
        List<Map> dealinfos = JSON.parseArray(JSON.toJSONString(deal.get(RESULT)), Map.class);
        if (null == dealinfos || dealinfos.isEmpty()) {
            return null;
        }
        return dealinfos.get(0);
    }

    /**
     * @param: null
     * @description: 公共变量
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-27
     */
    private void setCommon(Model model, String cityen) {
        model.addAttribute("cityen", cityen);
        //model.addAttribute("citys", citylist);
        model.addAttribute("staticurl", staticurl);
        model.addAttribute("ver", ver);
        model.addAttribute("citycn", citymap(cityen));

    }

    private String citymap(String cityen) {
        Map map = new HashMap();
        map.put("bj", "北京");
        map.put("tj", "天津");
        map.put("gz", "广州");
        map.put("sz", "深圳");
        map.put("cd", "成都");
        map.put("cq", "重庆");
        map.put("nj", "南京");
        map.put("wh", "武汉");
        map.put("hz", "惠州");
        map.put("cc", "长春");
        map.put("dl", "大连");
        map.put("sy", "沈阳");
        map.put("dg", "东莞");
        map.put("nn", "南宁");
        map.put("fs", "佛山");
        map.put("hrb", "哈尔滨");
        map.put("xm", "厦门");
        map.put("wx", "无锡");
        map.put("xy", "无锡");
        map.put("zh", "无锡");
        map.put("cs", "长沙");
        map.put("zj", "镇江");
        map.put("ganzhou", "赣州");
        map.put("hf", "合肥");
        map.put("jn", "济南");
        map.put("km", "昆明");
        map.put("nb", "宁波");
        map.put("xa", "西安");
        map.put("zs", "中山");
        map.put("zq", "肇庆");
        map.put("zz", "无锡");
        String citycn = (String) map.get(cityen);
        return citycn;
    }

    /**
     * @param model
     * @param cityen 城市编号
     * @param type   栏目类型编号
     * @param page   页码
     * @return
     */
    @GetMapping(value = {"/{cityen}/list/c{type}/p{page}", "/{cityen}/list", "/{cityen}/list/c{type}"})
    public String index(Model model
            , @PathVariable(name = "cityen") String cityen
            , @PathVariable(name = "type", required = false) Integer type
            , @PathVariable(name = "page", required = false) Integer page
            , @RequestParam(value = "key", required = false) String key
            , @RequestParam(value = "pagesize", defaultValue = "10", required = false) Integer pagesize) {
      /*  model.addAttribute("cityen", cityen);
        model.addAttribute("staticurl", staticurl);*/
        setCommon(model, cityen);
        log.info("search btn=>{}", key);
        if (StringUtils.isEmpty(page)) {
            page = 1;
        }
        //获取栏目类型
        List<NewsType> types = typeList(cityen, null);
        List<NewsType> currTypes = types.stream().filter(t -> t.getId().equals(type)).collect(Collectors.toList());
        if (currTypes != null && !currTypes.isEmpty()) {
            model.addAttribute("colName", currTypes.get(0).getColumnsName());
        }
        List<Integer> typeid = new ArrayList<>(Arrays.asList(type));
        //文章列表
        JSONObject result = newsList(cityen, typeid, page, pagesize, null, key);
        if (ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
            log.info("当前城市未获取到新闻列表,尝试jtyy获取=>{}", cityen);
            result = newsList(CENTANET, typeid, page, pagesize, null, key);
        }
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        //是否有百科栏目
        List<NewsType> baiketype = typeList(cityen, "baike");
        model.addAttribute("baiketype", !baiketype.isEmpty());
        //toplist
        JSONObject top = newsList(cityen, null, page, pagesize, 1, null);
        List<Map> topList = JSON.parseArray(JSON.toJSONString(top.get(NEWS_LIST)), Map.class);
        Integer pageCount = result.getInteger("PageTotal");
        model.addAttribute("news", news);
        model.addAttribute("topList", topList);
        model.addAttribute("type", type);
        model.addAttribute("key", key);
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute("p", p);
        return "news_list";
    }

    /**
     * @param: 城市编号
     * @description: 栏目列表接口
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-26
     */
    private List<NewsType> typeList(String cityen, String location) {
        Map map = new HashMap();
        map.put("cityen", cityen);
        map.put("platform", "pc");
        map.put("location", location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl
                + "GetColumnList?cityen={cityen}&platform={platform}&location={location}", JSONObject.class, map);
        String data = JSON.toJSONString(jSONObject.get(RESULT));
        List<NewsType> types = JSON.parseArray(data, NewsType.class);
        if (types.isEmpty()) {
            log.error("请求栏目列表为空=>{}", types);
        }
        return types;
    }

    /**
     * @param: cityen 城市
     * @description: 默认资讯列表
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-25
     */
    private JSONObject newsList(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put("cityen", cityen);
        List<Integer> empty = new ArrayList<>();
        typeIds = ObjectUtils.isEmpty(typeIds) ? empty : typeIds;
        map.put("typeid", typeIds.toString().replaceAll("\\[", "").replaceAll("\\]", ""));
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        if (StringUtils.hasText(key)) {
            map.put("typeid", null);
        }
        map.put("title", key);
        map.put("description", key);
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=pc&typeid={typeid}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}"
                , JSONObject.class, map);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error("请求文章列表为空=>{}", newsList);
        }
        return newsList;
    }

    /**
     * @param: cityen 城市
     * @description: 详情
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-22
     */
    @GetMapping("/{cityen}/detail/{id}.html")
    public String detail(Model model
            , @PathVariable("cityen") String cityen
            , @PathVariable("id") String id) {
        log.info("detail id=>{}", id);
        setCommon(model, cityen);
        //热点排行
        JSONObject newsList = newsList(cityen, null, 1, 10, 1, null);
        List<Map> news = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);
        //详情信息
        JSONObject result = restTemplate.getForObject(apiurl + "GetNewsContent?newsid=" + id + "&cityen=bj&platform=pc", JSONObject.class);
        JSONObject detail = result.getJSONObject(RESULT);
        //热门专题
        List<NewsType> types = typeList(cityen, "right");
        types.forEach(item -> {
            if (HOT.equals(item.getColumnsName())) {
                Integer typeid = item.getId();
                JSONObject list = newsList(cityen, Arrays.asList(typeid), 1, 10, null, null);
                List<Map> infoNews = new ArrayList<>();
                if (!ObjectUtils.isEmpty(list.get(NEWS_LIST))) {
                    infoNews = JSON.parseArray(JSON.toJSONString(list.get(NEWS_LIST)), Map.class);
                }
                model.addAttribute("infoNews", infoNews);
                model.addAttribute("hotType", item.getId());
            }
        });

        if (!ObjectUtils.isEmpty(detail.get("Url"))) {
            return "redirect:" + detail.get("Url");
        }
        model.addAttribute("news", news);
        model.addAttribute("detail", detail);
        return "detail";
    }

    /**
     * @param: type 文章类型
     * @description: 百科
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-27
     */
    @GetMapping(value = {"/{cityen}/baike", "/{cityen}/baike/c{type}/p{page}"})
    public String baike(Model model, @PathVariable("cityen") String cityen,
                        @PathVariable(value = "type", required = false) Integer type,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize) {
        page = ObjectUtils.isEmpty(page) ? 1 : page;
        //栏目类型
        List<NewsType> types = typeList(cityen, "baike");
        List<NewsType> baikeTypes = new ArrayList<>();
        if (null != types && !types.isEmpty()) {
            baikeTypes = types.get(0).getChildList();
        }
        if(!baikeTypes.isEmpty() && baikeTypes.size()>1){
            type = ObjectUtils.isEmpty(type) ? types.get(0).getChildList().get(0).getId() : type;
        }else if(baikeTypes.size()==1){
            //东北sy,cc,dl,hrb层级结构不一样
            type = ObjectUtils.isEmpty(type) ? baikeTypes.get(0).getChildList().get(0).getId() : type;
        }
        List<Integer> typeid = new ArrayList<>(Arrays.asList(type));
        //文章列表
        JSONObject result = newsList(cityen, typeid, page, pagesize, null, null);
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        setCommon(model, cityen);
        model.addAttribute("types", baikeTypes);
        model.addAttribute("typeid", 5);
        model.addAttribute("news", news);
        Integer pageCount = result.getInteger("PageTotal");
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute("p", p);
        return "baike";
    }
}
