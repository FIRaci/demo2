package com.example.hrm.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Phản hồi thông tin xác thực sau khi đăng nhập thành công")
public class AuthResponse {

    @Schema(description = "Mã xác thực JWT Access Token", example = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJBRE1JTjAwMSIs...)")
    private String token;

    @Builder.Default
    @Schema(description = "Loại Token", example = "Bearer")
    private String tokenType = "Bearer";

    @Schema(description = "Mã nhân viên đăng nhập", example = "ADMIN001")
    private String employeeId;

    @Schema(description = "Họ và tên nhân viên", example = "Trần Văn Quản Trị")
    private String fullName;

    @Schema(description = "Quyền hạn tài khoản (ROLE_ADMIN, ROLE_EMPLOYEE)", example = "ROLE_ADMIN")
    private String role;

    public AuthResponse(String token, String employeeId, String fullName, String role) {
        this.token = token;
        this.employeeId = employeeId;
        this.fullName = fullName;
        this.role = role;
    }
}
