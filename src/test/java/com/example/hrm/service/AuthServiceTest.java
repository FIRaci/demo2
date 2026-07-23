package com.example.hrm.service;

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
import com.example.hrm.security.CustomUserDetails;
import com.example.hrm.security.JwtUtils;
import com.example.hrm.service.impl.AuthServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

class AuthServiceTest {

    private UserAccountRepository userAccountRepository;
    private EmployeeRepository employeeRepository;
    private PasswordEncoder passwordEncoder;
    private JwtUtils jwtUtils;
    private AuthenticationManager authenticationManager;
    private AuthService authService;

    @BeforeEach
    void setUp() {
        userAccountRepository = Mockito.mock(UserAccountRepository.class);
        employeeRepository = Mockito.mock(EmployeeRepository.class);
        passwordEncoder = Mockito.mock(PasswordEncoder.class);
        jwtUtils = Mockito.mock(JwtUtils.class);
        authenticationManager = Mockito.mock(AuthenticationManager.class);

        authService = new AuthServiceImpl(
                userAccountRepository,
                employeeRepository,
                passwordEncoder,
                jwtUtils,
                authenticationManager
        );
    }

    @Test
    void testRegister_Success_ForExistingEmployee() {
        RegisterRequest request = new RegisterRequest("EMP002", "password123");
        Employee emp = new Employee("EMP002", "Sarah Connor", LocalDate.of(1998, 1, 1),
                Gender.FEMALE, "sarah@company.com", "123", "Addr", EmployeeType.PART_TIME,
                "Design", "UX", BigDecimal.valueOf(3000), "Bank", "67890");

        when(userAccountRepository.existsByEmployeeId("EMP002")).thenReturn(false);
        when(employeeRepository.findById("EMP002")).thenReturn(Optional.of(emp));
        when(passwordEncoder.encode("password123")).thenReturn("encodedPassword");
        when(jwtUtils.generateTokenForEmployee("EMP002", "ROLE_EMPLOYEE")).thenReturn("jwtToken");

        AuthResponse response = authService.register(request);

        assertNotNull(response);
        assertEquals("EMP002", response.getEmployeeId());
        assertEquals("ROLE_EMPLOYEE", response.getRole());
        assertEquals("jwtToken", response.getToken());
    }

    @Test
    void testRegister_Fails_IfEmployeeDoesNotExist() {
        RegisterRequest request = new RegisterRequest("UNKNOWN999", "password123");

        when(userAccountRepository.existsByEmployeeId("UNKNOWN999")).thenReturn(false);
        when(employeeRepository.findById("UNKNOWN999")).thenReturn(Optional.empty());

        assertThrows(ResourceNotFoundException.class, () -> authService.register(request));
    }

    @Test
    void testRegister_Fails_IfAccountAlreadyExists() {
        RegisterRequest request = new RegisterRequest("EMP001", "password123");

        when(userAccountRepository.existsByEmployeeId("EMP001")).thenReturn(true);

        assertThrows(DuplicateResourceException.class, () -> authService.register(request));
    }

    @Test
    void testLogin_Success_UsingAuthenticationManager() {
        LoginRequest request = new LoginRequest("EMP001", "user123");
        UserAccount account = new UserAccount("EMP001", "encodedPassword", Role.ROLE_EMPLOYEE);
        CustomUserDetails userDetails = new CustomUserDetails(account);
        Authentication authentication = Mockito.mock(Authentication.class);
        Employee emp = new Employee("EMP001", "Alex Johnson", LocalDate.of(1995, 1, 1),
                Gender.MALE, "alex@company.com", "123", "Addr", EmployeeType.FULL_TIME,
                "IT", "Dev", BigDecimal.valueOf(5000), "Bank", "12345");

        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(authentication);
        when(authentication.getPrincipal()).thenReturn(userDetails);
        when(employeeRepository.findById("EMP001")).thenReturn(Optional.of(emp));
        when(jwtUtils.generateToken(authentication)).thenReturn("jwtToken");

        AuthResponse response = authService.login(request);

        assertNotNull(response);
        assertEquals("EMP001", response.getEmployeeId());
        assertEquals("ROLE_EMPLOYEE", response.getRole());
        assertEquals("jwtToken", response.getToken());
    }

    @Test
    void testLogin_Fails_InvalidCredentials() {
        LoginRequest request = new LoginRequest("EMP001", "wrongpassword");

        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenThrow(new BadCredentialsException("Bad credentials"));

        assertThrows(UnauthorizedAccessException.class, () -> authService.login(request));
    }
}
