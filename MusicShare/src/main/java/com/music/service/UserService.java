package com.music.service;

import com.music.entity.User;

import java.util.Map;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-21-20:52
 */
public interface UserService {

    public User userLogin(User user);

    //根据userid查询单个user
    public User findUserByUserid(String userid);

    //根据前端传过来的用户名进行是否重复判断
    public User validateRepeat(String username);

    public Integer userRegister(Map<String,Object> map);

    public void userUpdate(User user);

    public void updateUserHeadPic(User user);

    public void updateUserScore(User user);

}
