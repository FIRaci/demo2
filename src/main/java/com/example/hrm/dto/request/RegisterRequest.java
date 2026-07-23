package com.example.hrm.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Request đăng ký tài khoản người dùng")
public class RegisterRequest {

    @NotBlank(message = "Employee ID is required")
    @Schema(description = "Mã nhân viên (phải tồn tại trong bảng employees)", example = "EMP001", requiredMode = Schema.RequiredMode.REQUIRED)
    private String employeeId;

    @NotBlank(message = "Password is required")
    @Size(min = 6, message = "Password must be at least 6 characters")
    @Schema(description = "Mật khẩu (tối thiểu 6 ký tự)", example = "admin123", requiredMode = Schema.RequiredMode.REQUIRED)
    private String password;
}
