package com.csd.nandai.controller;

import com.csd.nandai.domain.Book;
import com.csd.nandai.service.BookService;
import com.csd.nandai.util.BookUtil;
import com.csd.nandai.util.PageUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016-05-04.
 */
@Controller
public class BookController {
    @Resource
    private BookService bookService;


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
}
