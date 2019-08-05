package cn.itsource.mapper;

import cn.itsource.domain.Orderdetail;
import cn.itsource.domain.Product;
import cn.itsource.domain.Producttype;

import java.util.List;

public interface ProductMapper extends BaseMapper<Product> {

    void deleteByPrimaryKey(Long id);

    List<Product> selectAll();

}
