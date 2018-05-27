package com.music.service;

import com.music.entity.ShareSong;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-21:10
 */
public interface ShareSongService {

    public List<ShareSong> getShareSongListByUserid(String userid);

    public Integer addShareSong(ShareSong shareSong);

    public List<String> getShareSongids(ShareSong shareSong);

}
