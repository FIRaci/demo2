package com.example.hrm.config;

import com.example.hrm.entity.*;
import com.example.hrm.repository.EmployeeRepository;
import com.example.hrm.repository.UserAccountRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDate;

@Component
public class DataInitializer implements CommandLineRunner {

    private final EmployeeRepository employeeRepository;
    private final UserAccountRepository userAccountRepository;
    private final PasswordEncoder passwordEncoder;

    public DataInitializer(EmployeeRepository employeeRepository,
                           UserAccountRepository userAccountRepository,
                           PasswordEncoder passwordEncoder) {
        this.employeeRepository = employeeRepository;
        this.userAccountRepository = userAccountRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) throws Exception {
        if (employeeRepository.count() == 0) {
            Employee adminEmp = new Employee(
                    "ADMIN001",
                    "System Administrator",
                    LocalDate.of(1990, 1, 15),
                    Gender.MALE,
                    "admin@company.com",
                    "+1-555-0100",
                    "100 Tech Blvd, Suite 400",
                    EmployeeType.FULL_TIME,
                    "IT & Operations",
                    "System Admin",
                    BigDecimal.valueOf(7500.00),
                    "Chase Bank",
                    "9876543210"
            );
            employeeRepository.save(adminEmp);

            Employee emp1 = new Employee(
                    "EMP001",
                    "Alex Johnson",
                    LocalDate.of(1995, 5, 20),
                    Gender.MALE,
                    "alex.j@company.com",
                    "+1-555-0101",
                    "42 Wallaby Way, Sydney",
                    EmployeeType.FULL_TIME,
                    "Engineering",
                    "Senior Software Engineer",
                    BigDecimal.valueOf(4500.00),
                    "Bank of America",
                    "1234567890"
            );
            employeeRepository.save(emp1);

            Employee emp2 = new Employee(
                    "EMP002",
                    "Sarah Connor",
                    LocalDate.of(1998, 9, 10),
                    Gender.FEMALE,
                    "sarah.c@company.com",
                    "+1-555-0102",
                    "88 Skynet Rd, Los Angeles",
                    EmployeeType.PART_TIME,
                    "Design",
                    "UI/UX Designer",
                    BigDecimal.valueOf(2200.00),
                    "Wells Fargo",
                    "5554443332"
            );
            employeeRepository.save(emp2);

            Employee emp3 = new Employee(
                    "EMP003",
                    "Michael Scott",
                    LocalDate.of(1982, 3, 15),
                    Gender.MALE,
                    "michael.s@company.com",
                    "+1-555-0103",
                    "1725 Slough Avenue, Scranton",
                    EmployeeType.FULL_TIME,
                    "Management",
                    "Regional Manager",
                    BigDecimal.valueOf(6000.00),
                    "Citibank",
                    "1122334455"
            );
            employeeRepository.save(emp3);
        }

        if (userAccountRepository.count() == 0) {
            UserAccount adminAccount = new UserAccount(
                    "ADMIN001",
                    passwordEncoder.encode("admin123"),
                    Role.ROLE_ADMIN
            );
            userAccountRepository.save(adminAccount);

            UserAccount empAccount = new UserAccount(
                    "EMP001",
                    passwordEncoder.encode("user123"),
                    Role.ROLE_EMPLOYEE
            );
            userAccountRepository.save(empAccount);
        }
    }
}
