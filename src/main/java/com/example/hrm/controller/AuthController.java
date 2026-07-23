package com.example.hrm.controller;

import com.example.hrm.dto.request.LoginRequest;
import com.example.hrm.dto.request.RegisterRequest;
import com.example.hrm.dto.response.ApiResponse;
import com.example.hrm.dto.response.AuthResponse;
import com.example.hrm.service.AuthService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
@Tag(name = "Authentication", description = "Các API đăng nhập, đăng ký và đăng xuất")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/register")
    @Operation(summary = "Đăng ký tài khoản nhân viên", description = "Tạo tài khoản người dùng mới cho nhân viên dựa trên Employee ID")
    public ResponseEntity<ApiResponse<AuthResponse>> register(@Valid @RequestBody RegisterRequest request) {
        AuthResponse response = authService.register(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Registration successful", response));
    }

    @PostMapping("/login")
    @Operation(summary = "Đăng nhập hệ thống", description = "Đăng nhập bằng Employee ID và mật khẩu để nhận về JWT Access Token")
    public ResponseEntity<ApiResponse<AuthResponse>> login(@Valid @RequestBody LoginRequest request) {
        AuthResponse response = authService.login(request);
        return ResponseEntity.ok(ApiResponse.success("Login successful", response));
    }

    @PostMapping("/logout")
    @Operation(summary = "Đăng xuất hệ thống", description = "Thực hiện đăng xuất người dùng")
    public ResponseEntity<ApiResponse<String>> logout() {
        return ResponseEntity.ok(ApiResponse.success("Logout successful", "Logged out successfully"));
    }
}
