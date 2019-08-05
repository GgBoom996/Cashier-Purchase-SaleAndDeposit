package cn.itsource.web.controller;

import cn.itsource.util.AjaxResult;
import cn.itsource.util.PageList;
import cn.itsource.domain.${Domain};
import cn.itsource.query.${Domain}Query;
import cn.itsource.service.I${Domain}Service;
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
@RequestMapping("/${domain}")
public class ${Domain}Controller {

    @Autowired
    private I${Domain}Service ${domain}Service;

    @RequestMapping("/index")
    public String index() {


        return "${domain}/${domain}";
    }

    @RequestMapping("/list")
    @ResponseBody//json
    public PageList<${Domain}> list(${Domain}Query ${domain}Query) {

        return ${domain}Service.queryPage(${domain}Query);
    }

    // ${domain}/delete?id
    @RequestMapping("/delete")
    @ResponseBody//json
    public AjaxResult delete(Long id) {
        try {
            ${domain}Service.delete(id);
            return new AjaxResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult("删除失败:" + e.getMessage());
        }
    }

    // ${domain}/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody//json
    public AjaxResult saveOrUpdate(${Domain} ${domain}) {
        if (${domain} != null) {
            try {
                //判断是否有id,有就是修改,没有就是添加
                if (${domain}.getId() != null) {
                    //修改
                    ${domain}Service.update(${domain});
                } else {
                    //添加
                    ${domain}Service.add(${domain});
                }
                return new AjaxResult();
            } catch (Exception e) {
                e.printStackTrace();
                return new AjaxResult("操作失败:"+e.getMessage());
            }
        }
        return null;
    }
}
