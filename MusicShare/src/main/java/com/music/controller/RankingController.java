package com.music.controller;

import com.music.entity.Singer;
import com.music.entity.Song;
import com.music.entity.SongMenu;
import com.music.entity.User;
import com.music.service.FavoriteService;
import com.music.service.RankingService;
import com.music.service.SingerService;
import com.music.service.SongMenuService;
import com.music.vo.ListAddToSongMenuVo;
import com.music.vo.RankingVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-21:45
 */
@Controller
public class RankingController {

    @Autowired
    private RankingService rankingService;

    @Autowired
    private SingerService singerService;

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private SongMenuService songMenuService;

    @RequestMapping("/music/ranking/click")
    public String showRankingClick(Model model, HttpSession session){
        List<Song> songs=rankingService.showRankingClick();
        List<RankingVo> rankingVos=new ArrayList<RankingVo>();
        User user= (User) session.getAttribute("user");
        for (Song song:songs) {
            RankingVo rankingVo=new RankingVo();
            rankingVo.setSongid(song.getSongid());
            rankingVo.setSongname(song.getName());
            Singer singer=singerService.findSingerBySingerid(song.getSingerid());
            rankingVo.setSingerid(singer.getSingerid());
            rankingVo.setSingername(singer.getName());
            rankingVo.setStatus_date(song.getStatus_date());
            rankingVo.setClicktime(song.getClicktime());
            rankingVos.add(rankingVo);
        }
        model.addAttribute("rankingvos",rankingVos);
        Integer xihuannum=favoriteService.getFavsCountByUserid(user.getUserid());
        ListAddToSongMenuVo listAddToSongMenuVo=new ListAddToSongMenuVo();
        listAddToSongMenuVo.setSongmenuid("007");
        listAddToSongMenuVo.setSongmenuname("我喜欢的音乐");
        listAddToSongMenuVo.setSongmenuofsongs(xihuannum);
        listAddToSongMenuVo.setSongmenupic("");
        model.addAttribute("likesongmenushow",listAddToSongMenuVo);
        List<SongMenu> songMenus=songMenuService.getSongMenusByUseridAndStatus(user.getUserid());
        List<ListAddToSongMenuVo> listAddToSongMenuVos=new ArrayList<ListAddToSongMenuVo>();
        for (SongMenu songmenu:songMenus) {
            ListAddToSongMenuVo listAddToSongMenuVo1=new ListAddToSongMenuVo();
            listAddToSongMenuVo1.setSongmenupic(songmenu.getSmpicurl());
            listAddToSongMenuVo1.setSongmenuname(songmenu.getName());
            listAddToSongMenuVo1.setSongmenuid(songmenu.getSongmenuid());
            Integer songmenunum=songMenuService.getSongMenuOfSongsCountBySongMenuid(songmenu.getSongmenuid());
            listAddToSongMenuVo1.setSongmenuofsongs(songmenunum);
            listAddToSongMenuVos.add(listAddToSongMenuVo1);
        }
        model.addAttribute("songmenushow",listAddToSongMenuVos);
        return "ranking_click";
    }

    @RequestMapping("/music/ranking/download")
    public String showRankingDownload(Model model, HttpSession session){
        List<Song> songs=rankingService.showRankingDownload();
        List<RankingVo> rankingVos=new ArrayList<RankingVo>();
        User user= (User) session.getAttribute("user");
        for (Song song:songs) {
            RankingVo rankingVo=new RankingVo();
            rankingVo.setSongid(song.getSongid());
            rankingVo.setSongname(song.getName());
            Singer singer=singerService.findSingerBySingerid(song.getSingerid());
            rankingVo.setSingerid(singer.getSingerid());
            rankingVo.setSingername(singer.getName());
            rankingVo.setStatus_date(song.getStatus_date());
            rankingVo.setDownloadtime(song.getDownloadtime());
            rankingVos.add(rankingVo);
        }
        model.addAttribute("rankingvos",rankingVos);
        Integer xihuannum=favoriteService.getFavsCountByUserid(user.getUserid());
        ListAddToSongMenuVo listAddToSongMenuVo=new ListAddToSongMenuVo();
        listAddToSongMenuVo.setSongmenuid("007");
        listAddToSongMenuVo.setSongmenuname("我喜欢的音乐");
        listAddToSongMenuVo.setSongmenuofsongs(xihuannum);
        listAddToSongMenuVo.setSongmenupic("");
        model.addAttribute("likesongmenushow",listAddToSongMenuVo);
        List<SongMenu> songMenus=songMenuService.getSongMenusByUseridAndStatus(user.getUserid());
        List<ListAddToSongMenuVo> listAddToSongMenuVos=new ArrayList<ListAddToSongMenuVo>();
        for (SongMenu songmenu:songMenus) {
            ListAddToSongMenuVo listAddToSongMenuVo1=new ListAddToSongMenuVo();
            listAddToSongMenuVo1.setSongmenupic(songmenu.getSmpicurl());
            listAddToSongMenuVo1.setSongmenuname(songmenu.getName());
            listAddToSongMenuVo1.setSongmenuid(songmenu.getSongmenuid());
            Integer songmenunum=songMenuService.getSongMenuOfSongsCountBySongMenuid(songmenu.getSongmenuid());
            listAddToSongMenuVo1.setSongmenuofsongs(songmenunum);
            listAddToSongMenuVos.add(listAddToSongMenuVo1);
        }
        model.addAttribute("songmenushow",listAddToSongMenuVos);
        return "ranking_download";
    }

    @RequestMapping("/music/ranking/click/play")
    public String showRankingClickPlay(Model model){
        List<Song> songs=rankingService.showRankingClick();
        model.addAttribute("songs",songs);
        SongMenu songMenu=new SongMenu();
        songMenu.setName("点击排行榜");
        model.addAttribute("songmenu",songMenu);
        return "player";
    }

    @RequestMapping("/music/ranking/download/play")
    public String showRankingDownloadPlay(Model model){
        List<Song> songs=rankingService.showRankingDownload();
        model.addAttribute("songs",songs);
        SongMenu songMenu=new SongMenu();
        songMenu.setName("下载排行榜");
        model.addAttribute("songmenu",songMenu);
        return "player";
    }

}
