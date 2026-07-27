package com.example.hrm.service;

import com.example.hrm.dto.request.ProjectRequest;
import com.example.hrm.dto.response.ProjectResponse;
import org.springframework.data.domain.Pageable;
import com.example.hrm.dto.response.PageResponse;

public interface ProjectService {
    PageResponse<ProjectResponse> getAllProjects(String keyword, Pageable pageable);
    ProjectResponse getProjectById(Long id);
    ProjectResponse createProject(ProjectRequest request);
    ProjectResponse updateProject(Long id, ProjectRequest request);
    void deleteProject(Long id);
}
