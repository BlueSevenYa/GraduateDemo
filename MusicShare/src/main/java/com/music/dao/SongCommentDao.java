package com.music.dao;

import com.music.entity.SongComment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-06-09:00
 */

@Repository("songCommentDao")
public interface SongCommentDao {

    public List<SongComment> getAllCommentBySongid(String songid);

    public Integer addSongComment(SongComment songComment);

}
