package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Employee;
import com.example.demo.service.EmployeeService;

@Controller
public class EmployeeRegisterController {
	
	@Autowired
	private EmployeeService empService;
	
	@GetMapping("/addEmployee")
	public String addEmployee() {
		return "addUser";
	}
	
	
	@PostMapping("/addEmployee")
	@ResponseBody
	public ResponseEntity<Employee> addEmployee(@RequestBody Employee emp){
		try {
			Employee savedEmployee = empService.addNewEmployee(emp);
			return ResponseEntity.ok(savedEmployee);
		}catch(Exception e) {
			System.out.println("Exception : "+e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

}
