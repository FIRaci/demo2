package com.example.hrm.service.impl;

import com.example.hrm.dto.request.LoginRequest;
import com.example.hrm.dto.request.RegisterRequest;
import com.example.hrm.dto.response.AuthResponse;
import com.example.hrm.entity.Employee;
import com.example.hrm.entity.EmployeeType;
import com.example.hrm.entity.Gender;
import com.example.hrm.entity.Role;
import com.example.hrm.entity.UserAccount;
import com.example.hrm.exception.DuplicateResourceException;
import com.example.hrm.exception.ResourceNotFoundException;
import com.example.hrm.exception.UnauthorizedAccessException;
import com.example.hrm.repository.EmployeeRepository;
import com.example.hrm.repository.UserAccountRepository;
import com.example.hrm.security.JwtUtils;
import com.example.hrm.service.AuthService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
public class AuthServiceImpl implements AuthService {

    private final UserAccountRepository userAccountRepository;
    private final EmployeeRepository employeeRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtils jwtUtils;

    public AuthServiceImpl(UserAccountRepository userAccountRepository,
                           EmployeeRepository employeeRepository,
                           PasswordEncoder passwordEncoder,
                           JwtUtils jwtUtils) {
        this.userAccountRepository = userAccountRepository;
        this.employeeRepository = employeeRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtils = jwtUtils;
    }

    @Override
    @Transactional
    public AuthResponse register(RegisterRequest registerRequest) {
        String empId = registerRequest.getEmployeeId().trim();

        if (userAccountRepository.existsByEmployeeId(empId)) {
            throw new DuplicateResourceException("Account already registered for Employee ID: " + empId);
        }

        Employee employee = employeeRepository.findById(empId).orElseGet(() -> {
            Employee newEmp = new Employee();
            newEmp.setEmployeeId(empId);
            newEmp.setFullName("Employee " + empId);
            newEmp.setEmployeeType(EmployeeType.FULL_TIME);
            newEmp.setGender(Gender.MALE);
            newEmp.setEmail(empId.toLowerCase() + "@company.com");
            newEmp.setSalary(BigDecimal.valueOf(1000));
            return employeeRepository.save(newEmp);
        });

        Role assignedRole = empId.startsWith("ADMIN") ? Role.ROLE_ADMIN : Role.ROLE_EMPLOYEE;

        UserAccount userAccount = new UserAccount();
        userAccount.setEmployeeId(empId);
        userAccount.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        userAccount.setRole(assignedRole);
        userAccountRepository.save(userAccount);

        String token = jwtUtils.generateTokenForEmployee(empId, assignedRole.name());

        return new AuthResponse(token, empId, employee.getFullName(), assignedRole.name());
    }

    @Override
    public AuthResponse login(LoginRequest loginRequest) {
        String empId = loginRequest.getEmployeeId().trim();

        UserAccount account = userAccountRepository.findByEmployeeId(empId)
                .orElseThrow(() -> new ResourceNotFoundException("Account not found for Employee ID: " + empId));

        if (!passwordEncoder.matches(loginRequest.getPassword(), account.getPassword())) {
            throw new UnauthorizedAccessException("Invalid credentials for Employee ID: " + empId);
        }

        Employee employee = employeeRepository.findById(empId)
                .orElseThrow(() -> new ResourceNotFoundException("Employee profile not found: " + empId));

        String token = jwtUtils.generateTokenForEmployee(empId, account.getRole().name());

        return new AuthResponse(token, empId, employee.getFullName(), account.getRole().name());
    }
}
