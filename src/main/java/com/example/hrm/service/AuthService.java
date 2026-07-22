package com.example.hrm.service;

import com.example.hrm.dto.request.LoginRequest;
import com.example.hrm.dto.request.RegisterRequest;
import com.example.hrm.dto.response.AuthResponse;

public interface AuthService {

    AuthResponse register(RegisterRequest registerRequest);

    AuthResponse login(LoginRequest loginRequest);
}
