package com.example.hrm.controller;

import com.example.hrm.dto.request.TaskRequest;
import com.example.hrm.dto.request.TaskStatusUpdateRequest;
import com.example.hrm.dto.response.ApiResponse;
import com.example.hrm.dto.response.TaskResponse;
import com.example.hrm.security.CustomUserDetails;
import com.example.hrm.service.TaskService;
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
@RequestMapping("/api/tasks")
@CrossOrigin(origins = "*")
@Tag(name = "Task Management", description = "Các API quản lý Công việc")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping
    @Operation(summary = "Lấy danh sách Task", description = "Lấy danh sách task (Admin thấy hết, Nhân viên chỉ thấy task của mình)")
    public ResponseEntity<ApiResponse<com.example.hrm.dto.response.PageResponse<TaskResponse>>> getAllTasks(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String assigneeId,
            @RequestParam(required = false) Long projectId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDir,
            @Parameter(hidden = true) @AuthenticationPrincipal CustomUserDetails userDetails) {
            
        boolean isAdmin = userDetails.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));
                
        org.springframework.data.domain.Sort sort = sortDir.equalsIgnoreCase(org.springframework.data.domain.Sort.Direction.ASC.name()) ? org.springframework.data.domain.Sort.by(sortBy).ascending() : org.springframework.data.domain.Sort.by(sortBy).descending();
        org.springframework.data.domain.Pageable pageable = org.springframework.data.domain.PageRequest.of(page, size, sort);
        
        com.example.hrm.dto.response.PageResponse<TaskResponse> response;
        if (isAdmin) {
            if (assigneeId != null && !assigneeId.isEmpty()) {
                response = taskService.getMyTasks(assigneeId, keyword, pageable);
            } else {
                response = taskService.getAllTasks(keyword, projectId, pageable);
            }
        } else {
            response = taskService.getMyTasks(userDetails.getEmployeeId(), keyword, pageable);
        }
        
        return ResponseEntity.ok(ApiResponse.success(response));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Xem chi tiết Task")
    public ResponseEntity<ApiResponse<TaskResponse>> getTaskById(@PathVariable Long id) {
        return ResponseEntity.ok(ApiResponse.success(taskService.getTaskById(id)));
    }

    @PostMapping
    @Operation(summary = "Tạo mới Task (ADMIN/EMPLOYEE)")
    public ResponseEntity<ApiResponse<TaskResponse>> createTask(@Valid @RequestBody TaskRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Task created successfully", taskService.createTask(request)));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Cập nhật Task (ADMIN/EMPLOYEE)")
    public ResponseEntity<ApiResponse<TaskResponse>> updateTask(
            @PathVariable Long id, @Valid @RequestBody TaskRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Task updated successfully", taskService.updateTask(id, request)));
    }

    @PatchMapping("/{id}/status")
    @Operation(summary = "Cập nhật trạng thái Task", description = "Nhân viên cập nhật trạng thái Task của chính mình (TODO, IN_PROGRESS, DONE)")
    public ResponseEntity<ApiResponse<TaskResponse>> updateTaskStatus(
            @PathVariable Long id, 
            @Valid @RequestBody TaskStatusUpdateRequest request,
            @Parameter(hidden = true) @AuthenticationPrincipal CustomUserDetails userDetails) {
        
        boolean isAdmin = userDetails.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));
                
        return ResponseEntity.ok(ApiResponse.success("Task status updated successfully", 
                taskService.updateTaskStatus(id, request, userDetails.getEmployeeId(), isAdmin)));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Xóa Task (ADMIN/EMPLOYEE)")
    public ResponseEntity<ApiResponse<Void>> deleteTask(@PathVariable Long id) {
        taskService.deleteTask(id);
        return ResponseEntity.ok(ApiResponse.success("Task deleted successfully", null));
    }
}
