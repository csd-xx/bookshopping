package com.csd.nandai.service;

import com.csd.nandai.domain.Admin;

/**
 * Created by Administrator on 2016-05-09.
 */
public interface AdminService {
    Admin findOne(String adminname);
}
