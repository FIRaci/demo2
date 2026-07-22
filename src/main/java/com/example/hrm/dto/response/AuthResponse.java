package com.example.hrm.dto.response;

public class AuthResponse {

    private String token;
    private String tokenType = "Bearer";
    private String employeeId;
    private String fullName;
    private String role;

    public AuthResponse() {
    }

    public AuthResponse(String token, String employeeId, String fullName, String role) {
        this.token = token;
        this.employeeId = employeeId;
        this.fullName = fullName;
        this.role = role;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getTokenType() {
        return tokenType;
    }

    public void setTokenType(String tokenType) {
        this.tokenType = tokenType;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
