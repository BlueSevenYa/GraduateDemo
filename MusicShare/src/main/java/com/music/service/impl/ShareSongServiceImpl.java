package com.music.service.impl;

import com.music.dao.ShareSongDao;
import com.music.entity.ShareSong;
import com.music.service.ShareSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-21:11
 */
@Service
public class ShareSongServiceImpl implements ShareSongService {

    @Autowired
    private ShareSongDao shareSongDao;

    public List<ShareSong> getShareSongListByUserid(String userid) {
        return shareSongDao.getShareSongListByUserid(userid);
    }

    public Integer addShareSong(ShareSong shareSong) {
        return shareSongDao.addShareSong(shareSong);
    }

    public List<String> getShareSongids(ShareSong shareSong) {
        return shareSongDao.getShareSongids(shareSong);
    }


}
