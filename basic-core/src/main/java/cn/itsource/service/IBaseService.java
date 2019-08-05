package cn.itsource.service;

import cn.itsource.query.BaseQuery;
import cn.itsource.util.PageResult;

public interface IBaseService<T> {
    int insert(T t);

    T selectByPrimaryKey(Long id);

    int updateByPrimaryKey(T t);

    PageResult selectForList(BaseQuery qo);

}
