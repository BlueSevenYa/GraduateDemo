package com.music.service;

import com.music.entity.SongComment;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-06-09:02
 */
public interface SongCommentService {

    public List<SongComment> getAllCommentBySongid(String songid);

    public Integer addSongComment(SongComment songComment);

}
