package com.news.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.news.web.model.NewsRelated;
import com.news.web.model.NewsType;
import com.news.web.model.common.CommonHouseResult;
import com.news.web.model.esf.ESFResult;
import com.news.web.model.xiaoqu.XiaoQuResult;
import com.news.web.model.xinfang.XinfangResult;
import com.news.web.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 咨询
 */
@Slf4j
@Controller
//@CrossOrigin(origins = "*",maxAge = 3600)
public class NewsController {


    @Autowired
    private RestTemplate restTemplate;
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

    @Value("${static.url}")
    public String staticurl;
    @Value("${deal.url}")
    public String dealurl;
    @Value("${deal.citys}")
    public String dealCitys;


    private static final String GUANG_ZHOU = "gz";
    private static final String NEWS_LIST = "NewsList";
    private static final String RESULT = "Result";
    private static final String PUBLIC_COL = "东三省共用频道";
    private static final String LOOP_AD = "轮播广告位";
    /**
     * 热门专题
     */
    private static final String HOT = "热门专题";
    private static final String RIGHT = "right";
    private static final String BAIKE = "baike";
    private static final String CENTANET = "jtyy";
    private static final String BAIKE_TYPE = "baiketype";
    private static final String TYPES = "types";
    private static final String CITYEN = "cityen";
    private static final String COL_NAME = "colName";
    private static final String LOCATION = "location";
    private static final String TYPE_ID = "typeid";
    /**
     * 是否存在房源信息
     */
    private static final String NEWS_RELATED = "NewsRelated";
    private static final String GOU_FANG_TEXT = "购房百科";
    private static final String ARTICLE_LIST_IS_NULL = "请求文章列表为空=>{}";
    private static final String SEARCH_TEXT = "搜索列表";


    /**
     * @param: cityen 城市
     * @param: type 文章类型
     * @description: 资讯城市首页
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-26
     */
    @SuppressWarnings("all")
    @GetMapping(value = {"/{cityen}/", "/{cityen}/c{type}/"})
    public String index(Model model,
                        @PathVariable(name = "cityen") String cityen,
                        @PathVariable(name = "type", required = false) Integer type, HttpServletRequest request) {

        //判断是否为Android/ios/ipad，如果是，就重定向到其他页面
        String osName = request.getHeader("user-agent");
        if(osName.indexOf("Android") != -1 || osName.indexOf("iPhone") != -1 || osName.indexOf("iPad") != -1 ){
            if(type != null){
                return "redirect://news.centanet.com/m/" + cityen + "/c" + type + "/";
            }else {
                return "redirect://news.centanet.com/m/" + cityen + "/";
            }

        }

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
        List<NewsType> baiketype = typeList(cityen, BAIKE);
        model.addAttribute(BAIKE_TYPE, !baiketype.isEmpty());
        //将城市是否存在baike存在session当中
        session.setAttribute(BAIKE_TYPE, !baiketype.isEmpty());
        //过滤右侧栏目type
        List<NewsType> rightType = types.stream().filter(t -> RIGHT.equals(t.getLocation())).collect(Collectors.toList());

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
            for (NewsType t : jt) {
                JSONObject centa = newsList(CENTANET, Arrays.asList(t.getId()), 1, 5, null, null, null);
                if (!ObjectUtils.isEmpty(centa.get(NEWS_LIST))) {
                    centaNews.addAll(JSON.parseArray(JSON.toJSONString(centa.get(NEWS_LIST)), Map.class));
                }
            }
        }

