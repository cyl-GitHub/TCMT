package com.colin.controller;

import com.colin.bean.Admin;
import com.colin.bean.Expert;
import com.colin.service.ExpertService;
import com.colin.util.ParamCheck;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "expertController")
public class ExpertController {


    @Autowired
    private ExpertService expertService;

    //  登录
    @RequestMapping("/doLogin")
    @ResponseBody
    public Map doLogin(@RequestBody Expert expert) {
        Boolean b = ParamCheck.ParamCheck(expert.getExpertName(), expert.getExpertTelephone());
        Map<String, Object> map = new HashMap<>();
        if (b) {
           Expert expertLogin = expertService.selectExpert(expert);

            if (expertLogin != null) {
                map.put("result", "审核已提交,请勿重复提交!");
                return map;
            } else {
                expertService.insertExpert(expert);
                map.put("result", "success");
                return map;
            }

        } else {
            map.put("result", "信息不可为空");
            return map;
        }
    }


    @RequestMapping("selectExpert")
    public String selectExpert(@Param("pageNumber") Integer pageNumber, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 3;
        int totalPage;
        Admin adminLogin = (Admin) session.getAttribute("adminLogin");
        Integer count = expertService.selectCount();

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

        List<Expert> experts = expertService.selectAllExpert((pageNumber1 - 1) * pageCount, pageCount);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("experts", experts);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("adminLogin", adminLogin.getId());

        return "admin/ExpertAdministration";
    }


    @RequestMapping("selectExpertByExamine")
    public String selectExpertByExamine(@Param("pageNumber") Integer pageNumber, Model model, HttpSession session) {

        int pageNumber1 = 1;

        if (pageNumber != null)
            pageNumber1 = pageNumber;
        int pageCount = 6;
        int totalPage;
        Admin adminLogin = (Admin) session.getAttribute("adminLogin");
        Integer count = expertService.selectCountExamine();

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

        List<Expert> experts = expertService.selectExpertExamine((pageNumber1 - 1) * pageCount, pageCount);
        model.addAttribute("pageNumber", pageNumber1);
        model.addAttribute("experts", experts);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("adminLogin", adminLogin.getId());

        return "admin/ExpertAdministration";
    }




}
