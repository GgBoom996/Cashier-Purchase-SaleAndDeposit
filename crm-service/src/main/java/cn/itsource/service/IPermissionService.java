package cn.itsource.service;

import cn.itsource.service.IBaseService;
import cn.itsource.domain.Permission;

import java.util.List;
import java.util.Set;

public interface IPermissionService extends IBaseService<Permission> {


    void deleteByPrimaryKey(Long id);

    /**
     * 根据登录用户查询所拥有的权限编号
     * @return
     */
    Set<String> findPermissionssnsByLoginUser();


    List<Permission> findAll();

}
