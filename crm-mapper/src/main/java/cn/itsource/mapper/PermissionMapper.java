package cn.itsource.mapper;

import cn.itsource.domain.Employee;
import cn.itsource.domain.Permission;
import java.util.List;
import java.util.Set;

public interface PermissionMapper extends BaseMapper<Permission> {
    int deleteByPrimaryKey(Long id);



    List<Permission> findAll();

    Set<String> findPermissionsByLoginUser(String username);
}