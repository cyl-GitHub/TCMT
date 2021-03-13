package com.colin.controller;

import com.colin.bean.Message;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping(value = "consultationController")
public class ConsultationController {


    //信息咨询
    @RequestMapping(value = "Consultation")
    public String Consultation() {
        return "Consultation";
    }


    //用户发送消息
    @RequestMapping("/userSend")
    @ResponseBody
    public Map userSend(@RequestBody Message message, HttpSession session) {
        Map<String, Object> map = new HashMap();
        Map admin = (Map) session.getAttribute("admin");

        if (admin == null || admin.size() == 0) {
            map.put("result", "暂无客服在线,请稍后再进行咨询!");
            return map;
        } else {

            if (admin.containsValue("等待中")) {



            } else {
                map.put("result", "客服正忙,请稍后!");
                return map;
            }


        }


        return null;
    }


}
