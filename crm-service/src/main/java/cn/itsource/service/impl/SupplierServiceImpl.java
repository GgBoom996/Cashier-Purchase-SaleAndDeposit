package cn.itsource.service.impl;


import cn.itsource.domain.Supplier;
import cn.itsource.mapper.BaseMapper;
import cn.itsource.mapper.SupplierMapper;
import cn.itsource.service.ISupplierService;
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
public class SupplierServiceImpl extends BaseServiceImpl<Supplier> implements ISupplierService {
    @Autowired
    private SupplierMapper supplierMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        supplierMapper.deleteByPrimaryKey(id);
    }


//  事务测试
// @Transactional
//    @Override
//    public void add(Supplier supplier) {
//        System.out.println("come on");
//        supplierMapper.save(supplier);
//        int i=1/0;
//    }
}
