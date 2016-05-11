package com.csd.nandai.service;

import com.csd.nandai.dao.AdminDao;
import com.csd.nandai.domain.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016-05-09.
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;
    public Admin findOne(String adminname) {
        return adminDao.findOne(adminname);
    }
}
