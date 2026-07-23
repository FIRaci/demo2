-- DBeaver Seed Data for HRM (Oracle Database)
-- Chú ý: Cần bấm Alt + X (Execute Script) để chạy toàn bộ file.

-- 1. Xóa dữ liệu cũ (Tùy chọn)
DELETE FROM user_accounts;
DELETE FROM employees;

-- 2. Insert dữ liệu Nhân viên (employees)
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'ADMIN001', 'Trần Văn Quản Trị', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'MALE', 'admin@company.com', '+84-901-234-567', 
    '123 Đường Nguyễn Huệ, Quận 1, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 75000000.00, 
    'Vietcombank', '0123456789'
);

INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP001', 'Nguyễn Thị Phương Thảo', TO_DATE('1995-05-20', 'YYYY-MM-DD'), 'FEMALE', 'thao.ntp@company.com', '+84-912-345-678', 
    '456 Đường Lê Lợi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 35000000.00, 
    'Techcombank', '190123456789'
);

INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP002', 'Lê Hoàng Bách', TO_DATE('1998-09-10', 'YYYY-MM-DD'), 'MALE', 'bach.lh@company.com', '+84-923-456-789', 
    '789 Đường Trần Hưng Đạo, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 25000000.00, 
    'MB Bank', '9876543210'
);

INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP003', 'Phạm Quỳnh Anh', TO_DATE('1992-03-15', 'YYYY-MM-DD'), 'FEMALE', 'anh.pq@company.com', '+84-934-567-890', 
    '321 Đường Võ Văn Tần, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 20000000.00, 
    'VietinBank', '1122334455'
);

INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP004', 'Đặng Thái Sơn', TO_DATE('1988-11-22', 'YYYY-MM-DD'), 'MALE', 'son.dt@company.com', '+84-945-678-901', 
    '654 Đường Phan Đăng Lưu, Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 45000000.00, 
    'ACB', '123123123'
);

-- 3. Insert dữ liệu Tài khoản (user_accounts)
-- Password mặc định: admin123 -> Hash BCrypt: $2a$10$c.RkQx.FvS19B6X5y8T1p.8w4W8b3mP2j6kK1L7Z2qH8A0R5G9J3C
INSERT INTO user_accounts (employee_id, password, role) 
VALUES ('ADMIN001', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_ADMIN');

INSERT INTO user_accounts (employee_id, password, role) 
VALUES ('EMP001', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');

INSERT INTO user_accounts (employee_id, password, role) 
VALUES ('EMP002', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');

INSERT INTO user_accounts (employee_id, password, role) 
VALUES ('EMP003', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');

INSERT INTO user_accounts (employee_id, password, role) 
VALUES ('EMP004', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');

COMMIT;
