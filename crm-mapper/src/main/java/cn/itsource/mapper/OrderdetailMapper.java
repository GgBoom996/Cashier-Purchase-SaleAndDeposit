package cn.itsource.mapper;

import cn.itsource.domain.Orderdetail;
import cn.itsource.domain.Purchasingandpurchasing;

import java.util.List;

public interface OrderdetailMapper extends BaseMapper<Orderdetail>{
    List<Orderdetail> selectAll();

    int deleteByPrimaryKey(Long id);

    List<Orderdetail> selectbyid(Long id);
}