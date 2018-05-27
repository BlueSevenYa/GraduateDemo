package com.music.service.impl;

import com.music.dao.SongDao;
import com.music.entity.Song;
import com.music.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-20-20:30
 */
@Service
public class SongServiceImpl implements SongService{

    @Autowired
    private SongDao songDao;

    public List<Song> getSongListForIndexPage(){
        return songDao.getSongListForIndexPage();
    }

    public Song getSongBySongid(String songid) {
        return songDao.getSongBySongid(songid);
    }

    public List<Song> getSongsBySingerid(String singerid) {
        return songDao.getSongsBySingerid(singerid);
    }

    public void addClickTime(Song song) {
        songDao.addClickTime(song);
    }

    public List<Song> searchsongs(String keyword) {
        return songDao.searchsongs(keyword);
    }

    public Integer addSong(Song song) {
        return songDao.addSong(song);
    }

    public void addDownloadTime(Song song) {
        songDao.addDownloadTime(song);
    }

}
