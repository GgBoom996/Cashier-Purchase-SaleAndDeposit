package cn.itsource.service.impl;

import cn.itsource.domain.Producttype;
import cn.itsource.mapper.ProducttypeMapper;
import cn.itsource.service.IProducttypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProducttypeServiceImpl extends BaseServiceImpl<Producttype> implements IProducttypeService {

    @Autowired
    private ProducttypeMapper producttypeMapper;


    @Override
    public List<Producttype> findAll() {
        return producttypeMapper.findAll();
    }
}
