package cn.itsource.web.controller;

import cn.itsource.query.ProductQuery;
import cn.itsource.util.AjaxResult;
import cn.itsource.domain.Supplier;
import cn.itsource.query.SupplierQuery;
import cn.itsource.service.ISupplierService;
import cn.itsource.util.PageResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 22:52
 * @Version 1.0
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController {

    @Autowired
    private ISupplierService supplierService;

    @RequestMapping("/index")
    public String index() {
        return "supplier/supplier";
    }

    @RequestMapping("/getByid")
    @ResponseBody
    public Supplier getById(Long id){
        return supplierService.selectByPrimaryKey(id);
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult list(ProductQuery query){
        System.out.println(query.getKeyword());
        return supplierService.selectForList(query);
    }

    @RequestMapping("/page")
    @ResponseBody
    public PageResult page(@RequestBody String  qu){
        ProductQuery query = JSONObject.parseObject(qu, ProductQuery.class);
        System.out.println(query.getPage());
        return supplierService.selectForList(query);
    }


    @RequestMapping("/remove")
    @ResponseBody
    public AjaxResult remove(Long id){
        System.out.println(id);

        try {
            supplierService.deleteByPrimaryKey(id);
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
            supplierService.deleteByPrimaryKey(id);
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错了");
        }
    }



    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Supplier product){
        try {
            if(product.getId()==null){
                supplierService.insert(product);
            }else {
                supplierService.updateByPrimaryKey(product);
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
        Supplier produ = JSONObject.parseObject(product, Supplier.class);
        System.out.println(produ);
        try {
            if(produ.getId()==null){
                supplierService.insert(produ);
            }else {
                supplierService.updateByPrimaryKey(produ);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错的");
        }
    }
}
