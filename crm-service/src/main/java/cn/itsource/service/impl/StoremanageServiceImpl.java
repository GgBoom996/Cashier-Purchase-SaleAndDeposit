package cn.itsource.service.impl;


import cn.itsource.mapper.BaseMapper;
import cn.itsource.service.impl.BaseServiceImpl;
import cn.itsource.domain.Storemanage;
import cn.itsource.mapper.StoremanageMapper;
import cn.itsource.service.IStoremanageService;
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
public class StoremanageServiceImpl extends BaseServiceImpl<Storemanage> implements IStoremanageService {
    @Autowired
    private StoremanageMapper storemanageMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        storemanageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Storemanage> selectAll() {
        return storemanageMapper.selectAll();
    }


//  事务测试
// @Transactional
//    @Override
//    public void add(Storemanage storemanage) {
//        System.out.println("come on");
//        storemanageMapper.save(storemanage);
//        int i=1/0;
//    }
}
