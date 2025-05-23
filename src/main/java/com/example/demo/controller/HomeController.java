package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Employee;
import com.example.demo.service.EmployeeService;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private EmployeeService empService;
	
	@GetMapping("/home")
	public String getHomePage(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession(false);

	    if (session == null || session.getAttribute("empId") == null) {
	        return "redirect:/login";
	    }
	    
		List<Employee> listOfEmp = empService.getListOfEmployee();
		// filtering only employee whose status is 1
		listOfEmp = listOfEmp.stream().filter(emp -> emp.getStatus() == '1').toList();
		model.addAttribute("empList", listOfEmp);
		return "home";
	}
	
	@GetMapping("/getEmployeeList")
	public String getElmployeeList(Model model){
		
		List<Employee> listOfEmp = empService.getListOfEmployee();
		model.addAttribute("empList", listOfEmp);
		
		return "redirec:/home";
	}
	
	@GetMapping("/editEmployee/{empId}")
	public String editEmployee(@PathVariable("empId") int empId, Model model) {
		Employee emp = empService.findById(empId);
	    if (emp != null) {
	        model.addAttribute("employee", emp);
	        model.addAttribute("isEdit", true); // indicate edit mode
	        return "addUser";
	    } else {
	        return "redirect:/home";
	    }
	}
	
	@GetMapping("/deleteEmployee/{empId}")
	public String deleteEmployee(@PathVariable("empId") int empId, Model model) {
		Employee emp = empService.findById(empId);
		
		if(emp != null) {
			emp.setStatus('0');
			empService.addNewEmployee(emp);
			model.addAttribute("message", "Employee Deleted!");
		}
		
		return "redirect:/home";
	}

}
