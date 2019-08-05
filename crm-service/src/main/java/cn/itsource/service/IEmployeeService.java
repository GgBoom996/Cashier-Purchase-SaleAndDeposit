package cn.itsource.service;

import cn.itsource.service.IBaseService;
import cn.itsource.domain.Employee;

public interface IEmployeeService extends IBaseService<Employee> {
    void deleteByPrimaryKey(Long id);


    Employee findEmployeeByUsername(String username);
}
