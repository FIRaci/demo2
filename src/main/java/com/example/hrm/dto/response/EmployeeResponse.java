package com.example.hrm.dto.response;

import com.example.hrm.entity.Employee;
import com.example.hrm.entity.EmployeeType;
import com.example.hrm.entity.Gender;

import java.math.BigDecimal;
import java.time.LocalDate;

public class EmployeeResponse {

    private String employeeId;
    private String fullName;
    private LocalDate dateOfBirth;
    private Integer age;
    private Gender gender;
    private String email;
    private String phone;
    private String address;
    private EmployeeType employeeType;
    private String department;
    private String position;
    private BigDecimal salary;
    private String bankName;
    private String accountNumber;

    public EmployeeResponse() {
    }

    public static EmployeeResponse fromEntity(Employee entity, boolean includeSalary) {
        EmployeeResponse response = new EmployeeResponse();
        response.setEmployeeId(entity.getEmployeeId());
        response.setFullName(entity.getFullName());
        response.setDateOfBirth(entity.getDateOfBirth());
        response.setAge(entity.getAge());
        response.setGender(entity.getGender());
        response.setEmail(entity.getEmail());
        response.setPhone(entity.getPhone());
        response.setAddress(entity.getAddress());
        response.setEmployeeType(entity.getEmployeeType());
        response.setDepartment(entity.getDepartment());
        response.setPosition(entity.getPosition());
        response.setBankName(entity.getBankName());
        response.setAccountNumber(entity.getAccountNumber());

        if (includeSalary) {
            response.setSalary(entity.getSalary());
        } else {
            response.setSalary(null);
        }

        return response;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public EmployeeType getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(EmployeeType employeeType) {
        this.employeeType = employeeType;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public BigDecimal getSalary() {
        return salary;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
}
