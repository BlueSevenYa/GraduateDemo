package com.music.dao;

import com.music.entity.Fans;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-16:50
 */
@Repository("fansDao")
public interface FansDao {

    public List<Fans> getFansBySingerid(String singerid);

    public Integer addFans(Fans fans);

}
