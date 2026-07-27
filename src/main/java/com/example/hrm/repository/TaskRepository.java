package com.example.hrm.repository;

import com.example.hrm.entity.Task;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
    Page<Task> findByAssignee_EmployeeId(String employeeId, Pageable pageable);
    
    Page<Task> findByProjectId(Long projectId, Pageable pageable);
    
    @Query("SELECT t FROM Task t WHERE t.project.id = :projectId AND (LOWER(t.title) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(t.description) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    Page<Task> searchTasksByProjectId(@Param("projectId") Long projectId, @Param("keyword") String keyword, Pageable pageable);
    
    @Query("SELECT t FROM Task t WHERE LOWER(t.title) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(t.description) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<Task> searchTasks(@Param("keyword") String keyword, Pageable pageable);
    
    @Query("SELECT t FROM Task t WHERE t.assignee.employeeId = :employeeId AND (LOWER(t.title) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(t.description) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    Page<Task> searchTasksByAssignee(@Param("employeeId") String employeeId, @Param("keyword") String keyword, Pageable pageable);

    java.util.Optional<Task> findByTaskId(String taskId);
    boolean existsByTaskId(String taskId);
}
