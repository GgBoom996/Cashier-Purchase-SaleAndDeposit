package cn.itsource.web.controller;

import cn.itsource.domain.MyPage;
import cn.itsource.query.MyPageQuery;
import cn.itsource.query.ProductQuery;
import cn.itsource.service.IMyPageService;
import cn.itsource.util.AjaxResult;
import cn.itsource.util.PageResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/myPage")
public class MyPageController {

    @Autowired
    private IMyPageService myPageService;

    @RequestMapping("/index")
    public String index() {
        return "myPage/myPage";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult<MyPage> list(MyPageQuery myPageQuery) {
        return myPageService.selectForList(myPageQuery);
    }

    @RequestMapping("/page")
    @ResponseBody
    public PageResult page(@RequestBody String  qu){
        ProductQuery query = JSONObject.parseObject(qu, ProductQuery.class);
        System.out.println(query.getPage());
        return myPageService.selectForList(query);
    }


    // myPage/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody//json
    public AjaxResult saveOrUpdate(MyPage myPage) {
        if (myPage != null) {
            try {
                //判断是否有id,有就是修改,没有就是添加
                if (myPage.getId() != null) {
                    //修改
                    myPageService.updateByPrimaryKey(myPage);
                } else {
                    //添加
                    myPageService.insert(myPage);
                }
                return new AjaxResult();
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error("操作失败:"+e.getMessage());
            }
        }
        return null;
    }

    @RequestMapping(value = "/saveUpdate",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveUpdate(@RequestBody String  product){
        MyPage produ = JSONObject.parseObject(product, MyPage.class);
        System.out.println(produ);
        try {
            if(produ.getId()==null){
                myPageService.insert(produ);
            }else {
                myPageService.updateByPrimaryKey(produ);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错的");
        }
    }
}
