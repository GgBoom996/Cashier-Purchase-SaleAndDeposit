package cn.itsource.mapper;

import cn.itsource.domain.Role;
import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {
    int deleteByPrimaryKey(Long id);

    List<Role> selectAll();

    List<Role> findRoleByLoginUser(Long id);
}