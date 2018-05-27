package com.music.entity;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-20-19:40
 */

public class Song {

    private Integer id;
    private String songid;
    private String name;
    private String mp3url;
    private String songpicurl;
    private String lyric;
    private String status;
    private Date status_date;
    private Integer clicktime;
    private Integer downloadtime;
    private String singerid;
    private String userid;
    private Integer musicscore;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMp3url() {
        return mp3url;
    }

    public void setMp3url(String mp3url) {
        this.mp3url = mp3url;
    }

    public String getSongpicurl() {
        return songpicurl;
    }

    public void setSongpicurl(String songpicurl) {
        this.songpicurl = songpicurl;
    }

    public String getLyric() {
        return lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getStatus_date() {
        return status_date;
    }

    public void setStatus_date(Date status_date) {
        this.status_date = status_date;
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

    public String getSingerid() {
        return singerid;
    }

    public void setSingerid(String singerid) {
        this.singerid = singerid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getMusicscore() {
        return musicscore;
    }

    public void setMusicscore(Integer musicscore) {
        this.musicscore = musicscore;
    }

    @Override
    public String toString() {
        return "Song{" +
                "id=" + id +
                ", songid='" + songid + '\'' +
                ", name='" + name + '\'' +
                ", mp3url='" + mp3url + '\'' +
                ", songpicurl='" + songpicurl + '\'' +
                ", lyric='" + lyric + '\'' +
                ", status='" + status + '\'' +
                ", status_date=" + status_date +
                ", clicktime=" + clicktime +
                ", downloadtime=" + downloadtime +
                ", singerid='" + singerid + '\'' +
                ", userid='" + userid + '\'' +
                ", musicscore=" + musicscore +
                '}';
    }
}
