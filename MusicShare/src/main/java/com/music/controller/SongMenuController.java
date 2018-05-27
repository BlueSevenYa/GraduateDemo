package com.music.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.music.entity.*;
import com.music.service.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-19-17:32
 */

@Controller
@RequestMapping("/songmenu")
public class SongMenuController {

    /** 日志实例 */
    private static final Logger logger = Logger.getLogger(SongMenuController.class);

    @Autowired
    private SongMenuService songMenuService;

    @Autowired
    private UserService userService;

    @Autowired
    private SongService songService;

    @Autowired
    private MenuSongService menuSongService;

    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping("/getlist")
    public void getSongMenuList(){
        List<SongMenu> songMenuList=songMenuService.getSongMenuList();
        for (SongMenu songMenu:songMenuList) {
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            String date=simpleDateFormat.format(songMenu.getCreate_date());
            System.out.println(date);
            //songMenu.setCreate_date(date);
            User user=userService.findUserByUserid(songMenu.getUserId());
            System.out.println(user.getUsername());
            System.out.println(songMenu);
        }
    }

    @RequestMapping("/getsonglistbysmid")
    public String getSongListBySmid(HttpServletRequest request, Model model){
        String songmenuid=request.getParameter("songmenuid");
        SongMenu songMenu=songMenuService.getSongMenuBySongmenuid(songmenuid);
        model.addAttribute("songmenu",songMenu);
        List<String> songids=songMenuService.getSongListBySmid(songmenuid);
        List<Song> songs=new ArrayList<Song>();
        for (String songid:songids) {
            System.out.println(songid);
            Song song =songService.getSongBySongid(songid);
            songs.add(song);
        }
        for (Song song:songs) {
            System.out.println(song);
        }
        model.addAttribute("songs",songs);
        return "player";
    }

    @RequestMapping("/getallist")
    public String getAllList(Model model,HttpServletRequest request){
        String pageNum=request.getParameter("pageNum");
        String pageSize=request.getParameter("pageSize");
        System.out.println(pageNum+"==="+pageSize);
        int num=1;
        int size=10;
        if (pageNum != null && !"".equals(pageNum)) {
            num = Integer.parseInt(pageNum);
        }
        if (pageSize != null && !"".equals(pageSize)) {
            size = Integer.parseInt(pageSize);
        }
        PageHelper.startPage(num,size);
        List<IndexSongMenuVo> songMenus=songMenuService.getSongMenuAll();


        PageInfo<IndexSongMenuVo> pagehelper=new PageInfo<IndexSongMenuVo>(songMenus);
        System.out.println(pagehelper.getTotal());
        model.addAttribute("pagehelper",pagehelper);
        return "musiclist";
    }

    @RequestMapping("/addmusictosongmenu")
    public @ResponseBody  Map<String,Object> addMusicToSongMenu(HttpServletRequest request, HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();
        User user= (User) session.getAttribute("user");
        String songid=request.getParameter("songid");
        String songmenuid=request.getParameter("songmenuid");
        logger.info(songid+"===="+songmenuid);
        if(songmenuid.length()==7){
            MenuSong menuSong=new MenuSong();
            menuSong.setSongmenuid(songmenuid);
            menuSong.setSongid(songid);
            MenuSong menuSong1=menuSongService.getMenuSong(menuSong);
            if(menuSong1==null){
                Integer num=menuSongService.addMenuSong(menuSong);
                map.put("successCode",1);
            }else{
                map.put("successCode",0);
            }
        }else{
            Favorite favorite=new Favorite();
            favorite.setSongid(songid);
            favorite.setUserid(user.getUserid());
            Favorite favorite1=favoriteService.getFavorite(favorite);
            if(favorite1==null){
                Integer num1=favoriteService.addFavorite(favorite);
                map.put("successCode",1);
            }else{
                map.put("successCode",0);
            }
        }
        return map;
    }

    @RequestMapping("/addclicktime")
    public @ResponseBody
    void addClickTime(HttpServletRequest request){
        String songmenuid=request.getParameter("songmenuid");
        SongMenu songMenu=songMenuService.getSongMenuBySongmenuid(songmenuid);
        SongMenu songMenu1=new SongMenu();
        songMenu1.setSongmenuid(songmenuid);
        songMenu1.setClicktime(songMenu.getClicktime()+1);
        songMenuService.addClickTime(songMenu1);
    }

}
