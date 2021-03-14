package com.colin.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 聊天记录数据传输层
 */
@Getter
@Setter
@ToString
public class Message {

    /**
     * 用户信息
     */
    private String userId;

    /**
     * 客服信息
     */
    private String adminId;


    /**
     * 消息
     */
    private String message;
    /**
     * 图片
     */
    private String image;
    /**
     * 发送时间
     */
    private String sendTime;

    //用户发送0  客服发送1
    private Integer type;

}
