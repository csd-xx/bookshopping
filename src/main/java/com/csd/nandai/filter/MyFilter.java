package com.csd.nandai.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by Administrator on 2016-05-04.
 */
@WebFilter("/*")
public class MyFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("ctx", ((HttpServletRequest) request).getContextPath());
        chain.doFilter(request, response);
    }

    public void destroy() {

    }
}
