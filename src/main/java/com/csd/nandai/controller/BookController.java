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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    List<Book> bookList = new ArrayList<Book>();

    @RequestMapping("/book/select/all")
    @ResponseBody
    public String bookSelectAll(HttpServletRequest request) {//分页查询图书信息
        String page = request.getParameter("page");
        String rows = request.getParameter("rows");

        if (page == null) {
            page = "1";
        }
        if (rows == null || rows.equals("NaN")) {
            rows = "10";
        }

        int total = bookService.countAll();
        PageUtil pu = new PageUtil(Integer.parseInt(page), Integer.parseInt(rows));
        List<Book> book = bookService.findAll(pu);
        BookUtil bu = new BookUtil();
        bu.setTotal(total);
        bu.setRows(book);
        JSONObject jsonObj = JSONObject.fromObject(bu);
        System.out.println(jsonObj.toString());
        return jsonObj.toString();
    }

    @RequestMapping("/shoppingcart")
    @ResponseBody
    public String shoppingCart(@RequestParam("bookid")int bookid) {//往购物车里添加图书
        boolean j = true;
        Book book = bookService.findOne(bookid);
        for (Book a : bookList) {
            if (a.getBookid() == bookid) {
                a.setTotal(a.getTotal() + 1);
                j = false;
            }
        }
        if (j) {
            book.setTotal(1);
            bookList.add(book);
        }

        JSONArray js = JSONArray.fromObject(bookList);
        return js.toString();
    }

    @RequestMapping("/add/orders")
    @ResponseBody
    public String addorders(HttpServletRequest request) {//生产订单和订单明细
        DateUtil d = new DateUtil();
        String ordertime = d.getTime();
        String username = request.getParameter("username");
        User user = userService.findOne(username);
        float total = 0;
        for (Book a : bookList) {
            total = total + (a.getBookprice() * a.getTotal());
        }
        int userid = user.getUserid();
        OrderidUtil ou = new OrderidUtil();
        ou.setOrdertime(ordertime);
        ou.setUserid(userid);
        Orders orders = new Orders();
        orders.setUserid(userid);
        orders.setOrdertime(ordertime);
        orders.setOrderprice(total);
        ordersService.save(orders);
        Orders order = ordersService.findOrderid(ou);
        System.out.println(order.getOrderid());
        Orderdetail detail = new Orderdetail();
        for (Book a : bookList) {
            detail.setBookid(a.getBookid());
            detail.setBooknum(a.getTotal());
            detail.setOrderid(order.getOrderid());
            detailService.save(detail);
        }
        bookList.clear();
        Success s = new Success();
        s.setSuccess(true);
        return JSONObject.fromObject(s).toString();

    }

    @RequestMapping("/orders/cancel")
    @ResponseBody
    public String ordercancel() {//清除购物车
        bookList.clear();
        JSONArray js = JSONArray.fromObject(bookList);
        System.out.println(js);
        return js.toString();
    }

    @RequestMapping("/admin/select/book")
    @ResponseBody
    public String adminSelectBook(HttpServletRequest request) {//管理员查询图书信息
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        Book book = bookService.findOne(bookid);
        JSONArray js = JSONArray.fromObject(book);
        return js.toString();
    }

    @RequestMapping("/admin/add/book")
    @ResponseBody
    public String adminAddBook(Book book) {//添加图书信息
        bookService.save(book);
        Success s = new Success();
        s.setSuccess(true);
        System.out.println(JSONObject.fromObject(s).toString());
        return JSONObject.fromObject(s).toString();
    }

    @RequestMapping("/admin/edit/book")
    @ResponseBody
    public String adminEditBook(Book book) {//修改图书信息
        bookService.update(book);
        Success s = new Success();
        s.setSuccess(true);
        System.out.println(JSONObject.fromObject(s).toString());
        return JSONObject.fromObject(s).toString();
    }

    @RequestMapping("/admin/select/one/book")
    @ResponseBody
    public String adminSelectOneBook(HttpServletRequest request) {//给编辑图书框赋值
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        Book book = bookService.findOne(bookid);
        return JSONObject.fromObject(book).toString();
    }

    @RequestMapping("/admin/delete/book")
    @ResponseBody
    public String adminDeleteBook(HttpServletRequest request) {//删除图书信息
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        bookService.delete(bookid);
        Success s = new Success();
        s.setSuccess(true);
        System.out.println(JSONObject.fromObject(s).toString());
        return JSONObject.fromObject(s).toString();
    }

    @RequestMapping("/detail/select/book")
    @ResponseBody
    public String detailSelectBook(HttpServletRequest request) {//查询图书信息
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        Book book = bookService.findOne(bookid);
        JSONArray js = JSONArray.fromObject(book);
        return js.toString();
    }

    @RequestMapping("/look/shopping/cart")
    @ResponseBody
    public String lookShoppingCart() {//查询购物车

        JSONArray js = JSONArray.fromObject(bookList);
        return js.toString();
}
    @RequestMapping("/remove/book")
    @ResponseBody
    public String removeBook(String bookid) {//移除购物车中的图书
        int id=Integer.parseInt(bookid);
        for(int i=0;i<bookList.size();i++){
            if(bookList.get(i).getBookid()==id){
                bookList.remove(i);
                break;
            }

        }
        JSONArray js = JSONArray.fromObject(bookList);
        return js.toString();
    }

}
