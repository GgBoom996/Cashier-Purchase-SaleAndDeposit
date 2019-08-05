package cn.itsource.web.controller;

import cn.itsource.domain.Product;
import cn.itsource.domain.Role;
import cn.itsource.query.ProductQuery;
import cn.itsource.query.RoleQuery;
import cn.itsource.service.IRoleService;
import cn.itsource.util.AjaxResult;
import cn.itsource.util.PageResult;
import cn.itsource.web.controller.util.UserContext;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 22:52
 * @Version 1.0
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/index")
    public String index() {
        return "role/role";
    }

    @RequestMapping("/list")
    @ResponseBody//json
    public PageResult<Role> list(RoleQuery roleQuery) {

        return roleService.selectForList(roleQuery);
    }

    @RequestMapping("/findRoleByLoginUser")
    @ResponseBody
    public List<Role> findRoleByLoginUser(){
        return roleService.findRoleByLoginUser(UserContext.getId());
    }

    @RequestMapping("/page")
    @ResponseBody
    public PageResult page(@RequestBody String  qu){
        ProductQuery query = JSONObject.parseObject(qu, ProductQuery.class);
        System.out.println(query.getPage());
        return roleService.selectForList(query);
    }

    // role/delete?id
    @RequestMapping("/delete")
    @ResponseBody//json
    public AjaxResult delete(Long id) {
        try {
            roleService.deleteByPrimaryKey(id);
            return new AjaxResult();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("删除失败:" + e.getMessage());
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public AjaxResult update(Long id){
        System.out.println(id);

        try {
            roleService.deleteByPrimaryKey(id);
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错了");
        }
    }

    // role/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Role product){
        try {
            if(product.getId()==null){
                roleService.insert(product);
            }else {
                roleService.updateByPrimaryKey(product);
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
        Role produ = JSONObject.parseObject(product, Role.class);
        System.out.println(produ);
        try {
            if(produ.getId()==null){
                roleService.insert(produ);
            }else {
                roleService.updateByPrimaryKey(produ);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错的");
        }
    }
}
