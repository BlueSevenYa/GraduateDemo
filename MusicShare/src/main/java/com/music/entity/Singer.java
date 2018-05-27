package com.music.entity;

import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-27-17:18
 */

public class Singer {

    private Integer id;
    private String singerid;
    private String name;
    private String style;
    private String describle;
    private String nationality;
    private Date birthday;
    private String status;
    private Date status_date;
    private String singerpicurl;
    private String sex;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getDescrible() {
        return describle;
    }

    public void setDescrible(String describle) {
        this.describle = describle;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
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

    public String getSingerpicurl() {
        return singerpicurl;
    }

    public void setSingerpicurl(String singerpicurl) {
        this.singerpicurl = singerpicurl;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "id=" + id +
                ", singerid='" + singerid + '\'' +
                ", name='" + name + '\'' +
                ", style='" + style + '\'' +
                ", describle='" + describle + '\'' +
                ", nationality='" + nationality + '\'' +
                ", birthday=" + birthday +
                ", status='" + status + '\'' +
                ", status_date=" + status_date +
                ", singerpicurl='" + singerpicurl + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }
}
