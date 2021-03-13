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
     * 发送者信息
     */
    private String userSendId;
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

    /**
     * 接受者信息
     */
    private String userReceiveId;

}
