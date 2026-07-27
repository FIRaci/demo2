package com.example.hrm.dto.response;

import com.example.hrm.entity.Task;
import com.example.hrm.entity.TaskStatus;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

import io.swagger.v3.oas.annotations.media.Schema;

@Data
@Builder
@Schema(description = "Phản hồi thông tin Công việc (Task)")
public class TaskResponse {
    @Schema(description = "ID công việc", example = "1")
    private Long id;
    @Schema(description = "Mã công việc", example = "TSK001")
    private String taskId;
    @Schema(description = "Tiêu đề công việc", example = "Thiết kế API")
    private String title;
    @Schema(description = "Mô tả công việc", example = "Tạo các RESTful endpoint cho chức năng X")
    private String description;
    @Schema(description = "Hạn chót", example = "2026-12-31")
    private LocalDate deadline;
    @Schema(description = "Trạng thái", example = "TODO")
    private TaskStatus status;
    @Schema(description = "Thông tin dự án liên quan")
    private ProjectResponse project;
    @Schema(description = "Thông tin người được giao")
    private EmployeeResponse assignee;

    public static TaskResponse fromEntity(Task task) {
        return TaskResponse.builder()
                .id(task.getId())
                .taskId(task.getTaskId())
                .title(task.getTitle())
                .description(task.getDescription())
                .deadline(task.getDeadline())
                .status(task.getStatus())
                .project(task.getProject() != null ? ProjectResponse.fromEntity(task.getProject()) : null)
                .assignee(task.getAssignee() != null ? EmployeeResponse.fromEntity(task.getAssignee(), true) : null)
                .build();
    }
}
