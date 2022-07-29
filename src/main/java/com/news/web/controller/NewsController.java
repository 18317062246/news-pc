package com.news.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.news.web.model.ApiResult;
import com.news.web.model.NewsRelated;
import com.news.web.model.NewsType;
import com.news.web.model.common.CommonFootInfo;
import com.news.web.model.common.CommonHouseResult;
import com.news.web.model.request.NewsDetailRequest;
import com.news.web.model.response.NewsDetailResponse;
import com.news.web.service.NewsService;
import com.news.web.util.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 咨询
 */
@Slf4j
@Controller
@RequiredArgsConstructor
public class NewsController {

    private final RestTemplate restTemplate;
    private final NewsService newsService;

    @Value("${api.domain}")
    public String apiurl;

    @Value("${static.url}")
    public String staticurl;
    @Value("${deal.citys}")
    public String dealCitys;
    @Value("${centanet.research}")
    public String researchUrl;
    @Value("${dw.citys}")
    public String dwCitys;
    @Value("${website.suffix}")
    public String websiteSuffix;


    private static final String GUANG_ZHOU = "gz";
    private static final String NEWS_LIST = "NewsList";
    private static final String CITY_NEWS_LIST = "cityNewsList";
    private static final String BAIKE_NEWS_LIST = "baikeNewsList";
    private static final String BAIKE_NEWS_LIST_BY_KNOWLEDGE_QA = "baikeNewsListByKnowledgeQA";
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
                        @PathVariable(name = "type", required = false) Integer type,
                        @RequestParam(value = "entry", required = false) String entry,
                        @RequestParam(value = "downloadChannel", required = false) String downloadChannel,HttpServletRequest request) {

        //判断是否为Android/ios/ipad，如果是，就重定向到其他页面
        String osName = request.getHeader(AttributeKeyHelper.USER_AGENT);
        if(osName.indexOf(AttributeKeyHelper.ANDROID) != -1 || osName.indexOf(AttributeKeyHelper.IPHONE) != -1 || osName.indexOf(AttributeKeyHelper.IPAD) != -1 ){
            if(type != null){
                return String.format(AttributeKeyHelper.REDIRECT_M_BY_TYPE_LIST_ADDRESS , cityen , type);
            }else {
                return String.format(AttributeKeyHelper.REDIRECT_M_BY_INDEX_LIST_ADDRESS , cityen);
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

        //如果是北京，隐藏北京写字楼资讯栏目
        if(Objects.equals(cityen , AttributeKeyHelper.BJ_CITY_EN)){
            //筛选出北京写字楼栏目对象，栏目id为659
            List<NewsType> xzlDelList = types.stream().filter(l -> Objects.equals(659, l.getId())).collect(Collectors.toList());
            //如果北京写字楼资讯栏目集合不为空，就隐藏这些栏目
            if(!CollectionUtils.isEmpty(xzlDelList)){
                //隐藏写字楼相关的所有栏目
                types.removeAll(xzlDelList);
            }
        }

        //如果是东莞，隐藏东莞成交走势栏目和政策法规栏目
        if(Objects.equals(cityen , AttributeKeyHelper.DG_CITY_EN)){
            //筛选出东莞成交走势栏目对象，栏目id为89
            List<NewsType> chengjiaoDelList = types.stream().filter(l -> Objects.equals(89, l.getId())).collect(Collectors.toList());
            //如果东莞成交走势栏目集合不为空，就隐藏这些栏目
            if(!CollectionUtils.isEmpty(chengjiaoDelList)){
                //隐藏东莞成交走势相关的所有栏目
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
        if(Objects.equals(AttributeKeyHelper.SZ_WORLD_CITY_EN,cityen)){
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

        //判断是否为东莞城市，如果是东莞城市，隐藏政策法规栏目
        if(Objects.equals(cityen , AttributeKeyHelper.DG_CITY_EN)){
            //筛选出东莞政策法规栏目对象，栏目id为87
            List<NewsType> zhengceDelList = types.stream().filter(l -> Objects.equals(87, l.getId())).collect(Collectors.toList());
            //判断zhengceDelList对象是否不为空，不为空就将包含的对象删除
            if(!CollectionUtils.isEmpty(zhengceDelList)){
                rightTypeAdd.removeAll(zhengceDelList);
            }
        }

        //如果是惠州，隐藏Ben钟话市栏目
        if(Objects.equals(cityen , AttributeKeyHelper.HZ_CITY_EN)){
            //筛选出Ben钟话市栏目对象，栏目id为107
            List<NewsType> benDelList = types.stream().filter(l -> Objects.equals(107, l.getId())).collect(Collectors.toList());
            //隐藏Ben钟话市相关的栏目
            rightTypeAdd.removeAll(benDelList);
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

        model.addAttribute(AttributeKeyHelper.RIGHT_NEWS, rightNews);
        model.addAttribute(AttributeKeyHelper.RIGHT_NEW_ALL_COUNTS, newListByTypeTotals);
        model.addAttribute(AttributeKeyHelper.CENTA_NEWS, centaNews);
        //成交走势信息
        if (dealCitys.contains(cityen)) {
            List<Map> dealinfo = newsService.getDealPathInfo(cityen);
            model.addAttribute(AttributeKeyHelper.DEAL_INFO, dealinfo);
        }
        //移除广州轮播广告位
        if (GUANG_ZHOU.equals(cityen)) {
            List<NewsType> newsTypes = types.stream().filter(s -> !s.getColumnsName().equals(LOOP_AD)).collect(Collectors.toList());
            types = newsTypes;
        }
        model.addAttribute(TYPES, types);
        model.addAttribute(AttributeKeyHelper.JT_TYPES, jtTypes);
        model.addAttribute(AttributeKeyHelper.RIGHT_TYPE, rightTypeAdd);
        model.addAttribute(AttributeKeyHelper.TAB_TYPE, types.get(0).getId());
        model.addAttribute(AttributeKeyHelper.NEWS, leftNews);

        //大湾区埋点 神策数据
        if(dwCitys.contains(cityen)&& DwMaiDianUtiil.isMaiDianON){
            DwMaiDianUtiil.setModel(model,entry,cityen,downloadChannel,request);
            return DwMaiDianUtiil.INDEX_CENTIO_DW_PAGE;
        }
        return AttributeKeyHelper.INDEX_PAGE;
    }

    /**
     * 组装Map集合，用于判断城市首页栏目总数据
     */
    private Map<String , Integer> getNewListByTypeTotalMap(Map newListByFirst , String cityen , NewsType item , Integer rightNewsPageSize){
        Integer rightTotal = newsService.getNewListByTypeTotal(cityen, Arrays.asList(item.getId()), 1, rightNewsPageSize, null, null, null);
        Map<String , Integer> map = new HashMap<>();
        map.put(AttributeKeyHelper.TYPE_ID , (Integer) newListByFirst.get(AttributeKeyHelper.NEWS_LIST_BY_TYPE_ID_ATTR));
        map.put(AttributeKeyHelper.TOTAL , rightTotal);
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
        //获取公共底部的日期和时间
        CommonFootInfo footInfo = newsService.getFootInfo(cityen);
        model.addAttribute(CITYEN, cityen);
        model.addAttribute(AttributeKeyHelper.FOOT_INFO, footInfo);
        model.addAttribute(AttributeKeyHelper.STATIC_URL, staticurl);
        model.addAttribute(AttributeKeyHelper.CITY_CN, StringResource.citymap(cityen));
        model.addAttribute(AttributeKeyHelper.CITY_CODE, StringResource.getCityCode(cityen));
        model.addAttribute(AttributeKeyHelper.CITY_TELPHONE, StringResource.cityTelphone(cityen));
        model.addAttribute(AttributeKeyHelper.CITY_COMPLAINT_TELPHONE, StringResource.cityComplaintTelephone(cityen));
        model.addAttribute(AttributeKeyHelper.RESEARCH_URL, researchUrl);
        model.addAttribute(AttributeKeyHelper.CURRENT_YEAR, StringResource.getCurrentYear());
        model.addAttribute(AttributeKeyHelper.WEBSITE_SUFFIX, websiteSuffix);
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
            , @RequestParam(value = "pagesize", defaultValue = "10", required = false) Integer pagesize ,
                        @RequestParam(value = "entry", required = false) String entry,
                        @RequestParam(value = "downloadChannel", required = false) String downloadChannel,HttpServletRequest request) {

        //判断是否为Android/ios/ipad，如果是，就重定向到其他页面
        String osName = request.getHeader(AttributeKeyHelper.USER_AGENT);
        if(osName.indexOf(AttributeKeyHelper.ANDROID) != -1 || osName.indexOf(AttributeKeyHelper.IPHONE) != -1 || osName.indexOf(AttributeKeyHelper.IPAD) != -1 ){
            return String.format(AttributeKeyHelper.REDIRECT_M_BY_TYPE_LIST_ADDRESS , cityen , type);
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
        List<NewsType> jtyyTypes =  newsService.typeList(CENTANET, null);
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
        if(!Objects.equals(AttributeKeyHelper.WH_CITY_EN , cityen)) {
           hotTypeId =  types.stream().filter(l -> l.getColumnsName().equals(AttributeKeyHelper.HOT_TOPIC)).mapToInt(NewsType::getId).sum();
        }else {//武汉为武汉热门专题字样
            hotTypeId =  types.stream().filter(l -> l.getColumnsName().equals(AttributeKeyHelper.WH_HOT_TOPIC)).mapToInt(NewsType::getId).sum();
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
        Integer pageCount = result.getInteger(AttributeKeyHelper.PAGE_TOTAL);
        model.addAttribute(AttributeKeyHelper.NEWS, news);
        model.addAttribute(AttributeKeyHelper.TOP_LIST, topList);
        model.addAttribute(AttributeKeyHelper.TYPE, type);
        model.addAttribute(AttributeKeyHelper.SEARCH_KEY, key);
        model.addAttribute(AttributeKeyHelper.PAGE, page);
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute(AttributeKeyHelper.PAGE_UTIL_BY_P, p);

        //大湾区埋点 神策数据
        if(dwCitys.contains(cityen)&& DwMaiDianUtiil.isMaiDianON){
            DwMaiDianUtiil.setModel(model,entry,cityen,downloadChannel , request);
        }

        //如果是热门专题，跳往热门专题列表
        if (hotTypeId != null && hotTypeId > 0 && hotTypeId.equals(type)) {
            if(dwCitys.contains(cityen)) return DwMaiDianUtiil.TOPIC_LIST_CENTIO_DW_PAGE;
            return AttributeKeyHelper.TOPIC_LIST_PAGE;
        }
        if(dwCitys.contains(cityen)) return DwMaiDianUtiil.NEW_LIST_CENTIO_DW_PAGE;
        return AttributeKeyHelper.NEWS_LIST_PAGE;
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
            , @PathVariable("id") String id
            , @RequestParam(value = "index",required = false) Integer index
            , HttpServletRequest request
            , HttpServletResponse res
                         ) {
        log.info("detail id=>{}", id);
        model.addAttribute(AttributeKeyHelper.INDEX_DATA, index);
        System.err.println(index);
        String osName = request.getHeader(AttributeKeyHelper.USER_AGENT);
        //获取引用
        String referer = request.getHeader(AttributeKeyHelper.REFERER);
        if(osName.indexOf(AttributeKeyHelper.ANDROID) != -1 || osName.indexOf(AttributeKeyHelper.IPHONE) != -1 || osName.indexOf(AttributeKeyHelper.IPAD) != -1 ){
            return String.format(AttributeKeyHelper.REDIRECT_M_DETAIL_PAGE , cityen , id);
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
            JSONObject resultJSONObject = result.getJSONObject(RESULT);
            //获取是否上架的标识
            Integer upper = (Integer)resultJSONObject.get(AttributeKeyHelper.UPPER);
            //如果upper为0代表是下架,返回到资讯下架提示页面
            if(Objects.equals(0 , upper)){
                return AttributeKeyHelper.OFF_SHELF_NEWS;
            }
            if(resultJSONObject.get(NEWS_RELATED) != null) {
                //将房源对象进行转换
                String newsRelatedData = JSON.toJSONString(resultJSONObject.get(NEWS_RELATED));
                List<NewsRelated> types = JSON.parseArray(newsRelatedData, NewsRelated.class);
                //将新房、二手房、小区进行过滤
                List<NewsRelated> xinfangTypes = types.stream().filter(l -> l.getOtype().equals(AttributeKeyHelper.XINFANG_KEY)).collect(Collectors.toList());
                List<NewsRelated> esfTypes = types.stream().filter(l -> l.getOtype().equals(AttributeKeyHelper.ERSHOUFANG_KEY)).collect(Collectors.toList());
                List<NewsRelated> xiaoquTypes = types.stream().filter(l -> l.getOtype().equals(AttributeKeyHelper.XIAOQU_KEY)).collect(Collectors.toList());

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
                    model.addAttribute(AttributeKeyHelper.COMMON_HOUSE_RESULT , commonHouseResult);
                    //用于判断绑定的房源数据是否只有一条
                    model.addAttribute(AttributeKeyHelper.COMMON_HOUSE_RESULT_SIZE , commonHouseResult.size());
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
                model.addAttribute(AttributeKeyHelper.INFO_NEWS, infoNews);
                model.addAttribute(AttributeKeyHelper.HOT_TYPE, item.getId());
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
            Integer typeId = (Integer) detail.get(AttributeKeyHelper.DETAIL_BY_TYPE_ID_ATTR);
            //判断是否为百科id
            if (!CollectionUtils.isEmpty(typeIdList) && typeIdList.contains(typeId)) {
                //存储一个字段，是百科id，方便前端跳转
                model.addAttribute(AttributeKeyHelper.BAIKE_FLAG, true);
            } else {
                //存储一个字段，不是百科id，方便前端跳转
                model.addAttribute(AttributeKeyHelper.BAIKE_FLAG, false);
            }
        }else {
            //存储一个字段，不是百科id，方便前端跳转
            model.addAttribute(AttributeKeyHelper.BAIKE_FLAG, false);
        }

        //将文章内容进行格式化
        String content = (String) detail.get(AttributeKeyHelper.CONTENT);
        if (!StringUtils.isEmpty(content)) {
            model.addAttribute(AttributeKeyHelper.DETAIL_CONTENT, content.replace("crossorigin=\"anonymous\"", ""));
        }


        if (Objects.equals(detail.get(AttributeKeyHelper.FLAG) , AttributeKeyHelper.URL)) {//若flag的值为url,将文章跳转到此url指向的地址
            return String.format(AttributeKeyHelper.REDIRECT_LINK , detail.get(AttributeKeyHelper.DETAIL_BY_URL_ATTR));
        }

        model.addAttribute(AttributeKeyHelper.NEWS, news);
        model.addAttribute(AttributeKeyHelper.DETAIL, detail);
        model.addAttribute(AttributeKeyHelper.NEWS_ID, id);
        model.addAttribute(AttributeKeyHelper.REFERER, referer);
        //大湾区埋点 神策数据
        if(dwCitys.contains(cityen)&&DwMaiDianUtiil.isMaiDianON){
            //获取参数
            String json = CommonUtil.getQuerysParam(request);
            NewsDetailRequest detailRequest = null;
            if(!StringUtils.isEmpty(json)){
                detailRequest = JSON.parseObject(json , NewsDetailRequest.class);
            }
            model.addAttribute(AttributeKeyHelper.DOWNLOAD_CHANNEL, Objects.nonNull(detailRequest) ? detailRequest.getDownloadChannel() : StringResource.EMPTY_STR);

            return DwMaiDianUtiil.DETAIL_CENTIO_DW_PAGE;
        }
        return AttributeKeyHelper.DETAIL_PAGE;
    }

    /**
     * 记录日志
     */
    @ResponseBody
    @GetMapping("/{cityen}/detail/loadNewsViewHistory")
    public void insertLog(HttpServletRequest request , @PathVariable(name = "cityen") String cityen
    ,@RequestParam(name = "newsId") Integer newsId, @RequestParam(name = "downloadChannel" , required = false) String downloadChannel){
        //详情信息
        ApiResult<NewsDetailResponse> result = restTemplate.getForObject(String.format(StringResource.GET_NEWS_CONTENT_FORMAT , apiurl , newsId , cityen), ApiResult.class);
        if (result != null) {
            NewsDetailResponse response = JSON.parseObject(JSON.toJSONString(result.getResult()), NewsDetailResponse.class);
            //记录log
            newsService.insertLog(request, cityen, newsId, response.getTitle(), downloadChannel);
        }
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
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize,
                        @RequestParam(value = "entry", required = false) String entry,
                        @RequestParam(value = "downloadChannel", required = false) String downloadChannel,
                        HttpServletRequest request) {

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
            model.addAttribute(AttributeKeyHelper.TYPE_NAME, typeNameList.get(0));
        } else {//type为空，默认取出百科数据了

            result = newsService.newsListByBaike(cityen, null , BAIKE, page, pagesize, null, null);

            //如果新闻列表有数据，存在对应的栏目id
            List<Map> news1 = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
            if (!CollectionUtils.isEmpty(news1)) {
                //存储栏目id
                model.addAttribute(TYPE_ID, 0);
                //存储栏目名称
                model.addAttribute(AttributeKeyHelper.TYPE_NAME, GOU_FANG_TEXT);
            }
        }
        List<Map> news = JSON.parseArray(JSON.toJSONString(result.get(NEWS_LIST)), Map.class);
        setCommon(model, cityen);

        model.addAttribute(TYPES, baikeTypes);
        //存储百科左侧栏目大小
        model.addAttribute(AttributeKeyHelper.TYPES_SIZE, baikeTypes.size());

        //大湾区埋点 神策数据
        if(dwCitys.contains(cityen)&&DwMaiDianUtiil.isMaiDianON){
            DwMaiDianUtiil.setModel(model,entry,cityen,downloadChannel , request);
            return DwMaiDianUtiil.BAIKE_CENTIO_DW_PAGE;
        }

        model.addAttribute(AttributeKeyHelper.NEWS, news);
        Integer pageCount = result.getInteger(AttributeKeyHelper.PAGE_TOTAL);
        PageUtil p = new PageUtil(pageCount, page, pagesize);
        model.addAttribute(AttributeKeyHelper.PAGE_UTIL_BY_P, p);
        model.addAttribute(AttributeKeyHelper.PAGE, page);
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
        //若类型为空，返回空页面
        if(CollectionUtils.isEmpty(types)){
            return StringResource.EMPTY;
        }
        //如果type的id为464，那么取出东三省的默认第一个栏目
        if(Objects.equals(types.get(0).getId() , 464)){
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

            //如果是北京，隐藏北京写字楼资讯栏目
            if(Objects.equals(cityen , AttributeKeyHelper.BJ_CITY_EN)){
                //筛选出北京写字楼栏目对象，栏目id为659
                List<NewsType> xzlDelList = types.stream().filter(l -> Objects.equals(659, l.getId())).collect(Collectors.toList());
                //如果北京写字楼资讯栏目集合不为空，就删除这些栏目
                if(!CollectionUtils.isEmpty(xzlDelList)){
                    //删除写字楼相关的所有栏目
                    types.removeAll(xzlDelList);
                }
            }

            //如果是东莞，隐藏东莞成交走势栏目
            if(Objects.equals(cityen , AttributeKeyHelper.DG_CITY_EN)){
                //筛选出东莞成交走势栏目对象，栏目id为89
                List<NewsType> chengjiaoDelList = types.stream().filter(l -> Objects.equals(89, l.getId())).collect(Collectors.toList());
                //如果东莞成交走势栏目集合不为空，就隐藏这些栏目
                if(!CollectionUtils.isEmpty(chengjiaoDelList)){
                    //隐藏东莞成交走势相关的所有栏目
                    types.removeAll(chengjiaoDelList);
                }

                //筛选出东莞政策法规栏目对象，栏目id为87
                List<NewsType> zhengceDelList = types.stream().filter(l -> Objects.equals(87, l.getId())).collect(Collectors.toList());
                //如果东莞政策法规栏目集合不为空，就隐藏这些栏目
                if(!CollectionUtils.isEmpty(zhengceDelList)){
                    //隐藏东莞政策法规相关的所有栏目
                    types.removeAll(zhengceDelList);
                }
            }

            //如果是惠州，隐藏Ben钟话市栏目
            if(Objects.equals(cityen , AttributeKeyHelper.HZ_CITY_EN)){
                //筛选出Ben钟话市栏目对象，栏目id为107
                List<NewsType> benDelList = types.stream().filter(l -> Objects.equals(107, l.getId())).collect(Collectors.toList());
                //隐藏Ben钟话市相关的栏目
                types.removeAll(benDelList);
            }
        }
        List<Map> leftUp = new ArrayList<>();
        List<Map> leftDown = new ArrayList<>();
        List<Map> right = new ArrayList<>();
        List<Map> shleft = new ArrayList<>();

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
            //此处为嵌入式页面走getnewslist方法重载传入order=3,不影响new.centanet.com/cityen列表排序
            JSONObject result = newsService.newsList(cityen, typeid, 1, 10, null, null, null,null);
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
            return StringResource.THIRD_BAIKE;
        }

        //如果是惠州，就取全部的百科数据
        if(Objects.equals(cityen , AttributeKeyHelper.HZ_CITY_EN)) {
            //获取购房百科数据
            JSONObject baikeNewList = newsService.newsListByBaike(cityen, null, BAIKE, 1, 6, null, null);
            //如果新闻列表有数据，存在对应的栏目id
            List<Map> baikeNewListMap = JSON.parseArray(JSON.toJSONString(baikeNewList.get(NEWS_LIST)), Map.class);
            //若baikeNewListMap不为空,将百科信息传送到页面上
            if (!CollectionUtils.isEmpty(baikeNewList)) {
                model.addAttribute(BAIKE_NEWS_LIST, baikeNewListMap);
            }
            //如果是北京，就取百科-知识问答内容
        }else if(Objects.equals(AttributeKeyHelper.BJ_CITY_EN , cityen)){
            //获取购房百科-知识问答数据
            JSONObject baikeNewByKnowledgeQAList = newsService.newsListByBaike(cityen, 1048, BAIKE, 1, 6, null, null);
            //如果新闻列表有数据，存在对应的栏目id
            List<Map> baikeNewListByKnowledgeQAMap = JSON.parseArray(JSON.toJSONString(baikeNewByKnowledgeQAList.get(NEWS_LIST)), Map.class);
            //若baikeNewByKnowledgeQAList不为空,将购房百科-知识问答内容传送到页面上
            if (!CollectionUtils.isEmpty(baikeNewByKnowledgeQAList)) {
                model.addAttribute(BAIKE_NEWS_LIST_BY_KNOWLEDGE_QA, baikeNewListByKnowledgeQAMap);
            }
        }





        //获取最新的数据
        JSONObject newsList = newsService.newsList(cityen,  1, 10, 0);
        //将城市最新列表数据转换成List<Map>集合
        List<Map> newsListMap = JSON.parseArray(JSON.toJSONString(newsList.get(NEWS_LIST)), Map.class);
        //若内容为空，返回空页面
        if(CollectionUtils.isEmpty(newsListMap)){
            return StringResource.EMPTY;
        }

        //若newsListMap不为空,将城市最新信息传送到页面上
        if(!CollectionUtils.isEmpty(newsListMap)){
            model.addAttribute(CITY_NEWS_LIST, newsListMap);
        }


        model.addAttribute(StringResource.LEFT_UP, leftUp);
        model.addAttribute(StringResource.SH_LEFT, shleft);
        model.addAttribute(StringResource.LEFT_DOWN, leftDown);
        model.addAttribute(RIGHT, right);
        model.addAttribute(TYPES, types);
        if (StringResource.INDEX.equals(type)) {//二手房
            return StringResource.THIRD_ESF;
        } else if (StringResource.INFO.equals(type)) {//新房
            return StringResource.THIRD_XF;
        }else if (StringResource.SZ_ESF.equals(type) || StringResource.ESF_SZ_NEW.equals(type)) {//深圳二手房老页面及新页面
            return StringResource.THIRD_SZ_ESF;
        }else if (StringResource.ZS_BUYER.equals(type)) {//中山买房帮手
            return StringResource.THIRD_ZS_BUYER;
        }else if (StringResource.SZWORLD_XF.equals(type)) {//深圳海外新房
            return StringResource.THIRD_SZWORLD_XF;
        }else if (StringResource.JJR_BAIKE_INFO.equals(type)) {//北京、惠州经纪人页面百科信息
            return StringResource.JINGJIREN_BAIKE;
        }else if (StringResource.GZ_JJR_BAIKE_INFO.equals(type)) {//广州经纪人页面百科信息
            return StringResource.JINGJIREN_BAIKE_GZ;
        }else if (StringResource.BJ_JJR_BAIKE_INFO.equals(type)) {//北京经纪人页面百科信息
            return StringResource.JINGJIREN_BAIKE_BJ;
        }else if (StringResource.BJWORLD_XF.equals(type)) {//北京海外新房
            return StringResource.THIRD_BJWORLD_XF;
        }else if (StringResource.CS_ESF.equals(type)) {//长沙新房
            return StringResource.THIRD_XF_NEW;
        }else if (StringResource.INFO_NEW.equals(type)) {//新info页面
            return StringResource.THIRD_INFO_NEW;
        }else if (StringResource.ESF_NEW.equals(type)) {//二手房新页面
            return StringResource.THIRD_ESF_NEW;
        }else if (StringResource.THIRD_XA_NEW.equals(type)){//西安新布局
            return StringResource.XA_NEW;
        } else if (StringResource.XZL.equals(type)) {//二手房新页面,写字楼
            return StringResource.THIRD_XZL;
        }else if (StringResource.SH.equals(type)){//上海资讯新页面
            return StringResource.THIRD_SH;
        }
        return StringResource.THIRD_HOT;
    }
}
