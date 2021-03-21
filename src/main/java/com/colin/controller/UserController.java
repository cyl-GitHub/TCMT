package com.colin.controller;

import com.colin.bean.Admin;
import com.colin.bean.User;
import com.colin.service.UserService;
import com.colin.util.ParamCheck;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "userController")
public class UserController {

    @Autowired
    private UserService userService;

    //  登录
    @RequestMapping("/doLogin")
    @ResponseBody
    public Map doLogin(@RequestBody User user, HttpSession session, HttpServletRequest request) {


        Boolean b = ParamCheck.ParamCheck(user.getName(), user.getEmail(), user.getTelephone());
        String code = user.getCode();
        Map<String, Object> map = new HashMap<>();

        if (b) {
            boolean matches = true;
            String sessionCode = request.getSession().getAttribute("code").toString();
            //String sessionCode = code;
            if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode) && code.equalsIgnoreCase(sessionCode)) {

                User userLogin = userService.selectUser(user);


                if (userLogin != null) {
                    map.put("result", "信息已提交,请勿重复提交!");
                    return map;
                } else {
                    userService.insertUser(user);
                    map.put("result", "success");
                    return map;
                }

            } else {
                map.put("result", "验证码错误");
                return map;
            }
        } else {
            map.put("result", "信息不可为空");
            return map;
        }
    }


    @RequestMapping("selectUser")
    public String selectUser(@Param("pageNumber") Integer pageNumber, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 6;
        int totalPage;
        Admin adminLogin = (Admin) session.getAttribute("adminLogin");
        Integer count = userService.selectCount();

        if (count % pageCount == 0) {
            totalPage = count / pageCount;
        } else {
            totalPage = count / pageCount + 1;
        }

        if (pageNumber1 <= 0) {
            pageNumber1 = 1;
        } else if (pageNumber1 > totalPage) {
            pageNumber1 = totalPage;
        }

        if (pageNumber1 < 1) {
            pageNumber1 = 1;
        }
        if (totalPage < 1) {
            totalPage = 1;
        }

        List<User> users = userService.selectAllUser((pageNumber1 - 1) * pageCount, pageCount);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("users", users);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("adminLogin", adminLogin.getId());

        return "admin/UserAdministration";
    }


    @RequestMapping("selectUserByExamine")
    public String selectUserByExamine(@Param("pageNumber") Integer pageNumber, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 6;
        int totalPage;
        Admin adminLogin = (Admin) session.getAttribute("adminLogin");
        Integer count = userService.selectCountExamine();

        if (count % pageCount == 0) {
            totalPage = count / pageCount;
        } else {
            totalPage = count / pageCount + 1;
        }

        if (pageNumber1 <= 0) {
            pageNumber1 = 1;
        } else if (pageNumber1 > totalPage) {
            pageNumber1 = totalPage;
        }

        if (pageNumber1 < 1) {
            pageNumber1 = 1;
        }
        if (totalPage < 1) {
            totalPage = 1;
        }

        List<User> users = userService.selectUserExamine((pageNumber1 - 1) * pageCount, pageCount);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("users", users);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("adminLogin", adminLogin.getId());

        return "admin/UserAdministration1";
    }


    @RequestMapping("selectUser1")
    public String selectUser1(@Param("name") String name, @Param("email") String email, Model model, HttpSession session) {

        User user = userService.selectUser1(name, email);

        model.addAttribute("user1", user);

        return "user/showUser";
    }


    @RequestMapping("doExamine")
    public String doExamine(@Param("name") String name, @Param("email") String email, Model model, HttpSession session) {

        userService.doExamine(name, email);
        User user = userService.selectUser1(name, email);

        model.addAttribute("user1", user);

        return "user/showUser";
    }


    @RequestMapping("userDelete")
    public String userDelete(@Param("name") String name, @Param("email") String email, Model model, HttpSession session) {
        userService.userDelete(name, email);
        return "forward:/userController/selectUser?pageNumber=0";
    }

}
