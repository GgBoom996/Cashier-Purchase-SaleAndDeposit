package cn.itsource.service;

import cn.itsource.service.IBaseService;
import cn.itsource.domain.Role;

import java.util.List;

public interface IRoleService extends IBaseService<Role> {
    List<Role> findRoleByLoginUser(Long id);

    int deleteByPrimaryKey(Long id);
}
