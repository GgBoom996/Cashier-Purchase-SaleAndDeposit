package cn.itsource.service.impl;

import cn.itsource.domain.Orderdetail;
import cn.itsource.domain.Product;
import cn.itsource.domain.Producttype;
import cn.itsource.mapper.ProductMapper;
import cn.itsource.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl extends BaseServiceImpl<Product> implements IProductService{

    @Autowired
    private ProductMapper productMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Product> selectAll() {
        return productMapper.selectAll();
    }


/*    @Override
    public void updateStateToDisable(Long id) {
        Product product = productMapper.selectByPrimaryKey(id);

*//*        if(product.getState()==Product.STATE_NORMAL){
            product.setState(Product.STATE_DISABLED);
            updateByPrimaryKey(product);
        }*//*


    }*/


}
