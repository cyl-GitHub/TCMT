package com.colin.bean;

import java.util.List;

public class Hospital {
    private Integer id;//医院id
    private String name;//医院名
    private String link;//医院链接
    private String level;//医院等级
    private String address;//医院地址
    private List<String> master;//专精
    private List<Expert> experts;//专家
    private String certificate;//证书
}
