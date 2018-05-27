package com.music.entity;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-21:07
 */

public class ShareSong {

    private Integer id;
    private String userid;
    private String songid;
    private Date upload_date;
    private Integer score;
    private String isyuanchuang;

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

    public Date getUpload_date() {
        return upload_date;
    }

    public void setUpload_date(Date upload_date) {
        this.upload_date = upload_date;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getIsyuanchuang() {
        return isyuanchuang;
    }

    public void setIsyuanchuang(String isyuanchuang) {
        this.isyuanchuang = isyuanchuang;
    }

    @Override
    public String toString() {
        return "ShareSong{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", songid='" + songid + '\'' +
                ", upload_date=" + upload_date +
                ", score=" + score +
                '}';
    }
}
