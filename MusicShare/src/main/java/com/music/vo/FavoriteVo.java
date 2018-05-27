package com.music.vo;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-19:14
 */

public class FavoriteVo {

    private String userid;
    private String songid;
    private String singerid;
    private String songname;
    private String singername;
    private Date status_date;
    private String smpicurl;
    private Integer score;
    private String isyuanchuang;

    public String getIsyuanchuang() {
        return isyuanchuang;
    }

    public void setIsyuanchuang(String isyuanchuang) {
        this.isyuanchuang = isyuanchuang;
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

    public String getSingerid() {
        return singerid;
    }

    public void setSingerid(String singerid) {
        this.singerid = singerid;
    }

    public String getSongname() {
        return songname;
    }

    public void setSongname(String songname) {
        this.songname = songname;
    }

    public String getSingername() {
        return singername;
    }

    public void setSingername(String singername) {
        this.singername = singername;
    }

    public Date getStatus_date() {
        return status_date;
    }

    public void setStatus_date(Date status_date) {
        this.status_date = status_date;
    }

    public String getSmpicurl() {
        return smpicurl;
    }

    public void setSmpicurl(String smpicurl) {
        this.smpicurl = smpicurl;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "FavoriteVo{" +
                "userid='" + userid + '\'' +
                ", songid='" + songid + '\'' +
                ", singerid='" + singerid + '\'' +
                ", songname='" + songname + '\'' +
                ", singername='" + singername + '\'' +
                ", status_date=" + status_date +
                ", smpicurl='" + smpicurl + '\'' +
                '}';
    }
}
