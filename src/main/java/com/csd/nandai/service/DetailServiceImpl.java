package com.csd.nandai.service;

import com.csd.nandai.dao.DetailDao;
import com.csd.nandai.domain.Orderdetail;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016-05-06.
 */
@Service("detailService")
public class DetailServiceImpl implements DetailService{
    @Resource
    private DetailDao detailDao;
    public List<Orderdetail> findOne(int orderid) {
        return detailDao.findOne(orderid);
    }

    public void save(Orderdetail detail) {
        detailDao.save(detail);
    }
}
