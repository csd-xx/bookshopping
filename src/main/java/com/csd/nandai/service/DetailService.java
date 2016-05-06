package com.csd.nandai.service;

import com.csd.nandai.domain.Orderdetail;

import java.util.List;

/**
 * Created by Administrator on 2016-05-06.
 */
public interface DetailService {
    List<Orderdetail> findOne(int orderid);

    void save(Orderdetail detail);
}
