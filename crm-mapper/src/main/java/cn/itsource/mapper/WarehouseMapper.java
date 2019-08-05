package cn.itsource.mapper;

import cn.itsource.domain.Warehouse;
import java.util.List;

public interface WarehouseMapper extends BaseMapper<Warehouse>{
    int deleteByPrimaryKey(Long id);

}