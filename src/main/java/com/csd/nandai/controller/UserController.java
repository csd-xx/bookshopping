package com.csd.nandai.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csd.nandai.domain.User;
import com.csd.nandai.service.UserService;
import com.csd.nandai.util.Success;

import net.sf.json.JSONObject;

/**
 * Created by Administrator on 2016-05-04.
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/user/select/one")
    public String userLogin(HttpServletRequest request){//登录
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user=userService.findOne(username);
        if(password.equals(user.getPassword())){
            HttpSession session = request.getSession();
            session.setAttribute("user", user.getUsername());
            return "/book.jsp";
        }
        else{
            return "/error.jsp";
        }

    }
    @RequestMapping("/user/register")
    @ResponseBody
    public String userRegister(User user){//添加用户信息
    	userService.save(user);
    	Success s=new Success();
    	s.setSuccess(true);
    	System.out.println(JSONObject.fromObject(s).toString());
    	return JSONObject.fromObject(s).toString();
    }
    @RequestMapping("/select/user/edit")
    @ResponseBody
    public String userEdit(HttpServletRequest request){//查找用户信息
        String name= request.getParameter("username");
        User user=userService.findOne(name);

        System.out.println(JSONObject.fromObject(user).toString());
        return JSONObject.fromObject(user).toString();
    }
    @RequestMapping("/update/user")
    @ResponseBody
    public String updateUser(HttpServletRequest request,User user) {//更改用户信息
        String name= request.getParameter("username");
        int id=userService.findOne(name).getUserid();
        user.setUserid(id);
        userService.update(user);
        Success s=new Success();
        s.setSuccess(true);
        return JSONObject.fromObject(s).toString();
    }
    
}
