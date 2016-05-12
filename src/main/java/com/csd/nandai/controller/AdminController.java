package com.csd.nandai.controller;

import com.csd.nandai.domain.Admin;
import com.csd.nandai.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016-05-09.
 */
@Controller
public class AdminController {
    @Resource
    private AdminService adminService;

    @RequestMapping("/admin/select/one")
    public String userLogin(HttpServletRequest request){//登录
        String adminname=request.getParameter("adminname");
        String password=request.getParameter("password");
        Admin admin=adminService.findOne(adminname);
        if(password.equals(admin.getPassword())){
            return "/admin.jsp";
        }
        else{
            return "/error.jsp";
        }

    }
}
