package com.example.hrm.service.impl;

import com.example.hrm.dto.request.TaskRequest;
import com.example.hrm.dto.request.TaskStatusUpdateRequest;
import com.example.hrm.dto.response.TaskResponse;
import com.example.hrm.entity.Employee;
import com.example.hrm.entity.Project;
import com.example.hrm.entity.Task;
import com.example.hrm.exception.ResourceNotFoundException;
import com.example.hrm.exception.UnauthorizedAccessException;
import com.example.hrm.repository.EmployeeRepository;
import com.example.hrm.repository.ProjectRepository;
import com.example.hrm.repository.TaskRepository;
import com.example.hrm.service.TaskService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Pageable;
import com.example.hrm.dto.response.PageResponse;

@Service
public class TaskServiceImpl implements TaskService {
    private final TaskRepository taskRepository;
    private final ProjectRepository projectRepository;
    private final EmployeeRepository employeeRepository;

    public TaskServiceImpl(TaskRepository taskRepository, ProjectRepository projectRepository, EmployeeRepository employeeRepository) {
        this.taskRepository = taskRepository;
        this.projectRepository = projectRepository;
        this.employeeRepository = employeeRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public PageResponse<TaskResponse> getAllTasks(String keyword, Long projectId, Pageable pageable) {
        org.springframework.data.domain.Page<Task> tasks;
        if (projectId != null) {
            if (keyword != null && !keyword.trim().isEmpty()) {
                tasks = taskRepository.searchTasksByProjectId(projectId, keyword.trim(), pageable);
            } else {
                tasks = taskRepository.findByProjectId(projectId, pageable);
            }
        } else {
            if (keyword != null && !keyword.trim().isEmpty()) {
                tasks = taskRepository.searchTasks(keyword.trim(), pageable);
            } else {
                tasks = taskRepository.findAll(pageable);
            }
        }
        org.springframework.data.domain.Page<TaskResponse> responsePage = tasks.map(TaskResponse::fromEntity);
        return PageResponse.of(responsePage);
    }

    @Override
    @Transactional(readOnly = true)
    public PageResponse<TaskResponse> getMyTasks(String employeeId, String keyword, Pageable pageable) {
        org.springframework.data.domain.Page<Task> tasks;
        if (keyword != null && !keyword.trim().isEmpty()) {
            tasks = taskRepository.searchTasksByAssignee(employeeId, keyword.trim(), pageable);
        } else {
            tasks = taskRepository.findByAssignee_EmployeeId(employeeId, pageable);
        }
        org.springframework.data.domain.Page<TaskResponse> responsePage = tasks.map(TaskResponse::fromEntity);
        return PageResponse.of(responsePage);
    }

    @Override
    public TaskResponse getTaskById(Long id) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Task not found with id: " + id));
        return TaskResponse.fromEntity(task);
    }

    @Override
    @Transactional
    public TaskResponse createTask(TaskRequest request) {
        if (taskRepository.existsByTaskId(request.getTaskId())) {
            throw new IllegalArgumentException("Task ID already exists: " + request.getTaskId());
        }
        
        Project project = projectRepository.findByProjectId(request.getProjectId())
                .orElseThrow(() -> new ResourceNotFoundException("Project not found with code: " + request.getProjectId()));
        
        Employee assignee = employeeRepository.findById(request.getAssigneeId())
                .orElseThrow(() -> new ResourceNotFoundException("Employee not found with id: " + request.getAssigneeId()));

        Task task = Task.builder()
                .taskId(request.getTaskId())
                .title(request.getTitle())
                .description(request.getDescription())
                .deadline(request.getDeadline())
                .status(request.getStatus())
                .project(project)
                .assignee(assignee)
                .build();
                
        return TaskResponse.fromEntity(taskRepository.save(task));
    }

    @Override
    @Transactional
    public TaskResponse updateTask(Long id, TaskRequest request) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Task not found with id: " + id));
                
        if (!task.getTaskId().equals(request.getTaskId()) && taskRepository.existsByTaskId(request.getTaskId())) {
            throw new IllegalArgumentException("Task ID already exists: " + request.getTaskId());
        }
                
        Project project = projectRepository.findByProjectId(request.getProjectId())
                .orElseThrow(() -> new ResourceNotFoundException("Project not found with code: " + request.getProjectId()));
        
        Employee assignee = employeeRepository.findById(request.getAssigneeId())
                .orElseThrow(() -> new ResourceNotFoundException("Employee not found with id: " + request.getAssigneeId()));

        task.setTaskId(request.getTaskId());
        task.setTitle(request.getTitle());
        task.setDescription(request.getDescription());
        task.setDeadline(request.getDeadline());
        task.setStatus(request.getStatus());
        task.setProject(project);
        task.setAssignee(assignee);
        
        return TaskResponse.fromEntity(taskRepository.save(task));
    }

    @Override
    @Transactional
    public TaskResponse updateTaskStatus(Long id, TaskStatusUpdateRequest request, String employeeId, boolean isAdmin) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Task not found with id: " + id));
                
        if (!isAdmin && !task.getAssignee().getEmployeeId().equals(employeeId)) {
            throw new UnauthorizedAccessException("You are not allowed to update status of this task.");
        }
        
        task.setStatus(request.getStatus());
        return TaskResponse.fromEntity(taskRepository.save(task));
    }

    @Override
    @Transactional
    public void deleteTask(Long id) {
        if (!taskRepository.existsById(id)) {
            throw new ResourceNotFoundException("Task not found with id: " + id);
        }
        taskRepository.deleteById(id);
    }
}
