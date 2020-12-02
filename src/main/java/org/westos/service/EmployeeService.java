package org.westos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.westos.bean.Employee;
import org.westos.bean.EmployeeExample;
import org.westos.dao.EmployeeMapper;

import java.util.List;

@Service  //注解不要忘了 交个容器管理
public class EmployeeService {
    //注入mapper
    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        //因为查询所有，所以条件就传null
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        return employees;
    }

    public void saveEmp(Employee employee) {
        //有条件的插入
        employeeMapper.insertSelective(employee);
    }


    public boolean checkEmpName(String empName) {
        //创建 EmployeeExample条件对象
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);//根据条件统计个数
        return count==0; //员工姓名的个数==0 说明还没有这个员工
    }


    public Employee getEmpInfoByID(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }


    public void updateEmp(Employee employee) {
        //调用service
        //根据主键，有选择的更新，也就是employee中有哪些数据，就更新哪些数据,比如我们的员工名字是不需要更新的。
        employeeMapper.updateByPrimaryKeySelective(employee);
    }


}