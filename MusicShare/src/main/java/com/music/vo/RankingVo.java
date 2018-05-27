package com.music.vo;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-19:24
 */

public class RankingVo {

    private String singerid;
    private String singername;
    private String songid;
    private String songname;
    private Date status_date;
    private Integer clicktime;
    private Integer downloadtime;

    public String getSingerid() {
        return singerid;
    }

    public void setSingerid(String singerid) {
        this.singerid = singerid;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getSongname() {
        return songname;
    }

    public void setSongname(String songname) {
        this.songname = songname;
    }

    public Date getStatus_date() {
        return status_date;
    }

    public void setStatus_date(Date status_date) {
        this.status_date = status_date;
    }

    public String getSingername() {
        return singername;
    }

    public void setSingername(String singername) {
        this.singername = singername;
    }

    public Integer getClicktime() {
        return clicktime;
    }

    public void setClicktime(Integer clicktime) {
        this.clicktime = clicktime;
    }

    public Integer getDownloadtime() {
        return downloadtime;
    }

    public void setDownloadtime(Integer downloadtime) {
        this.downloadtime = downloadtime;
    }

    @Override
    public String toString() {
        return "RankingVo{" +
                "singerid='" + singerid + '\'' +
                ", singername='" + singername + '\'' +
                ", songid='" + songid + '\'' +
                ", songname='" + songname + '\'' +
                ", status_date=" + status_date +
                ", clicktime=" + clicktime +
                ", downloadtime=" + downloadtime +
                '}';
    }
}
