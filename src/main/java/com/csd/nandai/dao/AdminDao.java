package com.csd.nandai.dao;

import com.csd.nandai.domain.Admin;

/**
 * Created by Administrator on 2016-05-09.
 */
public interface AdminDao {
    Admin findOne(String adminname);

}
