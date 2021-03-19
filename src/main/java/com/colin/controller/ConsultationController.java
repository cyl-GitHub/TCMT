package com.colin.controller;

import com.colin.bean.Message;
import com.colin.bean.User;

import com.sun.glass.ui.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "consultationController")
public class ConsultationController {
    @Autowired
    private ServletContext application;

    //信息咨询
    @RequestMapping(value = "Consultation")
    public String Consultation() {

//        if (session.getAttribute("admin") == null) {
//            //客服列表
//            HashMap<String, String> admin = new HashMap<>();
//            admin.put("121", "等待中");
//            session.setAttribute("admin", admin);
//        }
//
//
//        if (session.getAttribute("user") == null) {
//            //用户列表
//            HashMap<String, User> user = new HashMap<>();
//            session.setAttribute("user", user);
//        }
//
//        if (session.getAttribute("messageQueue") == null) {
//            //消息列表 客服id  消息详情
//            HashMap<String, Queue<Message>> messageQueue = new HashMap<>();
//            session.setAttribute("messageQueue", messageQueue);
//        }


        return "Consultation";
    }


    //用户发送消息
    @RequestMapping("/userSend")
    @ResponseBody
    public Map userSend(@RequestBody Message message, HttpSession session) {
        Map<String, Object> map = new HashMap();
        HashMap admin = (HashMap) application.getAttribute("admin");
        HashMap<String, User> user = (HashMap) application.getAttribute("user");

        message.setType(true);

        //当游客无id时
        if (message.getUserId() == null || message.getUserId().equals("")) {
            int len = 100 + user.size();
            for (int i = 100; i <= len; i++) {
                if (!user.containsKey(String.valueOf(i))) {
                    message.setUserId(String.valueOf(i));
                    user.put(String.valueOf(i), null);
                    break;
                }
            }
        }

        //当第一次发消息无客服
        if (message.getAdminId() == null || message.getAdminId().equals("")) {
            if (admin == null || admin.size() == 0) {
                map.put("result", "暂无客服在线,请稍后再进行咨询!");
                return map;
            } else {
                if (admin.containsValue("等待中")) {
                    Iterator map1it = admin.entrySet().iterator();
                    while (map1it.hasNext()) {
                        Map.Entry<String, String> entry = (Map.Entry<String, String>) map1it.next();

                        if (entry.getValue().equals("等待中")) {
                            message.setAdminId(entry.getKey());
                            admin.put(entry.getKey(), "工作中");
                            break;
                        }
                    }
                } else {
                    map.put("result", "客服正忙,请稍后!");
                    return map;
                }
            }
        }


        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");//设置日期格式
        System.out.println();// new Date()为获取当前系统时间

        message.setSendTime(df.format(new Date()));


        //有客服

        map.put("result", "发送成功");
        map.put("message", message);


        //将处理好的消息放到application中
        HashMap<String, Queue<Message>> messageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("messageQueue");
        Queue<Message> messages;
        if (!messageQueue.containsKey(message.getAdminId())) {
            messages = new LinkedList<>();
        } else {
            messages = messageQueue.get(message.getAdminId());
        }

        messages.add(message);

        if (!messageQueue.containsKey(message.getAdminId())) {
            messageQueue.put(message.getAdminId(), messages);
        }

        return map;
    }


    @RequestMapping("/flushMessage")
    @ResponseBody
    public Map flushMessage(@RequestBody Message message, HttpSession session) {

        if (message.getAdminId() == null || message.getAdminId().equals("")) {
            return null;
        }

        String adminId = message.getAdminId();
        HashMap<String, Queue<Message>> messageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("messageQueue");

        if (!messageQueue.containsKey(adminId)) {
            return null;
        }

        Queue<Message> messages = messageQueue.get(adminId);

        Map<String, Object> map = new HashMap();

        map.put("messages", messages);

        Queue<Message> messages1 = new LinkedList();
        messageQueue.put(adminId, messages1);

        return map;
    }


    @RequestMapping("/exit")
    @ResponseBody
    public Map exit(@RequestBody Message message, HttpSession session) {
        if (message.getUserId() == null && message.getUserId().equals("")) {
            return null;
        }
        if (message.getAdminId() == null && message.getAdminId().equals("")) {
            return null;
        }

        HashMap admin = (HashMap) application.getAttribute("admin");
        HashMap<String, User> user = (HashMap) application.getAttribute("user");
        HashMap<String, Queue<Message>> messageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("messageQueue");

        if (admin.containsKey(message.getAdminId())) {
            admin.put(message.getAdminId(), "等待中");
        }

        if (user.containsKey(message.getUserId())) {
            user.remove(message.getUserId());
        }

        if (messageQueue.containsKey(message.getAdminId())) {
            messageQueue.remove(message.getAdminId());
        }

        return null;
    }



}
