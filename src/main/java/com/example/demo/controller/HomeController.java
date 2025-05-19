package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.demo.model.Employee;
import com.example.demo.service.EmployeeService;

@Controller
public class HomeController {
	
	@Autowired
	private EmployeeService empService;
	
	
	@GetMapping("/login")
	public String getHomePage() {
		return "login";
	}
	

}
