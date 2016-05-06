package com.csd.nandai.controller;

import com.csd.nandai.domain.Orders;
import com.csd.nandai.domain.User;
import com.csd.nandai.service.OrdersService;
import com.csd.nandai.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016-05-05.
 */
@Controller
public class OrderController {
    @Resource
    private OrdersService ordersService;
    @Resource
    private UserService userService;

    @RequestMapping("/select/user/order")
    @ResponseBody
    public String bookSelectAll(HttpServletRequest request){//查找订单
        String name= request.getParameter("username");
        User user=userService.findOne(name);
        int userid=user.getUserid();
        List<Orders> list=ordersService.findOne(userid);
        JSONArray js=JSONArray.fromObject(list);
        return js.toString();
    }
}
