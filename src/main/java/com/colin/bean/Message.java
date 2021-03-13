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
    private User user;
    /**
     * 消息
     */
    private String message;
    /**
     * 图片
     */
    private String image;
    /**
     * 消息类型
     */
    private MessageTypeEnum type;
    /**
     * 发送时间
     */
    private String sendTime;


}
