package com.music.controller;

import com.music.entity.User;
import com.music.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-12-05-20:51
 */

@Controller
public class ChangeHeadPicController {

    @Autowired
    private UserService userService;


    @RequestMapping("/change/head")
    public String changeHead(){

        return "chead";
    }

    @RequestMapping("/deal/change/head")
    public String dealChangeHead(HttpServletRequest request, HttpSession session) throws IOException {
        long startTime=System.currentTimeMillis();
        User user= (User) session.getAttribute("user");
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
                    String path="D:/musicplatform/picture/headpic/"+file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                    //下面处理数据库逻辑

                    User user1=new User();
                    user1.setUserid(user.getUserid());
                    user1.setUserpicurl(file.getOriginalFilename());
                    user.setUserpicurl(file.getOriginalFilename());
                    session.setAttribute("user",user);
                    userService.updateUserHeadPic(user1);
                }

            }

        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "redirect:/user/home?userid="+user.getUserid();
    }

}
