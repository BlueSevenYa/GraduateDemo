package com.music.controller;

import com.music.entity.Singer;
import com.music.entity.Song;
import com.music.entity.SongMenu;
import com.music.entity.User;
import com.music.service.SingerService;
import com.music.service.SongMenuService;
import com.music.service.SongService;
import com.music.service.UserService;
import com.music.vo.IndexSongMenuVo;
import com.music.vo.IndexSongVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-18-16:55
 */
@Controller
public class HomeController {

    @Autowired
    private SongMenuService songMenuService;

    public void setSongMenuService(SongMenuService songMenuService) {
        this.songMenuService = songMenuService;
    }

    @Autowired
    private UserService userService;

    @Autowired
    private SongService songService;

    @Autowired
    private SingerService singerService;

    @RequestMapping("/index")
    public String toIndex(HttpServletRequest request, Model model) {
        //获得热门的音乐
        List<SongMenu> songMenuList=songMenuService.getSongMenuList();
        List<IndexSongMenuVo> indexSongMenuVos=new ArrayList<IndexSongMenuVo>();
        for (SongMenu songMenu:songMenuList) {
            User user=userService.findUserByUserid(songMenu.getUserId());
            IndexSongMenuVo indexSongMenuVo=new IndexSongMenuVo();
            indexSongMenuVo.setSongmenuid(songMenu.getSongmenuid());
            indexSongMenuVo.setUserid(songMenu.getUserId());
            indexSongMenuVo.setClicktime(songMenu.getClicktime());
            indexSongMenuVo.setName(songMenu.getName());
            indexSongMenuVo.setSmpicurl(songMenu.getSmpicurl());
            indexSongMenuVo.setUsername(user.getUsername());
            indexSongMenuVo.setNickname(user.getNickname());
            indexSongMenuVos.add(indexSongMenuVo);
        }
        for (IndexSongMenuVo indexSongMenuVo:indexSongMenuVos) {
            System.out.println(indexSongMenuVo);
        }
        model.addAttribute("indexSongMenuVos",indexSongMenuVos);
        //获得最新歌碟上架信息
        List<Song> songListForIndex=songService.getSongListForIndexPage();
        List<IndexSongVo> indexSongVos=new ArrayList<IndexSongVo>();
        for (Song song:songListForIndex) {
            Singer singer=singerService.findSingerBySingerid(song.getSingerid());
            IndexSongVo indexSongVo=new IndexSongVo();
            indexSongVo.setName(song.getName());
            indexSongVo.setSongid(song.getSongid());
            indexSongVo.setSongpicurl(song.getSongpicurl());
            indexSongVo.setSingername(singer.getName());
            indexSongVo.setSingerid(singer.getSingerid());
            indexSongVos.add(indexSongVo);
        }
        for (IndexSongVo indexSongVo:indexSongVos) {
            System.out.println(indexSongVo);
        }
        model.addAttribute("indexSongVos",indexSongVos);
        return "index";

    }
}
