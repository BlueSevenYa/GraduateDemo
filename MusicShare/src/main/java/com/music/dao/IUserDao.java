package com.music.dao;

import com.music.entity.User;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-04-23-11:51
 */
public interface IUserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}
