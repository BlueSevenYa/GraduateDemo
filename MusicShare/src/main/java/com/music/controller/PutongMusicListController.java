package com.music.controller;

import com.music.entity.Song;
import com.music.entity.SongMenu;
import com.music.entity.User;
import com.music.service.FavoriteService;
import com.music.service.SingerService;
import com.music.service.SongMenuService;
import com.music.service.SongService;
import com.music.vo.FavoriteVo;
import com.music.vo.ListAddToSongMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-20:22
 */

@Controller
public class PutongMusicListController {

    @Autowired
    private SongMenuService songMenuService;

    @Autowired
    private SongService songService;

    @Autowired
    private SingerService singerService;

    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping("/putong/songs/{songmenuid}")
    public String toPutongSongs(@PathVariable String songmenuid, Model model, HttpSession session){
        SongMenu songMenu=songMenuService.getSongMenuBySongmenuid(songmenuid);
        model.addAttribute("songmenu",songMenu);
        List<String> songids=songMenuService.getSongListBySmid(songmenuid);
        List<FavoriteVo> songs=new ArrayList<FavoriteVo>();
        User user= (User) session.getAttribute("user");
        for (String songid:songids) {
            System.out.println(songid);
            Song song =songService.getSongBySongid(songid);
            FavoriteVo favoritevo=new FavoriteVo();
            favoritevo.setSongid(song.getSongid());
            favoritevo.setSongname(song.getName());
            favoritevo.setSingerid(song.getSingerid());
            favoritevo.setSingername(singerService.findSingerBySingerid(song.getSingerid()).getName());
            favoritevo.setStatus_date(song.getStatus_date());
            songs.add(favoritevo);
        }
        for (FavoriteVo song:songs) {
            System.out.println(song);
        }
        model.addAttribute("songs",songs);
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
        return "putongmusiclist";
    }

}
