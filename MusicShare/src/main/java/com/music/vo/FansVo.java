package com.music.vo;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-16:58
 */

public class FansVo {

    private String userid;
    private String nickname;
    private String content;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "FansVo{" +
                "userid='" + userid + '\'' +
                ", nickname='" + nickname + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
