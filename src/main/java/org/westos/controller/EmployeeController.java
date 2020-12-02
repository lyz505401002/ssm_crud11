package org.westos.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.westos.bean.Employee;
import org.westos.bean.PageMsg;
import org.westos.service.EmployeeService;

import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @RequestMapping(path = "/emps")
    //注意 index.jsp 发过来没有页码所以默认值是 defaultValue = "1"
    public PageMsg getEmpsWithJSON(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Model model){
        System.out.println("请求来了");
        //使用pagehelper设置分页信息
        //1.在查询所有之前使用PageHelper来设置页码和每页展示的条数
        PageHelper.startPage(pageNum,5);
        //2.那么这个查询就是一个分页查询了
        List<Employee> list = employeeService.getAll();
        //3.把查询出的结果list包装到PageInfo里面,5是可选参数表示连续显示5页的页码
        PageInfo pageInfo = new PageInfo(list,5);
        /*//4.把pageInfo放到域中转发到页面，就可以从pageInfo中取出分页的信息
        model.addAttribute("pageInfo", pageInfo);*/
        //4.使用我们自己定义的PageMsg 封装页面数据pageInfo返回PageMsg对象
        PageMsg pageMsg = PageMsg.success().add("pageInfo", pageInfo);

        return pageMsg;
    }


    @ResponseBody
    @RequestMapping(path = "/emp",method = RequestMethod.POST)
    public PageMsg saveEmp(Employee employee){
        //调用service
        employeeService.saveEmp(employee);
        //返回插入成功的结果
        return PageMsg.success();
    }


    @ResponseBody
    @RequestMapping(path = "/checkEmpName", method = RequestMethod.POST)
    public PageMsg checkEmpName(String empName) {
        //调用service
        boolean  b=employeeService.checkEmpName(empName);
        if(b){
            return PageMsg.success();
        }else{
            return PageMsg.fail();
        }
    }


    @ResponseBody
    @RequestMapping(path = "/emp/{id}", method = RequestMethod.GET)
    public PageMsg getEmpInfoByID(@PathVariable("id") Integer id){
        //调用service
        Employee employee= employeeService.getEmpInfoByID(id);
        return PageMsg.success().add("emp",employee);
    }


    @ResponseBody
    @RequestMapping(path = "/emp/{empId}", method = RequestMethod.PUT)  //更新采用PUT请求
    public PageMsg updateEmpInfoByID(Employee employee) {//这里不要使用@PathVariable注解
        //调用service
        employeeService.updateEmp(employee);
        return PageMsg.success();
    }


}