package cn.itsource.mapper;

import cn.itsource.domain.Producttype;

import java.util.List;

public interface ProducttypeMapper extends BaseMapper<Producttype> {
        List<Producttype> findAll();


}
