package com.practice.demo.dao;

import com.practice.demo.entity.Employee;

import java.util.List;

public interface EmployeeDAO {
    public List<Employee> findAll();
}
