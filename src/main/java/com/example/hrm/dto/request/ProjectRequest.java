package com.example.hrm.dto.request;

import com.example.hrm.entity.ProjectStatus;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import io.swagger.v3.oas.annotations.media.Schema;

@Data
@Schema(description = "Request tạo/cập nhật Dự án")
public class ProjectRequest {
    @NotBlank(message = "Project ID is required")
    @Schema(description = "Mã dự án", example = "PRJ001")
    private String projectId;

    @NotBlank(message = "Project name is required")
    @Schema(description = "Tên dự án", example = "Dự án CRM")
    private String name;

    @Schema(description = "Mô tả dự án", example = "Phát triển hệ thống CRM nội bộ")
    private String description;

    @NotNull(message = "Project status is required")
    @Schema(description = "Trạng thái dự án", example = "ACTIVE")
    private ProjectStatus status;
}
