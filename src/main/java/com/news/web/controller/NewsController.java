package com.news.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.news.web.model.NewsType;
import com.news.web.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
                        @PathVariable(name = "type", required = false) Integer type, HttpServletRequest request) {

        setCommon(model, cityen);
        //获取session
        HttpSession session = request.getSession();
        //获取栏目类型
        List<NewsType> types = typeList(cityen, null);
        List<NewsType> jtTypes = typeList(CENTANET, null);
        if (types.isEmpty()) {
            log.error("栏目类型空值=>{}", cityen);
            return "index";
        }
        List<NewsType> baiketype = typeList(cityen, "baike");
        model.addAttribute("baiketype", !baiketype.isEmpty());
        //将城市是否存在baike存在session当中
        session.setAttribute("baiketype", !baiketype.isEmpty());
        //过滤右侧栏目type
        List<NewsType> rightType = new ArrayList<>();
        rightType = types.stream().filter(t -> RIGHT.equals(t.getLocation())).collect(Collectors.toList());

        List<Map> leftNews = new ArrayList<>();
        for (NewsType t : types) {
            if (!RIGHT.equals(t.getLocation())) {
                //栏目id获取左侧文章列表
                JSONObject result = newsList(cityen, Arrays.asList(t.getId()), 1, 10, null, null, null);
                if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                    List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
                    leftNews.addAll(news);
                }
            }
        }

        //右侧上部文章
        List<NewsType> rightTypeAdd = new ArrayList<>();
        List<Map> rightNews = new ArrayList<>();
        for (NewsType right : rightType) {
            if (PUBLIC_COL.equals(right.getColumnsName())) {
                for (NewsType ri : right.getChildList()) {
                    rightTypeAdd.add(ri);
                }
                continue;
            }
            rightTypeAdd.add(right);
        }
        rightTypeAdd.forEach(item -> {
            JSONObject right = newsList(cityen, Arrays.asList(item.getId()), 1, 10, null, null, null);
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
                JSONObject right = newsList(CENTANET, Arrays.asList(t.getId()), 1, 5, null, null, null);
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
        model.addAttribute("cityTelphone", cityTelphone(cityen));


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
        map.put("xy", "襄阳");
        map.put("zh", "珠海");
        map.put("cs", "长沙");
        map.put("zj", "杭州");
        map.put("ganzhou", "赣州");
        map.put("hf", "合肥");
        map.put("jn", "济南");
        map.put("km", "昆明");
        map.put("nb", "宁波");
        map.put("xa", "西安");
        map.put("zs", "中山");
        map.put("zq", "肇庆");
        map.put("zz", "郑州");
        String citycn = (String) map.get(cityen);
        return citycn;
    }

    private String cityTelphone(String cityen) {
        Map map = new HashMap();
        map.put("bj", "400-812-5166");
        map.put("tj", "4008-985-666");
        map.put("gz", "4008-103-313");
        map.put("sz", "4008-192-186");
        map.put("cd", "400-028-8484");
        map.put("cq", "4008-110-117");
        map.put("nj", "400-876-6988");
        map.put("wh", "400-810-0188");
        map.put("hz", "400-819-6038");
        map.put("cc", "400-819-0218");
        map.put("dl", "400-810-0596");
        map.put("sy", "400-810-8620");
        map.put("dg", "400-815-1699");
        map.put("nn", "400-819-3688");
        map.put("fs", "400-819-8990");
        map.put("hrb", "400-819-7123");
        map.put("xm", "400-819-7679");
        map.put("wx", "400-928-0668");
        map.put("xy", "400-810-0188");
        map.put("zh", "400-819-0196");
        map.put("cs", "400-810-0388");
        map.put("zj", "400-819-7103");
        map.put("ganzhou", "400-819-6038");
        map.put("hf", "0551-65667801");
        map.put("jn", "0531-86922966");
        map.put("km", "0871-63193010");
        map.put("nb", "0574-87289000");
        map.put("xa", "029-81773952");
        map.put("zs", "88231922-880");
        map.put("zq", "400-819-8990");
        map.put("zz", "0371-66375760");
        map.put("nc", "0791-86296696");
        map.put("fz", "400-819-8990");
        String cityTelphone = (String) map.get(cityen);
        return cityTelphone;
    }


    /**
     * @param model
     * @param cityen 城市编号
     * @param type   栏目类型编号
     * @param page   页码
     * @return
     */
    @GetMapping(value = {"/{cityen}/list/c{type}/p{page}", "/{cityen}/list", "/{cityen}/list/c{type}", "/{cityen}/list/p{page}"})
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
        //判断当前的分类id是否和当前城市右侧栏目的id相等，若相等，就取出对应的栏目名称
        List<NewsType> currTypes = types.stream().filter(t -> t.getId().equals(type)).collect(Collectors.toList());
        if (currTypes != null && !currTypes.isEmpty()) {
            model.addAttribute("colName", currTypes.get(0).getColumnsName());
        }

        //获取集团资讯的栏目类型
        List<NewsType> jtyyTypes = typeList("jtyy", null);
        //判断当前的分类id是否和集团右侧栏目的id相等，若相等，就取出对应的栏目名称
        List<NewsType> jtyyCurrTypes = jtyyTypes.get(0).getChildList().stream().filter(t -> t.getId().equals(type)).collect(Collectors.toList());
        if (jtyyTypes != null && !jtyyCurrTypes.isEmpty()) {
            model.addAttribute("colName", jtyyCurrTypes.get(0).getColumnsName());
        }

        List<Integer> typeid = new ArrayList<>(Arrays.asList(type));

        //判断是否为热门专题
        Integer hotTypeId = types.stream().filter(l -> l.getColumnsName().equals("热门专题")).mapToInt(NewsType::getId).sum();
        //如果是热门专题，默认取8条数据
        if (hotTypeId != null && hotTypeId > 0 && hotTypeId.equals(type)) {
            pagesize = 8;
        }
        //文章列表
        JSONObject result = newsList(cityen, typeid, page, pagesize, null, key, null);
        if (ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
            log.info("当前城市未获取到新闻列表,尝试jtyy获取=>{}", cityen);
            result = newsList(CENTANET, typeid, page, pagesize, null, key, null);
        }
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        //是否有百科栏目
        List<NewsType> baiketype = typeList(cityen, "baike");
        model.addAttribute("baiketype", !baiketype.isEmpty());
        //toplist
        JSONObject top = newsList(cityen, null, page, pagesize, 1, null, null);
        List<Map> topList = JSON.parseArray(JSON.toJSONString(top.get(NEWS_LIST)), Map.class);
        Integer pageCount = result.getInteger("PageTotal");
        model.addAttribute("news", news);
        model.addAttribute("topList", topList);
        model.addAttribute("type", type);
        model.addAttribute("key", key);
        model.addAttribute("page", page);
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        System.out.println("p = " + p);
        model.addAttribute("p", p);


        //如果是热门专题，跳往热门专题列表
        if (hotTypeId != null && hotTypeId > 0 && hotTypeId.equals(type)) {
            return "topic_list";
        }
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
    private JSONObject newsList(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key, String location) {
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
        map.put("location", location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=pc&typeid={typeid}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}&location={location}"
                , JSONObject.class, map);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error("请求文章列表为空=>{}", newsList);
        }
        return newsList;
    }

    /**
     * @param: cityen 城市
     * @description: 默认百科资讯列表
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-25
     */
    private JSONObject newsListByBaike(String cityen, String location, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put("cityen", cityen);
        map.put("location", location);
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        if (StringUtils.hasText(key)) {
            map.put("typeid", null);
        }
        map.put("title", key);
        map.put("description", key);
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=pc&location={location}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}"
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
            , @PathVariable("id") String id, HttpServletRequest request) {
        log.info("detail id=>{}", id);

        //获取session
        HttpSession session = request.getSession();
        //从session中获取是否存在百科
        List<NewsType> baiketype = typeList(cityen, "baike");
        model.addAttribute("baiketype", !baiketype.isEmpty());

        setCommon(model, cityen);
        //热点排行
        JSONObject newsList = newsList(cityen, null, 1, 10, 1, null, null);
        List<Map> news = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);
        //详情信息
        JSONObject result = restTemplate.getForObject(apiurl + "GetNewsContent?newsid=" + id + "&cityen=bj&platform=pc", JSONObject.class);
        JSONObject detail = result.getJSONObject(RESULT);
        //热门专题
        List<NewsType> types = typeList(cityen, "right");
        types.forEach(item -> {
            if (HOT.equals(item.getColumnsName())) {
                Integer typeid = item.getId();
                JSONObject list = newsList(cityen, Arrays.asList(typeid), 1, 10, null, null, null);
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
    @GetMapping(value = {"/{cityen}/baike", "/{cityen}/baike/c{type}/p{page}", "/{cityen}/baike/p{page}"})
    public String baike(Model model, @PathVariable("cityen") String cityen,
                        @PathVariable(value = "type", required = false) Integer type,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize, HttpServletRequest request) {

        //获取session
        HttpSession session = request.getSession();


        page = ObjectUtils.isEmpty(page) ? 1 : page;
        //栏目类型
        List<NewsType> types = typeList(cityen, "baike");
        model.addAttribute("baiketype", !types.isEmpty());
        List<NewsType> baikeTypes = new ArrayList<>();
        if (null != types && !types.isEmpty()) {
            baikeTypes = types.get(0).getChildList();
        }

        if (!baikeTypes.isEmpty() && baikeTypes.size() > 1) {
            type = ObjectUtils.isEmpty(type) ? null : type;
        } else if (baikeTypes.size() == 1) {
            //东北sy,cc,dl,hrb层级结构不一样
            type = ObjectUtils.isEmpty(type) ? null : type;
        }

        //文章列表
        JSONObject result;
        if (type != null) {//type不为空，正常去取
            List<Integer> typeid = new ArrayList<>(Arrays.asList(type));
            //文章列表
            result = newsList(cityen, typeid, page, pagesize, null, null, null);

            //定义栏目名称集合
            List<String> typeNameList = Lists.newArrayList();
            //取出栏目名称
            Integer finalType = type;
            types.get(0).getChildList().stream().forEach(l -> {
                //判断id是否和type相等,相等就取出对应的栏目名称
                if (Objects.equals(finalType, l.getId())) typeNameList.add(l.getColumnsName());
                //如果是子集对象，取出子级
                List<NewsType> newsTypes = JSONArray.parseArray(JSON.toJSONString(l.getChildList()), NewsType.class);
                //循环遍历子级，查询是否相等
                newsTypes.stream().forEach(k -> {
                    //判断id是否和type相等,相等就取出对应的栏目名称
                    if (Objects.equals(finalType, k.getId())) typeNameList.add(k.getColumnsName());
                    //如果是子集对象，取出子级
                    List<NewsType> newsTypesTemp = JSONArray.parseArray(JSON.toJSONString(k.getChildList()), NewsType.class);
                    if (!CollectionUtils.isEmpty(newsTypesTemp)) {
                        //循环遍历子级，查询是否相等
                        newsTypesTemp.stream().forEach(m -> {
                            //判断id是否和type相等,相等就取出对应的栏目名称
                            if (Objects.equals(finalType, m.getId())) typeNameList.add(m.getColumnsName());
                        });
                    }
                });
            });
            //存储栏目id
            model.addAttribute("typeid", type);

            //存储栏目名称
            model.addAttribute("typeName", typeNameList.get(0));
        } else {//type为空，默认取出百科数据了

            result = newsListByBaike(cityen, "baike", page, pagesize, null, null);

            //如果新闻列表有数据，存在对应的栏目id
            List<Map> news1 = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
            if (!CollectionUtils.isEmpty(news1)) {
                //获取栏目名称
                String typeName = (String) news1.get(0).get("TypeName");
                //存储栏目id
                model.addAttribute("typeid", 0);
                //存储栏目名称
                model.addAttribute("typeName", typeName);
            }
        }
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        setCommon(model, cityen);

        model.addAttribute("types", baikeTypes);
        //存储百科左侧栏目大小
        model.addAttribute("typesSize", baikeTypes.size());

        model.addAttribute("news", news);
        Integer pageCount = result.getInteger("PageTotal");
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute("p", p);
        model.addAttribute("page", page);
        return "baike";
    }

    /**
     * @param: 嵌入页面
     * @description: TODO
     * @return:
     * @author: zouyuan1
     * @date: 2020-06-12
     */
    @GetMapping("/{cityen}/detail/third_{type}.html")
    public String thirdInfo(Model model,
                            @PathVariable("cityen") String cityen,
                            @PathVariable(value = "type", required = false) String type) {
        setCommon(model, cityen);
        //栏目类型
        List<NewsType> types = typeList(cityen, null);
        List<Map> leftUp = new ArrayList<>();
        List<Map> leftDown = new ArrayList<>();
        List<Map> right = new ArrayList<>();
        List<Map> news = new ArrayList<>();
        for (int i = 0; i < types.size(); i++) {
            //文章列表
            List<Integer> typeid = new ArrayList<>(Arrays.asList(types.get(i).getId()));
            JSONObject result = newsList(cityen, typeid, 1, 10, null, null, null);
            if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                switch (i) {
                    case 0:
                        leftUp.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
                        break;
                    case 1:
                        leftDown.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
                        break;
                    case 2:
                        right.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
                        break;
                    default:
                        leftUp.addAll(JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
                }
            }
        }
        if (BAIKE.equals(type)) {
            JSONObject result = newsList(cityen, null, 0, 2, null, null, BAIKE);
            if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                model.addAttribute("baike", JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
            }
            return "third_baike";
        }
        model.addAttribute("leftUp", leftUp);
        model.addAttribute("leftDown", leftDown);
        model.addAttribute("right", right);
        model.addAttribute("types", types);
        if ("type1".equals(type)) {
            return "third_hot";
        } else if ("type2".equals(type)) {
            return "third_info";
        }
        return "third_hot";
    }
}
