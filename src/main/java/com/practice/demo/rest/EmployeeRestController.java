package com.practice.demo.rest;

import com.practice.demo.entity.Employee;
import com.practice.demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class EmployeeRestController {

    private EmployeeService employeeService;

    @Autowired
    public EmployeeRestController(EmployeeService theEmployeeService){
        employeeService = theEmployeeService;
    }

    // Expose "/employee" and return list of employee
    @GetMapping("/employees")
    public List<Employee> findAll(){
        return employeeService.findAll();
    }

//    @GetMapping("/employees/{}")
}
