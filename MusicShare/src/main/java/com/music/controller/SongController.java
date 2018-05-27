package com.music.controller;

import com.music.entity.Singer;
import com.music.entity.Song;
import com.music.entity.SongComment;
import com.music.entity.User;
import com.music.service.SingerService;
import com.music.service.SongCommentService;
import com.music.service.SongService;
import com.music.service.UserService;
import com.music.vo.SongCommentVo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-20-19:44
 */

@Controller
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    @Autowired
    private SingerService singerService;

    @Autowired
    private SongCommentService songCommentService;

    @Autowired
    private UserService userService;

    public void setSongService(SongService songService) {
        this.songService = songService;
    }

    @RequestMapping("/getlistforindex")
    public void getSongListForIndex(){
        List<Song> songListForIndex=songService.getSongListForIndexPage();
        for (Song song:
             songListForIndex) {
            System.out.println(song);
        }
    }

    @RequestMapping("/listen")
    public String getSongForOne(HttpServletRequest request, Model model){
        String songid=request.getParameter("songid");
        Song song=songService.getSongBySongid(songid);
        Singer singer=singerService.findSingerBySingerid(song.getSingerid());
        model.addAttribute("song",song);
        model.addAttribute("singer",singer);
        List<SongComment> songComments=songCommentService.getAllCommentBySongid(songid);
        List<SongCommentVo> songCommentVos=new ArrayList<SongCommentVo>();
        for (SongComment songcomment:songComments) {
            System.out.println(songcomment);
            SongCommentVo songCommentVo=new SongCommentVo();
            User user=userService.findUserByUserid(songcomment.getUserid());
            songCommentVo.setUserid(songcomment.getUserid());
            songCommentVo.setUsername(user.getUsername());
            songCommentVo.setComment(songcomment.getContent());
            songCommentVo.setComment_date(songcomment.getComment_date());
            songCommentVo.setNickname(user.getNickname());
            songCommentVos.add(songCommentVo);
        }
        model.addAttribute("songCommentVos",songCommentVos);
        return "song";
    }

    @RequestMapping("/addsongcomment")
    public @ResponseBody
    Map<String,Object> addSongComment(HttpServletRequest request, HttpSession httpSession){
        Map<String,Object> map=new HashMap<String,Object>();
        String songid=request.getParameter("songid");
        String content=request.getParameter("content");
        String userid=((User)httpSession.getAttribute("user")).getUserid();
        SongComment songComment=new SongComment();
        songComment.setSongid(songid);
        songComment.setUserid(userid);
        songComment.setContent(content);
        Date date=new Date();
        songComment.setComment_date(date);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
        String dateString = formatter.format(date);
        songCommentService.addSongComment(songComment);
        SongCommentVo songCommentVo=new SongCommentVo();
        songCommentVo.setUserid(userid);
        songCommentVo.setNickname((userService.findUserByUserid(userid)).getNickname());
        songCommentVo.setComment(content);
        songCommentVo.setPublic_date(dateString);
        map.put("successCode",1);
        map.put("songcommentvo",songCommentVo);
        return map;
    }


    @RequestMapping("/addclicktime")
    public @ResponseBody
    void addClickTime(HttpServletRequest request){
        String songid=request.getParameter("songid");
        Song song=songService.getSongBySongid(songid);
        Song song1=new Song();
        song1.setSongid(songid);
        song1.setClicktime(song.getClicktime()+1);
        songService.addClickTime(song1);
    }

    @RequestMapping("/judgescore")
    public @ResponseBody Map<String,Object> judgeScore(HttpServletRequest request,HttpSession session){
        String songid=request.getParameter("songid");
        Song song=songService.getSongBySongid(songid);
        User user=(User)session.getAttribute("user");
        Map<String,Object> map=new HashMap<String,Object>();
        if(user.getUserscore()>song.getMusicscore()){
            map.put("songid",songid);
            map.put("successCode",1);
            return map;
        }else{
            map.put("successCode",0);
            return map;
        }
    }

    @RequestMapping("/download/{songid}")
    public ResponseEntity<byte[]> download(HttpServletRequest request, @PathVariable String songid,HttpSession session,
                                           Model model) throws IOException {
        Song song=songService.getSongBySongid(songid);
        Song song1=new Song();
        song1.setSongid(song.getSongid());
        song1.setDownloadtime(song.getDownloadtime()+1);
        songService.addDownloadTime(song1);
        User user=(User)session.getAttribute("user");
        User user1=new User();
        user1.setUserid(user.getUserid());
        user1.setUserscore(user.getUserscore()-song.getMusicscore());
        userService.updateUserScore(user1);
        String downloadFilePath="D:\\musicplatform\\song";//从我们的上传文件夹中去取
        String filename=songService.getSongBySongid(songid).getMp3url();
        File file = new File(downloadFilePath+ File.separator+filename);//新建一个文件

        HttpHeaders headers = new HttpHeaders();//http头信息

        String downloadFileName = new String(filename.getBytes("UTF-8"),"iso-8859-1");//设置编码

        headers.setContentDispositionFormData("attachment", downloadFileName);

        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        //MediaType:互联网媒介类型  contentType：具体请求中的媒体类型信息

        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);

    }

}
