package com.music.service;

import com.music.entity.Fans;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-16:54
 */
public interface FansService {

    public List<Fans> getFansBySingerid(String singerid);

    public Integer addFans(Fans fans);

}
