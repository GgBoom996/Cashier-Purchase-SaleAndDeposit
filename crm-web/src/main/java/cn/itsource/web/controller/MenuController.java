package cn.itsource.web.controller;

import cn.itsource.domain.Menu;
import cn.itsource.query.MenuQuery;
import cn.itsource.service.IMenuService;
import cn.itsource.util.PageResult;
import cn.itsource.web.controller.util.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 22:52
 * @Version 1.0
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @RequestMapping("/index")
    public String index() {
        return "menu/menu";
    }

    @RequestMapping("/list")
    @ResponseBody//json
    public PageResult<Menu> list(MenuQuery menuQuery) {
        return menuService.selectForList(menuQuery);
    }

    /**
     * 根据当前登录人获取动态菜单
     * @return
     */
    @RequestMapping("/findMenuByLoginUser")
    @ResponseBody
    public List<Menu> findMenuByLoginUser(){
        //UserContext.getId()
        return menuService.findMenuByLoginUser(UserContext.getId());
    }

}
