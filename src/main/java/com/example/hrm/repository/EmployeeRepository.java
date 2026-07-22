package com.example.hrm.repository;

import com.example.hrm.entity.Employee;
import com.example.hrm.entity.EmployeeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {

    List<Employee> findByFullNameContainingIgnoreCase(String fullName);

    List<Employee> findByEmployeeType(EmployeeType employeeType);

    List<Employee> findByFullNameContainingIgnoreCaseAndEmployeeType(String fullName, EmployeeType employeeType);

    boolean existsByEmail(String email);
}
