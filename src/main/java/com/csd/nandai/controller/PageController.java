package com.csd.nandai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016-05-04.
 */
@Controller
public class PageController {//加载homepage页面
    @RequestMapping("/select/homepage")
    public String selectHomePage() {
        return "/homepage.jsp";
    }
    @RequestMapping("/select/book")
    public String selectBook() {
        return "/book.jsp";
    }
}
