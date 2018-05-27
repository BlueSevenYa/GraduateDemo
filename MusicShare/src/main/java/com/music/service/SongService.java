package com.music.service;

import com.music.entity.Song;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-20-20:29
 */
public interface SongService {

    public List<Song> getSongListForIndexPage();

    public Song getSongBySongid(String songid);

    public List<Song> getSongsBySingerid(String singerid);

    public void addClickTime(Song song);

    public List<Song> searchsongs(String keyword);

    public Integer addSong(Song song);

    public void addDownloadTime(Song song);

}
