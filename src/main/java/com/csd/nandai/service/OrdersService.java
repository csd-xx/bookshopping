package com.csd.nandai.service;

import com.csd.nandai.domain.Orders;

import java.util.List;

/**
 * Created by Administrator on 2016-05-05.
 */
public interface OrdersService {
    List<Orders> findOne(int userid);
}
