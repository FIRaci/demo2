package com.example.hrm.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Wrapper phản hồi chuẩn của API")
public class ApiResponse<T> {

    @Schema(description = "Trạng thái thành công hay thất bại", example = "true")
    private boolean success;

    @Schema(description = "Thông điệp phản hồi", example = "Operation successful")
    private String message;

    @Schema(description = "Dữ liệu trả về")
    private T data;

    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(true, "Operation successful", data);
    }

    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(true, message, data);
    }

    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(false, message, null);
    }
}
