package cn.itsource.service;

import cn.itsource.domain.Orderdetail;
import cn.itsource.domain.Product;
import cn.itsource.domain.Producttype;

import java.util.List;

public interface IProductService extends IBaseService<Product>{
 /*   void updateStateToDisable(Long id);*/
      void deleteByPrimaryKey(Long id);

    List<Product> selectAll();

}
