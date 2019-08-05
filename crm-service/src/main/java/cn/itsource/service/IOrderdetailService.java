package cn.itsource.service;

import cn.itsource.domain.Orderdetail;

import java.util.List;

public interface IOrderdetailService extends IBaseService<Orderdetail> {
    List<Orderdetail> selectAll();
}
