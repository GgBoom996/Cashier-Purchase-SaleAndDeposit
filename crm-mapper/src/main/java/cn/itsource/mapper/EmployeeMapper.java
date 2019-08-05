package cn.itsource.mapper;

import cn.itsource.domain.Employee;

public interface EmployeeMapper extends BaseMapper<Employee> {
    int deleteByPrimaryKey(Long id);
    Employee findEmployeeByUsername(String username);

}