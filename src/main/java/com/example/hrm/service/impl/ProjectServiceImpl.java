package com.example.hrm.service.impl;

import com.example.hrm.dto.request.ProjectRequest;
import com.example.hrm.dto.response.ProjectResponse;
import com.example.hrm.entity.Project;
import com.example.hrm.exception.ResourceNotFoundException;
import com.example.hrm.repository.ProjectRepository;
import com.example.hrm.service.ProjectService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Pageable;
import com.example.hrm.dto.response.PageResponse;

@Service
public class ProjectServiceImpl implements ProjectService {
    private final ProjectRepository projectRepository;

    public ProjectServiceImpl(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    @Override
    public PageResponse<ProjectResponse> getAllProjects(String keyword, Pageable pageable) {
        org.springframework.data.domain.Page<Project> projects;
        if (keyword != null && !keyword.trim().isEmpty()) {
            projects = projectRepository.searchProjects(keyword.trim(), pageable);
        } else {
            projects = projectRepository.findAll(pageable);
        }
        org.springframework.data.domain.Page<ProjectResponse> responsePage = projects.map(ProjectResponse::fromEntity);
        return PageResponse.of(responsePage);
    }

    @Override
    public ProjectResponse getProjectById(Long id) {
        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Project not found with id: " + id));
        return ProjectResponse.fromEntity(project);
    }

    @Override
    @Transactional
    public ProjectResponse createProject(ProjectRequest request) {
        if (projectRepository.existsByProjectId(request.getProjectId())) {
            throw new IllegalArgumentException("Project ID already exists: " + request.getProjectId());
        }
        Project project = Project.builder()
                .projectId(request.getProjectId())
                .name(request.getName())
                .description(request.getDescription())
                .status(request.getStatus())
                .build();
        return ProjectResponse.fromEntity(projectRepository.save(project));
    }

    @Override
    @Transactional
    public ProjectResponse updateProject(Long id, ProjectRequest request) {
        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Project not found with id: " + id));
        
        if (!project.getProjectId().equals(request.getProjectId()) && projectRepository.existsByProjectId(request.getProjectId())) {
            throw new IllegalArgumentException("Project ID already exists: " + request.getProjectId());
        }
        
        project.setProjectId(request.getProjectId());
        project.setName(request.getName());
        project.setDescription(request.getDescription());
        project.setStatus(request.getStatus());
        
        return ProjectResponse.fromEntity(projectRepository.save(project));
    }

    @Override
    @Transactional
    public void deleteProject(Long id) {
        if (!projectRepository.existsById(id)) {
            throw new ResourceNotFoundException("Project not found with id: " + id);
        }
        projectRepository.deleteById(id);
    }
}
