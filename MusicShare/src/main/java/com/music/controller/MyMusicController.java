package com.music.controller;

import com.music.entity.ShareSong;
import com.music.entity.Song;
import com.music.entity.SongMenu;
import com.music.entity.User;
import com.music.service.*;
import com.music.util.GenerateUUidUtil;
import com.music.vo.FavoriteVo;
import com.music.vo.ListAddToSongMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-14-23:13
 */
@Controller
public class MyMusicController {


    @Autowired
    private SongMenuService songMenuService;

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private SongService songService;

    @Autowired
    private SingerService singerService;

    @Autowired
    private ShareSongService shareSongService;

    @RequestMapping("/my/music")
    public String goMyMusic(HttpServletRequest request, Model model, HttpSession session){
        User user1= (User) session.getAttribute("user");
        String sessionuserid=user1.getUserid();
        List<SongMenu> songMenus=songMenuService.getSongMenusByUseridAndStatus(sessionuserid);
        for (SongMenu songmenu:songMenus) {
            System.out.println(songmenu);
        }
        model.addAttribute("songmenus",songMenus);
        model.addAttribute("userhome",user1);
        List<String> songids= favoriteService.getSongidsByUserid(sessionuserid);
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

        map.put("favoritevos",favoriteVos);
        model.addAttribute("lovemusic",map);
        Integer xihuannum=favoriteService.getFavsCountByUserid(user1.getUserid());
        ListAddToSongMenuVo listAddToSongMenuVo=new ListAddToSongMenuVo();
        listAddToSongMenuVo.setSongmenuid("007");
        listAddToSongMenuVo.setSongmenuname("我喜欢的音乐");
        listAddToSongMenuVo.setSongmenuofsongs(xihuannum);
        listAddToSongMenuVo.setSongmenupic("");
        model.addAttribute("likesongmenushow",listAddToSongMenuVo);
        List<SongMenu> songMenus1=songMenuService.getSongMenusByUseridAndStatus(user1.getUserid());
        List<ListAddToSongMenuVo> listAddToSongMenuVos=new ArrayList<ListAddToSongMenuVo>();
        for (SongMenu songmenu:songMenus1) {
            ListAddToSongMenuVo listAddToSongMenuVo1=new ListAddToSongMenuVo();
            listAddToSongMenuVo1.setSongmenupic(songmenu.getSmpicurl());
            listAddToSongMenuVo1.setSongmenuname(songmenu.getName());
            listAddToSongMenuVo1.setSongmenuid(songmenu.getSongmenuid());
            Integer songmenunum=songMenuService.getSongMenuOfSongsCountBySongMenuid(songmenu.getSongmenuid());
            listAddToSongMenuVo1.setSongmenuofsongs(songmenunum);
            listAddToSongMenuVos.add(listAddToSongMenuVo1);
        }
        model.addAttribute("songmenushow",listAddToSongMenuVos);
        return "mymusic";
    }

    @RequestMapping("/my/songmenu/bianji")
    public String bianJiSongMenu(HttpServletRequest request,Model model){
        String songmenuid=request.getParameter("songmenuid");
        SongMenu songMenu=songMenuService.getSongMenuBySongmenuid(songmenuid);
        model.addAttribute("songmenu",songMenu);
        return "bianjigedan";
    }

