package cn.itsource.mapper;


import cn.itsource.domain.Supplier;

public interface SupplierMapper extends BaseMapper<Supplier> {
    int deleteByPrimaryKey(Long id);

    Supplier selectByPrimaryKey(Long id);
}