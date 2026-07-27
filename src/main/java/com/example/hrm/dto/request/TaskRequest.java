package com.example.hrm.dto.request;

import com.example.hrm.entity.TaskStatus;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDate;

import io.swagger.v3.oas.annotations.media.Schema;

@Data
@Schema(description = "Request tạo/cập nhật Công việc (Task)")
public class TaskRequest {
    @NotBlank(message = "Task ID is required")
    @Schema(description = "Mã công việc", example = "TSK001")
    private String taskId;

    @NotBlank(message = "Task title is required")
    @Schema(description = "Tiêu đề công việc", example = "Thiết kế API")
    private String title;

    @Schema(description = "Mô tả công việc", example = "Tạo các RESTful endpoint cho chức năng X")
    private String description;

    @NotNull(message = "Deadline is required")
    @Schema(description = "Hạn chót", example = "2026-12-31")
    private LocalDate deadline;

    @NotNull(message = "Task status is required")
    @Schema(description = "Trạng thái", example = "TODO")
    private TaskStatus status;

    @NotBlank(message = "Project ID is required")
    @Schema(description = "Mã dự án (String)", example = "PRJ001")
    private String projectId;

    @NotBlank(message = "Assignee ID is required")
    @Schema(description = "ID nhân viên được giao", example = "EMP001")
    private String assigneeId;
}
