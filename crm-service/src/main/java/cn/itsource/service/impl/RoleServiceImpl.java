package cn.itsource.service.impl;


import cn.itsource.mapper.BaseMapper;
import cn.itsource.service.impl.BaseServiceImpl;
import cn.itsource.domain.Role;
import cn.itsource.mapper.RoleMapper;
import cn.itsource.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 14:45
 * @Version 1.0
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findRoleByLoginUser(Long id) {
        return roleMapper.findRoleByLoginUser(id);
    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        return roleMapper.deleteByPrimaryKey(id);
    }


//  事务测试
// @Transactional
//    @Override
//    public void add(Role role) {
//        System.out.println("come on");
//        roleMapper.save(role);
//        int i=1/0;
//    }
}
