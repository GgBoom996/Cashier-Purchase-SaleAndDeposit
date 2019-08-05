package cn.itsource.service.impl;


import cn.itsource.domain.Permission;
import cn.itsource.mapper.PermissionMapper;
import cn.itsource.service.IPermissionService;
import cn.itsource.service.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 14:45
 * @Version 1.0
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class PermissionServiceImpl extends BaseServiceImpl<Permission> implements IPermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Set<String> findPermissionssnsByLoginUser() {
        return permissionMapper.findPermissionsByLoginUser(UserContext.getUser().getUsername());
    }

    @Override
    public List<Permission> findAll() {
        return permissionMapper.findAll();
    }


//  事务测试
// @Transactional
//    @Override
//    public void add(Permission permission) {
//        System.out.println("come on");
//        permissionMapper.save(permission);
//        int i=1/0;
//    }
}
