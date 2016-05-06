package com.csd.nandai.service;

import com.csd.nandai.dao.UserDao;
import com.csd.nandai.domain.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016-05-04.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDaO;

    public User findOne(String username) {
        return userDaO.findOne(username);
    }

    public void save(User user) {
        userDaO.save(user);
    }

    public void update(User user) {
        userDaO.update(user);
    }
}
