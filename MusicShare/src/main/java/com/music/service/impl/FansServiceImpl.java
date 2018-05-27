package com.music.service.impl;

import com.music.dao.FansDao;
import com.music.entity.Fans;
import com.music.service.FansService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-16:54
 */
@Service
public class FansServiceImpl implements FansService {

    @Autowired
    private FansDao fansDao;


    public List<Fans> getFansBySingerid(String singerid) {
        return fansDao.getFansBySingerid(singerid);
    }

    public Integer addFans(Fans fans) {
        return fansDao.addFans(fans);
    }
}
