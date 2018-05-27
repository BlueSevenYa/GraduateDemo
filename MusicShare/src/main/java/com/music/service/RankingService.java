package com.music.service;

import com.music.entity.Song;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-19:12
 */
public interface RankingService {

    public List<Song> showRankingClick();

    public List<Song> showRankingDownload();

}
