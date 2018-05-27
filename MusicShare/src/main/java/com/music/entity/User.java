package com.music.entity;


import java.util.Date;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-10-23-11:49
 */

public class User {

    private Integer id;
    private String userid;
    private String username;
    private String password;
    private Integer userscore;
    private String describle;
    private String place;
    private Date birthday;
    private String sex;
    private String userpicurl;
    private String nickname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getUserscore() {
        return userscore;
    }

    public void setUserscore(Integer userscore) {
        this.userscore = userscore;
    }

    public String getDescrible() {
        return describle;
    }

    public void setDescrible(String describle) {
        this.describle = describle;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getUserpicurl() {
        return userpicurl;
    }

    public void setUserpicurl(String userpicurl) {
        this.userpicurl = userpicurl;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", userscore=" + userscore +
                ", describle='" + describle + '\'' +
                ", place='" + place + '\'' +
                ", birthday=" + birthday +
                ", sex='" + sex + '\'' +
                ", userpicurl='" + userpicurl + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
