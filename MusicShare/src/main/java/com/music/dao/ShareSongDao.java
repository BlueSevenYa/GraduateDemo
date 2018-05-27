package com.music.dao;

import com.music.entity.ShareSong;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-21:09
 */
@Repository("shareSongDao")
public interface ShareSongDao {

    public List<ShareSong> getShareSongListByUserid(String userid);

    public Integer addShareSong(ShareSong shareSong);

    public List<String> getShareSongids(ShareSong shareSong);

}
