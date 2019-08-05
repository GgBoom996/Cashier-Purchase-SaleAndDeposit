package cn.itsource.service.impl;


import cn.itsource.mapper.BaseMapper;
import cn.itsource.service.impl.BaseServiceImpl;
import cn.itsource.domain.Employee;
import cn.itsource.mapper.EmployeeMapper;
import cn.itsource.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 14:45
 * @Version 1.0
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements IEmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Employee findEmployeeByUsername(String username) {
        return employeeMapper.findEmployeeByUsername(username);
    }


//  事务测试
// @Transactional
//    @Override
//    public void add(Employee employee) {
//        System.out.println("come on");
//        employeeMapper.save(employee);
//        int i=1/0;
//    }
}
