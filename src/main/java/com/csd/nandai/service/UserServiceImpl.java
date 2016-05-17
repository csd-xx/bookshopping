package com.csd.nandai.service;

import com.csd.nandai.dao.UserDao;
import com.csd.nandai.domain.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
        System.err.println(user.getSex());
        userDaO.update(user);
    }

    public List<User> findAll() {
        return userDaO.findAll();
    }

    public User findUser(int userid) {
        return userDaO.findUser(userid);
    }

    public void delete(int userid) {
        userDaO.delete(userid);
    }
}
