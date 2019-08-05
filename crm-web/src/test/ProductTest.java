import cn.itsource.domain.*;
import cn.itsource.mapper.OrderdetailMapper;
import cn.itsource.mapper.ProductMapper;
import cn.itsource.mapper.WarehouseMapper;
import cn.itsource.mapper.WarehousedetailMapper;
import cn.itsource.query.BaseQuery;
import cn.itsource.query.PurchasingandpurchasingQuery;
import cn.itsource.service.IPurchasingandpurchasingService;
import cn.itsource.util.PageResult;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ProductTest {
    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private IPurchasingandpurchasingService purchasingandpurchasingService;

    @Autowired
    private OrderdetailMapper orderdetailMapper;

    @Autowired
    private WarehousedetailMapper warehousedetailMapper;

    @Autowired
    private WarehouseMapper warehouseMapper;

    @Test
    public void test(){
        List<Product> products = productMapper.selectForList(new PurchasingandpurchasingQuery());
        for (Product product : products) {
            System.out.println(product.getType());
        }
    }
    @Test
    public void test3(){
        PageResult pageResult = purchasingandpurchasingService.selectForList(new BaseQuery());
        List<Purchasingandpurchasing> rows = pageResult.getRows();
        for (Purchasingandpurchasing row : rows) {
            System.out.println(row);
        }
    }

    @Test
    public void test2(){
        Purchasingandpurchasing purchasingandpurchasing = new Purchasingandpurchasing();
        purchasingandpurchasing.setDocumentNumber("15468");
        purchasingandpurchasing.setMakeTime(new Date());
        purchasingandpurchasing.setPaymentAmount(new BigDecimal(155));
        purchasingandpurchasing.setTotalAmount(1561L);
        purchasingandpurchasing.setStoremanageId(2L);
        purchasingandpurchasing.setRemarks("dwqdsadwq");
        List<Orderdetail> list = new ArrayList<>();
        Orderdetail orderdetail = new Orderdetail();
        orderdetail.setProdctTotalnum(new BigDecimal(1561));
        orderdetail.setProductId(1L);
        orderdetail.setProductNum(15L);
        list.add(orderdetail);
        purchasingandpurchasing.setOrderdetails(list);

        purchasingandpurchasingService.insert(purchasingandpurchasing);

    }
    @Test
    public void test4(){
        List<Orderdetail> selectbyid = orderdetailMapper.selectbyid(1L);
        for (Orderdetail orderdetail : selectbyid) {
            System.out.println(orderdetail);
        }
    }
    @Test
    public void test5(){
        Warehousedetail warehousedetail = warehousedetailMapper.selectProduct(1L, 1L);
    }
    @Test
    public void test6(){
        List<Warehouse> warehouses = warehouseMapper.selectForList(new BaseQuery());
        for (Warehouse warehouse : warehouses) {
            System.out.println(warehouse);
        }
    }
    @Test
    public void test7(){
        List<Warehousedetail> warehousedetails = warehousedetailMapper.selectByStoreId(2L);
        System.out.println(warehousedetails);

    }
}
