package com.music.controller;

import com.music.entity.Song;
import com.music.entity.SongMenu;
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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-18:50
 */

@Controller
public class LoveSongController {

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private SongService songService;

    @Autowired
    private SingerService singerService;

    @Autowired
    private SongMenuService songMenuService;

    @RequestMapping("/love/songs/{userid}")
    public String getLoveSongs(@PathVariable String userid, Model model){
        System.out.println(userid);
        List<String> songids= favoriteService.getSongidsByUserid(userid);
        List<FavoriteVo> favoriteVos=new ArrayList<FavoriteVo>();
        for (String songid:songids) {
            System.out.println(songid);
            FavoriteVo favoriteVo=new FavoriteVo();
            Song song=songService.getSongBySongid(songid);
            favoriteVo.setSongid(song.getSongid());
            favoriteVo.setSongname(song.getName());
            favoriteVo.setSingerid(song.getSingerid());
            favoriteVo.setSingername(singerService.findSingerBySingerid(song.getSingerid()).getName());
            favoriteVo.setStatus_date(song.getStatus_date());
            favoriteVos.add(favoriteVo);
        }
        for (FavoriteVo f:favoriteVos) {
            System.out.println(f);
        }
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("userid",userid);
        map.put("favoritevos",favoriteVos);
        model.addAttribute("lovemusic",map);
        Integer xihuannum=favoriteService.getFavsCountByUserid(userid);
        ListAddToSongMenuVo listAddToSongMenuVo=new ListAddToSongMenuVo();
        listAddToSongMenuVo.setSongmenuid("007");
        listAddToSongMenuVo.setSongmenuname("我喜欢的音乐");
        listAddToSongMenuVo.setSongmenuofsongs(xihuannum);
        listAddToSongMenuVo.setSongmenupic("");
        model.addAttribute("likesongmenushow",listAddToSongMenuVo);
        List<SongMenu> songMenus=songMenuService.getSongMenusByUseridAndStatus(userid);
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
        return "lovemusiclist";
    }

    @RequestMapping("/listen/songs/{userid}")
    public String toListenSongs(Model model,@PathVariable String userid){
        System.out.println(userid);
        List<String> songids= favoriteService.getSongidsByUserid(userid);
        List<Song> songs=new ArrayList<Song>();
        for (String songid:songids) {
            System.out.println(songid);
            Song song =songService.getSongBySongid(songid);
            songs.add(song);
        }
        model.addAttribute("songs",songs);
        SongMenu songMenu=new SongMenu();
        songMenu.setName("喜欢的音乐");
        model.addAttribute("songmenu",songMenu);
        return "player";
    }

}
