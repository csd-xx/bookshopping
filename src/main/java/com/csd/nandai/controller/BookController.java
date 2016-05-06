package com.csd.nandai.controller;

import com.csd.nandai.domain.Book;
import com.csd.nandai.domain.Orderdetail;
import com.csd.nandai.domain.Orders;
import com.csd.nandai.domain.User;
import com.csd.nandai.service.BookService;
import com.csd.nandai.service.DetailService;
import com.csd.nandai.service.OrdersService;
import com.csd.nandai.service.UserService;
import com.csd.nandai.util.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016-05-04.
 */
@Controller
public class BookController {
    @Resource
    private BookService bookService;
    @Resource
    private UserService userService;
    @Resource
    private OrdersService ordersService;
    @Resource
    private DetailService detailService;
    List<Book> bookList=new ArrayList<Book>();

    @RequestMapping("/book/select/all")
    @ResponseBody
    public String bookSelectAll(HttpServletRequest request){//分页查询图书信息
        String page = request.getParameter("page");
        String rows = request.getParameter("rows");

        if (page == null) {
            page = "1";
        }
        if (rows == null) {
            rows = "10";
        }

        int total =bookService.countAll();
        PageUtil pu=new PageUtil(Integer.parseInt(page), Integer.parseInt(rows));
        List<Book> book=bookService.findAll(pu);
        BookUtil bu=new BookUtil();
        bu.setTotal(total);
        bu.setRows(book);
        JSONObject jsonObj = JSONObject.fromObject(bu);
        System.out.println(jsonObj.toString());
        return jsonObj.toString();
    }
    @RequestMapping("/shoppingcart")
    @ResponseBody
    public String shoppingCart(HttpServletRequest request){//往购物车里添加图书
        boolean j=true;
        int bookid=Integer.parseInt(request.getParameter("bookid"));
        Book book=bookService.findOne(bookid);
        for(Book a:bookList){
            if(a.getBookid()==bookid){
                a.setTotal(a.getTotal()+1);
                j=false;
            }
        }
        if(j){
            book.setTotal(1);
            bookList.add(book);
        }

        JSONArray js=JSONArray.fromObject(bookList);
        return js.toString();
    }
    @RequestMapping("/add/orders")
    @ResponseBody
    public String addorders(HttpServletRequest request){//生产订单和订单明细
        DateUtil d=new DateUtil();
        String ordertime=d.getTime();
        String username=request.getParameter("username");
        User user=userService.findOne(username);
        float total=0;
        for(Book a:bookList){
            total=total+(a.getBookprice()*a.getTotal());
        }
        int userid=user.getUserid();
        OrderidUtil ou=new OrderidUtil();
        ou.setOrdertime(ordertime);
        ou.setUserid(userid);
        Orders orders=new Orders();
        orders.setUserid(userid);
        orders.setOrdertime(ordertime);
        orders.setOrderprice(total);
        ordersService.save(orders);
        Orders order=ordersService.findOrderid(ou);
        System.out.println(order.getOrderid());
        Orderdetail detail=new Orderdetail();
        for(Book a:bookList){
            detail.setBookid(a.getBookid());
            detail.setBooknum(a.getTotal());
            detail.setOrderid(order.getOrderid());
            detailService.save(detail);
        }
        bookList.clear();
        Success s=new Success();
        s.setSuccess(true);
        return JSONObject.fromObject(s).toString();

    }
    @RequestMapping("/orders/cancel")
    @ResponseBody
    public String ordercancel() {
        bookList.clear();
        JSONArray js=JSONArray.fromObject(bookList);
        System.out.println(js);
        return js.toString();
    }


}
