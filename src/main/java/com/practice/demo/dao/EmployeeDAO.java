package com.practice.demo.dao;

import com.practice.demo.entity.Employee;

import java.util.List;

public interface EmployeeDAO {
    public List<Employee> findAll();

    public Employee findByid(int theId);

    public void save(Employee theEmployee);

    public void delete(int theId);
}
