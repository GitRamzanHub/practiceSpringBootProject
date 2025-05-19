package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Employee;

public interface EmployeeService {
	
	public Employee addNewEmployee(Employee emp);
	
	public List<Employee> getListOfEmployee();
	
	public Employee findByUsername(String username);
	

}
