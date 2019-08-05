package cn.itsource.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class MainContorller {

    @RequestMapping("/main")
    public String  index(){
        return "main";
    }
}
