/**
 * @Author: Steven.yu
 * @Description: 静态常量key
 * @CreateTime: 2020/09/16 09:08:49
 */
package com.news.web.util;

import java.io.Serializable;

public interface AttributeKeyHelper extends Serializable {

    /**
     * 用户请求终端设备，来自于Android/ios/ipad
     */
    String USER_AGENT = "user-agent";

    /**
     * 来自于Android
     */
    String ANDROID = "Android";

    /**
     * 来自于iPhone
     */
    String IPHONE = "iPhone";

    /**
     * 来自于iPad
     */
    String IPAD = "iPad";

    /**
     * 重定向到M站的具体栏目列表地址
     */
    String REDIRECT_M_BY_TYPE_LIST_ADDRESS = "redirect://news.centanet.com/m/%s/c%s/";

    /**
     * 重定向到M站的首页地址
     */
    String REDIRECT_M_BY_INDEX_LIST_ADDRESS = "redirect://news.centanet.com/m/%s/";

    /**
     * 北京，城市简称
     */
    String BJ_CITY_EN = "bj";

    /**
     * 东莞，城市简称
     */
    String DG_CITY_EN = "dg";

    /**
     * 惠州，城市简称
     */
    String HZ_CITY_EN = "hz";

    /**
     * 武汉，城市简称
     */
    String WH_CITY_EN = "wh";

    /**
     * 深圳海外，城市简称
     */
    String SZ_WORLD_CITY_EN = "szworld";

    /**
     * 首页右侧新闻
     */
    String RIGHT_NEWS = "rightNews";

    /**
     * 首页右侧栏目，每个栏目中的文章总数据
     */
    String RIGHT_NEW_ALL_COUNTS = "rightNewAllCounts";

    /**
     * 集团新闻
     */
    String CENTA_NEWS = "centaNews";

    /**
     * 成交走势信息
     */
    String DEAL_INFO = "dealinfo";

    /**
     * 集团栏目
     */
    String JT_TYPES = "jtTypes";

    /**
     * 首页右侧栏目
     */
    String RIGHT_TYPE = "rightType";

    /**
     * 首页左侧当前栏目，默认是第一个栏目
     */
    String TAB_TYPE = "tabtype";

    /**
     * 文章列表
     */
    String NEWS = "news";

    /**
     * 首页
     */
    String INDEX_PAGE = "index";

    /**
     * 新闻列表中，TypeID返回字段
     */
    String NEWS_LIST_BY_TYPE_ID_ATTR = "TypeID";

    /**
     * 类型id
     */
    String TYPE_ID = "typeId";

    /**
     * 总数据
     */
    String TOTAL = "total";

    /**
     * 静态url
     */
    String STATIC_URL = "staticurl";

    /**
     * 城市中文名称
     */
    String CITY_CN = "citycn";

    /**
     * 城市400联系电话
     */
    String CITY_TELPHONE = "cityTelphone";

    /**
     * 研究院地址
     */
    String RESEARCH_URL = "researchUrl";

    /**
     * 热门专题
     */
    String HOT_TOPIC = "热门专题";

    /**
     * 武汉热门专题
     */
    String WH_HOT_TOPIC = "武汉热门专题";

    /**
     * 总页数
     */
    String PAGE_TOTAL = "PageTotal";

    /**
     * 热门专题列表
     */
    String TOP_LIST = "topList";

    /**
     * 当前栏目类型
     */
    String TYPE = "type";

    /**
     * 搜索key
     */
    String SEARCH_KEY = "key";

    /**
     * 当前页
     */
    String PAGE = "page";

    /**
     * 分页
     */
    String PAGE_UTIL_BY_P = "p";

    /**
     * 热门专题列表页面
     */
    String TOPIC_LIST_PAGE = "topic_list";

    /**
     * 栏目列表页面
     */
    String NEWS_LIST_PAGE = "news_list";

    /**
     * 重定向到M站详情页面
     */
    String REDIRECT_M_DETAIL_PAGE = "redirect://news.centanet.com/m/%s/detail/%s.html/";

    /**
     * 新房key
     */
    String XINFANG_KEY = "xinfang";

    /**
     * 二手房key
     */
    String ERSHOUFANG_KEY = "ershoufang";

    /**
     * 小区key
     */
    String XIAOQU_KEY = "xiaoqu";

    /**
     * 绑定的房源数据信息
     */
    String COMMON_HOUSE_RESULT = "commonHouseResult";

    /**
     * 绑定的房源数据大小信息
     */
    String COMMON_HOUSE_RESULT_SIZE = "commonHouseResultSize";

    /**
     * 详情中的热门专题栏目数据
     */
    String INFO_NEWS = "infoNews";

    /**
     * 详情中的热门专题栏目id
     */
    String HOT_TYPE = "hotType";

    /**
     * 详情中的Typeid返回字段
     */
    String DETAIL_BY_TYPE_ID_ATTR = "Typeid";

    /**
     * 是否为百科标识
     */
    String BAIKE_FLAG = "baikeFlag";

    /**
     * 文章内容
     */
    String CONTENT = "Content";

    /**
     * 详情文章内容
     */
    String DETAIL_CONTENT = "detailContent";

    /**
     * flag
     */
    String FLAG = "flag";

    /**
     * url
     */
    String URL = "url";

    /**
     * 详情中的url返回字段
     */
    String DETAIL_BY_URL_ATTR = "Url";

    /**
     * 跳转链接
     */
    String REDIRECT_LINK = "redirect:%s";

    /**
     * 详情
     */
    String DETAIL = "detail";

    /**
     * 文章id
     */
    String NEWS_ID = "newsId";

    /**
     * 详情页面
     */
    String DETAIL_PAGE = "detail";

    /**
     * 栏目名称
     */
    String TYPE_NAME = "typeName";

    /**
     * 总栏目大小
     */
    String TYPES_SIZE = "typesSize";


}
