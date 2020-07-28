/**
 * @Author: Steven.yu
 * @Description: 工具类
 * @CreateTime: 2020/06/28 16:44:28
 */
package com.news.web.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;


public class StringResource implements Serializable {

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
        map.put("szworld", "4008-192-186");
        return (String) map.get(cityen);
    }

}
