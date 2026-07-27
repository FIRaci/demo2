package com.example.hrm.dto.request;

import com.example.hrm.entity.TaskStatus;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import io.swagger.v3.oas.annotations.media.Schema;

@Data
@Schema(description = "Request cập nhật trạng thái công việc (dành cho nhân viên)")
public class TaskStatusUpdateRequest {
    @NotNull(message = "Task status is required")
    @Schema(description = "Trạng thái mới", example = "IN_PROGRESS")
    private TaskStatus status;
}
