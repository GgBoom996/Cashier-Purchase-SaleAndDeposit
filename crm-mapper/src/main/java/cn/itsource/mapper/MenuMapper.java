package cn.itsource.mapper;

import cn.itsource.domain.Employee;
import cn.itsource.domain.Menu;
import java.util.List;

public interface MenuMapper extends BaseMapper<Menu> {
    int deleteByPrimaryKey(Long id);

    List<Menu> selectAll();

    //通过用户id查询对应的菜单
    List<Menu> findMenuByLoginUser(Long id);
}