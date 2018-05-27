package com.music.dao;

import com.music.entity.Song;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-20-20:26
 */

@Repository("songDao")
public interface SongDao {

    public List<Song> getSongListForIndexPage();//获取首页的新碟上架所需要的歌曲信息，展示8条

    public Song getSongBySongid(String songid);

    public List<Song> getSongsBySingerid(String singerid);

    public void addClickTime(Song song);

    public void addDownloadTime(Song song);

    public List<Song> searchsongs(String keyword);

    public Integer addSong(Song song);

}
