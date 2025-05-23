package com.example.demo.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer>{

	public Employee findByUsername(String username);
	
	Optional<Employee> findByUsernameAndPassword(String username, String passowrd);
}
