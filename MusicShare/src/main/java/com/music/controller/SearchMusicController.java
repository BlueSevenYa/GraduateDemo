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
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-18-14:53
 */
@Controller
public class SearchMusicController {

    @Autowired
    private SongService songService;

    @Autowired
    private SingerService singerService;

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private SongMenuService songMenuService;

    @RequestMapping("/search/music")
    public String searchMusic(Model model, HttpServletRequest request, HttpSession session){
        String keyword=request.getParameter("keyword");
        System.out.println(keyword);
        List<Song> songs=songService.searchsongs(keyword);
        List<FavoriteVo> songlist=new ArrayList<FavoriteVo>();
        User user= (User) session.getAttribute("user");
        for (Song song:songs) {
            System.out.println(song);
            FavoriteVo favoriteVo=new FavoriteVo();
            favoriteVo.setSongid(song.getSongid());
            favoriteVo.setSongname(song.getName());
            favoriteVo.setSingerid(song.getSingerid());
            favoriteVo.setSingername(singerService.findSingerBySingerid(song.getSingerid()).getName());
            songlist.add(favoriteVo);
        }
        model.addAttribute("songlist",songlist);
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
        return "searchmusic";
    }

}
