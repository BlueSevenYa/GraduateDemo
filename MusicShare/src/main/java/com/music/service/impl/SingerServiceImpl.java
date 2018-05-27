package com.music.service.impl;

import com.music.dao.SingerDao;
import com.music.entity.Singer;
import com.music.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-27-17:23
 */
@Service
public class SingerServiceImpl implements SingerService {

    @Autowired
    private SingerDao singerDao;

    public Singer findSingerBySingerid(String singerid) {
        return singerDao.findSingerBySingerid(singerid);
    }

    public Singer findSingerBySingername(String singername) {
        return singerDao.findSingerBySingername(singername);
    }

    public List<Singer> getSingersWithCodition(Singer singer) {
        return singerDao.getSingersWithCodition(singer);
    }

    public Integer addSinger(Singer singer) {
        return singerDao.addSinger(singer);
    }
}
