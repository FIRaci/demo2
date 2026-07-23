package com.example.hrm.dto.request;

import com.example.hrm.entity.EmployeeType;
import com.example.hrm.entity.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Request tạo/cập nhật thông tin nhân viên")
public class EmployeeRequest {

    @NotBlank(message = "Employee ID is required")
    @Schema(description = "Mã nhân viên", example = "EMP001", requiredMode = Schema.RequiredMode.REQUIRED)
    private String employeeId;

    @NotBlank(message = "Full name is required")
    @Schema(description = "Họ và tên nhân viên", example = "Nguyễn Thị Phương Thảo", requiredMode = Schema.RequiredMode.REQUIRED)
    private String fullName;

    @Schema(description = "Ngày sinh (định dạng YYYY-MM-DD)", example = "1995-05-20")
    private LocalDate dateOfBirth;

    @Schema(description = "Giới tính (MALE, FEMALE, OTHER)", example = "FEMALE")
    private Gender gender;

    @Email(message = "Email format is invalid")
    @Schema(description = "Địa chỉ email", example = "thao.ntp@company.com")
    private String email;

    @Schema(description = "Số điện thoại liên hệ", example = "+84-912-345-678")
    private String phone;

    @Schema(description = "Địa chỉ thường trú", example = "456 Đường Lê Lợi, Quận 1, TP.HCM")
    private String address;

    @NotNull(message = "Employee type is required")
    @Schema(description = "Loại hình làm việc (FULL_TIME, PART_TIME)", example = "FULL_TIME", requiredMode = Schema.RequiredMode.REQUIRED)
    private EmployeeType employeeType;

    @Schema(description = "Phòng ban công tác", example = "Phòng Kỹ thuật")
    private String department;

    @Schema(description = "Chức danh/Vị trí công việc", example = "Kỹ sư Phần mềm")
    private String position;

    @PositiveOrZero(message = "Salary must be greater than or equal to 0")
    @Schema(description = "Mức lương hàng tháng (VND)", example = "35000000.00")
    private BigDecimal salary;

    @Schema(description = "Tên ngân hàng thụ hưởng", example = "Techcombank")
    private String bankName;

    @Schema(description = "Số tài khoản ngân hàng", example = "190123456789")
    private String accountNumber;
}
