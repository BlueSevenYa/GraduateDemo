package com.music.service.impl;

import com.music.dao.MenuSongDao;
import com.music.entity.MenuSong;
import com.music.service.MenuSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-24-16:24
 */
@Service
public class MenuSongServiceImpl implements MenuSongService {

    @Autowired
    private MenuSongDao menuSongDao;

    public MenuSong getMenuSong(MenuSong menuSong) {
        return menuSongDao.getMenuSong(menuSong);
    }

    public Integer addMenuSong(MenuSong menuSong) {
        return menuSongDao.addMenuSong(menuSong);
    }
}
