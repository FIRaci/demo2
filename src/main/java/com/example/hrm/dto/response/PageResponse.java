package com.example.hrm.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.domain.Page;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Schema(description = "Wrapper phản hồi cho dữ liệu phân trang")
public class PageResponse<T> {

    @Schema(description = "Danh sách phần tử của trang hiện tại")
    private List<T> content;

    @Schema(description = "Tổng số trang", example = "10")
    private int totalPages;

    @Schema(description = "Tổng số phần tử trên toàn bộ dữ liệu", example = "100")
    private long totalElements;

    @Schema(description = "Kích thước mỗi trang", example = "10")
    private int size;

    @Schema(description = "Số thứ tự trang hiện tại (0-indexed)", example = "0")
    private int number;
    
    public static <T> PageResponse<T> of(Page<T> page) {
        return PageResponse.<T>builder()
                .content(page.getContent())
                .totalPages(page.getTotalPages())
                .totalElements(page.getTotalElements())
                .size(page.getSize())
                .number(page.getNumber())
                .build();
    }
}
