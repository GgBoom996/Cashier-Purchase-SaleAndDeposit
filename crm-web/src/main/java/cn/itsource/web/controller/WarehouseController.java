package cn.itsource.web.controller;

import cn.itsource.domain.Product;
import cn.itsource.util.AjaxResult;
import cn.itsource.domain.Warehouse;
import cn.itsource.query.WarehouseQuery;
import cn.itsource.service.IWarehouseService;
import cn.itsource.util.PageResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 22:52
 * @Version 1.0
 */
@Controller
@RequestMapping("/warehouse")
public class WarehouseController {

    @Autowired
    private IWarehouseService warehouseService;

    @RequestMapping("/index")
    public String index() {


        return "warehouse/warehouse";
    }

    @RequestMapping("/list")
    @ResponseBody//json
    public PageResult<Warehouse> list(WarehouseQuery warehouseQuery) {
        return warehouseService.selectForList(warehouseQuery);
    }

    /*// warehouse/delete?id
    @RequestMapping("/delete")
    @ResponseBody//json
    public AjaxResult delete(Long id) {
        try {
            warehouseService.delete(id);
            return new AjaxResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult("删除失败:" + e.getMessage());
        }
    }*/

    // warehouse/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Warehouse warehouse ) {

        /*System.out.println(warehouse);*/
        /*if (warehouse != null) {
            try {
                //判断是否有id,有就是修改,没有就是添加
                if (warehouse.getId() != null) {
                    warehouseService.updateByPrimaryKey(warehouse);
                } else {
                    //添加
                    warehouseService.insert(warehouse);
                }
                AjaxResult ajaxResult = new AjaxResult();
                ajaxResult.setMsg("操作成功!!");
                return ajaxResult;
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error("错误操作");
            }
        }*/
        return null;
    }

    @RequestMapping(value = "/saveUpdate",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveUpdate(@RequestBody String  product){
        Warehouse produ = JSONObject.parseObject(product, Warehouse.class);
        System.out.println(produ);
        try {
            if(produ.getId()==null){
                warehouseService.insert(produ);
            }else {
                warehouseService.updateByPrimaryKey(produ);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错的");
        }
    }
}
