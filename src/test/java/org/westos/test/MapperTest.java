package org.westos.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.westos.bean.Department;
import org.westos.bean.Employee;
import org.westos.dao.DepartmentMapper;
import org.westos.dao.EmployeeMapper;

import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MapperTest {
    //注入
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;


    @Test
    public void test(){
        //1.先来插入几个部门
        Department dept = new Department();
        dept.setDeptName("学习部");
        departmentMapper.insertSelective(dept);

    }


    @Test
    public void test2(){
        //插入一个员工
        Employee employee = new Employee();
        employee.setEmpName("小D");
        employee.setGender("M");
        employee.setEmail("xiaod@163.com");
       	employee.setdId(4);
        employeeMapper.insertSelective(employee);
    }

    @Test
    public void test3() {
        //批量插入员工
        //通过sqlSession 获取一个可以执行批量操作的mapper
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            int num = new Random().nextInt(4) + 1;
            Employee employee = new Employee(null,"xiao"+i,"M","xiao"+i+"@163.com",num);
            mapper.insertSelective(employee);
        }
    }
}