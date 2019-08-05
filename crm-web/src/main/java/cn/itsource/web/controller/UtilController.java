package cn.itsource.web.controller;

import cn.itsource.domain.Orderdetail;
import cn.itsource.domain.Product;
import cn.itsource.domain.Storemanage;
import cn.itsource.service.IOrderdetailService;
import cn.itsource.service.IProductService;
import cn.itsource.service.IStoremanageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/util")
@Controller
public class UtilController {


    @Autowired
    private IOrderdetailService orderdetailService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IStoremanageService storemanageService;

    @RequestMapping("/findOrderdetail")
    @ResponseBody
    public List<Orderdetail> findOrderdetail(){
        return orderdetailService.selectAll();
    }
    @RequestMapping("/findProductAll")
    @ResponseBody
    public List<Product> findProductAll(){
        return productService.selectAll();
    }
    @RequestMapping("/findAllStore")
    @ResponseBody
    public List<Storemanage> findAllStore(){
        return storemanageService.selectAll();
    }

}
