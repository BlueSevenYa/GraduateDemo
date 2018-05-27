package com.music.controller;

import com.music.entity.Fans;
import com.music.entity.User;
import com.music.service.FansService;
import com.music.service.UserService;
import com.music.vo.FansVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-10-17:23
 */

@Controller
@RequestMapping("/fans")
public class FansController {

    @Autowired
    private FansService fansService;

    @Autowired
    private UserService userService;

    @RequestMapping("/addfans")
    public @ResponseBody
    Map<String,Object> addFans(HttpServletRequest request, HttpSession httpSession){
        Map<String,Object> map=new HashMap<String,Object>();
        String singerid=request.getParameter("singerid");
        String content=request.getParameter("content");
        String userid=((User)httpSession.getAttribute("user")).getUserid();
        Fans fans=new Fans();
        fans.setUserid(userid);
        fans.setSingerid(singerid);
        fans.setContent(content);
        fansService.addFans(fans);
        FansVo fansVo=new FansVo();
        fansVo.setContent(content);
        fansVo.setNickname((userService.findUserByUserid(userid)).getNickname());
        fansVo.setUserid(userid);

        map.put("successCode",1);
        map.put("fansvo",fansVo);
        return map;
    }

}
