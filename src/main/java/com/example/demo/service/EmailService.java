package com.example.demo.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	private static final String OTP_SUBJECT = "Your OTP for password reset";
	private static final String OTP_MESSAGE = "Forgot your password?\r\n"
			+ "\r\n"
			+ "Hey, we received a request to reset your password.\r\n"
			+ "\r\n"
			+ "Let’s get you a new one! Please verify this OTP with our Application: ";
	
	// method for generating 6 digit otp
	private String generateOTP() {
		Random random = new Random();
		int otp = random.nextInt(999999);
		return String.format("%06d", otp);
	}
	
	// method to send OTP
	public String sendOTP(String toEmail) {
		String otp = generateOTP();
		
		// CREATE A SIMPLE MAIL MESSAGE
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("kureshiskramzan@gmail.com");
		message.setTo(toEmail);
		message.setSubject(OTP_SUBJECT);
		message.setText(OTP_MESSAGE + otp);
		
		try {
			mailSender.send(message);
			return otp;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
// 99 / 96 state code nepal sending email vikas
// Error Code: 2200, ErrorMessage: State Code 99 is invalid for dispatch details or ship details