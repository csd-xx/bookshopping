package com.csd.nandai.dao;

import com.csd.nandai.domain.User;

import java.util.List;

/**
 * Created by Administrator on 2016-05-04.
 */
public interface UserDao {
    User findOne(String username);

    void save(User user);

    void update(User user);

    List<User> findAll();

    User findUser(int userid);

    void delete(int userid);


}
