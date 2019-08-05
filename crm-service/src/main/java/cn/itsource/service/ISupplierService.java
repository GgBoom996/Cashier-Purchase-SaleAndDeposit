package cn.itsource.service;

import cn.itsource.service.IBaseService;
import cn.itsource.domain.Supplier;

import java.util.List;

public interface ISupplierService extends IBaseService<Supplier> {
    void deleteByPrimaryKey(Long id);

}
