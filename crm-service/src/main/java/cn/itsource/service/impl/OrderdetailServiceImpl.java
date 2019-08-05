package cn.itsource.service.impl;

import cn.itsource.domain.Orderdetail;
import cn.itsource.mapper.OrderdetailMapper;
import cn.itsource.service.IOrderdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderdetailServiceImpl extends BaseServiceImpl<Orderdetail> implements IOrderdetailService{

    @Autowired
    private OrderdetailMapper orderdetailMapper;

    @Override
    public List<Orderdetail> selectAll() {
        return orderdetailMapper.selectAll();
    }
}
