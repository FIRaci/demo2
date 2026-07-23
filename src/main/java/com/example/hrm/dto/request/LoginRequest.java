package com.example.hrm.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Request đăng nhập hệ thống")
public class LoginRequest {

    @NotBlank(message = "Employee ID is required")
    @Schema(description = "Mã nhân viên (VD: ADMIN001 hoặc EMP001)", example = "ADMIN001", requiredMode = Schema.RequiredMode.REQUIRED)
    private String employeeId;

    @NotBlank(message = "Password is required")
    @Schema(description = "Mật khẩu đăng nhập", example = "admin123", requiredMode = Schema.RequiredMode.REQUIRED)
    private String password;
}
