/**
 * @Author: Steven.yu
 * @Description: 资讯PC站主启动器
 * @CreateTime: 2020/05/11 09:40:56
 */
package com.news.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class NewsWebApplication  extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(NewsWebApplication.class);
    }



    public static void main(String[] args) {
        SpringApplication.run(NewsWebApplication.class , args);
    }
}
