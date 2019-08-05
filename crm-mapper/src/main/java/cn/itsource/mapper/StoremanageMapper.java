package cn.itsource.mapper;

import cn.itsource.domain.Orderdetail;
import cn.itsource.domain.Storemanage;

import java.util.List;

public interface StoremanageMapper extends BaseMapper<Storemanage>{

    int deleteByPrimaryKey(Long id);

    List<Storemanage> selectAll();

}