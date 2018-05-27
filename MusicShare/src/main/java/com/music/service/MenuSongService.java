package com.music.service;

import com.music.entity.MenuSong;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-24-16:24
 */
public interface MenuSongService {

    public MenuSong getMenuSong(MenuSong menuSong);

    public Integer addMenuSong(MenuSong menuSong);

}
