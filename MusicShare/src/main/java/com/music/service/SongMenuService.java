package com.music.service;

import com.music.entity.IndexSongMenuVo;
import com.music.entity.SongMenu;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-19-20:03
 */
public interface SongMenuService {

    public List<SongMenu> getSongMenuList();

    public List<String> getSongListBySmid(String songmenuid);

    public SongMenu getSongMenuBySongmenuid(String songmenuid);

    public List<SongMenu> getSongMenusByUserid(String userid);

    public List<IndexSongMenuVo> getSongMenuAll();

    public List<SongMenu> getSongMenusByUseridAndStatus(String userid);

    public void updateSongmenu(SongMenu songMenu);

    public void deleteSongMenu(SongMenu songMenu);

    public Integer addSongMenu(SongMenu songMenu);

    public void updateSongMenuPic(SongMenu songMenu);

    public Integer getSongMenuOfSongsCountBySongMenuid(String songmenuid);

    public void addClickTime(SongMenu songMenu);


}
