package com.music.service;

import com.music.entity.Singer;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-27-17:22
 */
public interface SingerService {

    //根据singerid单独查询单个singer
    public Singer findSingerBySingerid(String singerid);

    public Singer findSingerBySingername(String singername);

    public List<Singer> getSingersWithCodition(Singer singer);

    public Integer addSinger(Singer singer);

}
