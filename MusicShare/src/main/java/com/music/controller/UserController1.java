package com.music.controller;

import com.music.entity.User;
import com.music.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-04-23-13:07
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("uid")
public class UserController1 {

    @Resource
    private IUserService userService;

    @RequestMapping("/showUser")
    public String toIndex(HttpServletRequest request, Model model){
        int userId = Integer.parseInt(request.getParameter("id"));
        System.out.println(userId);
        User user = this.userService.getUserById(userId);
        System.out.println(user.getUsername());
        model.addAttribute("user", user);
        return "showuser1";
    }

    @RequestMapping("/login1")
    public @ResponseBody Boolean test(@RequestBody User user, ModelMap map, HttpSession httpSession){
        String username=user.getUsername();
        String password=user.getPassword();

        System.out.println(username+"===="+password);
        if("admin".equals(username)&&"123456".equals(password)){
            map.addAttribute("uid","1111111111");
            httpSession.setAttribute("uid1","222222");
            System.out.println("保存成功");
            return true;
        }else{
            System.out.println("保存失败了");
            return false;
        }
    }






}
