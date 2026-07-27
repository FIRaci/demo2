package com.example.hrm.controller;

import com.example.hrm.dto.request.EmployeeRequest;
import com.example.hrm.dto.response.ApiResponse;
import com.example.hrm.dto.response.EmployeeResponse;
import com.example.hrm.entity.EmployeeType;
import com.example.hrm.security.CustomUserDetails;
import com.example.hrm.service.EmployeeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;



@RestController
@RequestMapping("/api/employees")
@CrossOrigin(origins = "*")
@Tag(name = "Employee Management", description = "Các API quản lý danh sách và hồ sơ Nhân viên")
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping
    @Operation(summary = "Lấy danh sách nhân viên", description = "Tìm kiếm và lọc danh sách nhân viên theo tên hoặc loại hình làm việc (FULL_TIME, PART_TIME)")
    public ResponseEntity<ApiResponse<com.example.hrm.dto.response.PageResponse<EmployeeResponse>>> getAllEmployees(
            @Parameter(description = "Tên nhân viên cần tìm kiếm (VD: Thảo, Bách)", example = "Thảo") @RequestParam(required = false) String name,
            @Parameter(description = "Loại hình làm việc (FULL_TIME, PART_TIME)", example = "FULL_TIME") @RequestParam(required = false) EmployeeType employeeType,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @Parameter(hidden = true) @AuthenticationPrincipal CustomUserDetails userDetails) {

        boolean isAdmin = userDetails.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

        org.springframework.data.domain.Pageable pageable = org.springframework.data.domain.PageRequest.of(page, size);
        com.example.hrm.dto.response.PageResponse<EmployeeResponse> list = employeeService.getAllEmployees(name, employeeType, userDetails.getEmployeeId(), isAdmin, pageable);
        return ResponseEntity.ok(ApiResponse.success(list));
    }

    @GetMapping("/me")
    @Operation(summary = "Lấy thông tin cá nhân", description = "Lấy hồ sơ nhân viên của người dùng đang đăng nhập dựa vào JWT Token")
    public ResponseEntity<ApiResponse<EmployeeResponse>> getMyProfile(
            @Parameter(hidden = true) @AuthenticationPrincipal CustomUserDetails userDetails) {
        boolean isAdmin = userDetails.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));
        EmployeeResponse profile = employeeService.getEmployeeById(userDetails.getEmployeeId(), userDetails.getEmployeeId(), isAdmin);
        return ResponseEntity.ok(ApiResponse.success(profile));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Lấy chi tiết nhân viên theo ID", description = "Xem thông tin chi tiết của nhân viên theo mã nhân viên (VD: EMP001, ADMIN001)")
    public ResponseEntity<ApiResponse<EmployeeResponse>> getEmployeeById(
            @Parameter(description = "Mã nhân viên", example = "EMP001") @PathVariable("id") String id,
            @Parameter(hidden = true) @AuthenticationPrincipal CustomUserDetails userDetails) {

        boolean isAdmin = userDetails.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));
        EmployeeResponse employee = employeeService.getEmployeeById(id, userDetails.getEmployeeId(), isAdmin);
        return ResponseEntity.ok(ApiResponse.success(employee));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @Operation(summary = "Tạo mới nhân viên (ADMIN)", description = "Thêm một nhân viên mới vào hệ thống. Yêu cầu quyền ROLE_ADMIN.")
    public ResponseEntity<ApiResponse<EmployeeResponse>> createEmployee(@Valid @RequestBody EmployeeRequest request) {
        EmployeeResponse created = employeeService.createEmployee(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Employee created successfully", created));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @Operation(summary = "Cập nhật thông tin nhân viên (ADMIN)", description = "Chỉnh sửa thông tin nhân viên theo ID. Yêu cầu quyền ROLE_ADMIN.")
    public ResponseEntity<ApiResponse<EmployeeResponse>> updateEmployee(
            @Parameter(description = "Mã nhân viên", example = "EMP001") @PathVariable("id") String id,
            @Valid @RequestBody EmployeeRequest request) {
        EmployeeResponse updated = employeeService.updateEmployee(id, request);
        return ResponseEntity.ok(ApiResponse.success("Employee updated successfully", updated));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @Operation(summary = "Xóa nhân viên (ADMIN)", description = "Xóa nhân viên khỏi hệ thống theo ID. Yêu cầu quyền ROLE_ADMIN.")
    public ResponseEntity<ApiResponse<Void>> deleteEmployee(
            @Parameter(description = "Mã nhân viên", example = "EMP001") @PathVariable("id") String id) {
        employeeService.deleteEmployee(id);
        return ResponseEntity.ok(ApiResponse.success("Employee deleted successfully", null));
    }
}
