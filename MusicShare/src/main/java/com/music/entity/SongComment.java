package com.music.entity;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-06-08:58
 */

public class SongComment {

    private Integer id;
    private String songid;
    private String userid;
    private String content;
    private Date comment_date;

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

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    @Override
    public String toString() {
        return "SongComment{" +
                "id=" + id +
                ", songid='" + songid + '\'' +
                ", userid='" + userid + '\'' +
                ", content='" + content + '\'' +
                ", comment_date=" + comment_date +
                '}';
    }
}
