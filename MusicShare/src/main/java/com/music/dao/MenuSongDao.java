package com.music.dao;

import com.music.entity.MenuSong;
import org.springframework.stereotype.Repository;



/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-24-16:23
 */
@Repository("menuSongDao")
public interface MenuSongDao {

    public MenuSong getMenuSong(MenuSong menuSong);

    public Integer addMenuSong(MenuSong menuSong);

}
