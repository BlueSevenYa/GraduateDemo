package com.music.dao;

import com.music.entity.Singer;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-27-17:17
 */
@Repository("singerDao")
public interface SingerDao {

    public Singer findSingerBySingerid(String singerid);

    public Singer findSingerBySingername(String singername);

    public List<Singer> getSingersWithCodition(Singer singer);

    public Integer addSinger(Singer singer);

}
