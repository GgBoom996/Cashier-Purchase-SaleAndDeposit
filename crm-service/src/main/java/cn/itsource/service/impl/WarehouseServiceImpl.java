package cn.itsource.service.impl;


import cn.itsource.domain.Warehousedetail;
import cn.itsource.mapper.BaseMapper;
import cn.itsource.mapper.WarehousedetailMapper;
import cn.itsource.query.BaseQuery;
import cn.itsource.service.impl.BaseServiceImpl;
import cn.itsource.domain.Warehouse;
import cn.itsource.mapper.WarehouseMapper;
import cn.itsource.service.IWarehouseService;
import cn.itsource.util.PageResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 14:45
 * @Version 1.0
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class WarehouseServiceImpl extends BaseServiceImpl<Warehouse> implements IWarehouseService {
    @Autowired
    private WarehouseMapper warehouseMapper;

    @Autowired
    private WarehousedetailMapper warehousedetailMapper;

    @Override
    public PageResult selectForList(BaseQuery qo) {
        PageHelper.startPage(qo.getPage(),qo.getRows());
        Page page = (Page)warehouseMapper.selectForList(qo);
        List<Warehouse> result = page.getResult();
        for (Warehouse warehouse : result) {
            List<Warehousedetail> warehousedetails = warehousedetailMapper.selectByStoreId(warehouse.getStoreId());
            warehouse.setWarehousedetails(warehousedetails);
        }
        return new PageResult(page.getTotal(),result);
    }


    //  事务测试
// @Transactional
//    @Override
//    public void add(Warehouse warehouse) {
//        System.out.println("come on");
//        warehouseMapper.save(warehouse);
//        int i=1/0;
//    }
}
