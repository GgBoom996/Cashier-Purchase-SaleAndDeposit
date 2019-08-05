package cn.itsource.web.controller;



import cn.itsource.domain.Product;
import cn.itsource.domain.Producttype;
import cn.itsource.query.ProductQuery;
import cn.itsource.service.IProductService;
import cn.itsource.service.IProducttypeService;
import cn.itsource.util.AjaxResult;
import cn.itsource.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;
    @Autowired
    private IProducttypeService producttypeService;


    @RequestMapping("/types")
    @ResponseBody
    public List<Producttype> lists(){
        return producttypeService.findAll();
    }


    @RequestMapping("/getByid")
    @ResponseBody
    public Product getById(Long id){
        return productService.selectByPrimaryKey(id);
    }

    @RequestMapping("/index")
    public String index(Model model){
        return "product";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult list(ProductQuery query){
        return productService.selectForList(query);
    }



    @RequestMapping("/remove")
    @ResponseBody
    public AjaxResult remove(Long id){
        try {
            productService.deleteByPrimaryKey(id);
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("删除失败");
        }
    }


    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Product product){
/*        System.out.println(product.getType().getId());*/
        try {
            if(product.getId()==null){
                System.out.println(product);
                System.out.println(product.getType());
                productService.insert(product);

            }else {
                productService.updateByPrimaryKey(product);
            }
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("失败"+e.getMessage());
        }
/*        return  null;*/
    }
}
