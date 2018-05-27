package com.music.vo;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-27-16:34
 */

public class IndexSongVo {

    private String songid;
    private String name;
    private String songpicurl;
    private String singerid;
    private String singername;

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

    public String getSongpicurl() {
        return songpicurl;
    }

    public void setSongpicurl(String songpicurl) {
        this.songpicurl = songpicurl;
    }

    public String getSingerid() {
        return singerid;
    }

    public void setSingerid(String singerid) {
        this.singerid = singerid;
    }

    public String getSingername() {
        return singername;
    }

    public void setSingername(String singername) {
        this.singername = singername;
    }

    @Override
    public String toString() {
        return "IndexSongVo{" +
                "songid='" + songid + '\'' +
                ", name='" + name + '\'' +
                ", songpicurl='" + songpicurl + '\'' +
                ", singerid='" + singerid + '\'' +
                ", singername='" + singername + '\'' +
                '}';
    }
}
