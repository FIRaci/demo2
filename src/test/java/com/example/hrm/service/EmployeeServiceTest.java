package com.example.hrm.service;

import com.example.hrm.dto.response.EmployeeResponse;
import com.example.hrm.entity.Employee;
import com.example.hrm.entity.EmployeeType;
import com.example.hrm.entity.Gender;
import com.example.hrm.exception.UnauthorizedAccessException;
import com.example.hrm.repository.EmployeeRepository;
import com.example.hrm.service.impl.EmployeeServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

class EmployeeServiceTest {

    private EmployeeRepository employeeRepository;
    private EmployeeService employeeService;

    @BeforeEach
    void setUp() {
        employeeRepository = Mockito.mock(EmployeeRepository.class);
        employeeService = new EmployeeServiceImpl(employeeRepository);
    }

    @Test
    void testGetEmployeeById_AdminCanSeeSalary() {
        Employee emp = new Employee("EMP001", "Alex Johnson", LocalDate.of(1995, 1, 1),
                Gender.MALE, "alex@company.com", "123", "Addr", EmployeeType.FULL_TIME,
                "IT", "Dev", BigDecimal.valueOf(5000), "Bank", "12345");

        when(employeeRepository.findById("EMP001")).thenReturn(Optional.of(emp));

        EmployeeResponse response = employeeService.getEmployeeById("EMP001", "ADMIN001", true);

        assertNotNull(response);
        assertEquals("EMP001", response.getEmployeeId());
        assertEquals(BigDecimal.valueOf(5000), response.getSalary());
    }

    @Test
    void testGetEmployeeById_EmployeeCanSeeOwnSalary() {
        Employee emp = new Employee("EMP001", "Alex Johnson", LocalDate.of(1995, 1, 1),
                Gender.MALE, "alex@company.com", "123", "Addr", EmployeeType.FULL_TIME,
                "IT", "Dev", BigDecimal.valueOf(5000), "Bank", "12345");

        when(employeeRepository.findById("EMP001")).thenReturn(Optional.of(emp));

        EmployeeResponse response = employeeService.getEmployeeById("EMP001", "EMP001", false);

        assertNotNull(response);
        assertEquals(BigDecimal.valueOf(5000), response.getSalary());
    }

    @Test
    void testGetEmployeeById_EmployeeCannotSeeOtherEmployee() {
        Employee emp = new Employee("EMP002", "Sarah Connor", LocalDate.of(1998, 1, 1),
                Gender.FEMALE, "sarah@company.com", "123", "Addr", EmployeeType.PART_TIME,
                "Design", "UX", BigDecimal.valueOf(3000), "Bank", "67890");

        when(employeeRepository.findById("EMP002")).thenReturn(Optional.of(emp));

        assertThrows(UnauthorizedAccessException.class, () -> {
            employeeService.getEmployeeById("EMP002", "EMP001", false);
        });
    }
}
