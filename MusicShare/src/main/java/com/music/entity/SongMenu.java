package com.music.entity;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-18-22:21
 */

public class SongMenu {
    private Integer id;
    private String songmenuid;
    private String status;
    private Date status_date;
    private Date create_date;
    private String userId;
    private String smpicurl;
    private String name;
    private String describle;
    private Integer clicktime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSongmenuid() {
        return songmenuid;
    }

    public void setSongmenuid(String songmenuid) {
        this.songmenuid = songmenuid;
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

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSmpicurl() {
        return smpicurl;
    }

    public void setSmpicurl(String smpicurl) {
        this.smpicurl = smpicurl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "SongMenu{" +
                "id=" + id +
                ", songmenuid='" + songmenuid + '\'' +
                ", status='" + status + '\'' +
                ", status_date=" + status_date +
                ", create_date=" + create_date +
                ", userId='" + userId + '\'' +
                ", smpicurl='" + smpicurl + '\'' +
                ", name='" + name + '\'' +
                ", describle='" + describle + '\'' +
                ", clicktime=" + clicktime +
                '}';
    }

    public Integer getClicktime() {
        return clicktime;
    }

    public void setClicktime(Integer clicktime) {
        this.clicktime = clicktime;
    }

    public String getDescrible() {
        return describle;
    }

    public void setDescrible(String describle) {
        this.describle = describle;
    }
}
