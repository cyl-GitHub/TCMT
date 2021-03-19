package com.colin.controller;

import com.colin.bean.Message;
import com.colin.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.*;
import javax.servlet.descriptor.JspConfigDescriptor;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

@Controller
@RequestMapping(value = "jspController")
public class JspController {
    @Autowired
    private ServletContext application;

    //主页
    @RequestMapping(value = "beginSession")
    public String beginSession(HttpSession session) {

        if (application.getAttribute("admin") == null) {
            //客服列表
            HashMap<String, String> admin = new HashMap<>();
            admin.put("121", "等待中");
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


        return "beginSession";
    }


    //主页
    @RequestMapping(value = "homepageChinese")
    public String homepageChinese() {
        return "homepageChinese";
    }

    @RequestMapping(value = "homepageEnglish")
    public String homepageEnglish() {
        return "homepageEnglish";
    }

    //主治
    @RequestMapping(value = "IndicationsChinese")
    public String IndicationsChinese() {
        return "IndicationsChinese";
    }

    @RequestMapping(value = "IndicationsEnglish")
    public String IndicationsEnglish() {
        return "IndicationsEnglish";
    }


    //TMCT
    @RequestMapping(value = "TCMTChinese")
    public String TCMTChinese() {
        return "TCMTChinese";
    }

    @RequestMapping(value = "TCMTEnglish")
    public String TCMTEnglish() {
        return "TCMTEnglish";
    }


    //服务
    @RequestMapping(value = "ServiceChinese")
    public String ServiceChinese() {
        return "ServiceChinese";
    }

    @RequestMapping(value = "ServiceEnglish")
    public String ServiceEnglish() {
        return "ServiceEnglish";
    }

    //收费标准
    @RequestMapping(value = "CostEnglish")
    public String CostEnglish() {
        return "CostEnglish";
    }

    @RequestMapping(value = "CostChinese")
    public String CostChinese() {
        return "CostChinese";
    }

    //医生注册
    @RequestMapping(value = "ExpertRegisterChinese")
    public String ExpertRegisterChinese() {
        return "ExpertRegisterChinese";
    }

    @RequestMapping(value = "ExpertRegisterEnglish")
    public String ExpertRegisterEnglish() {
        return "ExpertRegisterEnglish";
    }

    //用户登录
    @RequestMapping(value = "UserLoginChinese")
    public String UserLoginChinese() {
        return "UserLoginChinese";
    }

    @RequestMapping(value = "UserLoginEnglish")
    public String UserLoginEnglish() {
        return "UserLoginEnglish";
    }


    //用户登录
    @RequestMapping(value = "AdminLogin")
    public String AdminLogin() {
        return "admin/AdminLogin";
    }

    //用户管理
    @RequestMapping(value = "Administration")
    public String Administration() {
        return "admin/Administration";
    }

    //医生管理
    @RequestMapping(value = "Administration1")
    public String Administration1() {
        return "admin/Administration1";
    }


}
