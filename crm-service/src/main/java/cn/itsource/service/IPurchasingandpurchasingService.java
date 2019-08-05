package cn.itsource.service;

import cn.itsource.service.IBaseService;
import cn.itsource.domain.Purchasingandpurchasing;

public interface IPurchasingandpurchasingService extends IBaseService<Purchasingandpurchasing> {

    void  deleteByPrimaryKey(Long id);

    void warehousing (Purchasingandpurchasing purchasingandpurchasing);
}
