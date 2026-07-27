package com.example.hrm.dto.response;

import com.example.hrm.entity.Project;
import com.example.hrm.entity.ProjectStatus;
import lombok.Builder;
import lombok.Data;

import io.swagger.v3.oas.annotations.media.Schema;

@Data
@Builder
@Schema(description = "Phản hồi thông tin Dự án")
public class ProjectResponse {
    @Schema(description = "ID dự án", example = "1")
    private Long id;
    @Schema(description = "Mã dự án", example = "PRJ001")
    private String projectId;
    @Schema(description = "Tên dự án", example = "Dự án CRM")
    private String name;
    @Schema(description = "Mô tả dự án", example = "Phát triển hệ thống CRM nội bộ")
    private String description;
    @Schema(description = "Trạng thái dự án", example = "ACTIVE")
    private ProjectStatus status;

    public static ProjectResponse fromEntity(Project project) {
        return ProjectResponse.builder()
                .id(project.getId())
                .projectId(project.getProjectId())
                .name(project.getName())
                .description(project.getDescription())
                .status(project.getStatus())
                .build();
    }
}
