package cn.itsource.service;

import cn.itsource.domain.Employee;
import cn.itsource.service.IBaseService;
import cn.itsource.domain.Menu;

import java.util.List;

public interface IMenuService extends IBaseService<Menu> {
    /**
     * 获取菜单列表，根据登录用户
     * @return
     */
    List<Menu> findMenuByLoginUser(Long id);
}
