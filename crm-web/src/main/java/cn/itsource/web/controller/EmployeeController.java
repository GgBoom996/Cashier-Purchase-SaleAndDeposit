package cn.itsource.web.controller;

import cn.itsource.util.AjaxResult;

import cn.itsource.domain.Employee;
import cn.itsource.query.EmployeeQuery;
import cn.itsource.service.IEmployeeService;
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
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;

    @RequestMapping("/index")
    public String index() {


        return "employee/employee";
    }



    @RequestMapping("/getByid")
    @ResponseBody
    public Employee getById(Long id){
        return employeeService.selectByPrimaryKey(id);
    }



    @RequestMapping("/list")
    @ResponseBody//json
    public PageResult<Employee> list(EmployeeQuery employeeQuery) {

        return employeeService.selectForList(employeeQuery);
    }


    @RequestMapping("/page")
    @ResponseBody
    public PageResult page(@RequestBody String  qu){
        EmployeeQuery query = JSONObject.parseObject(qu, EmployeeQuery.class);

        return employeeService.selectForList(query);
    }

    @RequestMapping("remove")
    @ResponseBody
    public AjaxResult remove(Long id){
        System.out.println(id);

        try {
            employeeService.deleteByPrimaryKey(id);
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错了");
        }
    }
    @RequestMapping(value = "/saveUpdate",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveUpdate(@RequestBody String  product){
        Employee produ = JSONObject.parseObject(product, Employee.class);
       /* System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        System.out.println(produ.getAge());*/

        try {
            if(produ.getId()==null){
                Date date = new Date();
                produ.setAddtime(date);
                employeeService.insert(produ);


            }else {
                System.out.println("djeksdwdweferferferge");
                System.out.println(produ.getInitiationtime());
                System.out.println(produ.getAddtime());
                employeeService.updateByPrimaryKey(produ);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("错的");
        }
    }




    // employee/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody//json
    public AjaxResult saveOrUpdate(Employee employee) {
        if (employee != null) {
            try {
                //判断是否有id,有就是修改,没有就是添加
                if (employee.getId() != null) {
                    //修改
                    employeeService.updateByPrimaryKey(employee);
                } else {
                    //添加
                    Date date = new Date();
                    employee.setAddtime(date);
                    int insert = employeeService.insert(employee);
                }
                AjaxResult ajaxResult = new AjaxResult();
                ajaxResult.setMsg("操作成功");
                return ajaxResult;
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error("失败:" + e.getMessage());
            }
        }
        return null;
    }
}
