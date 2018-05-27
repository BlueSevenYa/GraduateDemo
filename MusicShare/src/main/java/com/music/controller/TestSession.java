package com.music.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-18-20:12
 */

@Controller
public class TestSession {

    @RequestMapping("/testsession")
    public String test(HttpSession httpSession){
        httpSession.setAttribute("username","username");
        return "tests";
    }

}
