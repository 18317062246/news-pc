/**
 * @Author: Steven.yu
 * @Description: 工具类
 * @CreateTime: 2020/06/28 16:44:28
 */
package com.news.web.util;

import com.news.web.util.common.Cityen;

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
    public static final String INFO_NEW = "info_new";
    public static final String THIRD_INFO_NEW = "third_info_new";
    public static final String ESF_NEW = "esf_new";
    public static final String THIRD_ESF_NEW = "third_esf_new";
    public static final String EMPTY = "empty";
    public static final String EMPTY_STR = "";
    public static final String ESF_SZ_NEW = "esf_sz_new";
    public static final String XZL = "xzl";
    public static final String THIRD_ESF_SZ_NEW = "third_esf_sz_new";
    public static final String THIRD_XF = "third_xf";
    public static final String SZ_ESF = "sz_esf";
    public static final String THIRD_SZ_ESF = "third_sz_esf";
    public static final String CS_ESF = "cs_esf";
    public static final String THIRD_CS_ESF = "third_cs_esf";
    public static final String THIRD_XF_NEW = "third_xf_new";
    public static final String THIRD_XZL = "third_xzl";
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

    public static final String NEWS = "news";
    public static final String CK_USER = "ck_user";
    public static final String CK_USER_WAP = "ck_user_wap";
    public static final String BIG_U = "U";
    public static final String AND = "&";
    public static final String COOKIE_NAME = "Y190cmFja2lk";
    public static final String WINDOWS = "Windows";
    public static final String INTEL_MAC_OS = "Intel Mac OS";
    public static final String PC = "pc";
    public static final String LIKE_MAC_OS = "like Mac OS";
    public static final String ANDROID = "Android";
    public static final String SALE_HOUSE = "salehouse";
    public static final String APP_IOS = "APP_IOS";
    public static final String APP_ANDROID = "APP_ANDROID";
    public static final String MICRO_MESSENGER = "MicroMessenger";
    public static final String WE_CHAT = "WeChat";
    public static final String WAP = "WAP";
    public static final String USER_AGENT = "user-agent";
    public static final String INSERT_VIEW_HISTORY_REQUEST_BY_RABBIT = "%sInsertViewHistoryRequestByRabbit";
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
        map.put(Cityen.BEIJING, "北京");
        map.put(Cityen.TIANJIN, "天津");
        map.put(Cityen.GUANGZHOU, "广州");
        map.put(Cityen.SHENZHEN, "深圳");
        map.put(Cityen.CHENGDU, "成都");
        map.put(Cityen.CHONGQING, "重庆");
        map.put(Cityen.NANJING, "南京");
        map.put(Cityen.WUHAN, "武汉");
        map.put(Cityen.HUIZHOU, "惠州");
        map.put(Cityen.CHANGCHUN, "长春");
        map.put(Cityen.DALIAN, "大连");
        map.put(Cityen.SHENYANG, "沈阳");
        map.put(Cityen.DONGGUAN, "东莞");
        map.put(Cityen.NANNING, "南宁");
        map.put(Cityen.FOSHAN, "佛山");
        map.put(Cityen.HAERBIN, "哈尔滨");
        map.put(Cityen.XIAMEN, "厦门");
        map.put(Cityen.WUXI, "无锡");
        map.put(Cityen.XIANGYANG, "襄阳");
        map.put(Cityen.ZHUHAI, "珠海");
        map.put(Cityen.CHANGSHA, "长沙");
        map.put(Cityen.HANGZHOU, "杭州");
        map.put(Cityen.GANZHOU, "赣州");
        map.put(Cityen.HEFEI, "合肥");
        map.put(Cityen.JINAN, "济南");
        map.put(Cityen.KUNMING, "昆明");
        map.put(Cityen.NINGBO, "宁波");
        map.put(Cityen.XIAN, "西安");
        map.put(Cityen.ZHONGSHAN, "中山");
        map.put(Cityen.ZHAOQING, "肇庆");
        map.put(Cityen.ZHENGZHOU, "郑州");
        map.put(Cityen.HENGQING, "横琴");
        map.put(Cityen.SZWORLD, "海外");
        return (String) map.get(cityen);
    }

    /**
     * 根据城市简称获取城市热线
     * @param cityen 城市简称
     * @return 城市热线
     */
    public static String cityTelphone(String cityen) {
        Map map = new HashMap();
        map.put(Cityen.BEIJING, "400-812-5166");
        map.put(Cityen.TIANJIN, "4008-985-666");
        map.put(Cityen.GUANGZHOU, "4008-103-313");
        map.put(Cityen.SHENZHEN, "4006622712转8888");
        map.put(Cityen.CHENGDU, "400-028-8484");
        map.put(Cityen.CHONGQING, "4008-110-117");
        map.put(Cityen.NANJING, "400-876-6988");
        map.put(Cityen.WUHAN, "400-810-0188");
        map.put(Cityen.HUIZHOU, "400-819-6038");
        map.put(Cityen.CHANGCHUN, "400-819-0218");
        map.put(Cityen.DALIAN, "400-810-0596");
        map.put(Cityen.SHENYANG, "400-810-8620");
        map.put(Cityen.DONGGUAN, "4006622730转8888");
        map.put(Cityen.NANNING, "400-819-3688");
        map.put(Cityen.FOSHAN, "400-819-8990");
        map.put(Cityen.HAERBIN, "400-819-7123");
        map.put(Cityen.XIAMEN, "400-819-7679");
        map.put(Cityen.WUXI, "400-928-0668");
        map.put(Cityen.XIANGYANG, "400-810-0188");
        map.put(Cityen.ZHUHAI, "400-819-0196");
        map.put(Cityen.CHANGSHA, "400-810-0388");
        map.put(Cityen.HANGZHOU, "400-819-7103");
        map.put(Cityen.GANZHOU, "400-819-6038");
        map.put(Cityen.HEFEI, "0551-65667801");
        map.put(Cityen.JINAN, "0531-86922966");
        map.put(Cityen.KUNMING, "0871-63193010");
        map.put(Cityen.NINGBO, "0574-87289000");
        map.put(Cityen.XIAN, "029-81773952");
        map.put(Cityen.ZHONGSHAN, "400-819-2680");
        map.put(Cityen.ZHAOQING, "400-819-8990");
        map.put(Cityen.ZHENGZHOU, "0371-66375760");
        map.put(Cityen.NANCHANG, "0791-86296696");
        map.put(Cityen.FUZHOU, "400-819-8852");
        map.put(Cityen.SZWORLD, "13528771779");
        map.put(Cityen.BJWORLD, "400-070-9022");
        map.put(Cityen.HENGQING, "0756-8575598");
        return (String) map.get(cityen);
    }

    /**
     * 根据城市简称获取城市投诉热线
     * @param cityen 城市简称
     * @return 城市投诉热线
     */
    public static String cityComplaintTelephone(String cityen) {
        Map map = new HashMap();
        map.put(Cityen.SHENZHEN, "0755-3398 0900");
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

    /**
     * 根据城市缩写获取城市代码
     * @param ：城市拼音缩写
     * return:城市代码
     * */
    public static String getCityCode(String cityShort) {
        Map<String, String> map = new HashMap<>();
        map.put(Cityen.BEIJING, "010");
        map.put(Cityen.TIANJIN, "022");
        map.put(Cityen.GUANGZHOU, "020");
        map.put(Cityen.SHENZHEN, "0755");
        map.put(Cityen.CHENGDU, "028");
        map.put(Cityen.CHONGQING, "023");
        map.put(Cityen.NANJING, "025");
        map.put(Cityen.WUHAN, "027");
        map.put(Cityen.HUIZHOU, "0752");
        map.put(Cityen.CHANGCHUN, "0431");
        map.put(Cityen.DALIAN, "0411");
        map.put(Cityen.SHENYANG, "024");
        map.put(Cityen.DONGGUAN, "0769");
        map.put(Cityen.NANNING, "0771");
        map.put(Cityen.FOSHAN, "0757");
        map.put(Cityen.HAERBIN, "0451");
        map.put(Cityen.XIAMEN, "0592");
        map.put(Cityen.WUXI, "0510");
        map.put(Cityen.XIANGYANG, "0710");
        map.put(Cityen.ZHUHAI, "0756");
        map.put(Cityen.CHANGSHA, "0731");
        map.put(Cityen.HANGZHOU, "0571");
        map.put(Cityen.GANZHOU, "0797");
        map.put(Cityen.HEFEI, "0551");
        map.put(Cityen.JINAN, "0531");
        map.put(Cityen.KUNMING, "0871");
        map.put(Cityen.NINGBO, "0574");
        map.put(Cityen.XIAN, "029");
        map.put(Cityen.ZHONGSHAN, "0760");
        map.put(Cityen.ZHAOQING, "0758");
        map.put(Cityen.ZHENGZHOU, "0371");
        return map.get(cityShort);
    }

}
