package com.colin.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 聊天记录数据传输层
 */
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

    //用户发送true  客服发送false
    private Boolean type;


    public Message() {
    }

    public Message(String userId, String adminId, String message, String image, String sendTime, Boolean type) {
        this.userId = userId;
        this.adminId = adminId;
        this.message = message;
        this.image = image;
        this.sendTime = sendTime;
        this.type = type;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }


    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }
}
