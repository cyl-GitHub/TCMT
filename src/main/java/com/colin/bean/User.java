package com.colin.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private String name;//用户名
    private String email;//email
    private String telephone;
    private String description;//病情描述
    private String address; //住址
    private String code;
    private Timestamp registrationTime;//注册时间
    private String examine;

}
