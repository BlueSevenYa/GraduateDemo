package com.music.service.impl;

import com.music.dao.SongCommentDao;
import com.music.entity.SongComment;
import com.music.service.SongCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-06-09:02
 */
@Service
public class SongCommentServiceImpl implements SongCommentService{

    @Autowired
    private SongCommentDao songCommentDao;


    public List<SongComment> getAllCommentBySongid(String songid) {
        return songCommentDao.getAllCommentBySongid(songid);
    }

    public Integer addSongComment(SongComment songComment) {
        return songCommentDao.addSongComment(songComment);
    }
}
