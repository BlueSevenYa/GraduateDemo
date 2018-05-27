package com.music.service;

import com.music.entity.Favorite;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-19:05
 */
public interface FavoriteService {

    public List<String> getSongidsByUserid(String userid);

    public Integer getFavsCountByUserid(String userid);

    public Favorite getFavorite(Favorite favorite);

    public Integer addFavorite(Favorite favorite);

}
