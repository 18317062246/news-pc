package com.news.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.news.web.model.NewsRelated;
import com.news.web.model.NewsType;
import com.news.web.model.common.CommonHouseResult;
import com.news.web.service.NewsService;
import com.news.web.util.PageUtil;
import com.news.web.util.StringResource;
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

    @Autowired
    private NewsService newsService;

    @Value("${api.domain}")
    public String apiurl;

    @Value("${static.url}")
    public String staticurl;
    @Value("${deal.citys}")
    public String dealCitys;
    @Value("${centanet.research}")
    public String researchUrl;


    private static final String GUANG_ZHOU = "gz";
    private static final String NEWS_LIST = "NewsList";
    private static final String CITY_NEWS_LIST = "cityNewsList";
    private static final String BAIKE_NEWS_LIST = "baikeNewsList";
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
    private static final String TYPE_ID = "typeid";
    /**
     * 是否存在房源信息
     */
    private static final String NEWS_RELATED = "NewsRelated";
    private static final String GOU_FANG_TEXT = "购房百科";
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
        List<NewsType> types = newsService.typeList(cityen, null);
        List<NewsType> jtTypes =  newsService.typeList(CENTANET, null);
        if (types.isEmpty()) {
            log.error("栏目类型空值=>{}", cityen);
            return "index";
        }
        List<NewsType> baiketype =  newsService.typeList(cityen, BAIKE);
        model.addAttribute(BAIKE_TYPE, !baiketype.isEmpty());
        //将城市是否存在baike存在session当中
        session.setAttribute(BAIKE_TYPE, !baiketype.isEmpty());
        //过滤右侧栏目type
        List<NewsType> rightType = types.stream().filter(t -> RIGHT.equals(t.getLocation())).collect(Collectors.toList());

        List<Map> leftNews = new ArrayList<>();
        //定义戴删除栏目对象
        List<NewsType> typeDelList = new ArrayList<>();
        for (NewsType t : types) {
            if (!RIGHT.equals(t.getLocation())) {
                //栏目id获取左侧文章列表
                JSONObject result = newsService.newsList(cityen, Arrays.asList(t.getId()), 1, 10, null, null, null);
                if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                    List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
                    leftNews.addAll(news);
                }else {//如果该栏目下没有文章，存储到删除栏目对象集合
                    typeDelList.add(t);
                }
            }
        }

        //若删除栏目集合对象不为空，将栏目进行批量删除
        if(!CollectionUtils.isEmpty(typeDelList)){
            types.removeAll(typeDelList);
        }

        //如果是北京，删除北京写字楼资讯栏目
        if(Objects.equals(cityen , "bj")){
            //筛选出北京写字楼栏目对象，栏目id为659
            List<NewsType> xzlDelList = types.stream().filter(l -> Objects.equals(659, l.getId())).collect(Collectors.toList());
            //如果北京写字楼资讯栏目集合不为空，就删除这些栏目
            if(!CollectionUtils.isEmpty(xzlDelList)){
                //删除写字楼相关的所有栏目
                types.removeAll(xzlDelList);
            }
        }

        //如果是东莞，删除东莞成交走势栏目
        if(Objects.equals(cityen , "dg")){
            //筛选出东莞成交走势栏目对象，栏目id为89
            List<NewsType> chengjiaoDelList = types.stream().filter(l -> Objects.equals(89, l.getId())).collect(Collectors.toList());
            //如果东莞成交走势栏目集合不为空，就删除这些栏目
            if(!CollectionUtils.isEmpty(chengjiaoDelList)){
                //删除东莞成交走势相关的所有栏目
                types.removeAll(chengjiaoDelList);
            }
        }

        //右侧上部文章
        List<NewsType> rightTypeAdd = new ArrayList<>();
        List<Map> rightNews = new ArrayList<>();
        List<Map> newListByTypeTotals = new ArrayList<>();
        for (NewsType right : rightType) {
            if (PUBLIC_COL.equals(right.getColumnsName())) {
                for (NewsType ri : right.getChildList()) {
                    rightTypeAdd.add(ri);
                }
                continue;
            }
            rightTypeAdd.add(right);
        }

        //判断是否为szworld.如果是szworld,默认取10条数据，否则取5条数据
        Integer rightNewsPageSize;
        if(Objects.equals("szworld",cityen)){
            rightNewsPageSize = 10;
        }else {
            rightNewsPageSize = 5;
        }
        //定义一个对象，用于判断删除栏目
        List<NewsType> rightTypeDel = new ArrayList<>();
        rightTypeAdd.forEach(item -> {
            JSONObject right = newsService.newsList(cityen, Arrays.asList(item.getId()), 1, rightNewsPageSize, null, null, null);
            if (!ObjectUtils.isEmpty(right.get(NEWS_LIST))) {
                rightNews.addAll(JSON.parseArray(JSON.toJSONString(right.get(NEWS_LIST)), Map.class));
                Map o = ((List<Map>)right.get(NEWS_LIST)).get(0);
                //获取栏目的总数据条数map
                Map<String, Integer> newListByTypeTotalMap = getNewListByTypeTotalMap(((List<Map>) right.get(NEWS_LIST)).get(0), cityen, item, rightNewsPageSize);
                //将数据添加到存储栏目总数据的集合中
                newListByTypeTotals.add(newListByTypeTotalMap);
            }else {//若加载的数据为空，则添加对象到rightTypeDel对象中
                //将对象添加到rightTypeDel集合中
                rightTypeDel.add(item);
            }
        });

        //判断rightTypeDel对象是否不为空，不为空就将包含的对象删除
        if(!CollectionUtils.isEmpty(rightTypeDel)){
            rightTypeAdd.removeAll(rightTypeDel);
        }

        //右侧下部集团jt文章
        List<Map> centaNews = new ArrayList<>();
        if (null != jtTypes && !jtTypes.isEmpty()) {
            List<NewsType> jt = jtTypes.get(0).getChildList();
            for (NewsType t : jt) {
                JSONObject centa = newsService.newsList(CENTANET, Arrays.asList(t.getId()), 1, 5, null, null, null);
                if (!ObjectUtils.isEmpty(centa.get(NEWS_LIST))) {
                    centaNews.addAll(JSON.parseArray(JSON.toJSONString(centa.get(NEWS_LIST)), Map.class));
                }
            }
        }

        model.addAttribute("rightNews", rightNews);
        model.addAttribute("rightNewAllCounts", newListByTypeTotals);
        model.addAttribute("centaNews", centaNews);
        //成交走势信息
        if (dealCitys.contains(cityen)) {
            List<Map> dealinfo = newsService.getDealPathInfo(cityen);
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
     * 组装Map集合，用于判断城市首页栏目总数据
     */
    private Map<String , Integer> getNewListByTypeTotalMap(Map newListByFirst , String cityen , NewsType item , Integer rightNewsPageSize){
        Integer rightTotal = newsService.getNewListByTypeTotal(cityen, Arrays.asList(item.getId()), 1, rightNewsPageSize, null, null, null);
        Map<String , Integer> map = new HashMap<>();
        map.put("typeId" , (Integer) newListByFirst.get("TypeID"));
        map.put("total" , rightTotal);
        return map;
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
        model.addAttribute("citycn", StringResource.citymap(cityen));
        model.addAttribute("cityTelphone", StringResource.cityTelphone(cityen));
        model.addAttribute("researchUrl", researchUrl);
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
        List<NewsType> types =  newsService.typeList(cityen, null);
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
        List<NewsType> jtyyTypes =  newsService.typeList("jtyy", null);
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
        Integer hotTypeId = 0;
        //非武汉是热门专题字样
        if(!Objects.equals("wh" , cityen)) {
           hotTypeId =  types.stream().filter(l -> l.getColumnsName().equals("热门专题")).mapToInt(NewsType::getId).sum();
        }else {//武汉为武汉热门专题字样
            hotTypeId =  types.stream().filter(l -> l.getColumnsName().equals("武汉热门专题")).mapToInt(NewsType::getId).sum();
        }
        //如果是热门专题，默认取8条数据
        if (hotTypeId != null && hotTypeId > 0 && hotTypeId.equals(type)) {
            pagesize = 8;
        }
        //文章列表
        JSONObject result = newsService.newsList(cityen, typeid, page, pagesize, null, key, null);
        for (NewsType t : jtyyTypes.get(0).getChildList()) {
            //若是集团栏目类型用jtyy查询获取文章列表
            if (!ObjectUtils.isEmpty(type) && type.equals(t.getId())) {
                log.info("当前栏目type是集团栏目类型=>{}", type);
                result = newsService.newsList(CENTANET, typeid, page, pagesize, null, key, null);
            }
        }
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        //是否有百科栏目
        List<NewsType> baiketype =  newsService.typeList(cityen, BAIKE);
        model.addAttribute(BAIKE_TYPE, !baiketype.isEmpty());
        //toplist
        JSONObject top = newsService.newsList(cityen, 1 , 10 ,0);
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
        List<NewsType> baiketype =  newsService.typeList(cityen, BAIKE);
        model.addAttribute(BAIKE_TYPE, !baiketype.isEmpty());

        setCommon(model, cityen);
        //热点排行
        JSONObject newsList = newsService.newsList(cityen, 1, 10, 0);
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
                    List<CommonHouseResult> xinFangInfo = newsService.getXinFangInfo(xinfangTypes, cityen);
                    //如果新房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(xinFangInfo)) {
                        commonHouseResult.addAll(xinFangInfo);
                    }
                }

                //判断二手房是否有数据
                if (!CollectionUtils.isEmpty(esfTypes)) {
                    //获取二手房信息
                    List<CommonHouseResult> esfInfo = newsService.getErshouFangInfo(esfTypes, cityen);
                    //如果二手房集合不为空，就添加到总的房源集合
                    if (!CollectionUtils.isEmpty(esfInfo)) {
                        commonHouseResult.addAll(esfInfo);
                    }
                }

                //判断小区是否有数据
                if (!CollectionUtils.isEmpty(xiaoquTypes)) {
                    //获取小区信息
                    List<CommonHouseResult> xiaoquInfos = newsService.getXiaoQuInfo(xiaoquTypes, cityen);
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
        List<NewsType> types =  newsService.typeList(cityen, RIGHT);
        types.forEach(item -> {
            if (HOT.equals(item.getColumnsName())) {
                Integer typeid = item.getId();
                JSONObject list = newsService.newsList(cityen, Arrays.asList(typeid), 1, 10, null, null, null);
                List<Map> infoNews = new ArrayList<>();
                if (!ObjectUtils.isEmpty(list.get(NEWS_LIST))) {
                    infoNews = JSON.parseArray(JSON.toJSONString(list.get(NEWS_LIST)), Map.class);
                }
                model.addAttribute("infoNews", infoNews);
                model.addAttribute("hotType", item.getId());
            }
        });

        //根据栏目id判断是列表页过来的还是百科列表页过来的
        if(!CollectionUtils.isEmpty(baiketype)) {
            //定义栏目id集合
            List<Integer> typeIdList = Lists.newArrayList();
            //循环栏目，取出每一个百科id
            baiketype.get(0).getChildList().stream().forEach(l -> {
                //取出栏目id
                typeIdList.add(l.getId());
                //如果是子级对象，取出子级
                List<NewsType> newsTypes = JSONArray.parseArray(JSON.toJSONString(l.getChildList()), NewsType.class);
                //循环遍历子级，查询是否相等
                newsTypes.stream().forEach(k -> {
                    //取出子级栏目id
                    typeIdList.add(k.getId());
                    //如果是子级对象，取出子级
                    List<NewsType> newsTypesTemp = JSONArray.parseArray(JSON.toJSONString(k.getChildList()), NewsType.class);
                    if (!CollectionUtils.isEmpty(newsTypesTemp)) {
                        //循环遍历子级，查询是否相等
                        newsTypesTemp.stream().forEach(m -> {
                            //取出子级栏目id
                            typeIdList.add(m.getId());
                        });
                    }
                });
            });
            //获取详情的栏目id
            Integer typeId = (Integer) detail.get("Typeid");
            //判断是否为百科id
            if (!CollectionUtils.isEmpty(typeIdList) && typeIdList.contains(typeId)) {
                //存储一个字段，是百科id，方便前端跳转
                model.addAttribute("baikeFlag", true);
            } else {
                //存储一个字段，不是百科id，方便前端跳转
                model.addAttribute("baikeFlag", false);
            }
        }else {
            //存储一个字段，不是百科id，方便前端跳转
            model.addAttribute("baikeFlag", false);
        }



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
        List<NewsType> types =  newsService.typeList(cityen, BAIKE);
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
            result = newsService.newsListByBaike(cityen, type , BAIKE, page, pagesize, null, null);

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

            result = newsService.newsListByBaike(cityen, null , BAIKE, page, pagesize, null, null);

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
    @SuppressWarnings("all")
    @GetMapping("/{cityen}/detail/third_{type}.html")
    public String thirdInfo(Model model,
                            @PathVariable("cityen") String cityen,
                            @PathVariable(value = "type", required = false) String type) {
        setCommon(model, cityen);
        //栏目类型
        List<NewsType> types =  newsService.typeList(cityen, null);
        //如果type的id为464，那么取出东三省的默认第一个栏目
        if(Objects.equals(types.get(1).getId() , 464)){
            //取出子级栏目
            List<NewsType> newsTypes = JSONArray.parseArray(JSON.toJSONString(types.get(1).getChildList()), NewsType.class);
            //取出子级栏目的默认第一个栏目
            types.set(1 , newsTypes.get(0));
        }

        //循环types
        //判断types是否为空，不为空就进行判断，栏目是否不存在列表
        if(!CollectionUtils.isEmpty(types)) {
            //创建一个List对象，将没有文章的栏目进行存储
            List<NewsType> newsTypesRemove = new ArrayList<>();
            //循环types,将没有文章的栏目进行删除
            for (NewsType newsType : types) {
                //41为中原资讯，如果是41，则进行跳过
                if(Objects.equals(newsType.getId() , 41)){
                    continue;
                }
                //获取集团资讯栏目下的文章
                JSONObject jtResult = newsService.newsList(cityen, Arrays.asList(newsType.getId()), 1, 10, null, null ,null);
                //若该栏目下的文章为空，将该文章对象添加到集合中
                if (ObjectUtils.isEmpty(jtResult.get(NEWS_LIST))) {
                    newsTypesRemove.add(newsType);
                }
            }

            //若newsTypesRemove对象不为空，就删除栏目
            if(!CollectionUtils.isEmpty(newsTypesRemove)) {
                //删除所有栏目
                types.removeAll(newsTypesRemove);
            }

            //如果是北京，删除北京写字楼资讯栏目
            if(Objects.equals(cityen , "bj")){
                //筛选出北京写字楼栏目对象，栏目id为659
                List<NewsType> xzlDelList = types.stream().filter(l -> Objects.equals(659, l.getId())).collect(Collectors.toList());
                //如果北京写字楼资讯栏目集合不为空，就删除这些栏目
                if(!CollectionUtils.isEmpty(xzlDelList)){
                    //删除写字楼相关的所有栏目
                    types.removeAll(xzlDelList);
                }
            }

            //如果是东莞，删除东莞成交走势栏目
            if(Objects.equals(cityen , "dg")){
                //筛选出东莞成交走势栏目对象，栏目id为89
                List<NewsType> chengjiaoDelList = types.stream().filter(l -> Objects.equals(89, l.getId())).collect(Collectors.toList());
                //如果东莞成交走势栏目集合不为空，就删除这些栏目
                if(!CollectionUtils.isEmpty(chengjiaoDelList)){
                    //删除东莞成交走势相关的所有栏目
                    types.removeAll(chengjiaoDelList);
                }
            }
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
            JSONObject result = newsService.newsList(cityen, typeid, 1, 10, null, null, null);
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
            JSONObject result = newsService.newsList(cityen, null, 0, 2, null, null, BAIKE);
            if (!ObjectUtils.isEmpty(result.get(NEWS_LIST))) {
                model.addAttribute(BAIKE, JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class));
            }
            return "third_baike";
        }

        //获取购房百科数据
        JSONObject baikeNewList = newsService.newsListByBaike(cityen, null , BAIKE, 1, 6, null, null);
        //如果新闻列表有数据，存在对应的栏目id
        List<Map> baikeNewListMap = JSON.parseArray(JSON.toJSONString(baikeNewList.get(NEWS_LIST)), Map.class);
        //若baikeNewListMap不为空,将百科信息传送到页面上
        if(!CollectionUtils.isEmpty(baikeNewList)){
            model.addAttribute(BAIKE_NEWS_LIST, baikeNewListMap);
        }

        //获取最新的数据
        JSONObject newsList = newsService.newsList(cityen,  1, 10, 0);
        //将城市最新列表数据转换成List<Map>集合
        List<Map> newsListMap = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);
        //若newsListMap不为空,将城市最新信息传送到页面上
        if(!CollectionUtils.isEmpty(newsListMap)){
            model.addAttribute(CITY_NEWS_LIST, newsListMap);
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
        }else if ("zs_buyer".equals(type)) {//中山买房帮手
            return "third_zs_buyer";
        }else if ("szworld_xf".equals(type)) {//海外新房
            return "third_szworld_xf";
        }else if ("jjr_baike_info".equals(type)) {//北京、惠州经纪人页面百科信息
            return "jingjiren_baike";
        }else if ("gz_jjr_baike_info".equals(type)) {//广州经纪人页面百科信息
            return "jingjiren_baike_gz";
        }
        return "third_hot";
    }
}
