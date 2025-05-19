package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Employee;
import com.example.demo.service.EmailService;
import com.example.demo.service.EmployeeService;
import com.example.demo.service.EmployeeServiceImpl;

@Controller
public class ForgotPasswordController {
	
	private String generatedOTP = "";
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private EmployeeServiceImpl empService;
	
	@GetMapping("/forgotPassword")
	public String getForgotScreen() {
		return "forgotPass";
	}
	
	@PostMapping("/forgotPassword")
	@ResponseBody
	public ResponseEntity<Map<String, String>> sendOtp(@RequestParam String email) {
	    System.out.println("Received Email ::"+email);
		
		// send OTP logic
		String resp = "Success";
		String message = "";
		if("Error".equals(resp)) {
			message = "Error sending otp, please try again!";
		}else {
			message = "OTP sent successfully!";
		}
		
		Map<String, String> response = new HashMap();
		response.put("status", resp);
		response.put("message", message);
		
	    return ResponseEntity.ok(response);
	}
	
	@PostMapping("/sendOTP")
	@ResponseBody
    public String sendOtpString(@RequestParam("email") String email) {
        generatedOTP = emailService.sendOTP(email);
        if (generatedOTP != null) {
            return generatedOTP;
        } else {
            return "Error";
        }
    }
	
	@PostMapping("/verifyOTP")
    public String verifyOtp(@RequestParam("otp") String enteredOtp) {
        if (enteredOtp.equals(generatedOTP)) {
            return "OTP verified successfully!";
        } else {
            return "Invalid OTP!";
        }
    }
	
	@PostMapping("/resetPassword")
	@ResponseBody
	public String resetPassword(@RequestParam("email") String email, @RequestParam("newPassword") String password) {
		
		Employee dbEmployee = empService.findByUsername(email);
		String result = "";
		
		if(dbEmployee == null) {
			return "User with "+email+" is not present, please create new user.";					
		}
				
		dbEmployee.setPassword(password);
		
		Employee newEmployee = empService.addNewEmployee(dbEmployee);
		
		if(newEmployee != null) {
			result =  "Password Updated Success!";
		}else {
			result = "Error While Updating password!";
		}
		
		return result;
		
	}

}
