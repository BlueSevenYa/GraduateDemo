package com.music.dao;

import com.music.entity.IndexSongMenuVo;
import com.music.entity.SongMenu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-19-20:01
 */
@Repository("songMenuDao")
public interface SongMenuDao {

    public List<SongMenu> getSongMenuList();

    public List<String > getSongListBySmid(String songmenuid);

    public SongMenu getSongMenuBySongmenuid(String songmenuid);

    public List<SongMenu> getSongMenusByUserid(String userid);

    public List<SongMenu> getSongMenusByUseridAndStatus(String userid);

    public List<IndexSongMenuVo> getSongMenuAll();

    public void updateSongmenu(SongMenu songMenu);

    public void deleteSongMenu(SongMenu songMenu);

    public Integer addSongMenu(SongMenu songMenu);

    public void updateSongMenuPic(SongMenu songMenu);

    public Integer getSongMenuOfSongsCountBySongMenuid(String songmenuid);

    public void addClickTime(SongMenu songMenu);

}
