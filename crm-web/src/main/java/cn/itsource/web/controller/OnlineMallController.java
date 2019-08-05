package cn.itsource.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/onlineMall")
public class OnlineMallController {

    @RequestMapping("/index")
    public String index(){
        return "onlineMall/onlineMall";
    }

    @RequestMapping("/hardwareService_N3")
    public String hardwareService(){
        return "onlineMall/hardwareService_N3";
    }
}
