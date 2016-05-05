package com.csd.nandai.service;

import com.csd.nandai.dao.OrdersDao;
import com.csd.nandai.domain.Orders;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016-05-05.
 */
@Service("ordersService")
public class OrdersServiceImpl implements OrdersService {

    @Resource
    private OrdersDao ordersDao;
    public List<Orders> findOne(int userid) {
        return ordersDao.findOne(userid);
    }
}
