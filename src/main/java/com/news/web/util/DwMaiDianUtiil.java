package com.news.web.util;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

public class DwMaiDianUtiil {
    public static final boolean isMaiDianON=true;

    public  static  final  String DETAIL_CENTIO_DW_PAGE = "detail_centio_dw";
    public  static  final String INDEX_CENTIO_DW_PAGE = "index_centio_dw";
    public  static  final String TOPIC_LIST_CENTIO_DW_PAGE = "topic_list_centio_dw";
    public  static  final String NEW_LIST_CENTIO_DW_PAGE = "news_list_centio_dw";

    public static void setModel(Model model, String entry, String cityen, HttpServletRequest request) {
        if(!isNullOrEmpty(entry)){
            model.addAttribute("entry",entry);
        }
        String[] urlParts=request.getRequestURL().toString().split("/");
        if(request.getHeader("user-agent").contains("MicroMessenger")){
            String sendUrl=urlParts[0]+"//"+urlParts[2]+"/"+urlParts[3]+"/"+urlParts[4]+"/";
            model.addAttribute("sendUrl",sendUrl);
        }

    }
    public static boolean isNullOrEmpty(Object o){
        return null==o||o.toString().equals("");
    }
}
