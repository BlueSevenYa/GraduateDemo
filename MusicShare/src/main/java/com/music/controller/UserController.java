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
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-21-20:55
 */


@Controller
@RequestMapping("/user")
public class UserController implements Converter<String,Date> {

    @Autowired
    private UserService userService;

    @Autowired
    private SongMenuService songMenuService;

    @Autowired
    private ShareSongService shareSongService;

    @Autowired
    private SongService songService;

    @Autowired
    private SingerService singerService;

    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping("/login")
    public @ResponseBody Map<String,Object> userLogin(HttpServletRequest request, HttpSession httpSession){
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        System.out.println(user);
        User user1=userService.userLogin(user);
        String content="<h3>&nbsp;欢迎回来"+user1.getUsername()+"</h3>" +
                "<img src=\"http://localhost:8080/musicplat/picture/headpic/"+user1.getUserpicurl()+"\" width=\"200px\" hight=\"200px\">";

        System.out.println(user1);
        Map<String,Object> map=new HashMap<String,Object>();
        if(user1!=null){
            httpSession.setAttribute("user",user1);
            map.put("successCode",1);
            map.put("userpicurl",user1.getUserpicurl());
            map.put("userid",user1.getUserid());
            map.put("content",content);
            return map;
        }else{
            map.put("successCode",0);
            return map;
        }

    }

    @RequestMapping("/signout")
    public String execute(HttpSession session){
        session.invalidate();
        return "redirect:/index";
    }

    @RequestMapping("/register")
    public @ResponseBody Map<String,Object> userRegister(HttpServletRequest request, HttpSession httpSession){
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user=new User();
        user.setUsername(username);
        Map<String,Object> map=new HashMap<String,Object>();
        User user1=userService.validateRepeat(user.getUsername());
        if(user1==null) {
            user.setPassword(password);
            user.setUserid(GenerateUUidUtil.generateRandomStr(10));
            user.setUserscore(10);
            user.setUserpicurl("0000000000.jpg");
            System.out.println(user);
            Map<String, Object> map1 = new HashMap<String, Object>();
            map1.put("username", user.getUsername());
            map1.put("userid", user.getUserid());
            map1.put("password", user.getPassword());
            map1.put("userscore", user.getUserscore());
            map1.put("userpicurl", user.getUserpicurl());
            Integer code = userService.userRegister(map1);
            System.out.println(code);
            httpSession.setAttribute("user", user);
            map.put("successCode", 1);
            map.put("userpicurl", user.getUserpicurl());
            map.put("userid", user.getUserid());
            return map;
        }else{
            map.put("successCode",0);
            return map;
        }

    }


    @RequestMapping("/validaterepeat")
    public @ResponseBody Map<String,Object> validateRepeat(HttpServletRequest request){
        String username=request.getParameter("username");
        User user= userService.validateRepeat(username);

        Map<String,Object> map=new HashMap<String,Object>();
        if(user!=null){
            map.put("successCode",0);
            return map;
        }else{
            map.put("successCode",1);
            return map;
        }
    }

    @RequestMapping("/home")
    public String toUserHome(HttpServletRequest request, Model model,HttpSession session){
        User user1= (User) session.getAttribute("user");
        String sessionuserid=user1.getUserid();
        String userid=request.getParameter("userid");
        System.out.println(userid);
        List<SongMenu> songMenus=songMenuService.getSongMenusByUseridAndStatus(userid);
        for (SongMenu songmenu:songMenus) {
            System.out.println(songmenu);
        }
        List<ShareSong> shareSongs=shareSongService.getShareSongListByUserid(userid);
        List<FavoriteVo> shareSongsforUser=new ArrayList<FavoriteVo>();
        for (ShareSong sharesong:shareSongs) {
            FavoriteVo favoriteVo=new FavoriteVo();
            favoriteVo.setStatus_date(sharesong.getUpload_date());
            favoriteVo.setSongid(sharesong.getSongid());
            favoriteVo.setIsyuanchuang(sharesong.getIsyuanchuang());
            Song song=songService.getSongBySongid(sharesong.getSongid());
            favoriteVo.setSongname(song.getName());
            favoriteVo.setSingerid(song.getSingerid());
            favoriteVo.setSingername(singerService.findSingerBySingerid(song.getSingerid()).getName());
            favoriteVo.setScore(song.getMusicscore());
            shareSongsforUser.add(favoriteVo);
        }
        model.addAttribute("sharesongforuser",shareSongsforUser);
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
        if(sessionuserid.equals(userid)){
            System.out.println("同一个人");
            User user=userService.findUserByUserid(userid);
            model.addAttribute("songmenus",songMenus);
            model.addAttribute("userhome",user);
            return "myhome";
        }else {
            System.out.println("不同的人");
            User user=userService.findUserByUserid(userid);
            model.addAttribute("songmenus",songMenus);
            model.addAttribute("userhome",user);
            return "otherhome";
        }



    }

    @RequestMapping("/dealupdate")
    public String dealUpdate(Model model,HttpSession session){
        User user= (User) session.getAttribute("user");
        System.out.println(user);
        User user1=userService.findUserByUserid(user.getUserid());
        model.addAttribute("userupdate",user1);
        return "setting";
    }

    @RequestMapping("/update")
    public String updateUser(HttpServletRequest request,HttpSession session) throws ParseException {
        String nickname=request.getParameter("nickname");
        String sex=request.getParameter("sex");
        String birth=request.getParameter("birthday");
        Date birthday=convert(birth);
        String place=request.getParameter("place");
        String describle=request.getParameter("describle");
        System.out.println(nickname+"=="+sex+"=="+birth+"=="+place+"=="+describle+"==");
        String userid=((User)session.getAttribute("user")).getUserid();
        User user=new User();
        user.setUserid(userid);
        user.setBirthday(birthday);
        user.setNickname(nickname);
        user.setSex(sex);
        user.setPlace(place);
        user.setDescrible(describle);
        userService.userUpdate(user);
        return "redirect:/user/home?userid="+userid;
    }

    public Date convert(String source) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return (Date) simpleDateFormat.parse(source);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

}
