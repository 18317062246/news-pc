/**
 * @Author: Steven.yu
 * @Description: 工具类
 * @CreateTime: 2020/06/28 16:44:28
 */
package com.news.web.util;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class StringResource implements Serializable {

    /**
     * 静态常量文本
     */
    public static final String INDEX = "index";
    public static final String THIRD_ESF = "third_esf";
    public static final String INFO = "info";
    public static final String THIRD_XF = "third_xf";
    public static final String SZ_ESF = "sz_esf";
    public static final String THIRD_SZ_ESF = "third_sz_esf";
    public static final String CS_ESF = "cs_esf";
    public static final String THIRD_CS_ESF = "third_cs_esf";
    public static final String ZS_BUYER = "zs_buyer";
    public static final String THIRD_ZS_BUYER = "third_zs_buyer";
    public static final String SZWORLD_XF = "szworld_xf";
    public static final String BJWORLD_XF = "bjworld_xf";
    public static final String THIRD_SZWORLD_XF = "third_szworld_xf";
    public static final String THIRD_BJWORLD_XF = "third_bjworld_xf";
    public static final String JJR_BAIKE_INFO = "jjr_baike_info";
    public static final String JINGJIREN_BAIKE = "jingjiren_baike";
    public static final String GZ_JJR_BAIKE_INFO = "gz_jjr_baike_info";
    public static final String JINGJIREN_BAIKE_GZ = "jingjiren_baike_gz";
    public static final String BJ_JJR_BAIKE_INFO = "bj_jjr_baike_info";
    public static final String JINGJIREN_BAIKE_BJ = "jingjiren_baike_bj";
    public static final String THIRD_HOT = "third_hot";
    public static final String THIRD_BAIKE = "third_baike";
    public static final String LEFT_UP = "leftUp";
    public static final String LEFT_DOWN = "leftDown";
    /**
     * 定义获取当前年的格式
     */
    private static final String CURRENT_YEAR_FORMAT = "yyyy";

    /**
     * @param input 原始图片路径
     * @param substring 分隔符
     * @return 返回文件的扩展名
     */
    public static int lastIndexOf(String input, String substring) {
        if (input == null) input = "";
        if (substring == null) substring = "";
        return input.lastIndexOf(substring);
    }

    /**
     * 根据城市简称获取城市名称
     * @param cityen 城市简称
     * @return 城市名称
     */
    public static String citymap(String cityen) {
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
        map.put("szworld", "海外");
        return (String) map.get(cityen);
    }

    /**
     * 根据城市简称获取城市名称
     * @param cityen 城市简称
     * @return 城市名称
     */
    public static String cityTelphone(String cityen) {
        Map map = new HashMap();
        map.put("bj", "400-812-5166");
        map.put("tj", "4008-985-666");
        map.put("gz", "4008-103-313");
        map.put("sz", "4006622712转8888");
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
        map.put("zs", "400-819-2680");
        map.put("zq", "400-819-8990");
        map.put("zz", "0371-66375760");
        map.put("nc", "0791-86296696");
        map.put("fz", "400-819-8852");
        map.put("szworld", "13528771779");
        map.put("bjworld", "400-070-9022");
        return (String) map.get(cityen);
    }

    /**
     * 获取当前的年
     */
    public static String getCurrentYear(){
        //获取当前日期
        Date date = new Date();
        //定义格式化时间的对象
        SimpleDateFormat sdf = new SimpleDateFormat(CURRENT_YEAR_FORMAT);
        //将date类型格式化成string并返回
        return sdf.format(date);
    }

}
