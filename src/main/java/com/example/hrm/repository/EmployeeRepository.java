package com.example.hrm.repository;

import com.example.hrm.entity.Employee;
import com.example.hrm.entity.EmployeeType;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {
    Page<Employee> findByFullNameContainingIgnoreCase(String fullName, Pageable pageable);

    Page<Employee> findByEmployeeType(EmployeeType employeeType, Pageable pageable);

    Page<Employee> findByFullNameContainingIgnoreCaseAndEmployeeType(String fullName, EmployeeType employeeType, Pageable pageable);

    boolean existsByEmail(String email);
}