        model.addAttribute("rightNews", rightNews);
        model.addAttribute("centaNews", centaNews);
        //成交走势信息
        if (dealCitys.contains(cityen)) {
            List<Map> dealinfo = getDealPathInfo(cityen);
            model.addAttribute("dealinfo", dealinfo);
        }
        //移除广州轮播广告位
        if (GUANG_ZHOU.equals(cityen)) {
            List<NewsType> newsTypes = types.stream().filter(s -> !s.getColumnsName().equals(LOOP_AD)).collect(Collectors.toList());
            types = newsTypes;
        }
        model.addAttribute(TYPES, types);
        model.addAttribute("jtTypes", jtTypes);
        model.addAttribute("rightType", rightTypeAdd);
        model.addAttribute("tabtype", types.get(0).getId());
        model.addAttribute("news", leftNews);
       /* if (GUANG_ZHOU.equals(cityen)) {
            //广州资讯主页
            return "index_gz";
        }*/
        return "index";
    }

    /**
     * 获取成交走势
     *
     * @param cityen
     * @return
     */
    @SuppressWarnings("all")
    private List<Map> getDealPathInfo(String cityen) {
        Map map = new HashMap();
        map.put("dg", 418);
        map.put("bj", 419);
        map.put("nj", 420);
        map.put("fs", 421);
        map.put("zq", 422);
        map.put("gz", 426);
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
     * @param: null
     * @description: 公共变量
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-27
     */
    private void setCommon(Model model, String cityen) {
        model.addAttribute(CITYEN, cityen);
        model.addAttribute("staticurl", staticurl);
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
        return (String) map.get(cityen);
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
        map.put("fz", "400-819-8852");
        return (String) map.get(cityen);
    }


    /**
     * @param model
     * @param cityen 城市编号
     * @param type   栏目类型编号
     * @param page   页码
     * @return
     */
    @SuppressWarnings("all")
    @GetMapping(value = {"/{cityen}/list/c{type}/p{page}", "/{cityen}/list/", "/{cityen}/list/c{type}", "/{cityen}/list/p{page}"})
    public String index(Model model
            , @PathVariable(name = "cityen") String cityen
            , @PathVariable(name = "type", required = false) Integer type
            , @PathVariable(name = "page", required = false) Integer page
            , @RequestParam(value = "key", required = false) String key
            , @RequestParam(value = "pagesize", defaultValue = "10", required = false) Integer pagesize , HttpServletRequest request) {

        //判断是否为Android/ios/ipad，如果是，就重定向到其他页面
        String osName = request.getHeader("user-agent");
        if(osName.indexOf("Android") != -1 || osName.indexOf("iPhone") != -1 || osName.indexOf("iPad") != -1 ){
            return "redirect://news.centanet.com/m/" + cityen + "/list/c" + type + "/";
        }
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
            model.addAttribute(COL_NAME, currTypes.get(0).getColumnsName());
        }

        //获取东三省公用频道
        //判断当前的分类名称是否和东三省共用频道相等
        List<NewsType> eastThreeProvinceTypeList = types.stream().filter(t -> t.getColumnsName().equals(PUBLIC_COL)).collect(Collectors.toList());
        //判断东三省共用频道childList是否合法
        if (!CollectionUtils.isEmpty(eastThreeProvinceTypeList) && !CollectionUtils.isEmpty(eastThreeProvinceTypeList.get(0).getChildList())) {
            //过滤东三省共用频道childList , 判断栏目id是否和其相等，相等就存储其栏目id
            List<NewsType> eastThreeProvinceTypeCurrTypes = eastThreeProvinceTypeList.get(0).getChildList().stream().filter(l -> l.getId().equals(type)).collect(Collectors.toList());
            if (eastThreeProvinceTypeCurrTypes != null && !eastThreeProvinceTypeCurrTypes.isEmpty()) {
                model.addAttribute(COL_NAME, eastThreeProvinceTypeCurrTypes.get(0).getColumnsName());
            }
        }

        //获取集团资讯的栏目类型
        List<NewsType> jtyyTypes = typeList("jtyy", null);
        //判断当前的分类id是否和集团右侧栏目的id相等，若相等，就取出对应的栏目名称
        List<NewsType> jtyyCurrTypes = jtyyTypes.get(0).getChildList().stream().filter(t -> t.getId().equals(type)).collect(Collectors.toList());
        if (jtyyTypes != null && !jtyyCurrTypes.isEmpty()) {
            model.addAttribute(COL_NAME, jtyyCurrTypes.get(0).getColumnsName());
        }

        //判断是否为搜索页面
        if(!StringUtils.isEmpty(key)){
            model.addAttribute(COL_NAME, SEARCH_TEXT);
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
        for (NewsType t : jtyyTypes.get(0).getChildList()) {
            //若是集团栏目类型用jtyy查询获取文章列表
            if (!ObjectUtils.isEmpty(type) && type.equals(t.getId())) {
                log.info("当前栏目type是集团栏目类型=>{}", type);
                result = newsList(CENTANET, typeid, page, pagesize, null, key, null);
            }
        }
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        //是否有百科栏目
        List<NewsType> baiketype = typeList(cityen, BAIKE);
        model.addAttribute(BAIKE_TYPE, !baiketype.isEmpty());
        //toplist
        JSONObject top = newsList(cityen, null, 1, 10, 1, null, null);
        List<Map> topList = JSON.parseArray(JSON.toJSONString(top.get(NEWS_LIST)), Map.class);
        Integer pageCount = result.getInteger("PageTotal");
        model.addAttribute("news", news);
        model.addAttribute("topList", topList);
        model.addAttribute("type", type);
        model.addAttribute("key", key);
        model.addAttribute("page", page);
        PageUtil p = new PageUtil(pageCount, page, pagesize);
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
     * @param: cityen 城市
     * @description: 默认资讯列表
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-25
     */
    private JSONObject newsList(String cityen, List<Integer> typeIds, Integer page, Integer pagesize, Integer order, String key, String location) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        List<Integer> empty = new ArrayList<>();
        typeIds = ObjectUtils.isEmpty(typeIds) ? empty : typeIds;
        map.put(TYPE_ID, typeIds.toString().replaceAll("\\[", "").replaceAll("\\]", ""));
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        if (StringUtils.hasText(key)) {
            map.put(TYPE_ID, null);
        }
        map.put("title", key);
        map.put("description", key);
        map.put(LOCATION, location);
        JSONObject jSONObject = restTemplate.getForObject(apiurl +
                        "GetNewsList?cityen={cityen}&platform=pc&typeid={typeid}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}&location={location}"
                , JSONObject.class, map);
        JSONObject newsList = jSONObject.getJSONObject(RESULT);
        if (newsList.isEmpty()) {
            log.error(ARTICLE_LIST_IS_NULL, newsList);
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
    @SuppressWarnings("all")
    private JSONObject newsListByBaike(String cityen, Integer typeId , String location, Integer page, Integer pagesize, Integer order, String key) {
        Map<String, Object> map = new HashMap<>();
        map.put(CITYEN, cityen);
        map.put(LOCATION, location);
        map.put("page", page);
        map.put("pagesize", pagesize);
        map.put("order", order);
        map.put("title", key);
        map.put("description", key);

        if(!ObjectUtils.isEmpty(typeId)){
            map.put("typeid", typeId);
        }

        StringBuffer sql = new StringBuffer("GetNewsList?cityen={cityen}&platform=wap&location={location}&page={page}&pagesize={pagesize}&order={order}&title={title}&description={description}");
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
     * 获取新房信息
     * @param xinfangTypes 新房集合
     * @param cityen 城市简称
     * @return
     */
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
     * 获取二手房信息
     * @param ershoufangTypes 二手房集合
     * @param cityen 城市简称
     * @return
     */
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
     * 获取小区信息
     * @param xiaoquTypes 小区集合
     * @param cityen 城市简称
     * @return
     */
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

    /**
     * @param: cityen 城市
     * @description: 详情
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-22
     */
    @SuppressWarnings("all")
    @GetMapping("/{cityen}/detail/{id}.html")
    public String detail(Model model
            , @PathVariable("cityen") String cityen
            , @PathVariable("id") String id , HttpServletRequest request) {
        log.info("detail id=>{}", id);

        String osName = request.getHeader("user-agent");

        if(osName.indexOf("Android") != -1 || osName.indexOf("iPhone") != -1 || osName.indexOf("iPad") != -1 ){
            return "redirect://news.centanet.com/m/" + cityen + "/detail/" + id + ".html/";
        }
        //获取百科
        List<NewsType> baiketype = typeList(cityen, BAIKE);
        model.addAttribute(BAIKE_TYPE, !baiketype.isEmpty());

        setCommon(model, cityen);
        //热点排行
        JSONObject newsList = newsList(cityen, null, 1, 10, 1, null, null);
        List<Map> news = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);
        //详情信息
        JSONObject result = restTemplate.getForObject(apiurl + "GetNewsContent?newsid=" + id + "&cityen="+cityen+"&platform=pc", JSONObject.class);
        //判断是否存在房源
        if(result.get(RESULT) != null){
            JSONObject xfResult = result.getJSONObject(RESULT);
            if(xfResult.get(NEWS_RELATED) != null) {
                //将房源对象进行转换
                String newsRelatedData = JSON.toJSONString(xfResult.get(NEWS_RELATED));
                List<NewsRelated> types = JSON.parseArray(newsRelatedData, NewsRelated.class);
                //将新房、二手房、小区进行过滤
                List<NewsRelated> xinfangTypes = types.stream().filter(l -> l.getOtype().equals("xinfang")).collect(Collectors.toList());
                List<NewsRelated> esfTypes = types.stream().filter(l -> l.getOtype().equals("ershoufang")).collect(Collectors.toList());
                List<NewsRelated> xiaoquTypes = types.stream().filter(l -> l.getOtype().equals("xiaoqu")).collect(Collectors.toList());

                //创建一个公共的对象，用于返回房源数据
                List<CommonHouseResult> commonHouseResult = new ArrayList<>();
                //判断新房是否有数据
                if (!CollectionUtils.isEmpty(xinfangTypes)) {
                    //获取新房信息
                    List<CommonHouseResult> xinFangInfo = getXinFangInfo(xinfangTypes, cityen);
                    //如果新房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(xinFangInfo)) {
                        commonHouseResult.addAll(xinFangInfo);
                    }
                }

                //判断二手房是否有数据
                if (!CollectionUtils.isEmpty(esfTypes)) {
                    //获取二手房信息
                    List<CommonHouseResult> esfInfo = getErshouFangInfo(esfTypes, cityen);
                    //如果二手房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(esfInfo)) {
                        commonHouseResult.addAll(esfInfo);
                    }
                }

                //判断小区是否有数据
                if (!CollectionUtils.isEmpty(xiaoquTypes)) {
                    //获取小区信息
                    List<CommonHouseResult> xiaoquInfos = getXiaoQuInfo(xiaoquTypes, cityen);
                    //如果小区集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(xiaoquInfos)) {
                        commonHouseResult.addAll(xiaoquInfos);
                    }
                }

                //判断总的房源是否为空，如果不为空就返回到页面
                if(!CollectionUtils.isEmpty(commonHouseResult)){

                    model.addAttribute("commonHouseResult" , commonHouseResult);
                    //用于判断绑定的房源数据是否只有一条
                    model.addAttribute("commonHouseResultSize" , commonHouseResult.size());
                }
            }
        }


        JSONObject detail = result.getJSONObject(RESULT);
        //热门专题
        List<NewsType> types = typeList(cityen, RIGHT);
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

        //将文章内容进行格式化
        String content = (String) detail.get("Content");
        if (!StringUtils.isEmpty(content)) {
            model.addAttribute("detailContent", content.replace("crossorigin=\"anonymous\"", ""));
        }


        if (Objects.equals(detail.get("flag") , "url")) {//若flag的值为url,将文章跳转到此url指向的地址
            return "redirect:" + detail.get("Url");
        }
        model.addAttribute("news", news);
        model.addAttribute("detail", detail);
        model.addAttribute("newsId", id);
        return "detail";
    }

    /**
     * @param: type 文章类型
     * @description: 百科
     * @return:
     * @author: zouyuan1
     * @date: 2020-05-27
     */
    @SuppressWarnings("all")
    @GetMapping(value = {"/{cityen}/baike", "/{cityen}/baike/c{type}/p{page}", "/{cityen}/baike/p{page}"})
    public String baike(Model model, @PathVariable("cityen") String cityen,
                        @PathVariable(value = "type", required = false) Integer type,
                        @PathVariable(value = "page", required = false) Integer page,
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize) {

        page = ObjectUtils.isEmpty(page) ? 1 : page;
        //栏目类型
        List<NewsType> types = typeList(cityen, BAIKE);
        model.addAttribute(BAIKE_TYPE, !types.isEmpty());
        List<NewsType> baikeTypes = new ArrayList<>();
        if (!CollectionUtils.isEmpty(types)) {
            baikeTypes = types.get(0).getChildList();
        }

        //当栏目id为空，赋值为null，否则就取type的值
        type = ObjectUtils.isEmpty(type) ? null : type;

        //文章列表
        JSONObject result;
        if (type != null) {//type不为空，正常去取
            //文章列表
            result = newsListByBaike(cityen, type , BAIKE, page, pagesize, null, null);

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
            model.addAttribute(TYPE_ID, type);

            //存储栏目名称
            model.addAttribute("typeName", typeNameList.get(0));
        } else {//type为空，默认取出百科数据了

            result = newsListByBaike(cityen, null , BAIKE, page, pagesize, null, null);

            //如果新闻列表有数据，存在对应的栏目id
            List<Map> news1 = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
            if (!CollectionUtils.isEmpty(news1)) {
                //存储栏目id
                model.addAttribute(TYPE_ID, 0);
                //存储栏目名称
                model.addAttribute("typeName", GOU_FANG_TEXT);
            }
        }
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        setCommon(model, cityen);

        model.addAttribute(TYPES, baikeTypes);
        //存储百科左侧栏目大小
        model.addAttribute("typesSize", baikeTypes.size());

        model.addAttribute("news", news);
        Integer pageCount = result.getInteger("PageTotal");
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute("p", p);
        model.addAttribute("page", page);
        return BAIKE;
    }

    /**
     * @param: 嵌入页面
     * @description:
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
        //如果type的id为464，那么取出东三省的默认第一个栏目
        if(Objects.equals(types.get(1).getId() , 464)){
            //取出子级栏目
            List<NewsType> newsTypes = JSONArray.parseArray(JSON.toJSONString(types.get(1).getChildList()), NewsType.class);
            //取出子级栏目的默认第一个栏目
            types.set(1 , newsTypes.get(0));
        }
        List<Map> leftUp = new ArrayList<>();
        List<Map> leftDown = new ArrayList<>();
        List<Map> right = new ArrayList<>();

        for (int i = 0; i < types.size(); i++) {
            //文章列表
            List<Integer> typeid = new ArrayList<>(Arrays.asList(types.get(i).getId()));
            //若typeid为464，取出子级栏目id
            if(Objects.equals(typeid.get(0) , 464)){
                //取出子级栏目
                List<NewsType> newsTypes = JSONArray.parseArray(JSON.toJSONString(types.get(i).getChildList()), NewsType.class);
                //取出子级栏目的第一个id
                typeid = Arrays.asList(newsTypes.get(0).getId());
            }
            JSONObject result = newsList(cityen, typeid, 1, 10, null, null, null);
            if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
                switch (i) {
                    case 0:
                        //左上
                        leftUp.addAll(news);
                        break;
                    case 1:
                        //左下
                        leftDown.addAll(news);
                        break;
                    case 2:
                        //右边
                        right.addAll(news);
                        break;
                    default:
                        leftUp.addAll(news);
                }
            }
        }
        if (BAIKE.equals(type)) {//购房百科
            JSONObject result = newsList(cityen, null, 0, 2, null, null, BAIKE);
            if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                model.addAttribute(BAIKE, JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
            }
            return "third_baike";
        }
        model.addAttribute("leftUp", leftUp);
        model.addAttribute("leftDown", leftDown);
        model.addAttribute(RIGHT, right);
        model.addAttribute(TYPES, types);

        if ("index".equals(type)) {//二手房
            return "third_esf";
        } else if ("info".equals(type)) {//新房
            return "third_xf";
        }else if ("sz_esf".equals(type)) {//深圳二手房
            return "third_sz_esf";
        }
        return "third_hot";
    }
}
