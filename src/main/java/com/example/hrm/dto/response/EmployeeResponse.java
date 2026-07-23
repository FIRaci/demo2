package com.example.hrm.dto.response;

import com.example.hrm.entity.Employee;
import com.example.hrm.entity.EmployeeType;
import com.example.hrm.entity.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Thông tin phản hồi hồ sơ Nhân viên")
public class EmployeeResponse {

    @Schema(description = "Mã nhân viên", example = "EMP001")
    private String employeeId;

    @Schema(description = "Họ và tên", example = "Nguyễn Thị Phương Thảo")
    private String fullName;

    @Schema(description = "Ngày sinh", example = "1995-05-20")
    private LocalDate dateOfBirth;

    @Schema(description = "Tuổi (tính toán tự động từ ngày sinh)", example = "31")
    private Integer age;

    @Schema(description = "Giới tính (MALE, FEMALE, OTHER)", example = "FEMALE")
    private Gender gender;

    @Schema(description = "Email công ty", example = "thao.ntp@company.com")
    private String email;

    @Schema(description = "Số điện thoại", example = "+84-912-345-678")
    private String phone;

    @Schema(description = "Địa chỉ thường trú", example = "456 Đường Lê Lợi, Quận 1, TP.HCM")
    private String address;

    @Schema(description = "Loại hình làm việc (FULL_TIME, PART_TIME)", example = "FULL_TIME")
    private EmployeeType employeeType;

    @Schema(description = "Phòng ban công tác", example = "Phòng Kỹ thuật")
    private String department;

    @Schema(description = "Chức danh / Vị trí", example = "Kỹ sư Phần mềm")
    private String position;

    @Schema(description = "Mức lương (VND) - Chỉ hiển thị cho ROLE_ADMIN hoặc chính bản thân nhân viên", example = "35000000.00")
    private BigDecimal salary;

    @Schema(description = "Tên ngân hàng thụ hưởng", example = "Techcombank")
    private String bankName;

    @Schema(description = "Số tài khoản ngân hàng", example = "190123456789")
    private String accountNumber;

    public static EmployeeResponse fromEntity(Employee entity, boolean includeSalary) {
        return EmployeeResponse.builder()
                .employeeId(entity.getEmployeeId())
                .fullName(entity.getFullName())
                .dateOfBirth(entity.getDateOfBirth())
                .age(entity.getAge())
                .gender(entity.getGender())
                .email(entity.getEmail())
                .phone(entity.getPhone())
                .address(entity.getAddress())
                .employeeType(entity.getEmployeeType())
                .department(entity.getDepartment())
                .position(entity.getPosition())
                .bankName(entity.getBankName())
                .accountNumber(entity.getAccountNumber())
                .salary(includeSalary ? entity.getSalary() : null)
                .build();
    }
}
