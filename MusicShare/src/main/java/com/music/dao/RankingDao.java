package com.music.dao;

import com.music.entity.Song;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-19:10
 */
@Repository("rankingDao")
public interface RankingDao {

    public List<Song> showRankingClick();

    public List<Song> showRankingDownload();

}
