package com.example.hrm.service;

import com.example.hrm.dto.request.TaskRequest;
import com.example.hrm.dto.request.TaskStatusUpdateRequest;
import com.example.hrm.dto.response.TaskResponse;
import org.springframework.data.domain.Pageable;
import com.example.hrm.dto.response.PageResponse;

public interface TaskService {
    PageResponse<TaskResponse> getAllTasks(String keyword, Long projectId, Pageable pageable);
    PageResponse<TaskResponse> getMyTasks(String employeeId, String keyword, Pageable pageable);
    TaskResponse getTaskById(Long id);
    TaskResponse createTask(TaskRequest request);
    TaskResponse updateTask(Long id, TaskRequest request);
    TaskResponse updateTaskStatus(Long id, TaskStatusUpdateRequest request, String employeeId, boolean isAdmin);
    void deleteTask(Long id);
}
