package com.music.dao;

import com.music.entity.User;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-21-20:46
 */
@Repository("userDao")
public interface UserDao {

    public User userLogin(User user);

    public User findUserByUserid(String userid);

    public User validateRepeat(String username);

    public Integer userRegister(Map<String,Object> map);

    public void userUpdate(User user);

    public void updateUserHeadPic(User user);

    public void updateUserScore(User user);


}
