package com.lpssfxy.ldy.crawlernoveladmin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScan("com.lpssfxy.ldy.crawlernoveladmin.mapper")
@SpringBootApplication
public class CrawlerNovelAdminApplication {
    public static void main(String[] args) {
        SpringApplication.run(CrawlerNovelAdminApplication.class, args);
    }

}
