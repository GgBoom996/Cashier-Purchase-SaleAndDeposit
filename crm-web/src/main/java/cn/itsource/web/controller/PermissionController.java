package cn.itsource.web.controller;

import cn.itsource.domain.Permission;
import cn.itsource.domain.Product;
import cn.itsource.query.PermissionQuery;
import cn.itsource.query.ProductQuery;
import cn.itsource.service.IPermissionService;
import cn.itsource.util.AjaxResult;
import cn.itsource.util.PageResult;
import cn.itsource.web.controller.util.UserContext;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Set;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 22:52
 * @Version 1.0
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("/index")
    public String index() {
        return "permission/permission";
    }

    @RequestMapping("/getByid")
    @ResponseBody
    public Permission getById(Long id){
        return permissionService.selectByPrimaryKey(id);
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult list(ProductQuery query){
        System.out.println(query.getKeyword());
        return permissionService.selectForList(query);
    }

    @RequestMapping("/page")
    @ResponseBody
    public PageResult page(@RequestBody String  qu){
        ProductQuery query = JSONObject.parseObject(qu, ProductQuery.class);
        System.out.println(query.getPage());
        return permissionService.selectForList(query);
    }


    @RequestMapping("/remove")
    @ResponseBody
    public AjaxResult remove(Long id){
        System.out.println(id);

        try {
            permissionService.deleteByPrimaryKey(id);
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错了");
        }
    }
    @RequestMapping("/update")
    @ResponseBody
    public AjaxResult update(Long id){
        System.out.println(id);

        try {
            permissionService.deleteByPrimaryKey(id);
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错了");
        }
    }



    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Permission product){
        try {
            if(product.getId()==null){
                permissionService.insert(product);
            }else {
                permissionService.updateByPrimaryKey(product);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错的");
        }
    }
    @RequestMapping(value = "/saveUpdate",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveUpdate(@RequestBody String  product){
        Permission produ = JSONObject.parseObject(product, Permission.class);
        System.out.println(produ);
        try {
            if(produ.getId()==null){
                permissionService.insert(produ);
            }else {
                permissionService.updateByPrimaryKey(produ);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错的");
        }
    }
}
