package com.music.service.impl;

import com.music.dao.FavoriteDao;
import com.music.entity.Favorite;
import com.music.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-19:05
 */
@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Autowired
    private FavoriteDao favoriteDao;

    public List<String> getSongidsByUserid(String userid) {
        return favoriteDao.getSongidsByUserid(userid);
    }

    public Integer getFavsCountByUserid(String userid) {
        return favoriteDao.getFavsCountByUserid(userid);
    }

    public Favorite getFavorite(Favorite favorite) {
        return favoriteDao.getFavorite(favorite);
    }

    public Integer addFavorite(Favorite favorite) {
        return favoriteDao.addFavorite(favorite);
    }
}
