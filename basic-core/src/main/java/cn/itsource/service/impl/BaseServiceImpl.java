package cn.itsource.service.impl;


import cn.itsource.mapper.BaseMapper;
import cn.itsource.query.BaseQuery;
import cn.itsource.service.IBaseService;
import cn.itsource.util.PageResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BaseServiceImpl<T> implements IBaseService<T> {

    @Autowired
    private BaseMapper<T> baseMapper;


    @Override
    public int insert(T t) {
        return baseMapper.insert(t);
    }

    @Override
    public T selectByPrimaryKey(Long id) {
        return baseMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(T t) {
        return baseMapper.updateByPrimaryKey(t);
    }

    @Override
    public PageResult selectForList(BaseQuery qo) {
        PageHelper.startPage(qo.getPage(),qo.getRows());
        Page page = (Page)baseMapper.selectForList(qo);
        return new PageResult(page.getTotal(),page.getResult());
    }

}
