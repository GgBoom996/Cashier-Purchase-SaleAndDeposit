package cn.itsource.service;

import cn.itsource.domain.Producttype;

import java.util.List;

public interface IProducttypeService extends IBaseService<Producttype> {
    List<Producttype> findAll();

}

