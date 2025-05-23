package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Employee;
import com.example.demo.service.EmployeeService;
import com.example.demo.service.EmployeeServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	private EmployeeService empService;
	
	@Autowired EmployeeServiceImpl empServiceImpl;
	
	@GetMapping("/login")
	public String getHomePage() {
		return "login";
	}
	
	@PostMapping("/loginDetails")
	public String checkLoginCredentials(@RequestParam("")String username,
													  @RequestParam("") String password,
													  HttpServletRequest req, 
													  Model model) {
		
		username = username.isEmpty() ? "" : username;
	    password = password.isEmpty() ? "" : password;
		
		List<Employee> listOfEmp = empService.getListOfEmployee();
		model.addAttribute("empList", listOfEmp);
		
		// if employee is present set the employee into the session
		Optional<Employee> emp = empServiceImpl.findByUsernameAndPassword(username, password);
		if(emp.isPresent()) {
			Employee dbEmployee = emp.get();
			HttpSession session = req.getSession();
	        session.setAttribute("username", dbEmployee.getUsername());
	        session.setAttribute("id", dbEmployee.getEmpId());
	        session.setAttribute("role", dbEmployee.getRole());
	        
	        // setting session time out only for 5 min 300 / 60 = 5 min
	        session.setMaxInactiveInterval(300);
	        
	        model.addAttribute("message", "Login Success!");
	        return "redirect:/home";
		}else {
			model.addAttribute("message", "Wrong username or password, please try again!");
	        return "login";
		}
		
	}
		

}
