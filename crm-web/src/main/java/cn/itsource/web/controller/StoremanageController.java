package cn.itsource.web.controller;

import cn.itsource.service.IStoremanageService;
import cn.itsource.util.AjaxResult;
import cn.itsource.util.PageResult;
import cn.itsource.domain.Storemanage;
import cn.itsource.query.StoremanageQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 22:52
 * @Version 1.0
 */
@Controller
@RequestMapping("/storemanage")
public class StoremanageController {

    @Autowired
    private IStoremanageService storemanageService;

    @RequestMapping("/index")
    public String index() {
        return "storemanage/storemanage";
    }

    @RequestMapping("/list")
    @ResponseBody//json
    public PageResult<Storemanage> list(StoremanageQuery storemanageQuery) {

        return storemanageService.selectForList(storemanageQuery);
    }

    // storemanage/delete?id
    @RequestMapping("/delete")
    @ResponseBody//json
    public AjaxResult delete(Long id) {
        try {
            System.out.println(id);
            storemanageService.deleteByPrimaryKey(id);
            AjaxResult ajaxResult = new AjaxResult();
            ajaxResult.setMsg("操作成功");
            return ajaxResult;
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("删除失败:" + e.getMessage());
        }
    }

    // storemanage/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody//json
    public AjaxResult saveOrUpdate(Storemanage storemanage) {
        System.out.println(storemanage);
        if (storemanage != null) {
            try {
                //判断是否有id,有就是修改,没有就是添加
                if (storemanage.getId() != null) {
                    //修改
                    Long id = storemanage.getId();
                    Storemanage storemanage1 = storemanageService.selectByPrimaryKey(id);
                    storemanage.setRegistrationDate(storemanage1.getRegistrationDate());
                    storemanage.setStoreCondition(storemanage1.getStoreCondition());
                    storemanageService.updateByPrimaryKey(storemanage);
                } else {
                    //添加
                    storemanageService.insert(storemanage);
                }
                AjaxResult ajaxResult = new AjaxResult();
                ajaxResult.setMsg("操作成功");
                return ajaxResult;
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error("操作失败:"+e.getMessage());
            }
        }
        return null;
    }
}
