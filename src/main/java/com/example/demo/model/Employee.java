package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "GALAXY_EMPLOYEE")
public class Employee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int empId;
	
	private String username;
	
	private String password;
	
	private String position;
	
	private String dept;
	
	private char status = '1';
	
	private String role;
	
	
	public Employee() {}


	public int getEmpId() {
		return empId;
	}


	public void setEmpId(int empId) {
		this.empId = empId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	public String getDept() {
		return dept;
	}


	public void setDept(String dept) {
		this.dept = dept;
	}	


	public Employee(char status) {
		super();
		this.status = status;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public Employee(int empId, String username, String password, String position, String dept, char status,
			String role) {
		super();
		this.empId = empId;
		this.username = username;
		this.password = password;
		this.position = position;
		this.dept = dept;
		this.status = status;
		this.role = role;
	}


	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", username=" + username + ", password=" + password + ", position="
				+ position + ", dept=" + dept + ", status=" + status + ", role=" + role + "]";
	}
	
	

}