    @RequestMapping("/my/songmenu/list")
    public String listSongMenuofsong(HttpServletRequest request,Model model,HttpSession session){
        String songmenuid=request.getParameter("songmenuid");
        System.out.println(songmenuid);
        User user = (User) session.getAttribute("user");
        if(songmenuid.length()==7){
            SongMenu songMenu=songMenuService.getSongMenuBySongmenuid(songmenuid);
            model.addAttribute("songmenuname",songMenu.getName());
            List<String> songids=songMenuService.getSongListBySmid(songmenuid);
            List<FavoriteVo> songs=new ArrayList<FavoriteVo>();
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
            return "songlistforsm";
        }else{
            if(songmenuid.length()==3) {
                model.addAttribute("songmenuname", "喜欢的音乐");

                List<String> songids = favoriteService.getSongidsByUserid(user.getUserid());
                List<FavoriteVo> favoriteVos = new ArrayList<FavoriteVo>();
                for (String songid : songids) {
                    System.out.println(songid);
                    FavoriteVo favoriteVo = new FavoriteVo();
                    Song song = songService.getSongBySongid(songid);
                    favoriteVo.setSongid(song.getSongid());
                    favoriteVo.setSongname(song.getName());
                    favoriteVo.setSingerid(song.getSingerid());
                    favoriteVo.setSingername(singerService.findSingerBySingerid(song.getSingerid()).getName());
                    favoriteVo.setStatus_date(song.getStatus_date());
                    favoriteVos.add(favoriteVo);
                }
                for (FavoriteVo f : favoriteVos) {
                    System.out.println(f);
                }
                model.addAttribute("songs", favoriteVos);
                return "songlistforsm";
            }else{
                model.addAttribute("songmenuname", "原创音乐");
                ShareSong shareSong=new ShareSong();
                shareSong.setUserid(user.getUserid());
                shareSong.setIsyuanchuang("是");
                List<String> songids=shareSongService.getShareSongids(shareSong);
                List<FavoriteVo> favoriteVos = new ArrayList<FavoriteVo>();
                for (String songid : songids) {
                    System.out.println(songid);
                    FavoriteVo favoriteVo = new FavoriteVo();
                    Song song = songService.getSongBySongid(songid);
                    favoriteVo.setSongid(song.getSongid());
                    favoriteVo.setSongname(song.getName());
                    favoriteVo.setSingerid(song.getSingerid());
                    favoriteVo.setSingername(singerService.findSingerBySingerid(song.getSingerid()).getName());
                    favoriteVo.setStatus_date(song.getStatus_date());
                    favoriteVos.add(favoriteVo);
                }
                for (FavoriteVo f : favoriteVos) {
                    System.out.println(f);
                }
                model.addAttribute("songs", favoriteVos);
                return "songlistforsm";
            }
        }


    }

    @RequestMapping("/my/songmenu/update")
    public @ResponseBody Map<String,Object> updateSongmenu(HttpServletRequest request){
        String name=request.getParameter("songmenuname");
        String describle=request.getParameter("songmenudesc");
        String songmenuid=request.getParameter("songmenuid");
        SongMenu songMenu=new SongMenu();
        songMenu.setName(name);
        songMenu.setDescrible(describle);
        songMenu.setSongmenuid(songmenuid);
        songMenuService.updateSongmenu(songMenu);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("success","success");
        return map;
    }

    @RequestMapping("/my/songmenu/delete")
    public String deleteSongMenu(HttpServletRequest request){
        String songmenuid=request.getParameter("songmenuid");
        SongMenu songMenu=new SongMenu();
        songMenu.setSongmenuid(songmenuid);
        songMenu.setStatus("close");
        songMenuService.deleteSongMenu(songMenu);
        return "redirect:/my/music";
    }

    @RequestMapping("/my/songmenu/add")
    public @ResponseBody Map<String,Object> addSongMenu(HttpServletRequest request,HttpSession session){
        String songmenuname=request.getParameter("songmenuname");
        System.out.println(songmenuname);
        SongMenu songMenu=new SongMenu();
        songMenu.setSongmenuid(GenerateUUidUtil.generateRandomStr(7));
        songMenu.setStatus("open");
        songMenu.setStatus_date(new Date());
        songMenu.setCreate_date(new Date());
        songMenu.setUserId(((User)session.getAttribute("user")).getUserid());
        songMenu.setSmpicurl("t0.jpg");
        songMenu.setName(songmenuname);
        songMenu.setClicktime(0);
        songMenuService.addSongMenu(songMenu);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("success","success");
        return map;
    }

    @RequestMapping("/my/songmenupic/update/{songmenuid}")
    public String mySongMenuPicUpdate(@PathVariable String songmenuid,Model model){
        System.out.println(songmenuid);
        model.addAttribute("songmenuid",songmenuid);
        return "csongmenupic";
    }

    @RequestMapping("/my/songmenupic/update/deal")
    public String mySongMenuPicUpdateDeal(HttpServletRequest request) throws IOException {
        String songmenuid=request.getParameter("songmenuid");
        long startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    System.out.println(file.getOriginalFilename());
                    String path="D:/musicplatform/picture/songmenu/"+file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                    //下面处理数据库逻辑
                    SongMenu songMenu=new SongMenu();
                    songMenu.setSongmenuid(songmenuid);
                    songMenu.setSmpicurl(file.getOriginalFilename());
                    songMenuService.updateSongMenuPic(songMenu);

                }

            }

        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "redirect:/my/music";
    }

}
