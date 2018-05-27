package com.music.service.impl;

import com.music.dao.RankingDao;
import com.music.entity.Song;
import com.music.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-19:12
 */
@Service
public class RankingServiceImpl implements RankingService {

    @Autowired
    private RankingDao rankingDao;

    public List<Song> showRankingClick() {
        return rankingDao.showRankingClick();
    }

    public List<Song> showRankingDownload() {
        return rankingDao.showRankingDownload();
    }
}
