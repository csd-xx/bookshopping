package com.csd.nandai.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csd.nandai.domain.User;
import com.csd.nandai.service.UserService;
import com.csd.nandai.util.Success;

import net.sf.json.JSONObject;

import java.util.List;

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
    @RequestMapping("/admin/select/user")
    @ResponseBody
    public String adminUser(){//管理员页面加载用户信息
        List<User> userList=userService.findAll();
        JSONArray js=JSONArray.fromObject(userList);
        return js.toString();
    }
    @RequestMapping("/admin/select/one/user")
    @ResponseBody
    public String adminSelectUser(HttpServletRequest request){//管理员查询用户信息
        int userid=Integer.parseInt(request.getParameter("userid"));
        User user=userService.findUser(userid);
        JSONArray js=JSONArray.fromObject(user);
        return js.toString();
    }
    @RequestMapping("/open/admin/edit/user")
    @ResponseBody
    public String openAdminEditUser(HttpServletRequest request){//管理员修改用户信息加载
        int userid=Integer.parseInt(request.getParameter("userid"));
        User user=userService.findUser(userid);
        return JSONObject.fromObject(user).toString();
    }
    @RequestMapping("/admin/edit/user")
    @ResponseBody
    public String adminUpdateUser(User user) {//更改用户信息
        userService.update(user);
        Success s=new Success();
        s.setSuccess(true);
        return JSONObject.fromObject(s).toString();
    }
    @RequestMapping("/admin/delete/user")
    @ResponseBody
    public String adminDeleteBook(HttpServletRequest request){//删除用户信息
        int userid=Integer.parseInt(request.getParameter("userid"));
        userService.delete(userid);
        Success s=new Success();
        s.setSuccess(true);
        System.out.println(JSONObject.fromObject(s).toString());
        return JSONObject.fromObject(s).toString();
    }
}
