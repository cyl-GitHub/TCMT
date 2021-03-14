package com.colin.controller;

import com.colin.bean.Message;
import com.colin.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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
        HashMap admin = (HashMap) session.getAttribute("admin");
        HashMap<String, User> user = (HashMap) session.getAttribute("user");

        int len = 100 + user.size();

        //当游客无id时
        if (message.getUserSendId() == null || message.getUserSendId().equals("")) {
            for (int i = 100; i < len; i++) {
                if (!user.containsKey(String.valueOf(i))) {
                    message.setUserSendId(String.valueOf(i));
                    break;
                }
            }
        }

        //当第一次发消息无客服
        if (message.getUserReceiveId() == null || message.getUserReceiveId().equals("")) {
            if (admin == null || admin.size() == 0) {
                map.put("result", "暂无客服在线,请稍后再进行咨询!");
                return map;
            } else {
                if (admin.containsValue("等待中")) {
                    Iterator map1it = admin.entrySet().iterator();
                    while (map1it.hasNext()) {
                        Map.Entry<String, String> entry = (Map.Entry<String, String>) map1it.next();

                        if (entry.getValue().equals("等待中")) {
                            message.setUserReceiveId(entry.getKey());
                            break;
                        }
                    }
                } else {
                    map.put("result", "客服正忙,请稍后!");
                    return map;
                }
            }
        }

        //有客服
        map.put("result", "发送成功");
        map.put("message", message);
        return map;
    }


}
