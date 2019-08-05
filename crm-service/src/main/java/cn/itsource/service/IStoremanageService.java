package cn.itsource.service;

import cn.itsource.service.IBaseService;
import cn.itsource.domain.Storemanage;

import java.util.List;

public interface IStoremanageService extends IBaseService<Storemanage> {

    void deleteByPrimaryKey(Long id);

    List<Storemanage> selectAll();
}
