package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RequestMapping("/login")
public class LoginController {
	
	
	@GetMapping
	public String getHomePage() {
		return "login";
	}
	
	@PostMapping
	public @ResponseBody String checkLoginCredentials(HttpServletRequest req, HttpServletResponse res) {
		String username = req.getParameter("username").isEmpty() ? "": req.getParameter("username");
		String password = req.getParameter("password").isEmpty() ? "" : req.getParameter("password");
		
		System.out.println("username: "+username);
		System.out.println("password: "+password);
		
		
		return "redirect:/addUser";
	}
	
	
	
	
	

}
