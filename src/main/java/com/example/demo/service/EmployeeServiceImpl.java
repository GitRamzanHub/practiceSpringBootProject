package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Service;

import com.example.demo.model.Employee;
import com.example.demo.repo.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeRepository empRepo;

	@Override
	public Employee addNewEmployee(Employee emp) {
		// TODO Auto-generated method stub
		return empRepo.save(emp);
	}

	@Override
	public List<Employee> getListOfEmployee() {
		List<Employee> empList = new ArrayList<>();
		empList = empRepo.findAll();
		return empList;
	}

	@Override
	public Employee findByUsername(String username) {
		// TODO Auto-generated method stub
		Employee emp = null;
		
		emp = empRepo.findByUsername(username);
		return emp;
	}

	@Override
	public Optional<Employee> findByUsernameAndPassword(String username, String password) {
		Optional<Employee> employee = empRepo.findByUsernameAndPassword(username, password);
		return employee;
	}

	@Override
	public Employee findById(int empId) {
		Optional<Employee> emp = empRepo.findById(empId);
		if(emp.isPresent()) {
			return emp.get();
		}else {
			return new Employee();
		}
		
	}

}
