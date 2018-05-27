package com.music.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.music.entity.*;
import com.music.service.FansService;
import com.music.service.SingerService;
import com.music.service.SongService;
import com.music.service.UserService;
import com.music.vo.FansVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-12:14
 */

@Controller
@RequestMapping("/singer")
public class SingerController {

    @Autowired
    private SingerService singerService;

    @Autowired
    private SongService songService;

    @Autowired
    private FansService fansService;

    @Autowired
    private UserService userService;

    @RequestMapping("/chinese/male")
    public String getChineseMaleSingers(HttpServletRequest request,Model model){
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
        Singer singer=new Singer();
        singer.setNationality("chinese");
        singer.setSex("男");
        List<Singer> singers=singerService.getSingersWithCodition(singer);
        for (Singer singer1:singers) {
            System.out.println(singer1);
        }
        PageInfo<Singer> pagehelper=new PageInfo<Singer>(singers);
        model.addAttribute("pagehelper",pagehelper);
        model.addAttribute("nationalitytag",singer.getNationality());
        model.addAttribute("sextag",singer.getSex());
        return "singercm";
    }

    @RequestMapping("/chinese/female")
    public String getChineseFemaleSingers(HttpServletRequest request,Model model){
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
        Singer singer=new Singer();
        singer.setNationality("chinese");
        singer.setSex("女");
        List<Singer> singers=singerService.getSingersWithCodition(singer);
        for (Singer singer1:singers) {
            System.out.println(singer1);
        }
        PageInfo<Singer> pagehelper=new PageInfo<Singer>(singers);
        model.addAttribute("pagehelper",pagehelper);
        model.addAttribute("nationalitytag",singer.getNationality());
        model.addAttribute("sextag",singer.getSex());
        return "singercf";
    }

    @RequestMapping("foreign/male")
    public String getForeignMaleSingers(HttpServletRequest request,Model model){
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
        Singer singer=new Singer();
        singer.setNationality("foreign");
        singer.setSex("男");
        List<Singer> singers=singerService.getSingersWithCodition(singer);
        for (Singer singer1:singers) {
            System.out.println(singer1);
        }
        PageInfo<Singer> pagehelper=new PageInfo<Singer>(singers);
        model.addAttribute("pagehelper",pagehelper);
        model.addAttribute("nationalitytag",singer.getNationality());
        model.addAttribute("sextag",singer.getSex());
        return "singerfm";
    }

    @RequestMapping("foreign/female")
    public String getForeignFemaleSingers(HttpServletRequest request,Model model){
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
        Singer singer=new Singer();
        singer.setNationality("foreign");
        singer.setSex("女");
        List<Singer> singers=singerService.getSingersWithCodition(singer);
        for (Singer singer1:singers) {
            System.out.println(singer1);
        }
        PageInfo<Singer> pagehelper=new PageInfo<Singer>(singers);
        model.addAttribute("pagehelper",pagehelper);
        model.addAttribute("nationalitytag",singer.getNationality());
        model.addAttribute("sextag",singer.getSex());
        return "singerff";
    }

    @RequestMapping("/show/{singerid}")
    public String showSingerByid(@PathVariable String singerid, Model model){
        System.out.println(singerid);
        Singer singer=singerService.findSingerBySingerid(singerid);
        model.addAttribute("singer",singer);
        List<Song> songs=songService.getSongsBySingerid(singerid);
        model.addAttribute("songs",songs);
        List<Fans> fansList=fansService.getFansBySingerid(singerid);
        List<FansVo> fansVos=new ArrayList<FansVo>();
        for (Fans fans:fansList) {
            System.out.println(fans);
            FansVo fansVo=new FansVo();
            User user=userService.findUserByUserid(fans.getUserid());
            fansVo.setNickname(user.getNickname());
            fansVo.setUserid(user.getUserid());
            fansVo.setContent(fans.getContent());
            fansVos.add(fansVo);
        }
        model.addAttribute("fansvos",fansVos);
        return "singerdata";
    }

    @RequestMapping("/playsong/{singerid}")
    public String getPlaySongs(@PathVariable String singerid, Model model){
        System.out.println(singerid);
        Singer singer=singerService.findSingerBySingerid(singerid);
        SongMenu songMenu=new SongMenu();
        songMenu.setName(singer.getName()+"的热门歌曲");
        model.addAttribute("songmenu",songMenu);
        List<Song> songs=songService.getSongsBySingerid(singerid);
        model.addAttribute("songs",songs);

        return "player";
    }

}
