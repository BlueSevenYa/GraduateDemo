package com.music.entity;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-18:39
 */

public class Favorite {

    private Integer id;
    private String userid;
    private String songid;
    private Integer clicktime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public Integer getClicktime() {
        return clicktime;
    }

    public void setClicktime(Integer clicktime) {
        this.clicktime = clicktime;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", songid='" + songid + '\'' +
                ", clicktime=" + clicktime +
                '}';
    }
}
