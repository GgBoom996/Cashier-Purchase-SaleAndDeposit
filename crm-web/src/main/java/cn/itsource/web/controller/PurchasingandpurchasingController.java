package cn.itsource.web.controller;

import cn.itsource.domain.Warehouse;
import cn.itsource.util.AjaxResult;
import cn.itsource.domain.Purchasingandpurchasing;
import cn.itsource.query.PurchasingandpurchasingQuery;
import cn.itsource.service.IPurchasingandpurchasingService;
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
@RequestMapping("/purchasingandpurchasing")
public class PurchasingandpurchasingController {

    @Autowired
    private IPurchasingandpurchasingService purchasingandpurchasingService;

    @RequestMapping("/index")
    public String index() {
        return "purchasingandpurchasing/Purchasing";
    }

    @RequestMapping("/list")
    @ResponseBody//json
    public PageResult<Purchasingandpurchasing> list(PurchasingandpurchasingQuery purchasingandpurchasingQuery) {

        return purchasingandpurchasingService.selectForList(purchasingandpurchasingQuery);
    }

    // purchasingandpurchasing/delete?id
    @RequestMapping("/delete")
    @ResponseBody//json
    public AjaxResult delete(Long id) {
        try {
            purchasingandpurchasingService.deleteByPrimaryKey(id);
            AjaxResult ajaxResult = new AjaxResult();
            ajaxResult.setMsg("操作成功");
            return ajaxResult;
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("删除失败");
        }
    }

    // purchasingandpurchasing/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody//json
    public AjaxResult saveOrUpdate(Purchasingandpurchasing purchasingandpurchasing) {
        if (purchasingandpurchasing != null) {
            try {
                //判断是否有id,有就是修改,没有就是添加
                if (purchasingandpurchasing.getId() != null) {
                    //修改
                    purchasingandpurchasingService.updateByPrimaryKey(purchasingandpurchasing);
                } else {
                    //添加
                    purchasingandpurchasingService.insert(purchasingandpurchasing);
                }
                AjaxResult ajaxResult = new AjaxResult();
                ajaxResult.setMsg("操作成功");
                return ajaxResult;
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error("错误操作");
            }
        }
        return null;
    }

    @RequestMapping(value = "/saveUpdate",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveUpdate(@RequestBody String  product){
        Purchasingandpurchasing produ = JSONObject.parseObject(product, Purchasingandpurchasing.class);
        System.out.println(produ);
        try {
            if(produ.getId()==null){
                purchasingandpurchasingService.insert(produ);
            }else {
                purchasingandpurchasingService.updateByPrimaryKey(produ);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("添加错误");
        }
    }

    public AjaxResult warehousing(Purchasingandpurchasing purchasingandpurchasing){
        if(!purchasingandpurchasing.getOrderStatus()){

        }
        return new AjaxResult();
    }
}
