package com.music.service.impl;

import com.music.dao.IUserDao;
import com.music.entity.User;
import com.music.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-04-23-12:02
 */
@Service("userService")
public class IUserServiceImpl implements IUserService {

    @Resource
    private IUserDao IUserDao;

    public User getUserById(int userId) {
        return this.IUserDao.selectByPrimaryKey(userId);
    }
}
