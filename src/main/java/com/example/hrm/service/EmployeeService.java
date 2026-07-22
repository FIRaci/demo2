package com.example.hrm.service;

import com.example.hrm.dto.request.EmployeeRequest;
import com.example.hrm.dto.response.EmployeeResponse;
import com.example.hrm.entity.EmployeeType;

import java.util.List;

public interface EmployeeService {

    List<EmployeeResponse> getAllEmployees(String name, EmployeeType employeeType, String requesterId, boolean isAdmin);

    EmployeeResponse getEmployeeById(String employeeId, String requesterId, boolean isAdmin);

    EmployeeResponse createEmployee(EmployeeRequest request);

    EmployeeResponse updateEmployee(String employeeId, EmployeeRequest request);

    void deleteEmployee(String employeeId);
}
