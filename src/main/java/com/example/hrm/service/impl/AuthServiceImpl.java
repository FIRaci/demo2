package com.example.hrm.service.impl;

import com.example.hrm.dto.request.LoginRequest;
import com.example.hrm.dto.request.RegisterRequest;
import com.example.hrm.dto.response.AuthResponse;
import com.example.hrm.entity.Employee;
import com.example.hrm.entity.Role;
import com.example.hrm.entity.UserAccount;
import com.example.hrm.exception.DuplicateResourceException;
import com.example.hrm.exception.ResourceNotFoundException;
import com.example.hrm.exception.UnauthorizedAccessException;
import com.example.hrm.repository.EmployeeRepository;
import com.example.hrm.repository.UserAccountRepository;
import com.example.hrm.security.CustomUserDetails;
import com.example.hrm.security.JwtUtils;
import com.example.hrm.service.AuthService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthServiceImpl implements AuthService {

    private final UserAccountRepository userAccountRepository;
    private final EmployeeRepository employeeRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtils jwtUtils;
    private final AuthenticationManager authenticationManager;

    public AuthServiceImpl(UserAccountRepository userAccountRepository,
                           EmployeeRepository employeeRepository,
                           PasswordEncoder passwordEncoder,
                           JwtUtils jwtUtils,
                           AuthenticationManager authenticationManager) {
        this.userAccountRepository = userAccountRepository;
        this.employeeRepository = employeeRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtils = jwtUtils;
        this.authenticationManager = authenticationManager;
    }

    @Override
    @Transactional
    public AuthResponse register(RegisterRequest registerRequest) {
        String empId = registerRequest.getEmployeeId().trim();

        if (userAccountRepository.existsByEmployeeId(empId)) {
            throw new DuplicateResourceException("Account already registered for Employee ID: " + empId);
        }

        Employee employee = employeeRepository.findById(empId)
                .orElseThrow(() -> new ResourceNotFoundException("Employee profile not found with ID: " + empId + ". Registration is only allowed for existing employees created by HR Admin."));

        Role assignedRole = Role.ROLE_EMPLOYEE;

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

        Authentication authentication;
        try {
            authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(empId, loginRequest.getPassword())
            );
        } catch (AuthenticationException e) {
            throw new UnauthorizedAccessException("Invalid credentials for Employee ID: " + empId);
        }

        SecurityContextHolder.getContext().setAuthentication(authentication);

        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        Employee employee = employeeRepository.findById(empId)
                .orElseThrow(() -> new ResourceNotFoundException("Employee profile not found: " + empId));

        String token = jwtUtils.generateToken(authentication);

        return new AuthResponse(token, empId, employee.getFullName(), userDetails.getRoleName());
    }
}
