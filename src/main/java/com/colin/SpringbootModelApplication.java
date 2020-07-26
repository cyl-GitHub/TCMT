package com.colin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@MapperScan("com.colin.mapper")//扫描mapper，要不然就在每个mapper接口用@mapper，否则就这样进行扫描
@SpringBootApplication(scanBasePackages = "com.colin")
@EnableTransactionManagement  //开启事务管理
public class SpringbootModelApplication {
    public static void main(String[] args) {

        SpringApplication.run(SpringbootModelApplication.class, args);
    }

}
