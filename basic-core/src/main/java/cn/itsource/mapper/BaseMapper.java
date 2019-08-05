package cn.itsource.mapper;

import cn.itsource.query.BaseQuery;

import java.util.List;

public interface BaseMapper<T> {
    int insert(T t);

    T selectByPrimaryKey(Long id);

    int updateByPrimaryKey(T t);

    List<T> selectForList(BaseQuery qo);

}
