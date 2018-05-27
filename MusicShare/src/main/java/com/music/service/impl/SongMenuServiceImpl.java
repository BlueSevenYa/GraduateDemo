package com.music.service.impl;

import com.music.dao.SongMenuDao;
import com.music.entity.IndexSongMenuVo;
import com.music.entity.SongMenu;
import com.music.service.SongMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-19-20:04
 */
@Service
public class SongMenuServiceImpl implements SongMenuService{

    @Autowired
    private SongMenuDao songMenuDao;

    public List<SongMenu> getSongMenuList() {
        return songMenuDao.getSongMenuList();
    }

    public List<String> getSongListBySmid(String songmenuid) {
        return songMenuDao.getSongListBySmid(songmenuid);
    }

    public SongMenu getSongMenuBySongmenuid(String songmenuid) {
        return songMenuDao.getSongMenuBySongmenuid(songmenuid);
    }

    public List<SongMenu> getSongMenusByUserid(String userid) {
        return songMenuDao.getSongMenusByUserid(userid);
    }

    public List<IndexSongMenuVo> getSongMenuAll() {
        return songMenuDao.getSongMenuAll();
    }

    public List<SongMenu> getSongMenusByUseridAndStatus(String userid) {
        return songMenuDao.getSongMenusByUseridAndStatus(userid);
    }

    public void updateSongmenu(SongMenu songMenu) {
        songMenuDao.updateSongmenu(songMenu);
    }

    public void deleteSongMenu(SongMenu songMenu) {
        songMenuDao.deleteSongMenu(songMenu);
    }

    public Integer addSongMenu(SongMenu songMenu) {
        return songMenuDao.addSongMenu(songMenu);
    }

    public void updateSongMenuPic(SongMenu songMenu) {
        songMenuDao.updateSongMenuPic(songMenu);
    }

    public Integer getSongMenuOfSongsCountBySongMenuid(String songmenuid) {
        return songMenuDao.getSongMenuOfSongsCountBySongMenuid(songmenuid);
    }

    public void addClickTime(SongMenu songMenu) {
        songMenuDao.addClickTime(songMenu);
    }


}
