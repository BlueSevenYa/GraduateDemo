package com.music.controller;

import com.music.entity.ShareSong;
import com.music.entity.Singer;
import com.music.entity.Song;
import com.music.entity.User;
import com.music.service.ShareSongService;
import com.music.service.SingerService;
import com.music.service.SongService;
import com.music.util.GenerateUUidUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-22:12
 */
@Controller
public class UploadController {

    @Autowired
    private SingerService singerService;

    @Autowired
    private SongService songService;

    @Autowired
    private ShareSongService shareSongService;

    /** 日志实例 */
    private static final Logger logger = Logger.getLogger(UploadController.class);

    @RequestMapping("/music/upload")
    public String musicUpload(){

        return "upload";
    }

    @RequestMapping("/deal/music/upload")
    public @ResponseBody
    Map<String,Object> dealMusicUpload(@RequestParam(value = "file", required = false) MultipartFile file,
                                       HttpServletRequest request, ModelMap model) throws IOException {
        Map<String,Object> map=new HashMap<String,Object>();
        logger.info("---------------- upload img begin ---------------------");
        //String path="D:/uploadFile/";
        String ori_fileName = file.getOriginalFilename();
        //logger.info("path:" + path);
        logger.info("ori_fileName:" + ori_fileName);
        if(ori_fileName.endsWith(".mp3")){
            String path="D:/musicplatform/song/";
            logger.info("path:" + path);
            File targetFile = new File(path, ori_fileName);
            file.transferTo(targetFile);

        }
        if(ori_fileName.endsWith(".jpg")){
            String path="D:/musicplatform/picture/song/";
            logger.info("path:" + path);
            File targetFile = new File(path, ori_fileName);
            file.transferTo(targetFile);
        }
        map.put("success","success");
        map.put("name",ori_fileName);
        logger.info("---------------- upload img end ---------------------");
        return map;
    }


    @RequestMapping("/deal/music/save")
    public @ResponseBody
    Map<String,Object> dealMusicSave(HttpServletRequest request, Model model, HttpSession session) throws IOException {
        Map<String,Object> map=new HashMap<String,Object>();
        User user= (User) session.getAttribute("user");
        String songname=request.getParameter("songname");
        String singername=request.getParameter("singername");
        String sex=request.getParameter("sex");
        String isyuanchuang=request.getParameter("isyuanchuang");
        Integer score=Integer.parseInt(request.getParameter("score"));
        String songnameurl=request.getParameter("songnameurl");
        String picname=request.getParameter("picname");
        logger.info(songname+"="+singername+"="+sex+"="+isyuanchuang+"="+score+"="+songnameurl+"="+picname);
        Singer singer=singerService.findSingerBySingername(singername);
        if(singer!=null){
            logger.info("已存在一个同名歌手");
            Song song=new Song();
            String songid=GenerateUUidUtil.generateRandomStr(6);
            song.setSongid(songid);
            song.setName(songname);
            song.setMp3url(songnameurl);
            song.setSongpicurl(picname);
            song.setStatus("open");
            song.setStatus_date(new Date());
            song.setClicktime(0);
            song.setDownloadtime(0);
            song.setSingerid(singer.getSingerid());
            song.setUserid(user.getUserid());
            song.setMusicscore(score);
            Integer num= songService.addSong(song);
            logger.info(num);
            ShareSong shareSong=new ShareSong();
            shareSong.setUserid(user.getUserid());
            shareSong.setSongid(songid);
            shareSong.setUpload_date(new Date());
            shareSong.setIsyuanchuang(isyuanchuang);
            shareSong.setScore(score);
            shareSongService.addShareSong(shareSong);
        }else{
            logger.info("未存在一个同名歌手");
            String singerid= GenerateUUidUtil.generateRandomStr(7);
            Singer singer1=new Singer();
            singer1.setSingerid(singerid);
            singer1.setName(singername);
            singer1.setNationality("chinese");
            singer1.setStatus("open");
            singer1.setStatus_date(new Date());
            singer1.setSex(sex);
            singer1.setSingerpicurl("moren.jpg");
            Integer num1=singerService.addSinger(singer1);
            Song song=new Song();
            String songid=GenerateUUidUtil.generateRandomStr(6);
            song.setSongid(songid);
            song.setName(songname);
            song.setMp3url(songnameurl);
            song.setSongpicurl(picname);
            song.setStatus("open");
            song.setStatus_date(new Date());
            song.setClicktime(0);
            song.setDownloadtime(0);
            song.setSingerid(singer1.getSingerid());
            song.setUserid(user.getUserid());
            song.setMusicscore(score);
            Integer num= songService.addSong(song);
            logger.info(num);
            ShareSong shareSong=new ShareSong();
            shareSong.setUserid(user.getUserid());
            shareSong.setSongid(songid);
            shareSong.setUpload_date(new Date());
            shareSong.setIsyuanchuang(isyuanchuang);
            shareSong.setScore(score);
            shareSongService.addShareSong(shareSong);
        }
        map.put("successCode",1);
        return map;
    }

}
