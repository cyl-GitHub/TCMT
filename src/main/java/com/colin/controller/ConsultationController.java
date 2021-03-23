package com.colin.controller;

import com.colin.bean.Admin;
import com.colin.bean.Message;
import com.colin.bean.User;

import org.springframework.beans.factory.annotation.Autowired;
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
        if (application.getAttribute("admin") == null) {
            //客服列表
            HashMap<String, String> admin = new HashMap<>();
            application.setAttribute("admin", admin);
        }


        if (application.getAttribute("user") == null) {
            //用户列表
            HashMap<String, User> user = new HashMap<>();
            application.setAttribute("user", user);
        }

        if (application.getAttribute("messageQueue") == null) {
            //消息列表 客服id  消息详情
            HashMap<String, Queue<Message>> messageQueue = new HashMap<>();
            application.setAttribute("messageQueue", messageQueue);
        }

        return "Consultation";
    }

    //信息咨询 管理员
    @RequestMapping(value = "AdminConsultation")
    public String AdminConsultation(HttpSession session) {
        if (application.getAttribute("admin") == null) {
            //客服列表
            HashMap<String, String> admin = new HashMap<>();
            application.setAttribute("admin", admin);
        }


        if (application.getAttribute("user") == null) {
            //用户列表
            HashMap<String, User> user = new HashMap<>();
            application.setAttribute("user", user);
        }

        if (application.getAttribute("messageQueue") == null) {
            //消息列表 客服id  消息详情
            HashMap<String, Queue<Message>> messageQueue = new HashMap<>();
            application.setAttribute("messageQueue", messageQueue);
        }


        if (application.getAttribute("adminMessageQueue") == null) {
            //消息列表 客服id  消息详情
            HashMap<String, Queue<Message>> adminMessageQueue = new HashMap<>();
            application.setAttribute("adminMessageQueue", adminMessageQueue);
        }


        Admin adminLogin = (Admin) session.getAttribute("adminLogin");

        HashMap<String, String> admin = (HashMap<String, String>) application.getAttribute("admin");

        admin.put(adminLogin.getId(), "等待中");

        return "AdminConsultation";
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

            User userLogin = (User) session.getAttribute("userLogin");

            if (userLogin != null) {
                user.put(String.valueOf(userLogin.getId()), null);
            } else {
                int len = 10000 + user.size();
                for (int i = 10000; i <= len; i++) {
                    if (!user.containsKey(String.valueOf(i))) {
                        message.setUserId(String.valueOf(i));
                        user.put(String.valueOf(i), null);
                        User user1 = new User();
                        user1.setId(String.valueOf(i));

                        session.setAttribute("userLogin", user1);
                        break;
                    }
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
        HashMap<String, Queue<Message>> adminMessageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("adminMessageQueue");


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


        Queue<Message> messages1;
        if (!adminMessageQueue.containsKey(message.getAdminId())) {
            messages1 = new LinkedList<>();
        } else {
            messages1 = adminMessageQueue.get(message.getAdminId());
        }

        messages1.add(message);

        if (!adminMessageQueue.containsKey(message.getAdminId())) {
            adminMessageQueue.put(message.getAdminId(), messages1);
        }

        return map;
    }


    //用户发送消息
    @RequestMapping("/adminSend")
    @ResponseBody
    public Map adminSend(@RequestBody Message message, HttpSession session) {
        Map<String, Object> map = new HashMap();
        HashMap<String, User> user = (HashMap) application.getAttribute("user");
        Admin adminLogin = (Admin) session.getAttribute("adminLogin");

        message.setAdminId(adminLogin.getId());
        message.setType(false);


        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");//设置日期格式
        System.out.println();// new Date()为获取当前系统时间

        message.setSendTime(df.format(new Date()));


        map.put("result", "发送成功");


        //将处理好的消息放到application中
        HashMap<String, Queue<Message>> messageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("messageQueue");
        HashMap<String, Queue<Message>> adminMessageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("adminMessageQueue");


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


        Queue<Message> messages1;
        if (!adminMessageQueue.containsKey(message.getAdminId())) {
            messages1 = new LinkedList<>();
        } else {
            messages1 = adminMessageQueue.get(message.getAdminId());
        }

        messages1.add(message);

        if (!adminMessageQueue.containsKey(message.getAdminId())) {
            adminMessageQueue.put(message.getAdminId(), messages1);
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


    @RequestMapping("/adminFlushMessage")
    @ResponseBody
    public Map adminFlushMessage(@RequestBody Message message, HttpSession session) {

        Admin admin = (Admin) session.getAttribute("adminLogin");
        if (admin == null) {
            return null;
        }

        String adminId = admin.getId();

        HashMap<String, Queue<Message>> adminMessageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("adminMessageQueue");

        if (!adminMessageQueue.containsKey(adminId)) {
            return null;
        }

        Queue<Message> messages = adminMessageQueue.get(adminId);

        Map<String, Object> map = new HashMap();

        map.put("messages", messages);

        if (!messages.isEmpty()) {
            String userId1 = messages.peek().getUserId();
            if (userId1 != null && !userId1.equals("")) {
                session.setAttribute("userId", userId1);
            }
        }

        String userId = (String) session.getAttribute("userId");

        map.put("userId", userId);

        Queue<Message> messages1 = new LinkedList();
        adminMessageQueue.put(adminId, messages1);

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
        HashMap<String, Queue<Message>> adminMessageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("adminMessageQueue");

        if (admin.containsKey(message.getAdminId())) {
            admin.put(message.getAdminId(), "等待中");
        }

        if (user.containsKey(message.getUserId())) {
            user.remove(message.getUserId());
        }

        if (messageQueue.containsKey(message.getAdminId())) {
            messageQueue.remove(message.getAdminId());
            adminMessageQueue.remove(message.getAdminId());
        }

        return null;
    }


    @RequestMapping("/adminExit")
    @ResponseBody
    public Map adminExit(@RequestBody Message message, HttpSession session) {

        HashMap admin = (HashMap) application.getAttribute("admin");
        HashMap<String, Queue<Message>> messageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("messageQueue");
        HashMap<String, Queue<Message>> adminMessageQueue = (HashMap<String, Queue<Message>>) application.getAttribute("adminMessageQueue");


        Admin adminLogin = (Admin) session.getAttribute("adminLogin");

        admin.remove(adminLogin.getId());
        messageQueue.remove(adminLogin.getId());
        adminMessageQueue.remove(adminLogin.getId());

        return null;
    }


}
