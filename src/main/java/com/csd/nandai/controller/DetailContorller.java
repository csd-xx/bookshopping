package com.csd.nandai.controller;

import com.csd.nandai.domain.Orderdetail;
import com.csd.nandai.service.DetailService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016-05-06.
 */
@Controller
public class DetailContorller {
    @Resource
    private DetailService detailService;
    @RequestMapping("/user/select/detail")
    @ResponseBody
    public String userSelectDetail(HttpServletRequest request){//查找订单明细
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        List<Orderdetail> detail=detailService.findOne(orderid);
        JSONArray js=JSONArray.fromObject(detail);
        return js.toString();
    }
}
