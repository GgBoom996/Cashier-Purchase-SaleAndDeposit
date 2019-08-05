package cn.itsource.mapper;

import cn.itsource.domain.Warehousedetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WarehousedetailMapper extends BaseMapper<Warehousedetail>{
    int deleteByPrimaryKey(Long id);

    List<Warehousedetail> selectAll();

    Warehousedetail selectProduct(@Param("productid") Long productid , @Param("storeid") Long storeid);

    List<Warehousedetail> selectByStoreId(Long warehouseId);

}