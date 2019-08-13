package com.practice.demo.service;

import com.practice.demo.entity.Employee;

import java.util.List;

public interface EmployeeService {
    public List<Employee> findAll();

    public Employee findByid(int theId);

    public void save(Employee theEmployee);

    public void delete(int theId);
}
