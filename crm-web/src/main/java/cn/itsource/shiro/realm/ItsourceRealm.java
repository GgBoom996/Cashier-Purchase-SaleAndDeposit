package cn.itsource.shiro.realm;


import cn.itsource.domain.Employee;
import cn.itsource.service.IEmployeeService;
import cn.itsource.service.IPermissionService;
import cn.itsource.util.MD5Util;
import cn.itsource.service.UserContext ;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/**
 *  只要你的bean交给了spring管理，在其内部可以随意注入spring管理的bean对象
 */
public class ItsourceRealm extends AuthorizingRealm {
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IPermissionService permissionService;

    /**
     * 授权: 授予角色和权限             更多是授予权限
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
       // Employee employee = (Employee) principalCollection.getPrimaryPrincipal();  方式1
        Employee employee = UserContext.getUser();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set<String> permissions = permissionService.findPermissionssnsByLoginUser();
        info.setStringPermissions(permissions);
        return info;
    }

    public Set<String> findPermissionsByUsername(String username){
        Set<String> permissions = new HashSet<>();
        permissions.add("employee:index");
        permissions.add("dept:datagrid");
        permissions.add("dept:remove");
        return permissions;
    }


    /**
     * 身份认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String)token.getPrincipal();
        Employee employee = employeeService.findEmployeeByUsername(username);
        if(employee == null){
            return null;
        }
        ByteSource salt = ByteSource.Util.bytes(MD5Util.SALT);
        return new SimpleAuthenticationInfo(employee,employee.getPassword(),salt,getName());
    }


}
