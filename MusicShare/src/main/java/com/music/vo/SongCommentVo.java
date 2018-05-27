package com.music.vo;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-09-21:00
 */

public class SongCommentVo {

    private String userid;
    private String username;
    private String songid;
    private String comment;
    private Date comment_date;
    private String nickname;
    private String public_date;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPublic_date() {
        return public_date;
    }

    public void setPublic_date(String public_date) {
        this.public_date = public_date;
    }

    @Override
    public String toString() {
        return "SongCommentVo{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", songid='" + songid + '\'' +
                ", comment='" + comment + '\'' +
                ", comment_date=" + comment_date +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
