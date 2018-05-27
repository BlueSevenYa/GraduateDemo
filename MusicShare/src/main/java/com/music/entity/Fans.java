package com.music.entity;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-16:49
 */

public class Fans {

    private Integer id;
    private String singerid;
    private String userid;
    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Fans{" +
                "id=" + id +
                ", singerid='" + singerid + '\'' +
                ", userid='" + userid + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
