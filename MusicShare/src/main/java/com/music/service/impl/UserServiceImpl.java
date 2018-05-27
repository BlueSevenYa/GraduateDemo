package com.music.service.impl;

import com.music.dao.UserDao;
import com.music.entity.User;
import com.music.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-21-20:53
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public User userLogin(User user) {
        return userDao.userLogin(user);
    }

    public User findUserByUserid(String userid) {
        return userDao.findUserByUserid(userid);
    }

    public User validateRepeat(String username) {
        return userDao.validateRepeat(username);
    }

    public Integer userRegister(Map<String, Object> map) {
        return userDao.userRegister(map);
    }

    public void userUpdate(User user) {
        userDao.userUpdate(user);
    }

    public void updateUserHeadPic(User user) {
        userDao.updateUserHeadPic(user);
    }

    public void updateUserScore(User user) {
        userDao.updateUserScore(user);
    }


}
