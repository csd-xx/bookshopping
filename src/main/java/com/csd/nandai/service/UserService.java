package com.csd.nandai.service;

import com.csd.nandai.domain.User;

/**
 * Created by Administrator on 2016-05-04.
 */
public interface UserService {
    User findOne(String username);

    void save(User user);
}
