package cn.itsource.service.impl;


import cn.itsource.domain.*;
import cn.itsource.mapper.*;
import cn.itsource.query.BaseQuery;
import cn.itsource.service.IPurchasingandpurchasingService;
import cn.itsource.util.PageResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 14:45
 * @Version 1.0
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class PurchasingandpurchasingServiceImpl extends BaseServiceImpl<Purchasingandpurchasing> implements IPurchasingandpurchasingService {
    @Autowired
    private PurchasingandpurchasingMapper purchasingandpurchasingMapper;

    @Autowired
    private OrderdetailMapper orderdetailMapper;

    @Autowired
    private WarehouseMapper warehouseMapper;

    @Autowired
    private WarehousedetailMapper warehousedetailMapper;

    @Autowired
    private ProductMapper productMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        List<Orderdetail> selectbyid = orderdetailMapper.selectbyid(id);
        for (Orderdetail orderdetail : selectbyid) {
            orderdetailMapper.deleteByPrimaryKey(orderdetail.getId());
        }
        purchasingandpurchasingMapper.deleteByPrimaryKey(id);

    }

    @Override
    public PageResult selectForList(BaseQuery qo) {
        PageHelper.startPage(qo.getPage(),qo.getRows());
        Page page = (Page)purchasingandpurchasingMapper.selectForList(qo);
        List<Purchasingandpurchasing> result = page.getResult();
        for (Purchasingandpurchasing purchasingandpurchasing : result) {
            Long id = purchasingandpurchasing.getId();
            List<Orderdetail> selectbyid = orderdetailMapper.selectbyid(id);
            purchasingandpurchasing.setOrderdetails(selectbyid);
        }
        return new PageResult(page.getTotal(),result);
    }

    @Override
    public void warehousing(Purchasingandpurchasing purchasingandpurchasing) {
        List<Orderdetail> orderdetails = purchasingandpurchasing.getOrderdetails();
        for (Orderdetail orderdetail : orderdetails) {
            Long productId = orderdetail.getProductId();
            Warehousedetail warehousedetail = warehousedetailMapper.selectProduct(productId, purchasingandpurchasing.getStoremanageId());
            if (warehousedetail !=null){
                warehousedetail.setProductNum(warehousedetail.getProductNum()+orderdetail.getProductNum());
                warehousedetail.setProductValue(warehousedetail.getProductValue().add(orderdetail.getProdctTotalnum()));
                warehousedetailMapper.insert(warehousedetail);
                Warehouse warehouse = warehouseMapper.selectByPrimaryKey(purchasingandpurchasing.getStoremanageId());
                warehouse.setProductValue(warehouse.getProductValue().add(orderdetail.getProdctTotalnum()));
                warehouseMapper.insert(warehouse);
            }else {
                warehousedetail.setProductValue(orderdetail.getProdctTotalnum());
                warehousedetail.setProductNum(orderdetail.getProductNum());
                warehousedetail.setProductId(orderdetail.getProductId());
                warehousedetail.setWarehouseId(purchasingandpurchasing.getStoremanageId());
                warehousedetailMapper.insert(warehousedetail);
                Warehouse warehouse = warehouseMapper.selectByPrimaryKey(purchasingandpurchasing.getStoremanageId());
                warehouse.setProductValue(warehouse.getProductValue().add(orderdetail.getProdctTotalnum()));;
                warehouse.setProductValue(warehouse.getProductValue().add(orderdetail.getProdctTotalnum()));
                warehouseMapper.insert(warehouse);
            }
        }
    }


    @Override
    public int insert(Purchasingandpurchasing purchasingandpurchasing) {
        purchasingandpurchasing.setPaymentAmount(new BigDecimal(0));
        purchasingandpurchasing.setMakeTime(new Date());

        List<Orderdetail> orderdetails = purchasingandpurchasing.getOrderdetails();

        Orderdetail orderdetail = orderdetails.get(0);

        Product product = productMapper.selectByPrimaryKey(orderdetail.getProductId());

        orderdetail.setProdctTotalnum(new BigDecimal(orderdetail.getProductNum()).multiply(product.getInputPrice()));

        purchasingandpurchasing.setPaymentAmount(purchasingandpurchasing.getPaymentAmount().add(new BigDecimal(orderdetail.getProductNum()).multiply(product.getInputPrice())));

        purchasingandpurchasing.setTotalAmount(orderdetail.getProductNum());

        purchasingandpurchasingMapper.insert(purchasingandpurchasing);

        Long id = purchasingandpurchasing.getId();

        if (id != null){

                orderdetail.setPurchasingandpurchasingId(id);

                orderdetailMapper.insert(orderdetail);


        }
       return 0;
    }

    @Override
    public int updateByPrimaryKey(Purchasingandpurchasing purchasingandpurchasing) {
        purchasingandpurchasing.setPaymentAmount(new BigDecimal(0));
        Long id = purchasingandpurchasing.getId();
        Purchasingandpurchasing purchasingandpurchasing1 = purchasingandpurchasingMapper.selectByPrimaryKey(id);
        List<Orderdetail> orderdetails1 = purchasingandpurchasing1.getOrderdetails();
        for (Orderdetail orderdetail : orderdetails1) {
            Product product = productMapper.selectByPrimaryKey(orderdetail.getProductId());
            orderdetail.setProdctTotalnum(new BigDecimal(orderdetail.getProductNum()).multiply(product.getInputPrice()));
            purchasingandpurchasing.setPaymentAmount(purchasingandpurchasing.getPaymentAmount().add(new BigDecimal(orderdetail.getProductNum()).multiply(product.getInputPrice())));
        }
        for (Orderdetail orderdetail : orderdetails1) {
            orderdetailMapper.deleteByPrimaryKey(orderdetail.getId());
        }
        List<Orderdetail> orderdetails = purchasingandpurchasing.getOrderdetails();
        for (Orderdetail orderdetail : orderdetails) {
            orderdetailMapper.insert(orderdetail);
        }
        return super.updateByPrimaryKey(purchasingandpurchasing);
    }



}
