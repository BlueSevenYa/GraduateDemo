package com.music.vo;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-26-21:59
 */

public class IndexSongMenuVo {

    private String songmenuid;
    private String userid;
    private String smpicurl;
    private String name;
    private Integer clicktime;
    private String username;
    private String nickname;

    public String getSongmenuid() {
        return songmenuid;
    }

    public void setSongmenuid(String songmenuid) {
        this.songmenuid = songmenuid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
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

    public Integer getClicktime() {
        return clicktime;
    }

    public void setClicktime(Integer clicktime) {
        this.clicktime = clicktime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "IndexSongMenuVo{" +
                "songmenuid='" + songmenuid + '\'' +
                ", userid='" + userid + '\'' +
                ", smpicurl='" + smpicurl + '\'' +
                ", name='" + name + '\'' +
                ", clicktime=" + clicktime +
                ", username='" + username + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
