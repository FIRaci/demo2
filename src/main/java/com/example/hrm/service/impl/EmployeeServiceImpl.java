package com.example.hrm.service.impl;

import com.example.hrm.dto.request.EmployeeRequest;
import com.example.hrm.dto.response.EmployeeResponse;
import com.example.hrm.entity.Employee;
import com.example.hrm.entity.EmployeeType;
import com.example.hrm.exception.DuplicateResourceException;
import com.example.hrm.exception.ResourceNotFoundException;
import com.example.hrm.exception.UnauthorizedAccessException;
import com.example.hrm.repository.EmployeeRepository;
import com.example.hrm.service.EmployeeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Collections;


import com.example.hrm.dto.response.PageResponse;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public PageResponse<EmployeeResponse> getAllEmployees(String name, EmployeeType employeeType, String requesterId, boolean isAdmin, org.springframework.data.domain.Pageable pageable) {
        if (!isAdmin) {
            return employeeRepository.findById(requesterId)
                    .map(emp -> {
                        org.springframework.data.domain.Page<Employee> singlePage = new org.springframework.data.domain.PageImpl<>(Collections.singletonList(emp), pageable, 1);
                        org.springframework.data.domain.Page<EmployeeResponse> responsePage = singlePage.map(e -> EmployeeResponse.fromEntity(e, true));
                        return com.example.hrm.dto.response.PageResponse.of(responsePage);
                    })
                    .orElse(com.example.hrm.dto.response.PageResponse.of(org.springframework.data.domain.Page.empty(pageable)));
        }
        
        org.springframework.data.domain.Page<Employee> employees;
        boolean hasName = StringUtils.hasText(name);

        if (hasName && employeeType != null) {
            employees = employeeRepository.findByFullNameContainingIgnoreCaseAndEmployeeType(name.trim(), employeeType, pageable);
        } else if (hasName) {
            employees = employeeRepository.findByFullNameContainingIgnoreCase(name.trim(), pageable);
        } else if (employeeType != null) {
            employees = employeeRepository.findByEmployeeType(employeeType, pageable);
        } else {
            employees = employeeRepository.findAll(pageable);
        }

        org.springframework.data.domain.Page<EmployeeResponse> responsePage = employees.map(emp -> {
            boolean includeSalary = isAdmin || emp.getEmployeeId().equalsIgnoreCase(requesterId);
            return EmployeeResponse.fromEntity(emp, includeSalary);
        });

        return com.example.hrm.dto.response.PageResponse.of(responsePage);
    }

    @Override
    @Transactional(readOnly = true)
    public EmployeeResponse getEmployeeById(String employeeId, String requesterId, boolean isAdmin) {
        Employee employee = employeeRepository.findById(employeeId)
                .orElseThrow(() -> new ResourceNotFoundException("Employee not found with ID: " + employeeId));

        boolean isSelf = employeeId.equalsIgnoreCase(requesterId);
        if (!isAdmin && !isSelf) {
            throw new UnauthorizedAccessException("Employees are only authorized to view their own profile.");
        }

        return EmployeeResponse.fromEntity(employee, isAdmin || isSelf);
    }

    @Override
    @Transactional
    public EmployeeResponse createEmployee(EmployeeRequest request) {
        String empId = request.getEmployeeId().trim();

        if (employeeRepository.existsById(empId)) {
            throw new DuplicateResourceException("Employee ID already exists: " + empId);
        }

        if (StringUtils.hasText(request.getEmail()) && employeeRepository.existsByEmail(request.getEmail())) {
            throw new DuplicateResourceException("Email already exists: " + request.getEmail());
        }

        Employee employee = new Employee();
        mapRequestToEntity(request, employee);
        employee.setEmployeeId(empId);

        Employee saved = employeeRepository.save(employee);
        return EmployeeResponse.fromEntity(saved, true);
    }

    @Override
    @Transactional
    public EmployeeResponse updateEmployee(String employeeId, EmployeeRequest request) {
        Employee employee = employeeRepository.findById(employeeId)
                .orElseThrow(() -> new ResourceNotFoundException("Employee not found with ID: " + employeeId));

        if (StringUtils.hasText(request.getEmail())
                && !request.getEmail().equalsIgnoreCase(employee.getEmail())
                && employeeRepository.existsByEmail(request.getEmail())) {
            throw new DuplicateResourceException("Email already in use by another employee: " + request.getEmail());
        }

        mapRequestToEntity(request, employee);
        Employee updated = employeeRepository.save(employee);
        return EmployeeResponse.fromEntity(updated, true);
    }

    @Override
    @Transactional
    public void deleteEmployee(String employeeId) {
        if (!employeeRepository.existsById(employeeId)) {
            throw new ResourceNotFoundException("Employee not found with ID: " + employeeId);
        }
        employeeRepository.deleteById(employeeId);
    }

    private void mapRequestToEntity(EmployeeRequest request, Employee entity) {
        entity.setFullName(request.getFullName());
        entity.setDateOfBirth(request.getDateOfBirth());
        entity.setGender(request.getGender());
        entity.setEmail(request.getEmail());
        entity.setPhone(request.getPhone());
        entity.setAddress(request.getAddress());
        entity.setEmployeeType(request.getEmployeeType());
        entity.setDepartment(request.getDepartment());
        entity.setPosition(request.getPosition());
        entity.setSalary(request.getSalary());
        entity.setBankName(request.getBankName());
        entity.setAccountNumber(request.getAccountNumber());
    }
}
