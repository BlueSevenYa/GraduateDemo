package com.music.dao;

import com.music.entity.Favorite;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-19:02
 */

@Repository("favoriteDao")
public interface FavoriteDao {

    //通过userid查到所有相关联的songid
    public List<String> getSongidsByUserid(String userid);

    public Integer getFavsCountByUserid(String userid);

    public Favorite getFavorite(Favorite favorite);

    public Integer addFavorite(Favorite favorite);

}
