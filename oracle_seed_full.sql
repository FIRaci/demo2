-- ==========================================================================
-- DBeaver FULL Seed Data for HRM (Oracle Database)
-- Hướng dẫn: Mở file này trong DBeaver và nhấn Alt + X để thực thi toàn bộ script.
-- Đã sửa lỗi ORA-02290: Mọi ProjectStatus đều thuộc (ACTIVE, COMPLETED, ON_HOLD).
-- Đã dùng Subquery (SELECT id FROM projects WHERE project_code = ...) 100% không lỗi FK!
-- ==========================================================================

-- 1. Dọn dẹp dữ liệu cũ
DELETE FROM tasks;
DELETE FROM projects;
DELETE FROM user_accounts;
DELETE FROM employees;

-- 2. Insert Nhân viên (ADMIN001 + EMP001 -> EMP500)
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
    'EMP001', 'Trần Bích Nhung', TO_DATE('1980-06-04', 'YYYY-MM-DD'), 'FEMALE', 'emp001@company.com', '+84-983-252-808', 
    '186 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 28516250.40, 
    'BIDV', '7795886880'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP002', 'Dương Minh Quý', TO_DATE('1997-03-14', 'YYYY-MM-DD'), 'MALE', 'emp002@company.com', '+84-945-452-143', 
    '730 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 12429789.20, 
    'MB Bank', '3421620227'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP003', 'Dương Đức Dũng', TO_DATE('1981-02-04', 'YYYY-MM-DD'), 'MALE', 'emp003@company.com', '+84-991-941-770', 
    '639 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Điều phối viên', 48176886.21, 
    'MB Bank', '6035109826'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP004', 'Nô Phương Anh', TO_DATE('2000-11-08', 'YYYY-MM-DD'), 'FEMALE', 'emp004@company.com', '+84-929-996-206', 
    '157 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 15226635.77, 
    'VietinBank', '0999220002'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP005', 'Võ Gia Cường', TO_DATE('1979-06-27', 'YYYY-MM-DD'), 'MALE', 'emp005@company.com', '+84-991-248-313', 
    '112 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 37733834.64, 
    'BIDV', '0284121927'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP006', 'Lý Bảo Việt', TO_DATE('1985-12-10', 'YYYY-MM-DD'), 'MALE', 'emp006@company.com', '+84-978-401-975', 
    '212 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 37151659.91, 
    'TPBank', '8968386515'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP007', 'Phan Bảo Quý', TO_DATE('1988-03-07', 'YYYY-MM-DD'), 'MALE', 'emp007@company.com', '+84-930-255-141', 
    '450 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 47089980.90, 
    'Techcombank', '1011434068'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP008', 'Hoàng Quỳnh Hoa', TO_DATE('2003-10-22', 'YYYY-MM-DD'), 'FEMALE', 'emp008@company.com', '+84-929-488-790', 
    '173 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 47202660.00, 
    'Vietcombank', '0937880558'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP009', 'Đỗ Thị Anh', TO_DATE('1982-12-16', 'YYYY-MM-DD'), 'FEMALE', 'emp009@company.com', '+84-930-688-278', 
    '296 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Điều phối viên', 23365957.02, 
    'BIDV', '3770428390'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP010', 'Đặng Bích Duyên', TO_DATE('1991-10-24', 'YYYY-MM-DD'), 'FEMALE', 'emp010@company.com', '+84-930-336-886', 
    '983 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 45481501.13, 
    'Vietcombank', '3761597389'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP011', 'Trần Bích Hằng', TO_DATE('1975-08-28', 'YYYY-MM-DD'), 'FEMALE', 'emp011@company.com', '+84-946-814-458', 
    '621 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Điều phối viên', 33227025.99, 
    'Techcombank', '9919164548'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP012', 'Võ Thị Trang', TO_DATE('1994-07-18', 'YYYY-MM-DD'), 'FEMALE', 'emp012@company.com', '+84-912-454-398', 
    '224 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 21354575.87, 
    'Vietcombank', '8128810779'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP013', 'Phan Hữu Bách', TO_DATE('1996-06-16', 'YYYY-MM-DD'), 'MALE', 'emp013@company.com', '+84-934-903-801', 
    '906 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 43981010.25, 
    'TPBank', '8447982410'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP014', 'Phạm Ngọc Nhi', TO_DATE('1991-10-19', 'YYYY-MM-DD'), 'FEMALE', 'emp014@company.com', '+84-940-387-751', 
    '113 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 36195402.77, 
    'ACB', '0320699996'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP015', 'Bùi Ngọc Trung', TO_DATE('1996-12-15', 'YYYY-MM-DD'), 'MALE', 'emp015@company.com', '+84-980-253-813', 
    '896 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 49478641.24, 
    'TPBank', '7517338829'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP016', 'Phạm Thu Yến', TO_DATE('1999-07-17', 'YYYY-MM-DD'), 'FEMALE', 'emp016@company.com', '+84-918-386-254', 
    '808 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 25697615.35, 
    'VietinBank', '0123609402'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP017', 'Hồ Phương Hoa', TO_DATE('1982-10-24', 'YYYY-MM-DD'), 'FEMALE', 'emp017@company.com', '+84-936-606-528', 
    '448 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 19442591.51, 
    'BIDV', '4524366756'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP018', 'Nguyễn Thành Sơn', TO_DATE('1995-04-18', 'YYYY-MM-DD'), 'MALE', 'emp018@company.com', '+84-938-173-636', 
    '661 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 43634151.73, 
    'MB Bank', '2176513852'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP019', 'Lê Văn Tuấn', TO_DATE('1978-06-06', 'YYYY-MM-DD'), 'MALE', 'emp019@company.com', '+84-932-410-845', 
    '933 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Brand Manager', 31759740.83, 
    'Techcombank', '6986241443'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP020', 'Nô Thái Long', TO_DATE('1995-05-06', 'YYYY-MM-DD'), 'MALE', 'emp020@company.com', '+84-919-114-581', 
    '304 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 25925218.53, 
    'VietinBank', '8776010541'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP021', 'Trần Phương Anh', TO_DATE('1979-06-27', 'YYYY-MM-DD'), 'FEMALE', 'emp021@company.com', '+84-938-530-183', 
    '686 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 40303700.94, 
    'Vietcombank', '1112118622'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP022', 'Lê Xung Quý', TO_DATE('1976-03-11', 'YYYY-MM-DD'), 'MALE', 'emp022@company.com', '+84-986-454-602', 
    '592 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 49914497.92, 
    'VPBank', '1218964389'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP023', 'Lý Lan Thảo', TO_DATE('1999-11-05', 'YYYY-MM-DD'), 'FEMALE', 'emp023@company.com', '+84-997-769-424', 
    '919 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 42902132.52, 
    'ACB', '3440963097'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP024', 'Nguyễn Tuấn Việt', TO_DATE('1999-08-27', 'YYYY-MM-DD'), 'MALE', 'emp024@company.com', '+84-914-432-212', 
    '119 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 17759316.69, 
    'VietinBank', '1272430546'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP025', 'Bùi Quỳnh Anh', TO_DATE('1993-03-23', 'YYYY-MM-DD'), 'FEMALE', 'emp025@company.com', '+84-971-494-411', 
    '149 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 19922583.27, 
    'Vietcombank', '8398982356'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP026', 'Bùi Hữu Phong', TO_DATE('1976-08-17', 'YYYY-MM-DD'), 'MALE', 'emp026@company.com', '+84-952-682-701', 
    '169 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 45268921.97, 
    'VPBank', '6651502133'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP027', 'Hoàng Thu Chi', TO_DATE('1975-02-02', 'YYYY-MM-DD'), 'FEMALE', 'emp027@company.com', '+84-918-894-197', 
    '191 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 42228214.60, 
    'Vietcombank', '8544578434'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP028', 'Nguyễn Đức Dũng', TO_DATE('1975-07-24', 'YYYY-MM-DD'), 'MALE', 'emp028@company.com', '+84-971-661-234', 
    '375 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 36502030.82, 
    'Techcombank', '7812226773'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP029', 'Hồ Diệu Ly', TO_DATE('1994-08-27', 'YYYY-MM-DD'), 'FEMALE', 'emp029@company.com', '+84-960-841-324', 
    '719 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 24252389.58, 
    'BIDV', '3295853149'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP030', 'Huỳnh Minh Long', TO_DATE('1976-04-19', 'YYYY-MM-DD'), 'MALE', 'emp030@company.com', '+84-993-534-909', 
    '921 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 15745801.56, 
    'Vietcombank', '2554893888'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP031', 'Phạm Tuấn Phúc', TO_DATE('1989-04-07', 'YYYY-MM-DD'), 'MALE', 'emp031@company.com', '+84-931-320-506', 
    '588 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 16190216.76, 
    'BIDV', '6348128387'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP032', 'Bùi Công Dũng', TO_DATE('1981-11-16', 'YYYY-MM-DD'), 'MALE', 'emp032@company.com', '+84-993-644-765', 
    '583 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 17807557.42, 
    'VietinBank', '2766087148'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP033', 'Trần Thanh Hằng', TO_DATE('1991-05-15', 'YYYY-MM-DD'), 'FEMALE', 'emp033@company.com', '+84-958-477-470', 
    '5 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 20436152.02, 
    'Techcombank', '8714187105'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP034', 'Huỳnh Thái Bách', TO_DATE('1990-07-24', 'YYYY-MM-DD'), 'MALE', 'emp034@company.com', '+84-970-133-505', 
    '663 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 38861404.77, 
    'Techcombank', '9451594208'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP035', 'Phạm Gia Hiếu', TO_DATE('2003-03-15', 'YYYY-MM-DD'), 'MALE', 'emp035@company.com', '+84-933-269-360', 
    '93 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 37772050.89, 
    'TPBank', '9882020375'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP036', 'Phan Xung Phong', TO_DATE('2000-03-12', 'YYYY-MM-DD'), 'MALE', 'emp036@company.com', '+84-949-571-386', 
    '310 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Content Creator', 43671050.72, 
    'BIDV', '2777786349'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP037', 'Phan Quỳnh Nhi', TO_DATE('1980-05-12', 'YYYY-MM-DD'), 'FEMALE', 'emp037@company.com', '+84-955-309-238', 
    '692 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 33067796.21, 
    'Sacombank', '0344012961'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP038', 'Phan Hữu Phong', TO_DATE('1984-09-01', 'YYYY-MM-DD'), 'MALE', 'emp038@company.com', '+84-965-306-420', 
    '96 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 37801898.15, 
    'MB Bank', '8174201771'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP039', 'Nguyễn Ngọc Nam', TO_DATE('1998-02-20', 'YYYY-MM-DD'), 'MALE', 'emp039@company.com', '+84-920-723-806', 
    '619 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Content Creator', 18098037.89, 
    'BIDV', '6519508465'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP040', 'Lý Ngọc Trang', TO_DATE('1976-07-21', 'YYYY-MM-DD'), 'FEMALE', 'emp040@company.com', '+84-934-904-543', 
    '49 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 46185254.34, 
    'TPBank', '5581284571'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP041', 'Hồ Diệu Loan', TO_DATE('1975-12-19', 'YYYY-MM-DD'), 'FEMALE', 'emp041@company.com', '+84-945-153-759', 
    '184 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 29346989.88, 
    'MB Bank', '2001274720'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP042', 'Võ Văn Long', TO_DATE('1975-09-26', 'YYYY-MM-DD'), 'MALE', 'emp042@company.com', '+84-952-699-455', 
    '640 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 23783133.37, 
    'BIDV', '9728306130'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP043', 'Lý Hữu Phúc', TO_DATE('1981-09-09', 'YYYY-MM-DD'), 'MALE', 'emp043@company.com', '+84-983-753-595', 
    '604 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 31528759.52, 
    'BIDV', '2464038393'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP044', 'Trần Thành Quý', TO_DATE('1999-04-14', 'YYYY-MM-DD'), 'MALE', 'emp044@company.com', '+84-911-998-766', 
    '584 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 33302095.69, 
    'BIDV', '3497251618'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP045', 'Lý Hữu Tuấn', TO_DATE('1981-01-17', 'YYYY-MM-DD'), 'MALE', 'emp045@company.com', '+84-986-348-180', 
    '786 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 35454398.27, 
    'BIDV', '8382286728'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP046', 'Đỗ Thành Khánh', TO_DATE('1987-03-15', 'YYYY-MM-DD'), 'MALE', 'emp046@company.com', '+84-936-906-520', 
    '457 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 15889154.47, 
    'Vietcombank', '8929888432'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP047', 'Đặng Tuấn Tuấn', TO_DATE('1975-04-22', 'YYYY-MM-DD'), 'MALE', 'emp047@company.com', '+84-988-550-793', 
    '321 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 16984206.57, 
    'ACB', '4707831349'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP048', 'Võ Thành Sơn', TO_DATE('2002-09-06', 'YYYY-MM-DD'), 'MALE', 'emp048@company.com', '+84-928-987-151', 
    '737 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 17045130.15, 
    'MB Bank', '7004303602'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP049', 'Bùi Tuyết Ly', TO_DATE('1976-02-16', 'YYYY-MM-DD'), 'FEMALE', 'emp049@company.com', '+84-943-851-401', 
    '82 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 18223785.84, 
    'Sacombank', '1070665114'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP050', 'Vũ Thu Yến', TO_DATE('1990-04-06', 'YYYY-MM-DD'), 'FEMALE', 'emp050@company.com', '+84-995-612-411', 
    '832 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 41802384.27, 
    'Techcombank', '1252430244'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP051', 'Nguyễn Mai Trang', TO_DATE('2000-01-10', 'YYYY-MM-DD'), 'FEMALE', 'emp051@company.com', '+84-940-309-526', 
    '332 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 12407282.11, 
    'Techcombank', '1771237263'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP052', 'Võ Phương Trang', TO_DATE('2000-02-18', 'YYYY-MM-DD'), 'FEMALE', 'emp052@company.com', '+84-987-333-228', 
    '484 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 47665581.99, 
    'TPBank', '6017360979'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP053', 'Lý Trinh Hằng', TO_DATE('1984-09-04', 'YYYY-MM-DD'), 'FEMALE', 'emp053@company.com', '+84-923-693-212', 
    '565 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 15804583.21, 
    'VietinBank', '2936076655'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP054', 'Trần Anh Việt', TO_DATE('1978-05-08', 'YYYY-MM-DD'), 'MALE', 'emp054@company.com', '+84-992-199-406', 
    '420 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 19148962.60, 
    'TPBank', '4530764834'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP055', 'Phạm Thanh Duyên', TO_DATE('2002-08-21', 'YYYY-MM-DD'), 'FEMALE', 'emp055@company.com', '+84-946-634-293', 
    '493 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 37542011.22, 
    'ACB', '7606654373'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP056', 'Bùi Hoàng Bách', TO_DATE('1976-02-25', 'YYYY-MM-DD'), 'MALE', 'emp056@company.com', '+84-936-565-235', 
    '791 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 15111755.92, 
    'VietinBank', '6925107889'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP057', 'Nguyễn Tuấn Long', TO_DATE('1991-11-03', 'YYYY-MM-DD'), 'MALE', 'emp057@company.com', '+84-953-207-239', 
    '355 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 44823349.37, 
    'Vietcombank', '1777718184'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP058', 'Lý Quỳnh Anh', TO_DATE('2003-06-03', 'YYYY-MM-DD'), 'FEMALE', 'emp058@company.com', '+84-937-688-885', 
    '617 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 35895418.38, 
    'VPBank', '5691327491'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP059', 'Nô Thanh Nhung', TO_DATE('1988-07-04', 'YYYY-MM-DD'), 'FEMALE', 'emp059@company.com', '+84-916-664-194', 
    '255 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 23794930.14, 
    'VietinBank', '8898806538'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP060', 'Dương Thanh Nhi', TO_DATE('1978-05-09', 'YYYY-MM-DD'), 'FEMALE', 'emp060@company.com', '+84-944-604-697', 
    '471 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Digital Marketing', 36102829.76, 
    'BIDV', '0124970394'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP061', 'Vũ Đức Sơn', TO_DATE('1976-01-10', 'YYYY-MM-DD'), 'MALE', 'emp061@company.com', '+84-940-166-465', 
    '887 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 29947586.51, 
    'Sacombank', '6804115891'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP062', 'Võ Tuấn Dũng', TO_DATE('1978-04-16', 'YYYY-MM-DD'), 'MALE', 'emp062@company.com', '+84-995-490-139', 
    '131 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 46969980.92, 
    'BIDV', '9120888456'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP063', 'Võ Thu Anh', TO_DATE('1985-05-01', 'YYYY-MM-DD'), 'FEMALE', 'emp063@company.com', '+84-981-222-994', 
    '640 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 45706178.72, 
    'Sacombank', '9920673224'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP064', 'Bùi Minh Sơn', TO_DATE('1976-12-10', 'YYYY-MM-DD'), 'MALE', 'emp064@company.com', '+84-975-194-371', 
    '609 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Điều phối viên', 49655732.28, 
    'Techcombank', '1153077723'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP065', 'Vũ Ánh Duyên', TO_DATE('1996-08-19', 'YYYY-MM-DD'), 'FEMALE', 'emp065@company.com', '+84-932-337-944', 
    '531 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 36014434.15, 
    'TPBank', '0833718545'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP066', 'Phạm Tuấn Khánh', TO_DATE('1980-10-04', 'YYYY-MM-DD'), 'MALE', 'emp066@company.com', '+84-994-166-440', 
    '885 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 20801935.68, 
    'BIDV', '0037384489'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP067', 'Huỳnh Tuấn Khánh', TO_DATE('2001-01-16', 'YYYY-MM-DD'), 'MALE', 'emp067@company.com', '+84-944-718-727', 
    '177 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 18804231.50, 
    'ACB', '7437747055'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP068', 'Trần Hoàng Nam', TO_DATE('1993-10-07', 'YYYY-MM-DD'), 'MALE', 'emp068@company.com', '+84-954-903-103', 
    '313 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 45395220.69, 
    'TPBank', '4592042327'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP069', 'Nguyễn Thành Bách', TO_DATE('1977-07-21', 'YYYY-MM-DD'), 'MALE', 'emp069@company.com', '+84-956-751-272', 
    '297 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 35125772.82, 
    'Sacombank', '8561704971'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP070', 'Đỗ Anh Cường', TO_DATE('1979-06-20', 'YYYY-MM-DD'), 'MALE', 'emp070@company.com', '+84-988-791-906', 
    '981 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 43222279.47, 
    'BIDV', '2143781287'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP071', 'Hoàng Phương Duyên', TO_DATE('1986-07-07', 'YYYY-MM-DD'), 'FEMALE', 'emp071@company.com', '+84-912-379-365', 
    '705 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 46564671.90, 
    'VietinBank', '5236370973'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP072', 'Vũ Thị Vy', TO_DATE('2002-02-18', 'YYYY-MM-DD'), 'FEMALE', 'emp072@company.com', '+84-930-364-278', 
    '367 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 38247067.42, 
    'BIDV', '5697735317'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP073', 'Nô Ngọc Hiếu', TO_DATE('1985-01-06', 'YYYY-MM-DD'), 'MALE', 'emp073@company.com', '+84-911-997-756', 
    '338 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Motion Designer', 29108379.59, 
    'TPBank', '3589938764'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP074', 'Dương Lan Loan', TO_DATE('1982-03-08', 'YYYY-MM-DD'), 'FEMALE', 'emp074@company.com', '+84-962-118-602', 
    '674 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 47807092.64, 
    'ACB', '0699406635'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP075', 'Nguyễn Tuấn Sơn', TO_DATE('1983-02-09', 'YYYY-MM-DD'), 'MALE', 'emp075@company.com', '+84-944-213-824', 
    '553 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 42377590.35, 
    'VPBank', '6673687745'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP076', 'Bùi Thu Nhi', TO_DATE('1981-05-13', 'YYYY-MM-DD'), 'FEMALE', 'emp076@company.com', '+84-921-954-656', 
    '296 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 27743495.23, 
    'MB Bank', '6802023016'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP077', 'Bùi Tuyết Vy', TO_DATE('1975-12-07', 'YYYY-MM-DD'), 'FEMALE', 'emp077@company.com', '+84-950-724-112', 
    '865 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 36076335.91, 
    'MB Bank', '0282265452'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP078', 'Hoàng Ngọc Thảo', TO_DATE('1998-09-20', 'YYYY-MM-DD'), 'FEMALE', 'emp078@company.com', '+84-973-124-451', 
    '955 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 49528125.24, 
    'Techcombank', '4949291421'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP079', 'Phạm Minh Phúc', TO_DATE('1980-10-13', 'YYYY-MM-DD'), 'MALE', 'emp079@company.com', '+84-954-113-904', 
    '697 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 31374612.14, 
    'Vietcombank', '4023614501'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP080', 'Đặng Ngọc Việt', TO_DATE('1977-09-21', 'YYYY-MM-DD'), 'MALE', 'emp080@company.com', '+84-987-305-307', 
    '281 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 48158396.14, 
    'BIDV', '6632481676'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP081', 'Hoàng Anh Nam', TO_DATE('1998-02-05', 'YYYY-MM-DD'), 'MALE', 'emp081@company.com', '+84-919-895-599', 
    '961 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 20787136.58, 
    'ACB', '8022404069'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP082', 'Hồ Ngọc Tuấn', TO_DATE('1996-06-13', 'YYYY-MM-DD'), 'MALE', 'emp082@company.com', '+84-976-548-535', 
    '218 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 24290158.87, 
    'ACB', '6136197583'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP083', 'Nguyễn Kim Anh', TO_DATE('1979-07-21', 'YYYY-MM-DD'), 'FEMALE', 'emp083@company.com', '+84-986-471-299', 
    '793 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 36580092.46, 
    'VPBank', '3341781693'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP084', 'Phan Tuyết Thảo', TO_DATE('1993-10-14', 'YYYY-MM-DD'), 'FEMALE', 'emp084@company.com', '+84-967-661-357', 
    '518 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Account Executive', 48238562.31, 
    'TPBank', '8089522790'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP085', 'Lê Tuấn Quý', TO_DATE('1991-08-05', 'YYYY-MM-DD'), 'MALE', 'emp085@company.com', '+84-925-228-535', 
    '686 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 37000298.49, 
    'MB Bank', '6219814052'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP086', 'Đỗ Xung Sơn', TO_DATE('2003-01-04', 'YYYY-MM-DD'), 'MALE', 'emp086@company.com', '+84-985-948-364', 
    '278 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 19657197.63, 
    'BIDV', '5490464230'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP087', 'Dương Thái Trung', TO_DATE('1996-01-26', 'YYYY-MM-DD'), 'MALE', 'emp087@company.com', '+84-991-135-885', 
    '953 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 26183165.48, 
    'TPBank', '4375409170'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP088', 'Hoàng Xung Trung', TO_DATE('1975-08-26', 'YYYY-MM-DD'), 'MALE', 'emp088@company.com', '+84-967-138-955', 
    '900 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 17223620.83, 
    'VietinBank', '7442276787'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP089', 'Hoàng Phương Anh', TO_DATE('1991-10-07', 'YYYY-MM-DD'), 'FEMALE', 'emp089@company.com', '+84-950-254-537', 
    '871 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 45038709.89, 
    'TPBank', '6307279882'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP090', 'Huỳnh Thanh Hằng', TO_DATE('1983-06-21', 'YYYY-MM-DD'), 'FEMALE', 'emp090@company.com', '+84-960-501-480', 
    '803 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 25987797.57, 
    'VietinBank', '3378246466'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP091', 'Huỳnh Thu Anh', TO_DATE('1984-11-05', 'YYYY-MM-DD'), 'FEMALE', 'emp091@company.com', '+84-987-900-929', 
    '901 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 26729825.14, 
    'ACB', '7717072095'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP092', 'Đỗ Phương Hương', TO_DATE('2003-03-01', 'YYYY-MM-DD'), 'FEMALE', 'emp092@company.com', '+84-946-784-935', 
    '288 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 19462654.95, 
    'MB Bank', '0200535631'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP093', 'Trần Diệu Thảo', TO_DATE('1975-09-24', 'YYYY-MM-DD'), 'FEMALE', 'emp093@company.com', '+84-944-971-202', 
    '335 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 21337057.89, 
    'Sacombank', '1581242694'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP094', 'Hoàng Tuyết Loan', TO_DATE('1985-12-18', 'YYYY-MM-DD'), 'FEMALE', 'emp094@company.com', '+84-935-968-452', 
    '301 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 42767398.53, 
    'VPBank', '9244375732'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP095', 'Nguyễn Thu Nhi', TO_DATE('2000-03-22', 'YYYY-MM-DD'), 'FEMALE', 'emp095@company.com', '+84-941-154-919', 
    '31 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 29944676.37, 
    'ACB', '6877415660'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP096', 'Nô Bảo Hùng', TO_DATE('1996-01-02', 'YYYY-MM-DD'), 'MALE', 'emp096@company.com', '+84-982-374-536', 
    '883 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 24547333.34, 
    'ACB', '8464424615'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP097', 'Bùi Thái Việt', TO_DATE('1986-05-04', 'YYYY-MM-DD'), 'MALE', 'emp097@company.com', '+84-992-983-371', 
    '856 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 37907890.27, 
    'VPBank', '3231842172'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP098', 'Nguyễn Minh Long', TO_DATE('1997-02-23', 'YYYY-MM-DD'), 'MALE', 'emp098@company.com', '+84-961-350-458', 
    '771 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Account Executive', 37211489.52, 
    'ACB', '3942627959'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP099', 'Vũ Tuấn Dũng', TO_DATE('1978-02-26', 'YYYY-MM-DD'), 'MALE', 'emp099@company.com', '+84-984-520-454', 
    '601 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 32920196.52, 
    'MB Bank', '0257806438'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP100', 'Vũ Trinh Hoa', TO_DATE('2003-07-19', 'YYYY-MM-DD'), 'FEMALE', 'emp100@company.com', '+84-926-887-605', 
    '213 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 14917482.54, 
    'Vietcombank', '9706432591'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP101', 'Hoàng Kim Thảo', TO_DATE('2002-04-09', 'YYYY-MM-DD'), 'FEMALE', 'emp101@company.com', '+84-954-840-894', 
    '146 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 13254037.02, 
    'Sacombank', '1632254527'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP102', 'Trần Quỳnh Nhung', TO_DATE('2003-06-16', 'YYYY-MM-DD'), 'FEMALE', 'emp102@company.com', '+84-952-696-194', 
    '3 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 33689014.89, 
    'VietinBank', '8348657124'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP103', 'Đặng Thái Cường', TO_DATE('1977-05-09', 'YYYY-MM-DD'), 'MALE', 'emp103@company.com', '+84-973-877-755', 
    '14 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 15139981.04, 
    'ACB', '1877624614'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP104', 'Dương Xung Phúc', TO_DATE('1984-10-27', 'YYYY-MM-DD'), 'MALE', 'emp104@company.com', '+84-971-529-449', 
    '658 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 49151002.12, 
    'ACB', '7347535202'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP105', 'Huỳnh Anh Tuấn', TO_DATE('1995-05-17', 'YYYY-MM-DD'), 'MALE', 'emp105@company.com', '+84-997-235-599', 
    '640 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 18336581.93, 
    'ACB', '3416503584'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP106', 'Hồ Quang Khánh', TO_DATE('2003-12-11', 'YYYY-MM-DD'), 'MALE', 'emp106@company.com', '+84-977-190-329', 
    '356 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 18206728.90, 
    'Techcombank', '3045768686'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP107', 'Lý Xung Phúc', TO_DATE('1996-06-27', 'YYYY-MM-DD'), 'MALE', 'emp107@company.com', '+84-940-316-727', 
    '662 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 25913180.40, 
    'BIDV', '3948944083'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP108', 'Vũ Công Phúc', TO_DATE('1986-09-04', 'YYYY-MM-DD'), 'MALE', 'emp108@company.com', '+84-937-520-352', 
    '139 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 12960063.82, 
    'ACB', '6383044987'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP109', 'Võ Trinh Loan', TO_DATE('1988-11-15', 'YYYY-MM-DD'), 'FEMALE', 'emp109@company.com', '+84-962-641-499', 
    '901 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 16440545.89, 
    'VPBank', '0295244174'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP110', 'Hoàng Thị Vy', TO_DATE('1991-04-06', 'YYYY-MM-DD'), 'FEMALE', 'emp110@company.com', '+84-953-153-533', 
    '615 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 31735243.74, 
    'ACB', '9299617774'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP111', 'Nguyễn Ngọc Việt', TO_DATE('1998-08-21', 'YYYY-MM-DD'), 'MALE', 'emp111@company.com', '+84-963-352-949', 
    '488 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 47767579.14, 
    'BIDV', '9443656419'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP112', 'Đặng Phương Thảo', TO_DATE('1995-03-19', 'YYYY-MM-DD'), 'FEMALE', 'emp112@company.com', '+84-990-797-965', 
    '33 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 12183040.55, 
    'MB Bank', '5437778129'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP113', 'Đặng Ngọc Anh', TO_DATE('1986-01-09', 'YYYY-MM-DD'), 'FEMALE', 'emp113@company.com', '+84-978-652-943', 
    '454 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Account Executive', 31649259.67, 
    'Vietcombank', '0488159355'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP114', 'Đặng Văn Sơn', TO_DATE('1996-07-24', 'YYYY-MM-DD'), 'MALE', 'emp114@company.com', '+84-926-245-614', 
    '463 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 16843601.78, 
    'VPBank', '6294887529'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP115', 'Hoàng Quang Phong', TO_DATE('1985-11-21', 'YYYY-MM-DD'), 'MALE', 'emp115@company.com', '+84-969-863-999', 
    '55 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 36646998.92, 
    'VietinBank', '2616460528'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP116', 'Võ Công Bách', TO_DATE('1992-05-01', 'YYYY-MM-DD'), 'MALE', 'emp116@company.com', '+84-935-796-538', 
    '880 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Account Executive', 13400888.82, 
    'Sacombank', '0761211210'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP117', 'Trần Minh Quý', TO_DATE('1976-06-01', 'YYYY-MM-DD'), 'MALE', 'emp117@company.com', '+84-973-701-443', 
    '518 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 21818198.58, 
    'TPBank', '8119582622'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP118', 'Lê Anh Cường', TO_DATE('1992-09-18', 'YYYY-MM-DD'), 'MALE', 'emp118@company.com', '+84-986-308-934', 
    '513 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 47702868.57, 
    'VPBank', '4598297147'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP119', 'Phan Mai Anh', TO_DATE('1998-09-07', 'YYYY-MM-DD'), 'FEMALE', 'emp119@company.com', '+84-910-220-566', 
    '439 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 23076598.24, 
    'Techcombank', '7752972779'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP120', 'Lý Minh Sơn', TO_DATE('2000-12-28', 'YYYY-MM-DD'), 'MALE', 'emp120@company.com', '+84-967-961-821', 
    '86 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 23841169.72, 
    'ACB', '7825786861'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP121', 'Bùi Trinh Ly', TO_DATE('1986-08-14', 'YYYY-MM-DD'), 'FEMALE', 'emp121@company.com', '+84-931-974-863', 
    '749 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 48239622.66, 
    'Techcombank', '2957819189'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP122', 'Phạm Ngọc Cường', TO_DATE('1980-12-10', 'YYYY-MM-DD'), 'MALE', 'emp122@company.com', '+84-974-166-628', 
    '169 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 12629889.06, 
    'VietinBank', '5155073608'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP123', 'Nô Đức Dũng', TO_DATE('1998-05-09', 'YYYY-MM-DD'), 'MALE', 'emp123@company.com', '+84-947-140-538', 
    '428 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 19028485.55, 
    'Vietcombank', '5744421301'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP124', 'Trần Ngọc Bách', TO_DATE('1978-09-27', 'YYYY-MM-DD'), 'MALE', 'emp124@company.com', '+84-957-867-456', 
    '136 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 23485221.80, 
    'VPBank', '0303458448'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP125', 'Dương Hồng Thảo', TO_DATE('2003-10-28', 'YYYY-MM-DD'), 'FEMALE', 'emp125@company.com', '+84-957-456-496', 
    '977 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 25675320.18, 
    'MB Bank', '8924519614'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP126', 'Nguyễn Anh Hùng', TO_DATE('1975-12-05', 'YYYY-MM-DD'), 'MALE', 'emp126@company.com', '+84-988-742-987', 
    '832 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 42384818.38, 
    'TPBank', '7255574604'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP127', 'Vũ Diệu Loan', TO_DATE('1977-09-01', 'YYYY-MM-DD'), 'FEMALE', 'emp127@company.com', '+84-927-144-338', 
    '982 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 28949341.99, 
    'VPBank', '9338034820'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP128', 'Phan Đức Hiếu', TO_DATE('1983-03-25', 'YYYY-MM-DD'), 'MALE', 'emp128@company.com', '+84-950-439-439', 
    '471 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 27356915.84, 
    'MB Bank', '1417935486'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP129', 'Đặng Hoàng Cường', TO_DATE('2001-11-07', 'YYYY-MM-DD'), 'MALE', 'emp129@company.com', '+84-939-769-447', 
    '627 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 30649012.15, 
    'MB Bank', '5303916870'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP130', 'Hồ Anh Dũng', TO_DATE('1984-07-21', 'YYYY-MM-DD'), 'MALE', 'emp130@company.com', '+84-978-296-173', 
    '963 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 26614369.34, 
    'BIDV', '9893023692'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP131', 'Trần Thu Hương', TO_DATE('1993-10-03', 'YYYY-MM-DD'), 'FEMALE', 'emp131@company.com', '+84-978-911-680', 
    '318 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 26038077.04, 
    'Vietcombank', '9460992118'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP132', 'Bùi Hoàng Hùng', TO_DATE('1994-01-18', 'YYYY-MM-DD'), 'MALE', 'emp132@company.com', '+84-997-930-252', 
    '221 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 19431408.52, 
    'Vietcombank', '2146809657'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP133', 'Đặng Bích Yến', TO_DATE('1977-08-02', 'YYYY-MM-DD'), 'FEMALE', 'emp133@company.com', '+84-991-357-854', 
    '329 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 48675089.50, 
    'ACB', '3851969410'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP134', 'Đặng Quỳnh Loan', TO_DATE('1993-06-13', 'YYYY-MM-DD'), 'FEMALE', 'emp134@company.com', '+84-932-933-248', 
    '897 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 31588407.77, 
    'Techcombank', '0252231861'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP135', 'Huỳnh Lan Hằng', TO_DATE('1977-10-04', 'YYYY-MM-DD'), 'FEMALE', 'emp135@company.com', '+84-975-974-449', 
    '786 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 41410176.59, 
    'Sacombank', '6729167430'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP136', 'Bùi Tuyết Anh', TO_DATE('2002-08-14', 'YYYY-MM-DD'), 'FEMALE', 'emp136@company.com', '+84-956-177-760', 
    '334 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 43793281.38, 
    'ACB', '1564375706'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP137', 'Võ Thái Phong', TO_DATE('1989-07-12', 'YYYY-MM-DD'), 'MALE', 'emp137@company.com', '+84-973-840-646', 
    '178 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 40004649.07, 
    'Vietcombank', '5698307765'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP138', 'Trần Hoàng Quý', TO_DATE('1981-04-12', 'YYYY-MM-DD'), 'MALE', 'emp138@company.com', '+84-964-993-485', 
    '350 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 44432322.61, 
    'BIDV', '9383209205'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP139', 'Vũ Đức Dũng', TO_DATE('1999-03-03', 'YYYY-MM-DD'), 'MALE', 'emp139@company.com', '+84-978-955-707', 
    '424 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 26415950.63, 
    'MB Bank', '0481379167'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP140', 'Hồ Mai Linh', TO_DATE('1993-10-14', 'YYYY-MM-DD'), 'FEMALE', 'emp140@company.com', '+84-973-890-916', 
    '727 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 37657611.05, 
    'VietinBank', '4631834855'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP141', 'Phạm Mai Thảo', TO_DATE('1997-05-20', 'YYYY-MM-DD'), 'FEMALE', 'emp141@company.com', '+84-958-598-188', 
    '917 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 29706973.12, 
    'VPBank', '5925725674'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP142', 'Hồ Bảo Long', TO_DATE('1977-06-19', 'YYYY-MM-DD'), 'MALE', 'emp142@company.com', '+84-949-461-182', 
    '660 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 38628675.28, 
    'Sacombank', '3604043613'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP143', 'Vũ Kim Loan', TO_DATE('1985-12-22', 'YYYY-MM-DD'), 'FEMALE', 'emp143@company.com', '+84-974-332-177', 
    '605 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 46125520.56, 
    'MB Bank', '1869935730'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP144', 'Lý Thái Cường', TO_DATE('1976-12-02', 'YYYY-MM-DD'), 'MALE', 'emp144@company.com', '+84-946-442-764', 
    '917 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 34856985.76, 
    'MB Bank', '0229950294'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP145', 'Lê Quang Hiếu', TO_DATE('1976-09-28', 'YYYY-MM-DD'), 'MALE', 'emp145@company.com', '+84-979-434-552', 
    '139 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 26667938.83, 
    'Vietcombank', '7020439309'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP146', 'Hồ Ngọc Trang', TO_DATE('1982-06-05', 'YYYY-MM-DD'), 'FEMALE', 'emp146@company.com', '+84-978-552-147', 
    '135 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 25714105.13, 
    'ACB', '7237656492'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP147', 'Dương Hoàng Hiếu', TO_DATE('1996-11-26', 'YYYY-MM-DD'), 'MALE', 'emp147@company.com', '+84-931-204-332', 
    '11 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 41607373.31, 
    'BIDV', '8613925322'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP148', 'Phạm Phương Linh', TO_DATE('2003-07-07', 'YYYY-MM-DD'), 'FEMALE', 'emp148@company.com', '+84-949-237-167', 
    '665 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 33008574.25, 
    'ACB', '3511622897'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP149', 'Đặng Quỳnh Nhi', TO_DATE('1980-10-14', 'YYYY-MM-DD'), 'FEMALE', 'emp149@company.com', '+84-995-856-935', 
    '825 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 31599889.85, 
    'Sacombank', '0983335758'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP150', 'Đặng Gia Trung', TO_DATE('1978-06-08', 'YYYY-MM-DD'), 'MALE', 'emp150@company.com', '+84-949-883-230', 
    '389 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 19239374.24, 
    'Techcombank', '4726333352'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP151', 'Phạm Bảo Khánh', TO_DATE('1998-09-15', 'YYYY-MM-DD'), 'MALE', 'emp151@company.com', '+84-980-586-761', 
    '121 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 40729163.07, 
    'BIDV', '1818311794'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP152', 'Bùi Diệu Chi', TO_DATE('1992-09-03', 'YYYY-MM-DD'), 'FEMALE', 'emp152@company.com', '+84-933-550-841', 
    '708 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 32671208.87, 
    'Vietcombank', '8043523060'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP153', 'Lý Văn Khánh', TO_DATE('1984-01-13', 'YYYY-MM-DD'), 'MALE', 'emp153@company.com', '+84-957-754-100', 
    '938 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Content Creator', 42758175.59, 
    'VietinBank', '4595103290'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP154', 'Lê Mai Ly', TO_DATE('1999-08-24', 'YYYY-MM-DD'), 'FEMALE', 'emp154@company.com', '+84-992-983-787', 
    '988 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 23330831.76, 
    'Sacombank', '8484321659'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP155', 'Đặng Bích Trang', TO_DATE('2002-07-04', 'YYYY-MM-DD'), 'FEMALE', 'emp155@company.com', '+84-995-858-118', 
    '860 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 17775554.21, 
    'Vietcombank', '0469304328'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP156', 'Dương Hoàng Việt', TO_DATE('2003-05-06', 'YYYY-MM-DD'), 'MALE', 'emp156@company.com', '+84-974-418-739', 
    '379 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 15685095.59, 
    'VPBank', '5045792905'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP157', 'Đặng Công Tuấn', TO_DATE('1986-10-08', 'YYYY-MM-DD'), 'MALE', 'emp157@company.com', '+84-914-684-323', 
    '522 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 20470312.81, 
    'BIDV', '8273167206'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP158', 'Huỳnh Bảo Bách', TO_DATE('1995-09-04', 'YYYY-MM-DD'), 'MALE', 'emp158@company.com', '+84-918-801-207', 
    '26 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 49157068.25, 
    'Vietcombank', '1642547890'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP159', 'Đặng Ánh Hoa', TO_DATE('1988-01-08', 'YYYY-MM-DD'), 'FEMALE', 'emp159@company.com', '+84-959-858-313', 
    '601 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 42128926.34, 
    'BIDV', '2647000536'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP160', 'Huỳnh Gia Phong', TO_DATE('1984-05-23', 'YYYY-MM-DD'), 'MALE', 'emp160@company.com', '+84-927-290-444', 
    '187 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 35159062.98, 
    'Sacombank', '2446092749'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP161', 'Võ Diệu Chi', TO_DATE('1977-11-03', 'YYYY-MM-DD'), 'FEMALE', 'emp161@company.com', '+84-976-826-757', 
    '263 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 13270342.04, 
    'Techcombank', '6081724712'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP162', 'Huỳnh Tuấn Việt', TO_DATE('1981-01-01', 'YYYY-MM-DD'), 'MALE', 'emp162@company.com', '+84-950-159-793', 
    '384 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 21455842.46, 
    'MB Bank', '7585052299'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP163', 'Lê Minh Hiếu', TO_DATE('1981-06-26', 'YYYY-MM-DD'), 'MALE', 'emp163@company.com', '+84-991-279-226', 
    '530 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 33728360.24, 
    'MB Bank', '3731389292'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP164', 'Đặng Tuyết Chi', TO_DATE('1975-01-08', 'YYYY-MM-DD'), 'FEMALE', 'emp164@company.com', '+84-963-301-296', 
    '780 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Senior Designer', 12174006.62, 
    'Sacombank', '8561776302'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP165', 'Võ Tuấn Bách', TO_DATE('1996-05-06', 'YYYY-MM-DD'), 'MALE', 'emp165@company.com', '+84-945-899-217', 
    '439 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 35556457.88, 
    'Sacombank', '1345462303'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP166', 'Huỳnh Ánh Trang', TO_DATE('1976-04-15', 'YYYY-MM-DD'), 'FEMALE', 'emp166@company.com', '+84-943-772-567', 
    '184 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 29908402.53, 
    'Sacombank', '3722949501'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP167', 'Dương Quỳnh Nhi', TO_DATE('1988-04-07', 'YYYY-MM-DD'), 'FEMALE', 'emp167@company.com', '+84-973-195-288', 
    '699 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 25261146.67, 
    'VPBank', '6887782424'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP168', 'Đặng Bảo Việt', TO_DATE('1977-08-11', 'YYYY-MM-DD'), 'MALE', 'emp168@company.com', '+84-947-496-225', 
    '879 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 38349632.74, 
    'MB Bank', '7830650762'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP169', 'Phạm Tuyết Anh', TO_DATE('1978-12-26', 'YYYY-MM-DD'), 'FEMALE', 'emp169@company.com', '+84-970-456-349', 
    '962 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 40272206.25, 
    'VPBank', '4332701102'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP170', 'Lê Mai Linh', TO_DATE('1980-06-14', 'YYYY-MM-DD'), 'FEMALE', 'emp170@company.com', '+84-925-509-867', 
    '697 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 40979051.73, 
    'Techcombank', '7204706592'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP171', 'Hoàng Minh Sơn', TO_DATE('1994-09-10', 'YYYY-MM-DD'), 'MALE', 'emp171@company.com', '+84-910-823-635', 
    '639 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 25409287.87, 
    'TPBank', '3248943366'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP172', 'Vũ Hoàng Khánh', TO_DATE('1976-06-23', 'YYYY-MM-DD'), 'MALE', 'emp172@company.com', '+84-974-562-279', 
    '185 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Brand Manager', 47520940.94, 
    'ACB', '5749671797'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP173', 'Huỳnh Thái Tuấn', TO_DATE('1987-03-12', 'YYYY-MM-DD'), 'MALE', 'emp173@company.com', '+84-953-653-857', 
    '512 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 26646981.24, 
    'Vietcombank', '2203257479'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP174', 'Lý Lan Hằng', TO_DATE('2002-02-28', 'YYYY-MM-DD'), 'FEMALE', 'emp174@company.com', '+84-959-142-157', 
    '317 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 13015297.29, 
    'VPBank', '3207691030'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP175', 'Nô Ngọc Linh', TO_DATE('1999-06-03', 'YYYY-MM-DD'), 'FEMALE', 'emp175@company.com', '+84-980-686-707', 
    '848 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 27747119.04, 
    'TPBank', '3280483420'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP176', 'Lý Ánh Nhi', TO_DATE('1988-07-20', 'YYYY-MM-DD'), 'FEMALE', 'emp176@company.com', '+84-949-232-610', 
    '36 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 12956167.67, 
    'Vietcombank', '9800116382'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP177', 'Dương Thanh Linh', TO_DATE('2002-03-05', 'YYYY-MM-DD'), 'FEMALE', 'emp177@company.com', '+84-974-503-871', 
    '10 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 17313186.20, 
    'Vietcombank', '2275045674'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP178', 'Lý Minh Khánh', TO_DATE('1987-11-24', 'YYYY-MM-DD'), 'MALE', 'emp178@company.com', '+84-961-425-218', 
    '216 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 43308144.90, 
    'MB Bank', '8744650811'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP179', 'Lê Anh Khánh', TO_DATE('1985-06-06', 'YYYY-MM-DD'), 'MALE', 'emp179@company.com', '+84-988-304-945', 
    '633 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 29727550.23, 
    'ACB', '0480237494'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP180', 'Đặng Lan Trang', TO_DATE('1976-10-26', 'YYYY-MM-DD'), 'FEMALE', 'emp180@company.com', '+84-962-411-347', 
    '480 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 48774197.72, 
    'MB Bank', '2873525051'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP181', 'Huỳnh Thành Việt', TO_DATE('2002-03-21', 'YYYY-MM-DD'), 'MALE', 'emp181@company.com', '+84-985-921-648', 
    '862 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 42445304.17, 
    'VietinBank', '1551808771'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP182', 'Nguyễn Xung Nam', TO_DATE('1977-09-09', 'YYYY-MM-DD'), 'MALE', 'emp182@company.com', '+84-933-508-475', 
    '734 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 22230493.62, 
    'Techcombank', '8465067448'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP183', 'Vũ Phương Ly', TO_DATE('2002-12-02', 'YYYY-MM-DD'), 'FEMALE', 'emp183@company.com', '+84-916-911-538', 
    '767 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 45422191.58, 
    'MB Bank', '5372872455'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP184', 'Phạm Tuấn Phong', TO_DATE('1984-12-09', 'YYYY-MM-DD'), 'MALE', 'emp184@company.com', '+84-910-921-746', 
    '230 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 41627247.72, 
    'Techcombank', '5179347618'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP185', 'Lê Thu Loan', TO_DATE('2003-12-26', 'YYYY-MM-DD'), 'FEMALE', 'emp185@company.com', '+84-929-909-592', 
    '781 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 49515965.55, 
    'Vietcombank', '6338302123'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP186', 'Lê Thị Hương', TO_DATE('1978-03-26', 'YYYY-MM-DD'), 'FEMALE', 'emp186@company.com', '+84-956-139-776', 
    '150 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 46883969.17, 
    'Techcombank', '9620708738'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP187', 'Lý Thanh Vy', TO_DATE('1982-02-10', 'YYYY-MM-DD'), 'FEMALE', 'emp187@company.com', '+84-986-534-459', 
    '137 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 15986737.56, 
    'BIDV', '8267835221'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP188', 'Đỗ Thành Trung', TO_DATE('1992-11-12', 'YYYY-MM-DD'), 'MALE', 'emp188@company.com', '+84-918-964-148', 
    '89 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 18341536.86, 
    'ACB', '0441617919'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP189', 'Trần Gia Trung', TO_DATE('1999-11-27', 'YYYY-MM-DD'), 'MALE', 'emp189@company.com', '+84-961-767-302', 
    '642 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 33624137.04, 
    'ACB', '9394334739'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP190', 'Lý Quỳnh Linh', TO_DATE('1989-12-20', 'YYYY-MM-DD'), 'FEMALE', 'emp190@company.com', '+84-994-817-733', 
    '638 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 37130554.77, 
    'TPBank', '8576237664'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP191', 'Đặng Quỳnh Thảo', TO_DATE('2001-10-24', 'YYYY-MM-DD'), 'FEMALE', 'emp191@company.com', '+84-994-110-950', 
    '109 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 37508567.36, 
    'ACB', '5483962411'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP192', 'Lê Bảo Khánh', TO_DATE('1979-06-07', 'YYYY-MM-DD'), 'MALE', 'emp192@company.com', '+84-988-611-297', 
    '657 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Motion Designer', 40256503.80, 
    'Techcombank', '0034163501'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP193', 'Huỳnh Minh Tuấn', TO_DATE('1999-10-13', 'YYYY-MM-DD'), 'MALE', 'emp193@company.com', '+84-969-493-825', 
    '562 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 48395124.93, 
    'Techcombank', '8762864035'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP194', 'Võ Hồng Yến', TO_DATE('1989-09-07', 'YYYY-MM-DD'), 'FEMALE', 'emp194@company.com', '+84-961-488-352', 
    '480 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 21316840.21, 
    'ACB', '8196642957'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP195', 'Lê Bảo Phong', TO_DATE('1997-11-17', 'YYYY-MM-DD'), 'MALE', 'emp195@company.com', '+84-924-580-423', 
    '566 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 12693228.05, 
    'Techcombank', '0220009960'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP196', 'Huỳnh Bảo Tuấn', TO_DATE('1994-05-17', 'YYYY-MM-DD'), 'MALE', 'emp196@company.com', '+84-985-980-483', 
    '403 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 21931980.29, 
    'VietinBank', '4638719754'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP197', 'Nô Lan Hằng', TO_DATE('1986-01-01', 'YYYY-MM-DD'), 'FEMALE', 'emp197@company.com', '+84-986-324-846', 
    '786 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 39480160.14, 
    'VietinBank', '8430085315'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP198', 'Hoàng Kim Duyên', TO_DATE('2002-09-26', 'YYYY-MM-DD'), 'FEMALE', 'emp198@company.com', '+84-992-127-166', 
    '616 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 32959501.09, 
    'MB Bank', '9108277356'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP199', 'Huỳnh Mai Ly', TO_DATE('1979-10-14', 'YYYY-MM-DD'), 'FEMALE', 'emp199@company.com', '+84-961-666-927', 
    '668 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 31745220.08, 
    'VPBank', '1203906598'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP200', 'Nguyễn Diệu Thảo', TO_DATE('1998-06-09', 'YYYY-MM-DD'), 'FEMALE', 'emp200@company.com', '+84-952-303-336', 
    '694 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 13978344.87, 
    'Vietcombank', '7288070873'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP201', 'Lê Ánh Duyên', TO_DATE('1976-08-27', 'YYYY-MM-DD'), 'FEMALE', 'emp201@company.com', '+84-971-292-427', 
    '167 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 45346770.53, 
    'ACB', '9759677459'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP202', 'Bùi Thái Phúc', TO_DATE('2001-11-23', 'YYYY-MM-DD'), 'MALE', 'emp202@company.com', '+84-915-201-911', 
    '828 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 27130779.53, 
    'BIDV', '2635531218'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP203', 'Đỗ Mai Linh', TO_DATE('2000-12-18', 'YYYY-MM-DD'), 'FEMALE', 'emp203@company.com', '+84-974-222-389', 
    '35 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 38967924.89, 
    'VietinBank', '1740153219'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP204', 'Võ Thu Loan', TO_DATE('1991-02-11', 'YYYY-MM-DD'), 'FEMALE', 'emp204@company.com', '+84-964-307-930', 
    '695 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 17083070.50, 
    'Vietcombank', '2368510039'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP205', 'Phan Văn Việt', TO_DATE('1976-08-04', 'YYYY-MM-DD'), 'MALE', 'emp205@company.com', '+84-932-659-231', 
    '672 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 34176564.01, 
    'Vietcombank', '0761908504'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP206', 'Hồ Văn Phong', TO_DATE('1994-12-20', 'YYYY-MM-DD'), 'MALE', 'emp206@company.com', '+84-926-591-628', 
    '293 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 32250277.43, 
    'VietinBank', '3873315034'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP207', 'Vũ Thu Hoa', TO_DATE('1988-02-19', 'YYYY-MM-DD'), 'FEMALE', 'emp207@company.com', '+84-972-711-533', 
    '863 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 15018740.02, 
    'ACB', '6215839522'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP208', 'Bùi Phương Duyên', TO_DATE('1991-04-11', 'YYYY-MM-DD'), 'FEMALE', 'emp208@company.com', '+84-953-787-292', 
    '255 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 17681267.94, 
    'VPBank', '5631017832'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP209', 'Huỳnh Quỳnh Nhung', TO_DATE('1992-04-23', 'YYYY-MM-DD'), 'FEMALE', 'emp209@company.com', '+84-961-373-334', 
    '274 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 18941664.96, 
    'MB Bank', '3129753445'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP210', 'Phan Hữu Sơn', TO_DATE('1995-08-09', 'YYYY-MM-DD'), 'MALE', 'emp210@company.com', '+84-973-688-424', 
    '638 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Content Creator', 27774987.37, 
    'ACB', '0802698795'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP211', 'Võ Quỳnh Nhi', TO_DATE('1989-01-21', 'YYYY-MM-DD'), 'FEMALE', 'emp211@company.com', '+84-918-409-967', 
    '185 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 18077288.15, 
    'BIDV', '4255029546'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP212', 'Trần Văn Dũng', TO_DATE('1980-11-25', 'YYYY-MM-DD'), 'MALE', 'emp212@company.com', '+84-991-801-350', 
    '81 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 19736931.56, 
    'Sacombank', '7533832768'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP213', 'Võ Ngọc Nhi', TO_DATE('1995-12-08', 'YYYY-MM-DD'), 'FEMALE', 'emp213@company.com', '+84-967-635-996', 
    '567 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 49273103.69, 
    'ACB', '1862969257'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP214', 'Hoàng Kim Nhi', TO_DATE('1994-03-19', 'YYYY-MM-DD'), 'FEMALE', 'emp214@company.com', '+84-964-400-392', 
    '341 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Account Executive', 18748526.05, 
    'VietinBank', '8900033344'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP215', 'Nô Thành Hiếu', TO_DATE('1996-03-07', 'YYYY-MM-DD'), 'MALE', 'emp215@company.com', '+84-943-960-385', 
    '710 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 39839327.91, 
    'VietinBank', '1825940009'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP216', 'Hồ Mai Chi', TO_DATE('1986-01-23', 'YYYY-MM-DD'), 'FEMALE', 'emp216@company.com', '+84-925-733-276', 
    '560 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Brand Manager', 33119843.18, 
    'VietinBank', '3126308364'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP217', 'Bùi Quỳnh Loan', TO_DATE('1980-09-05', 'YYYY-MM-DD'), 'FEMALE', 'emp217@company.com', '+84-994-817-666', 
    '99 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 46744399.79, 
    'Sacombank', '2478160107'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP218', 'Huỳnh Kim Hoa', TO_DATE('1976-01-27', 'YYYY-MM-DD'), 'FEMALE', 'emp218@company.com', '+84-927-357-184', 
    '410 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Account Executive', 42994283.90, 
    'Techcombank', '7655433772'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP219', 'Nô Quỳnh Anh', TO_DATE('1990-02-23', 'YYYY-MM-DD'), 'FEMALE', 'emp219@company.com', '+84-996-499-390', 
    '705 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 38779822.52, 
    'VietinBank', '6438510506'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP220', 'Đỗ Tuấn Phúc', TO_DATE('1989-01-07', 'YYYY-MM-DD'), 'MALE', 'emp220@company.com', '+84-989-120-929', 
    '229 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 12409018.43, 
    'VietinBank', '9471206464'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP221', 'Đặng Minh Tuấn', TO_DATE('2000-09-13', 'YYYY-MM-DD'), 'MALE', 'emp221@company.com', '+84-993-437-501', 
    '140 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 40669108.48, 
    'TPBank', '8554086357'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP222', 'Lý Mai Ly', TO_DATE('1993-04-03', 'YYYY-MM-DD'), 'FEMALE', 'emp222@company.com', '+84-930-726-724', 
    '816 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 25872717.19, 
    'VPBank', '5192078079'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP223', 'Hồ Ngọc Yến', TO_DATE('1996-10-26', 'YYYY-MM-DD'), 'FEMALE', 'emp223@company.com', '+84-914-609-413', 
    '795 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 31393476.14, 
    'ACB', '4337849872'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP224', 'Nguyễn Phương Chi', TO_DATE('1981-07-21', 'YYYY-MM-DD'), 'FEMALE', 'emp224@company.com', '+84-910-777-465', 
    '394 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 18814020.09, 
    'VPBank', '1347729418'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP225', 'Bùi Thái Bách', TO_DATE('1999-01-25', 'YYYY-MM-DD'), 'MALE', 'emp225@company.com', '+84-979-346-586', 
    '275 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 16496051.68, 
    'Vietcombank', '7807638358'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP226', 'Phan Văn Quý', TO_DATE('1990-03-01', 'YYYY-MM-DD'), 'MALE', 'emp226@company.com', '+84-913-185-231', 
    '636 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 36462401.83, 
    'MB Bank', '7533618753'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP227', 'Lý Lan Nhi', TO_DATE('1976-08-11', 'YYYY-MM-DD'), 'FEMALE', 'emp227@company.com', '+84-915-694-395', 
    '953 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 19408207.96, 
    'Vietcombank', '6398676130'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP228', 'Phan Minh Cường', TO_DATE('1985-02-24', 'YYYY-MM-DD'), 'MALE', 'emp228@company.com', '+84-959-441-402', 
    '658 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 36912526.28, 
    'Techcombank', '5895189364'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP229', 'Đỗ Hoàng Hùng', TO_DATE('1976-06-03', 'YYYY-MM-DD'), 'MALE', 'emp229@company.com', '+84-970-851-947', 
    '676 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 34623735.97, 
    'MB Bank', '3429383755'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP230', 'Bùi Công Quý', TO_DATE('1998-08-16', 'YYYY-MM-DD'), 'MALE', 'emp230@company.com', '+84-995-971-277', 
    '146 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 29110753.12, 
    'ACB', '9585027801'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP231', 'Đỗ Hồng Loan', TO_DATE('1997-01-07', 'YYYY-MM-DD'), 'FEMALE', 'emp231@company.com', '+84-925-684-417', 
    '53 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 26675093.14, 
    'BIDV', '5955684856'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP232', 'Huỳnh Tuấn Long', TO_DATE('2002-05-01', 'YYYY-MM-DD'), 'MALE', 'emp232@company.com', '+84-976-568-240', 
    '250 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 25341469.10, 
    'VPBank', '6387037944'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP233', 'Võ Phương Nhung', TO_DATE('1979-05-16', 'YYYY-MM-DD'), 'FEMALE', 'emp233@company.com', '+84-990-521-530', 
    '197 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 39907877.00, 
    'Techcombank', '8119100531'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP234', 'Phan Tuấn Trung', TO_DATE('1989-08-04', 'YYYY-MM-DD'), 'MALE', 'emp234@company.com', '+84-938-401-944', 
    '636 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 43676030.93, 
    'Techcombank', '7587356237'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP235', 'Nô Ánh Hằng', TO_DATE('1999-05-26', 'YYYY-MM-DD'), 'FEMALE', 'emp235@company.com', '+84-926-645-365', 
    '140 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 18474597.07, 
    'ACB', '6479777401'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP236', 'Vũ Ánh Vy', TO_DATE('1980-09-16', 'YYYY-MM-DD'), 'FEMALE', 'emp236@company.com', '+84-936-801-731', 
    '319 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 42164948.92, 
    'Sacombank', '0311986310'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP237', 'Đặng Lan Nhi', TO_DATE('1980-07-25', 'YYYY-MM-DD'), 'FEMALE', 'emp237@company.com', '+84-975-896-933', 
    '397 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 48427375.87, 
    'ACB', '2331143355'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP238', 'Hoàng Hữu Hùng', TO_DATE('1984-12-16', 'YYYY-MM-DD'), 'MALE', 'emp238@company.com', '+84-927-957-665', 
    '903 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 39169427.71, 
    'Techcombank', '0733659235'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP239', 'Lý Quang Sơn', TO_DATE('1999-12-27', 'YYYY-MM-DD'), 'MALE', 'emp239@company.com', '+84-967-952-194', 
    '252 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 34552675.67, 
    'BIDV', '5071184051'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP240', 'Vũ Minh Hiếu', TO_DATE('1993-10-26', 'YYYY-MM-DD'), 'MALE', 'emp240@company.com', '+84-919-863-404', 
    '600 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 45685929.95, 
    'ACB', '0391307077'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP241', 'Đỗ Lan Hoa', TO_DATE('1985-07-27', 'YYYY-MM-DD'), 'FEMALE', 'emp241@company.com', '+84-991-839-188', 
    '697 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 34629877.15, 
    'VPBank', '7873046819'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP242', 'Hồ Minh Dũng', TO_DATE('1981-02-01', 'YYYY-MM-DD'), 'MALE', 'emp242@company.com', '+84-956-675-723', 
    '768 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 22659818.99, 
    'Sacombank', '7733492579'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP243', 'Dương Thị Loan', TO_DATE('1991-07-21', 'YYYY-MM-DD'), 'FEMALE', 'emp243@company.com', '+84-924-659-957', 
    '724 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 35961772.07, 
    'MB Bank', '4620934470'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP244', 'Nô Thu Nhung', TO_DATE('1981-04-25', 'YYYY-MM-DD'), 'FEMALE', 'emp244@company.com', '+84-992-408-605', 
    '904 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 35705720.96, 
    'VietinBank', '1055822704'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP245', 'Đỗ Đức Phúc', TO_DATE('1978-09-19', 'YYYY-MM-DD'), 'MALE', 'emp245@company.com', '+84-994-501-774', 
    '42 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 24461082.44, 
    'Vietcombank', '4525710073'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP246', 'Trần Hoàng Tuấn', TO_DATE('1992-08-14', 'YYYY-MM-DD'), 'MALE', 'emp246@company.com', '+84-962-261-763', 
    '342 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 19003534.21, 
    'ACB', '7336524686'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP247', 'Nguyễn Ngọc Vy', TO_DATE('1985-04-15', 'YYYY-MM-DD'), 'FEMALE', 'emp247@company.com', '+84-999-337-465', 
    '777 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 20797682.08, 
    'MB Bank', '4127061773'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP248', 'Huỳnh Thị Ly', TO_DATE('1991-04-07', 'YYYY-MM-DD'), 'FEMALE', 'emp248@company.com', '+84-968-977-188', 
    '371 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 31841451.46, 
    'MB Bank', '5917997155'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP249', 'Hoàng Diệu Loan', TO_DATE('1991-04-19', 'YYYY-MM-DD'), 'FEMALE', 'emp249@company.com', '+84-943-714-788', 
    '982 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 18597179.10, 
    'MB Bank', '9211011901'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP250', 'Phan Văn Long', TO_DATE('1999-06-08', 'YYYY-MM-DD'), 'MALE', 'emp250@company.com', '+84-941-213-680', 
    '926 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 32519086.41, 
    'VPBank', '9258750581'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP251', 'Hoàng Thanh Linh', TO_DATE('1994-12-04', 'YYYY-MM-DD'), 'FEMALE', 'emp251@company.com', '+84-983-427-718', 
    '168 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 28503139.84, 
    'Vietcombank', '0516337005'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP252', 'Nô Minh Phong', TO_DATE('1995-10-24', 'YYYY-MM-DD'), 'MALE', 'emp252@company.com', '+84-951-913-789', 
    '838 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Điều phối viên', 20995520.92, 
    'VPBank', '7162016115'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP253', 'Hoàng Ngọc Sơn', TO_DATE('1984-08-09', 'YYYY-MM-DD'), 'MALE', 'emp253@company.com', '+84-984-402-531', 
    '63 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 36036758.51, 
    'Techcombank', '1831520527'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP254', 'Huỳnh Lan Hoa', TO_DATE('1996-02-09', 'YYYY-MM-DD'), 'FEMALE', 'emp254@company.com', '+84-998-833-735', 
    '503 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 29194993.30, 
    'Vietcombank', '6747827357'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP255', 'Vũ Lan Duyên', TO_DATE('1986-03-06', 'YYYY-MM-DD'), 'FEMALE', 'emp255@company.com', '+84-950-371-125', 
    '795 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 29719340.36, 
    'Sacombank', '6609460590'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP256', 'Trần Thị Yến', TO_DATE('1985-01-03', 'YYYY-MM-DD'), 'FEMALE', 'emp256@company.com', '+84-988-105-477', 
    '403 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Account Executive', 20565812.41, 
    'MB Bank', '8918706164'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP257', 'Hồ Hữu Phúc', TO_DATE('1991-10-28', 'YYYY-MM-DD'), 'MALE', 'emp257@company.com', '+84-955-577-936', 
    '600 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 15880380.08, 
    'VPBank', '5276561522'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP258', 'Phan Minh Trung', TO_DATE('1981-04-09', 'YYYY-MM-DD'), 'MALE', 'emp258@company.com', '+84-948-825-648', 
    '525 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 30006920.46, 
    'BIDV', '1704993957'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP259', 'Dương Tuyết Hoa', TO_DATE('1998-08-18', 'YYYY-MM-DD'), 'FEMALE', 'emp259@company.com', '+84-958-122-224', 
    '918 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 25194519.70, 
    'Techcombank', '0299751438'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP260', 'Nguyễn Phương Hoa', TO_DATE('1990-07-23', 'YYYY-MM-DD'), 'FEMALE', 'emp260@company.com', '+84-933-276-677', 
    '628 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 13692034.84, 
    'Techcombank', '0720617233'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP261', 'Lý Quỳnh Thảo', TO_DATE('1983-12-03', 'YYYY-MM-DD'), 'FEMALE', 'emp261@company.com', '+84-937-629-458', 
    '647 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Content Creator', 13538112.77, 
    'TPBank', '1470009725'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP262', 'Vũ Hữu Trung', TO_DATE('1992-05-01', 'YYYY-MM-DD'), 'MALE', 'emp262@company.com', '+84-918-935-893', 
    '609 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 30470400.08, 
    'VietinBank', '1726231657'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP263', 'Huỳnh Thái Phúc', TO_DATE('1998-12-21', 'YYYY-MM-DD'), 'MALE', 'emp263@company.com', '+84-978-685-941', 
    '402 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 30067960.30, 
    'BIDV', '7211693718'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP264', 'Lê Thái Hiếu', TO_DATE('1985-11-06', 'YYYY-MM-DD'), 'MALE', 'emp264@company.com', '+84-975-829-195', 
    '851 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 43829456.55, 
    'ACB', '1407809294'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP265', 'Trần Minh Hùng', TO_DATE('1990-03-06', 'YYYY-MM-DD'), 'MALE', 'emp265@company.com', '+84-942-203-101', 
    '236 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 46230360.98, 
    'VietinBank', '7126251296'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP266', 'Hồ Ngọc Hằng', TO_DATE('1988-09-25', 'YYYY-MM-DD'), 'FEMALE', 'emp266@company.com', '+84-956-825-755', 
    '186 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 38077592.03, 
    'VPBank', '8738702755'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP267', 'Trần Diệu Loan', TO_DATE('1982-06-21', 'YYYY-MM-DD'), 'FEMALE', 'emp267@company.com', '+84-978-495-520', 
    '583 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 47320465.68, 
    'Techcombank', '4854216397'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP268', 'Nguyễn Trinh Duyên', TO_DATE('1983-10-08', 'YYYY-MM-DD'), 'FEMALE', 'emp268@company.com', '+84-932-338-386', 
    '327 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 34148659.71, 
    'MB Bank', '8494672073'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP269', 'Vũ Thu Yến', TO_DATE('1979-04-07', 'YYYY-MM-DD'), 'FEMALE', 'emp269@company.com', '+84-978-314-815', 
    '110 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Điều phối viên', 38333272.00, 
    'VietinBank', '4288723721'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP270', 'Huỳnh Ngọc Hiếu', TO_DATE('1988-03-23', 'YYYY-MM-DD'), 'MALE', 'emp270@company.com', '+84-993-680-867', 
    '933 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 43353656.16, 
    'ACB', '6724964711'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP271', 'Huỳnh Bảo Cường', TO_DATE('2002-03-24', 'YYYY-MM-DD'), 'MALE', 'emp271@company.com', '+84-992-634-234', 
    '961 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 22094090.98, 
    'Vietcombank', '0924857035'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP272', 'Hồ Diệu Thảo', TO_DATE('2003-12-09', 'YYYY-MM-DD'), 'FEMALE', 'emp272@company.com', '+84-912-739-316', 
    '883 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 37816847.10, 
    'VPBank', '0658954003'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP273', 'Hồ Tuấn Phúc', TO_DATE('1987-12-19', 'YYYY-MM-DD'), 'MALE', 'emp273@company.com', '+84-933-425-504', 
    '994 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 21057472.61, 
    'ACB', '3361069003'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP274', 'Hoàng Tuấn Việt', TO_DATE('1992-01-13', 'YYYY-MM-DD'), 'MALE', 'emp274@company.com', '+84-919-308-362', 
    '902 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 18388939.06, 
    'BIDV', '2917922014'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP275', 'Phạm Thanh Nhi', TO_DATE('1981-11-02', 'YYYY-MM-DD'), 'FEMALE', 'emp275@company.com', '+84-949-557-185', 
    '992 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 35022841.39, 
    'Techcombank', '4134677583'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP276', 'Bùi Thái Bách', TO_DATE('1985-02-08', 'YYYY-MM-DD'), 'MALE', 'emp276@company.com', '+84-944-472-660', 
    '979 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 19645701.28, 
    'TPBank', '4034036095'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP277', 'Đỗ Thái Bách', TO_DATE('1997-03-08', 'YYYY-MM-DD'), 'MALE', 'emp277@company.com', '+84-967-364-435', 
    '209 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 24510783.17, 
    'VietinBank', '5001958733'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP278', 'Trần Bích Anh', TO_DATE('1993-10-25', 'YYYY-MM-DD'), 'FEMALE', 'emp278@company.com', '+84-964-268-597', 
    '638 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 35619045.83, 
    'Vietcombank', '7308458224'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP279', 'Nô Ngọc Thảo', TO_DATE('2003-10-16', 'YYYY-MM-DD'), 'FEMALE', 'emp279@company.com', '+84-950-667-606', 
    '302 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 19497810.95, 
    'BIDV', '6459481946'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP280', 'Đỗ Bích Hằng', TO_DATE('2002-11-12', 'YYYY-MM-DD'), 'FEMALE', 'emp280@company.com', '+84-997-245-161', 
    '824 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 19814843.70, 
    'VPBank', '2071919444'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP281', 'Đỗ Thu Nhung', TO_DATE('2001-11-07', 'YYYY-MM-DD'), 'FEMALE', 'emp281@company.com', '+84-992-803-810', 
    '32 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 40341689.79, 
    'Sacombank', '5832764710'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP282', 'Nô Quang Hiếu', TO_DATE('1994-06-03', 'YYYY-MM-DD'), 'MALE', 'emp282@company.com', '+84-945-878-526', 
    '138 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 14803868.02, 
    'Techcombank', '7896185238'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP283', 'Bùi Công Phong', TO_DATE('1984-01-02', 'YYYY-MM-DD'), 'MALE', 'emp283@company.com', '+84-937-232-979', 
    '368 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 19329914.27, 
    'Vietcombank', '7673112721'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP284', 'Đỗ Ngọc Yến', TO_DATE('1989-06-13', 'YYYY-MM-DD'), 'FEMALE', 'emp284@company.com', '+84-973-108-299', 
    '182 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 15625362.84, 
    'Sacombank', '1883175838'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP285', 'Dương Minh Sơn', TO_DATE('1998-03-01', 'YYYY-MM-DD'), 'MALE', 'emp285@company.com', '+84-970-278-907', 
    '789 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 29659511.25, 
    'Vietcombank', '5290393275'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP286', 'Lý Bảo Phong', TO_DATE('1997-02-10', 'YYYY-MM-DD'), 'MALE', 'emp286@company.com', '+84-983-832-817', 
    '912 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 49497142.71, 
    'BIDV', '9366296088'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP287', 'Vũ Thành Khánh', TO_DATE('1998-06-18', 'YYYY-MM-DD'), 'MALE', 'emp287@company.com', '+84-933-205-661', 
    '372 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 20789867.02, 
    'Vietcombank', '4171193612'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP288', 'Lê Trinh Nhung', TO_DATE('1982-02-07', 'YYYY-MM-DD'), 'FEMALE', 'emp288@company.com', '+84-981-197-445', 
    '198 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 27630789.25, 
    'Sacombank', '7156361443'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP289', 'Dương Hoàng Long', TO_DATE('1983-10-22', 'YYYY-MM-DD'), 'MALE', 'emp289@company.com', '+84-915-579-655', 
    '536 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 31995453.10, 
    'Sacombank', '9252344553'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP290', 'Bùi Tuấn Phúc', TO_DATE('1983-02-12', 'YYYY-MM-DD'), 'MALE', 'emp290@company.com', '+84-918-844-932', 
    '119 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 31370576.24, 
    'VPBank', '0284575081'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP291', 'Vũ Xung Hiếu', TO_DATE('1994-07-14', 'YYYY-MM-DD'), 'MALE', 'emp291@company.com', '+84-932-538-840', 
    '338 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 25645295.79, 
    'VietinBank', '5794316123'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP292', 'Võ Tuyết Ly', TO_DATE('1999-04-06', 'YYYY-MM-DD'), 'FEMALE', 'emp292@company.com', '+84-963-247-562', 
    '833 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 37436018.90, 
    'MB Bank', '3058362250'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP293', 'Lê Ngọc Cường', TO_DATE('1997-06-05', 'YYYY-MM-DD'), 'MALE', 'emp293@company.com', '+84-931-969-162', 
    '215 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Điều phối viên', 17757966.00, 
    'TPBank', '9146377471'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP294', 'Vũ Hồng Nhung', TO_DATE('1976-08-16', 'YYYY-MM-DD'), 'FEMALE', 'emp294@company.com', '+84-997-974-450', 
    '399 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 12529100.59, 
    'MB Bank', '3587273776'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP295', 'Đặng Mai Nhung', TO_DATE('1977-08-26', 'YYYY-MM-DD'), 'FEMALE', 'emp295@company.com', '+84-994-678-795', 
    '431 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 22102272.72, 
    'VietinBank', '2920551892'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP296', 'Lê Thành Hùng', TO_DATE('1996-04-21', 'YYYY-MM-DD'), 'MALE', 'emp296@company.com', '+84-973-111-965', 
    '319 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Content Creator', 15668191.19, 
    'Vietcombank', '2470419574'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP297', 'Phạm Gia Phong', TO_DATE('1999-10-26', 'YYYY-MM-DD'), 'MALE', 'emp297@company.com', '+84-915-215-627', 
    '484 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 45167824.76, 
    'VPBank', '6666271686'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP298', 'Dương Quỳnh Yến', TO_DATE('1976-04-16', 'YYYY-MM-DD'), 'FEMALE', 'emp298@company.com', '+84-926-962-776', 
    '433 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 40819149.85, 
    'TPBank', '3060530446'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP299', 'Võ Thanh Hằng', TO_DATE('2000-07-10', 'YYYY-MM-DD'), 'FEMALE', 'emp299@company.com', '+84-930-214-269', 
    '819 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 43717563.56, 
    'Techcombank', '5500776262'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP300', 'Nô Công Phong', TO_DATE('1979-12-23', 'YYYY-MM-DD'), 'MALE', 'emp300@company.com', '+84-999-624-732', 
    '422 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 19539712.70, 
    'BIDV', '4490115449'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP301', 'Nguyễn Hữu Bách', TO_DATE('1975-10-12', 'YYYY-MM-DD'), 'MALE', 'emp301@company.com', '+84-959-117-142', 
    '353 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 27663391.20, 
    'TPBank', '0395494407'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP302', 'Vũ Hồng Linh', TO_DATE('1985-06-28', 'YYYY-MM-DD'), 'FEMALE', 'emp302@company.com', '+84-950-662-836', 
    '508 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Content Creator', 23844184.58, 
    'VPBank', '0650254075'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP303', 'Hoàng Xung Phong', TO_DATE('1986-11-18', 'YYYY-MM-DD'), 'MALE', 'emp303@company.com', '+84-955-513-784', 
    '26 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 33384138.22, 
    'Sacombank', '7853387810'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP304', 'Nô Trinh Anh', TO_DATE('1980-12-10', 'YYYY-MM-DD'), 'FEMALE', 'emp304@company.com', '+84-941-707-965', 
    '522 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 12026292.90, 
    'MB Bank', '4261133429'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP305', 'Nguyễn Đức Long', TO_DATE('1989-03-06', 'YYYY-MM-DD'), 'MALE', 'emp305@company.com', '+84-920-682-160', 
    '962 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 22575134.28, 
    'BIDV', '0137823139'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP306', 'Trần Công Quý', TO_DATE('2002-08-01', 'YYYY-MM-DD'), 'MALE', 'emp306@company.com', '+84-920-579-577', 
    '761 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 49688595.99, 
    'Vietcombank', '0729334767'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP307', 'Nô Xung Nam', TO_DATE('1990-06-04', 'YYYY-MM-DD'), 'MALE', 'emp307@company.com', '+84-936-767-171', 
    '846 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 19864227.29, 
    'BIDV', '3787751874'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP308', 'Hoàng Hữu Cường', TO_DATE('1988-03-18', 'YYYY-MM-DD'), 'MALE', 'emp308@company.com', '+84-944-973-314', 
    '570 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 42981722.75, 
    'ACB', '2878614034'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP309', 'Vũ Gia Sơn', TO_DATE('1991-03-08', 'YYYY-MM-DD'), 'MALE', 'emp309@company.com', '+84-922-943-589', 
    '666 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Điều phối viên', 44172497.07, 
    'ACB', '3989111541'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP310', 'Lê Kim Vy', TO_DATE('1987-05-18', 'YYYY-MM-DD'), 'FEMALE', 'emp310@company.com', '+84-971-861-673', 
    '335 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 48568938.96, 
    'ACB', '0712900743'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP311', 'Nguyễn Thái Tuấn', TO_DATE('1975-05-01', 'YYYY-MM-DD'), 'MALE', 'emp311@company.com', '+84-992-725-921', 
    '780 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 43788864.57, 
    'ACB', '1631835248'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP312', 'Phạm Thái Quý', TO_DATE('2002-07-11', 'YYYY-MM-DD'), 'MALE', 'emp312@company.com', '+84-923-446-414', 
    '353 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Điều phối viên', 26120795.68, 
    'Vietcombank', '5978703828'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP313', 'Võ Bích Linh', TO_DATE('2002-03-10', 'YYYY-MM-DD'), 'FEMALE', 'emp313@company.com', '+84-967-618-197', 
    '132 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Motion Designer', 31961144.64, 
    'TPBank', '6387171851'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP314', 'Phan Ánh Hoa', TO_DATE('1993-04-10', 'YYYY-MM-DD'), 'FEMALE', 'emp314@company.com', '+84-958-518-985', 
    '581 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 31670522.33, 
    'Vietcombank', '4734524777'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP315', 'Phạm Thị Vy', TO_DATE('1984-08-15', 'YYYY-MM-DD'), 'FEMALE', 'emp315@company.com', '+84-969-270-706', 
    '137 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 48984550.03, 
    'Vietcombank', '9900301010'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP316', 'Huỳnh Thái Trung', TO_DATE('1988-05-26', 'YYYY-MM-DD'), 'MALE', 'emp316@company.com', '+84-925-445-417', 
    '683 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 29879838.33, 
    'ACB', '1889534848'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP317', 'Trần Minh Hùng', TO_DATE('1986-04-11', 'YYYY-MM-DD'), 'MALE', 'emp317@company.com', '+84-994-455-485', 
    '259 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 16609096.64, 
    'MB Bank', '8739830446'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP318', 'Đặng Anh Bách', TO_DATE('1982-07-20', 'YYYY-MM-DD'), 'MALE', 'emp318@company.com', '+84-938-567-505', 
    '859 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 44082790.36, 
    'VPBank', '7985822040'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP319', 'Trần Công Khánh', TO_DATE('1993-03-02', 'YYYY-MM-DD'), 'MALE', 'emp319@company.com', '+84-991-360-620', 
    '650 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 48142248.44, 
    'VietinBank', '3854960171'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP320', 'Bùi Tuấn Dũng', TO_DATE('1979-12-22', 'YYYY-MM-DD'), 'MALE', 'emp320@company.com', '+84-989-573-579', 
    '490 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 33307003.45, 
    'Vietcombank', '3418747136'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP321', 'Hoàng Công Long', TO_DATE('1997-09-20', 'YYYY-MM-DD'), 'MALE', 'emp321@company.com', '+84-949-841-493', 
    '536 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 46672717.76, 
    'Techcombank', '5246043758'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP322', 'Hồ Hữu Việt', TO_DATE('1993-06-09', 'YYYY-MM-DD'), 'MALE', 'emp322@company.com', '+84-940-545-523', 
    '546 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 16731219.06, 
    'VietinBank', '4990798101'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP323', 'Vũ Ngọc Phong', TO_DATE('1980-06-25', 'YYYY-MM-DD'), 'MALE', 'emp323@company.com', '+84-968-646-205', 
    '270 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 34561200.12, 
    'MB Bank', '2895020459'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP324', 'Nguyễn Tuấn Quý', TO_DATE('1991-07-03', 'YYYY-MM-DD'), 'MALE', 'emp324@company.com', '+84-967-243-843', 
    '99 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 19007792.94, 
    'Sacombank', '7892551517'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP325', 'Võ Anh Phong', TO_DATE('1988-04-25', 'YYYY-MM-DD'), 'MALE', 'emp325@company.com', '+84-935-740-872', 
    '47 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 14052766.93, 
    'BIDV', '0100762149'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP326', 'Nguyễn Kim Ly', TO_DATE('1993-09-17', 'YYYY-MM-DD'), 'FEMALE', 'emp326@company.com', '+84-933-434-287', 
    '853 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 44144043.41, 
    'TPBank', '0550988023'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP327', 'Trần Văn Hùng', TO_DATE('1989-11-13', 'YYYY-MM-DD'), 'MALE', 'emp327@company.com', '+84-992-306-735', 
    '228 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 38919328.03, 
    'VietinBank', '4503504898'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP328', 'Bùi Lan Linh', TO_DATE('2001-08-22', 'YYYY-MM-DD'), 'FEMALE', 'emp328@company.com', '+84-949-899-620', 
    '657 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 13665049.28, 
    'MB Bank', '7463796567'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP329', 'Bùi Quỳnh Trang', TO_DATE('2001-01-02', 'YYYY-MM-DD'), 'FEMALE', 'emp329@company.com', '+84-924-447-658', 
    '158 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 30012333.72, 
    'ACB', '7007738047'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP330', 'Võ Văn Phong', TO_DATE('1979-05-17', 'YYYY-MM-DD'), 'MALE', 'emp330@company.com', '+84-958-230-298', 
    '581 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 39472900.44, 
    'VPBank', '6136827791'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP331', 'Lê Thành Tuấn', TO_DATE('1989-08-20', 'YYYY-MM-DD'), 'MALE', 'emp331@company.com', '+84-917-885-703', 
    '444 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 23289575.03, 
    'Vietcombank', '7080679820'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP332', 'Hồ Anh Quý', TO_DATE('1991-12-14', 'YYYY-MM-DD'), 'MALE', 'emp332@company.com', '+84-915-348-579', 
    '951 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 16525081.25, 
    'Sacombank', '0655245539'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP333', 'Dương Ánh Nhi', TO_DATE('1996-12-25', 'YYYY-MM-DD'), 'FEMALE', 'emp333@company.com', '+84-986-479-286', 
    '843 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 46212257.92, 
    'MB Bank', '3390403565'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP334', 'Nô Văn Quý', TO_DATE('1988-12-20', 'YYYY-MM-DD'), 'MALE', 'emp334@company.com', '+84-986-185-130', 
    '792 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 33994135.24, 
    'BIDV', '8638804579'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP335', 'Hồ Hồng Hương', TO_DATE('1976-08-26', 'YYYY-MM-DD'), 'FEMALE', 'emp335@company.com', '+84-914-558-769', 
    '362 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 37348050.33, 
    'VietinBank', '6271500050'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP336', 'Phạm Thành Việt', TO_DATE('1985-03-24', 'YYYY-MM-DD'), 'MALE', 'emp336@company.com', '+84-964-380-750', 
    '179 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 23106057.59, 
    'VietinBank', '7199479550'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP337', 'Trần Bích Vy', TO_DATE('1999-09-28', 'YYYY-MM-DD'), 'FEMALE', 'emp337@company.com', '+84-951-457-462', 
    '482 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 21495336.86, 
    'Techcombank', '7099981665'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP338', 'Vũ Lan Yến', TO_DATE('1997-07-14', 'YYYY-MM-DD'), 'FEMALE', 'emp338@company.com', '+84-943-435-526', 
    '103 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 22242489.75, 
    'MB Bank', '5778495590'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP339', 'Đặng Ngọc Long', TO_DATE('1987-05-23', 'YYYY-MM-DD'), 'MALE', 'emp339@company.com', '+84-988-486-594', 
    '785 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 38065028.37, 
    'ACB', '5733251780'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP340', 'Hoàng Thái Hiếu', TO_DATE('1979-04-05', 'YYYY-MM-DD'), 'MALE', 'emp340@company.com', '+84-972-784-484', 
    '374 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 41653546.74, 
    'Vietcombank', '6716575746'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP341', 'Bùi Thanh Nhi', TO_DATE('1990-06-02', 'YYYY-MM-DD'), 'FEMALE', 'emp341@company.com', '+84-949-283-464', 
    '134 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 31640559.43, 
    'TPBank', '8649980087'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP342', 'Đỗ Công Tuấn', TO_DATE('1997-05-20', 'YYYY-MM-DD'), 'MALE', 'emp342@company.com', '+84-952-828-752', 
    '298 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 18985948.30, 
    'MB Bank', '0113768474'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP343', 'Hoàng Anh Bách', TO_DATE('1977-12-04', 'YYYY-MM-DD'), 'MALE', 'emp343@company.com', '+84-983-585-696', 
    '142 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 27318597.25, 
    'ACB', '0174812515'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP344', 'Bùi Thanh Hương', TO_DATE('1977-01-16', 'YYYY-MM-DD'), 'FEMALE', 'emp344@company.com', '+84-991-784-536', 
    '240 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 29986271.16, 
    'TPBank', '0835231035'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP345', 'Nô Hồng Anh', TO_DATE('2002-04-01', 'YYYY-MM-DD'), 'FEMALE', 'emp345@company.com', '+84-985-640-132', 
    '176 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 18434101.88, 
    'ACB', '8879897624'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP346', 'Đỗ Ngọc Dũng', TO_DATE('2003-12-03', 'YYYY-MM-DD'), 'MALE', 'emp346@company.com', '+84-975-554-432', 
    '427 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 21795655.56, 
    'Vietcombank', '6640972267'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP347', 'Hồ Hữu Phúc', TO_DATE('1999-03-02', 'YYYY-MM-DD'), 'MALE', 'emp347@company.com', '+84-935-255-976', 
    '934 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 45469057.64, 
    'ACB', '1386033085'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP348', 'Hoàng Ánh Linh', TO_DATE('1999-07-23', 'YYYY-MM-DD'), 'FEMALE', 'emp348@company.com', '+84-983-720-531', 
    '815 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 32120762.56, 
    'MB Bank', '8690723239'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP349', 'Trần Mai Chi', TO_DATE('1999-06-06', 'YYYY-MM-DD'), 'FEMALE', 'emp349@company.com', '+84-993-785-536', 
    '791 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 36111560.65, 
    'ACB', '4764162300'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP350', 'Phạm Minh Dũng', TO_DATE('1988-08-25', 'YYYY-MM-DD'), 'MALE', 'emp350@company.com', '+84-986-728-229', 
    '997 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 24397790.60, 
    'Vietcombank', '7520763637'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP351', 'Hoàng Bảo Tuấn', TO_DATE('1997-03-25', 'YYYY-MM-DD'), 'MALE', 'emp351@company.com', '+84-917-876-371', 
    '952 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 20855238.17, 
    'VietinBank', '5766637967'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP352', 'Nô Hoàng Phúc', TO_DATE('1989-03-08', 'YYYY-MM-DD'), 'MALE', 'emp352@company.com', '+84-978-619-529', 
    '793 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 39886341.72, 
    'VPBank', '2957693904'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP353', 'Nô Quỳnh Hằng', TO_DATE('1995-03-12', 'YYYY-MM-DD'), 'FEMALE', 'emp353@company.com', '+84-921-686-657', 
    '278 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 46829827.94, 
    'Sacombank', '4905020245'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP354', 'Đỗ Hoàng Dũng', TO_DATE('1985-03-27', 'YYYY-MM-DD'), 'MALE', 'emp354@company.com', '+84-963-616-184', 
    '978 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 28838392.97, 
    'MB Bank', '4069604447'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP355', 'Phan Trinh Duyên', TO_DATE('1986-09-15', 'YYYY-MM-DD'), 'FEMALE', 'emp355@company.com', '+84-957-522-261', 
    '836 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 37361025.67, 
    'VietinBank', '0327083095'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP356', 'Nô Đức Sơn', TO_DATE('1985-05-22', 'YYYY-MM-DD'), 'MALE', 'emp356@company.com', '+84-910-972-359', 
    '12 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 27761273.29, 
    'MB Bank', '0648870835'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP357', 'Huỳnh Ngọc Cường', TO_DATE('2001-11-18', 'YYYY-MM-DD'), 'MALE', 'emp357@company.com', '+84-967-796-185', 
    '430 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 46202020.40, 
    'VietinBank', '2477539345'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP358', 'Đỗ Gia Bách', TO_DATE('1991-06-18', 'YYYY-MM-DD'), 'MALE', 'emp358@company.com', '+84-955-521-776', 
    '585 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 44273697.93, 
    'TPBank', '4398535288'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP359', 'Bùi Hữu Nam', TO_DATE('1997-04-02', 'YYYY-MM-DD'), 'MALE', 'emp359@company.com', '+84-970-389-512', 
    '769 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 14500236.31, 
    'VPBank', '5835169656'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP360', 'Hồ Mai Hằng', TO_DATE('2001-01-19', 'YYYY-MM-DD'), 'FEMALE', 'emp360@company.com', '+84-934-893-436', 
    '712 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 14523781.25, 
    'MB Bank', '6183775317'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP361', 'Võ Tuyết Chi', TO_DATE('1993-11-16', 'YYYY-MM-DD'), 'FEMALE', 'emp361@company.com', '+84-979-128-945', 
    '301 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 33750979.87, 
    'ACB', '1323289447'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP362', 'Trần Bảo Phúc', TO_DATE('1975-06-22', 'YYYY-MM-DD'), 'MALE', 'emp362@company.com', '+84-917-822-861', 
    '594 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 44082653.34, 
    'MB Bank', '2410120271'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP363', 'Bùi Ánh Loan', TO_DATE('1988-09-23', 'YYYY-MM-DD'), 'FEMALE', 'emp363@company.com', '+84-996-408-155', 
    '96 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Thư ký Ban Giám đốc', 21848727.01, 
    'Vietcombank', '9692067609'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP364', 'Lê Lan Vy', TO_DATE('1987-05-04', 'YYYY-MM-DD'), 'FEMALE', 'emp364@company.com', '+84-960-214-318', 
    '196 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 27297141.49, 
    'TPBank', '8071397712'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP365', 'Đỗ Thái Phong', TO_DATE('1982-09-25', 'YYYY-MM-DD'), 'MALE', 'emp365@company.com', '+84-984-428-312', 
    '781 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 38579644.25, 
    'TPBank', '4575808113'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP366', 'Lê Quỳnh Hương', TO_DATE('1975-12-04', 'YYYY-MM-DD'), 'FEMALE', 'emp366@company.com', '+84-975-423-374', 
    '942 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 18110220.11, 
    'BIDV', '3902523208'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP367', 'Phạm Gia Sơn', TO_DATE('1983-04-09', 'YYYY-MM-DD'), 'MALE', 'emp367@company.com', '+84-948-887-596', 
    '550 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 44302942.78, 
    'Techcombank', '0932538889'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP368', 'Võ Quang Quý', TO_DATE('2000-01-23', 'YYYY-MM-DD'), 'MALE', 'emp368@company.com', '+84-993-955-716', 
    '590 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 12106538.60, 
    'ACB', '4028021159'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP369', 'Võ Ngọc Loan', TO_DATE('2001-09-14', 'YYYY-MM-DD'), 'FEMALE', 'emp369@company.com', '+84-927-328-558', 
    '725 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 17853461.24, 
    'BIDV', '3252396348'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP370', 'Dương Kim Nhung', TO_DATE('1986-01-07', 'YYYY-MM-DD'), 'FEMALE', 'emp370@company.com', '+84-997-607-621', 
    '168 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 39423474.57, 
    'MB Bank', '3228632678'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP371', 'Nguyễn Hữu Việt', TO_DATE('1996-12-14', 'YYYY-MM-DD'), 'MALE', 'emp371@company.com', '+84-925-927-500', 
    '644 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 40861034.96, 
    'TPBank', '9547738576'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP372', 'Vũ Thái Sơn', TO_DATE('1996-02-12', 'YYYY-MM-DD'), 'MALE', 'emp372@company.com', '+84-946-239-680', 
    '457 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 20736359.50, 
    'Sacombank', '8632561548'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP373', 'Hồ Văn Khánh', TO_DATE('1990-03-15', 'YYYY-MM-DD'), 'MALE', 'emp373@company.com', '+84-920-168-904', 
    '537 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 30551528.30, 
    'Techcombank', '8216996702'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP374', 'Phan Tuyết Hoa', TO_DATE('1983-12-15', 'YYYY-MM-DD'), 'FEMALE', 'emp374@company.com', '+84-930-977-405', 
    '177 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 17371001.49, 
    'VPBank', '0505707457'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP375', 'Trần Anh Sơn', TO_DATE('1993-07-02', 'YYYY-MM-DD'), 'MALE', 'emp375@company.com', '+84-933-499-590', 
    '53 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 27474550.62, 
    'Techcombank', '8557986128'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP376', 'Bùi Trinh Yến', TO_DATE('1983-01-10', 'YYYY-MM-DD'), 'FEMALE', 'emp376@company.com', '+84-913-505-711', 
    '680 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 33321260.41, 
    'MB Bank', '8552883259'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP377', 'Dương Bích Loan', TO_DATE('1989-11-08', 'YYYY-MM-DD'), 'FEMALE', 'emp377@company.com', '+84-966-733-425', 
    '812 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 27579401.79, 
    'Techcombank', '1329731692'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP378', 'Phan Lan Duyên', TO_DATE('1982-03-09', 'YYYY-MM-DD'), 'FEMALE', 'emp378@company.com', '+84-923-848-134', 
    '895 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 37742153.35, 
    'ACB', '6856418371'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP379', 'Hồ Ngọc Nam', TO_DATE('1995-11-06', 'YYYY-MM-DD'), 'MALE', 'emp379@company.com', '+84-914-623-682', 
    '521 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 21022609.07, 
    'MB Bank', '6538837867'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP380', 'Bùi Lan Chi', TO_DATE('1987-02-11', 'YYYY-MM-DD'), 'FEMALE', 'emp380@company.com', '+84-983-437-887', 
    '758 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 33259459.92, 
    'MB Bank', '0000336135'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP381', 'Nô Tuấn Nam', TO_DATE('1978-04-11', 'YYYY-MM-DD'), 'MALE', 'emp381@company.com', '+84-961-569-743', 
    '959 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 49832699.26, 
    'Sacombank', '5438877770'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP382', 'Võ Kim Vy', TO_DATE('2001-01-09', 'YYYY-MM-DD'), 'FEMALE', 'emp382@company.com', '+84-996-704-181', 
    '158 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 15517038.26, 
    'Techcombank', '3757341992'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP383', 'Vũ Văn Nam', TO_DATE('1979-10-13', 'YYYY-MM-DD'), 'MALE', 'emp383@company.com', '+84-934-879-479', 
    '338 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 30018818.05, 
    'TPBank', '4824501975'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP384', 'Trần Thị Ly', TO_DATE('1983-05-20', 'YYYY-MM-DD'), 'FEMALE', 'emp384@company.com', '+84-973-457-202', 
    '835 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 20343517.32, 
    'VPBank', '7975636719'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP385', 'Võ Xung Sơn', TO_DATE('2001-08-25', 'YYYY-MM-DD'), 'MALE', 'emp385@company.com', '+84-994-457-152', 
    '390 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 27725167.18, 
    'MB Bank', '9665588999'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP386', 'Dương Đức Phong', TO_DATE('1999-04-10', 'YYYY-MM-DD'), 'MALE', 'emp386@company.com', '+84-975-271-445', 
    '518 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Thiết kế', 'Senior Designer', 36319400.61, 
    'Vietcombank', '5691831183'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP387', 'Phạm Thanh Vy', TO_DATE('1992-09-28', 'YYYY-MM-DD'), 'FEMALE', 'emp387@company.com', '+84-914-634-356', 
    '632 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 49033854.92, 
    'VietinBank', '4217622461'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP388', 'Nô Đức Trung', TO_DATE('1990-07-21', 'YYYY-MM-DD'), 'MALE', 'emp388@company.com', '+84-922-506-784', 
    '711 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 49117819.37, 
    'MB Bank', '4521960330'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP389', 'Dương Phương Linh', TO_DATE('1983-04-03', 'YYYY-MM-DD'), 'FEMALE', 'emp389@company.com', '+84-971-678-314', 
    '360 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 15983433.56, 
    'VietinBank', '3013808689'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP390', 'Bùi Anh Long', TO_DATE('1976-04-03', 'YYYY-MM-DD'), 'MALE', 'emp390@company.com', '+84-964-443-503', 
    '535 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 25958118.88, 
    'Sacombank', '7589000736'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP391', 'Phạm Thái Việt', TO_DATE('1985-04-11', 'YYYY-MM-DD'), 'MALE', 'emp391@company.com', '+84-915-329-101', 
    '74 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 44481348.86, 
    'VietinBank', '0181381425'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP392', 'Phạm Mai Hằng', TO_DATE('1990-03-17', 'YYYY-MM-DD'), 'FEMALE', 'emp392@company.com', '+84-997-700-663', 
    '172 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 29876076.15, 
    'BIDV', '8106523829'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP393', 'Huỳnh Bảo Nam', TO_DATE('1991-07-15', 'YYYY-MM-DD'), 'MALE', 'emp393@company.com', '+84-928-364-147', 
    '693 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 34703914.04, 
    'Techcombank', '8294035912'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP394', 'Phạm Gia Sơn', TO_DATE('1990-02-01', 'YYYY-MM-DD'), 'MALE', 'emp394@company.com', '+84-928-379-440', 
    '34 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 48890938.40, 
    'MB Bank', '9263890653'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP395', 'Hồ Gia Dũng', TO_DATE('1985-09-11', 'YYYY-MM-DD'), 'MALE', 'emp395@company.com', '+84-936-609-304', 
    '234 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 27196809.38, 
    'TPBank', '6657089038'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP396', 'Phan Bảo Tuấn', TO_DATE('1987-12-24', 'YYYY-MM-DD'), 'MALE', 'emp396@company.com', '+84-919-825-779', 
    '190 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 22642594.66, 
    'Vietcombank', '0337031238'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP397', 'Phan Công Trung', TO_DATE('2000-08-22', 'YYYY-MM-DD'), 'MALE', 'emp397@company.com', '+84-936-582-314', 
    '656 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 42929605.80, 
    'Techcombank', '2117669569'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP398', 'Đỗ Đức Khánh', TO_DATE('1984-03-19', 'YYYY-MM-DD'), 'MALE', 'emp398@company.com', '+84-949-125-291', 
    '931 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 29140256.79, 
    'VietinBank', '4718396628'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP399', 'Nô Hữu Tuấn', TO_DATE('1978-06-09', 'YYYY-MM-DD'), 'MALE', 'emp399@company.com', '+84-981-132-956', 
    '789 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 41428593.85, 
    'TPBank', '3090335617'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP400', 'Đặng Hữu Phúc', TO_DATE('1994-08-14', 'YYYY-MM-DD'), 'MALE', 'emp400@company.com', '+84-950-834-397', 
    '130 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 20108625.53, 
    'ACB', '6403358718'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP401', 'Đặng Ngọc Thảo', TO_DATE('2001-08-13', 'YYYY-MM-DD'), 'FEMALE', 'emp401@company.com', '+84-978-146-273', 
    '437 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'HRBP', 18129697.42, 
    'MB Bank', '3875044349'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP402', 'Phạm Xung Việt', TO_DATE('1980-01-26', 'YYYY-MM-DD'), 'MALE', 'emp402@company.com', '+84-953-949-943', 
    '105 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 36101398.72, 
    'TPBank', '8501216269'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP403', 'Bùi Tuyết Ly', TO_DATE('1999-10-25', 'YYYY-MM-DD'), 'FEMALE', 'emp403@company.com', '+84-936-628-438', 
    '627 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 44112222.12, 
    'MB Bank', '3938318450'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP404', 'Nguyễn Hồng Trang', TO_DATE('1996-05-18', 'YYYY-MM-DD'), 'FEMALE', 'emp404@company.com', '+84-927-208-388', 
    '742 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 38729407.58, 
    'VPBank', '4375926516'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP405', 'Phạm Thu Ly', TO_DATE('1979-10-04', 'YYYY-MM-DD'), 'FEMALE', 'emp405@company.com', '+84-924-658-409', 
    '112 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 19309633.48, 
    'ACB', '2090894453'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP406', 'Vũ Văn Khánh', TO_DATE('1991-01-12', 'YYYY-MM-DD'), 'MALE', 'emp406@company.com', '+84-993-740-702', 
    '711 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 26763509.98, 
    'Sacombank', '2275417140'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP407', 'Võ Thu Duyên', TO_DATE('1984-07-28', 'YYYY-MM-DD'), 'FEMALE', 'emp407@company.com', '+84-957-502-133', 
    '119 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 41207551.64, 
    'MB Bank', '0508513303'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP408', 'Phạm Quỳnh Duyên', TO_DATE('1992-02-22', 'YYYY-MM-DD'), 'FEMALE', 'emp408@company.com', '+84-952-923-715', 
    '55 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 14769989.62, 
    'Vietcombank', '7502782011'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP409', 'Phạm Quỳnh Hoa', TO_DATE('1989-07-13', 'YYYY-MM-DD'), 'FEMALE', 'emp409@company.com', '+84-983-459-295', 
    '668 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 34862430.86, 
    'Techcombank', '2317462968'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP410', 'Hoàng Tuyết Trang', TO_DATE('1983-01-12', 'YYYY-MM-DD'), 'FEMALE', 'emp410@company.com', '+84-965-507-837', 
    '203 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Content Creator', 44483665.95, 
    'TPBank', '1052858007'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP411', 'Bùi Tuyết Loan', TO_DATE('1994-02-18', 'YYYY-MM-DD'), 'FEMALE', 'emp411@company.com', '+84-921-441-932', 
    '169 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 14001030.25, 
    'Sacombank', '9865975229'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP412', 'Vũ Tuyết Trang', TO_DATE('1980-12-25', 'YYYY-MM-DD'), 'FEMALE', 'emp412@company.com', '+84-978-871-798', 
    '277 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 40596839.83, 
    'Sacombank', '4417378756'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP413', 'Lê Phương Hoa', TO_DATE('1982-05-26', 'YYYY-MM-DD'), 'FEMALE', 'emp413@company.com', '+84-964-343-172', 
    '135 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'HRBP', 15633809.53, 
    'Techcombank', '0321496354'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP414', 'Đỗ Phương Hương', TO_DATE('1976-03-12', 'YYYY-MM-DD'), 'FEMALE', 'emp414@company.com', '+84-916-704-857', 
    '450 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 15550887.34, 
    'BIDV', '3767276758'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP415', 'Hoàng Quỳnh Hằng', TO_DATE('1993-12-11', 'YYYY-MM-DD'), 'FEMALE', 'emp415@company.com', '+84-970-602-527', 
    '679 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Brand Manager', 14613427.24, 
    'VietinBank', '6607352428'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP416', 'Hoàng Kim Linh', TO_DATE('1985-01-25', 'YYYY-MM-DD'), 'FEMALE', 'emp416@company.com', '+84-969-914-729', 
    '790 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 40632233.83, 
    'Techcombank', '1125234208'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP417', 'Huỳnh Thành Cường', TO_DATE('1993-05-23', 'YYYY-MM-DD'), 'MALE', 'emp417@company.com', '+84-926-171-516', 
    '624 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'HRBP', 42447711.93, 
    'MB Bank', '3862336037'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP418', 'Huỳnh Thái Quý', TO_DATE('1991-02-22', 'YYYY-MM-DD'), 'MALE', 'emp418@company.com', '+84-955-381-639', 
    '204 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 37570413.09, 
    'BIDV', '3433809165'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP419', 'Phan Tuyết Chi', TO_DATE('2001-07-26', 'YYYY-MM-DD'), 'FEMALE', 'emp419@company.com', '+84-939-874-749', 
    '912 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 39755502.61, 
    'Sacombank', '7152841180'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP420', 'Huỳnh Gia Cường', TO_DATE('1978-12-06', 'YYYY-MM-DD'), 'MALE', 'emp420@company.com', '+84-915-128-512', 
    '514 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 38006316.89, 
    'Sacombank', '8476585577'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP421', 'Trần Tuấn Quý', TO_DATE('1993-10-21', 'YYYY-MM-DD'), 'MALE', 'emp421@company.com', '+84-922-801-329', 
    '372 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 31672002.90, 
    'VPBank', '7051072323'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP422', 'Đặng Diệu Chi', TO_DATE('1981-03-17', 'YYYY-MM-DD'), 'FEMALE', 'emp422@company.com', '+84-951-292-940', 
    '77 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Content Creator', 31734715.91, 
    'TPBank', '0478423188'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP423', 'Nguyễn Xung Việt', TO_DATE('1977-12-26', 'YYYY-MM-DD'), 'MALE', 'emp423@company.com', '+84-946-416-609', 
    '184 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 42490605.79, 
    'Techcombank', '6767249850'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP424', 'Trần Tuyết Hương', TO_DATE('2003-03-15', 'YYYY-MM-DD'), 'FEMALE', 'emp424@company.com', '+84-974-656-194', 
    '591 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 17806398.93, 
    'VietinBank', '0866272544'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP425', 'Dương Lan Chi', TO_DATE('2001-12-06', 'YYYY-MM-DD'), 'FEMALE', 'emp425@company.com', '+84-955-239-381', 
    '299 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Brand Manager', 16266331.86, 
    'MB Bank', '4307662161'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP426', 'Lê Bích Vy', TO_DATE('1997-11-21', 'YYYY-MM-DD'), 'FEMALE', 'emp426@company.com', '+84-993-682-860', 
    '792 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 19450164.37, 
    'MB Bank', '5281290778'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP427', 'Lê Xung Trung', TO_DATE('1983-08-27', 'YYYY-MM-DD'), 'MALE', 'emp427@company.com', '+84-913-398-494', 
    '568 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 19766377.32, 
    'Techcombank', '0349269509'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP428', 'Bùi Tuyết Ly', TO_DATE('1980-11-11', 'YYYY-MM-DD'), 'FEMALE', 'emp428@company.com', '+84-928-585-153', 
    '280 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 48339119.86, 
    'Sacombank', '9853080625'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP429', 'Vũ Anh Việt', TO_DATE('1999-08-22', 'YYYY-MM-DD'), 'MALE', 'emp429@company.com', '+84-947-631-366', 
    '759 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Digital Marketing', 44878108.36, 
    'Techcombank', '4357481105'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP430', 'Vũ Ngọc Việt', TO_DATE('1992-12-16', 'YYYY-MM-DD'), 'MALE', 'emp430@company.com', '+84-969-831-462', 
    '823 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Digital Marketing', 20289074.95, 
    'ACB', '3697204195'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP431', 'Huỳnh Hữu Nam', TO_DATE('1978-11-18', 'YYYY-MM-DD'), 'MALE', 'emp431@company.com', '+84-951-402-761', 
    '781 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 39677082.46, 
    'MB Bank', '4628033277'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP432', 'Phan Thu Trang', TO_DATE('1983-02-01', 'YYYY-MM-DD'), 'FEMALE', 'emp432@company.com', '+84-931-670-542', 
    '906 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 12143449.92, 
    'TPBank', '3600786423'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP433', 'Bùi Thành Khánh', TO_DATE('2000-11-19', 'YYYY-MM-DD'), 'MALE', 'emp433@company.com', '+84-933-219-925', 
    '842 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Tài chính - Kế toán', 'Chuyên viên Phân tích Tài chính', 24824377.76, 
    'ACB', '6065714913'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP434', 'Phạm Thành Khánh', TO_DATE('1987-02-07', 'YYYY-MM-DD'), 'MALE', 'emp434@company.com', '+84-976-277-457', 
    '637 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 42378216.38, 
    'Techcombank', '7170487919'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP435', 'Đỗ Anh Hiếu', TO_DATE('1986-09-03', 'YYYY-MM-DD'), 'MALE', 'emp435@company.com', '+84-919-721-135', 
    '326 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 47061169.88, 
    'ACB', '8906690128'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP436', 'Đỗ Trinh Hương', TO_DATE('1980-07-28', 'YYYY-MM-DD'), 'FEMALE', 'emp436@company.com', '+84-956-537-552', 
    '652 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Phần mềm', 32659700.78, 
    'Vietcombank', '7833970083'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP437', 'Nguyễn Công Trung', TO_DATE('1989-05-22', 'YYYY-MM-DD'), 'MALE', 'emp437@company.com', '+84-993-939-142', 
    '502 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 42768353.51, 
    'Sacombank', '0866807325'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP438', 'Phạm Ngọc Sơn', TO_DATE('1990-01-06', 'YYYY-MM-DD'), 'MALE', 'emp438@company.com', '+84-932-588-317', 
    '751 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 39570185.44, 
    'MB Bank', '9336607487'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP439', 'Lý Thu Thảo', TO_DATE('1995-02-09', 'YYYY-MM-DD'), 'FEMALE', 'emp439@company.com', '+84-911-487-947', 
    '91 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Senior Designer', 13228915.67, 
    'VPBank', '1279542502'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP440', 'Bùi Đức Phúc', TO_DATE('1981-05-26', 'YYYY-MM-DD'), 'MALE', 'emp440@company.com', '+84-950-554-598', 
    '794 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 17018756.41, 
    'Vietcombank', '0158018436'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP441', 'Hồ Đức Bách', TO_DATE('1998-11-01', 'YYYY-MM-DD'), 'MALE', 'emp441@company.com', '+84-946-659-445', 
    '98 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 44634987.99, 
    'VPBank', '5919513029'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP442', 'Phan Tuyết Thảo', TO_DATE('1979-06-28', 'YYYY-MM-DD'), 'FEMALE', 'emp442@company.com', '+84-941-778-438', 
    '475 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 25902595.08, 
    'Sacombank', '5197809414'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP443', 'Lý Mai Hương', TO_DATE('1981-02-12', 'YYYY-MM-DD'), 'FEMALE', 'emp443@company.com', '+84-922-483-798', 
    '634 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 49554833.46, 
    'Techcombank', '3262491925'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP444', 'Phan Bảo Bách', TO_DATE('1978-12-07', 'YYYY-MM-DD'), 'MALE', 'emp444@company.com', '+84-942-595-800', 
    '743 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 44384355.04, 
    'MB Bank', '3974404866'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP445', 'Hồ Trinh Anh', TO_DATE('2001-08-27', 'YYYY-MM-DD'), 'FEMALE', 'emp445@company.com', '+84-973-266-411', 
    '792 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 31596603.94, 
    'Techcombank', '4716061620'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP446', 'Vũ Thanh Anh', TO_DATE('1994-07-28', 'YYYY-MM-DD'), 'FEMALE', 'emp446@company.com', '+84-966-696-751', 
    '996 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Trưởng phòng Nhân sự', 32664480.84, 
    'Techcombank', '3634591102'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP447', 'Vũ Hữu Sơn', TO_DATE('1995-08-25', 'YYYY-MM-DD'), 'MALE', 'emp447@company.com', '+84-944-914-582', 
    '382 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 20492877.69, 
    'VietinBank', '9064356041'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP448', 'Hoàng Bảo Nam', TO_DATE('1990-01-27', 'YYYY-MM-DD'), 'MALE', 'emp448@company.com', '+84-951-152-946', 
    '132 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Content Creator', 43909155.16, 
    'VietinBank', '4658796466'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP449', 'Trần Văn Phúc', TO_DATE('1994-02-17', 'YYYY-MM-DD'), 'MALE', 'emp449@company.com', '+84-982-941-885', 
    '101 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 35481513.60, 
    'Vietcombank', '4099239127'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP450', 'Phạm Quang Cường', TO_DATE('1978-02-16', 'YYYY-MM-DD'), 'MALE', 'emp450@company.com', '+84-919-468-399', 
    '566 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 48455858.75, 
    'TPBank', '6964600362'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP451', 'Võ Đức Quý', TO_DATE('1981-08-13', 'YYYY-MM-DD'), 'MALE', 'emp451@company.com', '+84-958-648-659', 
    '878 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Warehouse Supervisor', 17067035.27, 
    'BIDV', '0852266830'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP452', 'Đặng Ngọc Long', TO_DATE('1993-03-16', 'YYYY-MM-DD'), 'MALE', 'emp452@company.com', '+84-959-327-423', 
    '557 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư QA', 26305331.00, 
    'Sacombank', '1534823006'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP453', 'Đặng Anh Dũng', TO_DATE('1978-09-20', 'YYYY-MM-DD'), 'MALE', 'emp453@company.com', '+84-970-602-520', 
    '153 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 49631707.20, 
    'VPBank', '0631440203'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP454', 'Huỳnh Văn Bách', TO_DATE('2001-12-10', 'YYYY-MM-DD'), 'MALE', 'emp454@company.com', '+84-942-805-464', 
    '721 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 35852485.52, 
    'Techcombank', '6496791048'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP455', 'Vũ Bảo Cường', TO_DATE('1981-05-13', 'YYYY-MM-DD'), 'MALE', 'emp455@company.com', '+84-927-338-471', 
    '308 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 43800980.87, 
    'Vietcombank', '0411642472'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP456', 'Đặng Lan Hương', TO_DATE('1988-04-02', 'YYYY-MM-DD'), 'FEMALE', 'emp456@company.com', '+84-922-157-156', 
    '780 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Logistics', 'Điều phối viên', 15801563.92, 
    'Vietcombank', '1466712013'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP457', 'Nô Minh Phúc', TO_DATE('2001-08-11', 'YYYY-MM-DD'), 'MALE', 'emp457@company.com', '+84-989-198-449', 
    '477 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 24337367.62, 
    'ACB', '3508711037'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP458', 'Đặng Thị Nhung', TO_DATE('1978-07-21', 'YYYY-MM-DD'), 'FEMALE', 'emp458@company.com', '+84-938-125-309', 
    '71 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Nghiên cứu viên', 49320920.88, 
    'MB Bank', '3875141900'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP459', 'Võ Gia Tuấn', TO_DATE('1982-09-24', 'YYYY-MM-DD'), 'MALE', 'emp459@company.com', '+84-977-439-141', 
    '316 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 42887547.32, 
    'Vietcombank', '3333293090'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP460', 'Bùi Ánh Yến', TO_DATE('1986-01-04', 'YYYY-MM-DD'), 'FEMALE', 'emp460@company.com', '+84-992-683-244', 
    '232 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Nhân sự', 'Chuyên viên Đào tạo', 47598842.08, 
    'TPBank', '8031316122'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP461', 'Nguyễn Bảo Dũng', TO_DATE('1980-06-13', 'YYYY-MM-DD'), 'MALE', 'emp461@company.com', '+84-959-761-875', 
    '202 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Kỹ sư Hệ thống', 34947550.61, 
    'BIDV', '5791606762'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP462', 'Hồ Trinh Hoa', TO_DATE('1985-10-17', 'YYYY-MM-DD'), 'FEMALE', 'emp462@company.com', '+84-970-852-734', 
    '343 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 19988146.52, 
    'Vietcombank', '2384097963'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP463', 'Nô Thái Trung', TO_DATE('1991-03-03', 'YYYY-MM-DD'), 'MALE', 'emp463@company.com', '+84-953-413-912', 
    '595 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 17989921.02, 
    'Sacombank', '6690009693'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP464', 'Vũ Thành Tuấn', TO_DATE('2003-02-22', 'YYYY-MM-DD'), 'MALE', 'emp464@company.com', '+84-967-937-309', 
    '359 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 23953945.75, 
    'VietinBank', '4158821048'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP465', 'Dương Kim Nhi', TO_DATE('1979-02-09', 'YYYY-MM-DD'), 'FEMALE', 'emp465@company.com', '+84-935-492-538', 
    '34 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 36624810.02, 
    'VietinBank', '1057334008'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP466', 'Huỳnh Gia Trung', TO_DATE('2000-06-04', 'YYYY-MM-DD'), 'MALE', 'emp466@company.com', '+84-920-640-747', 
    '719 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kỹ thuật', 'Trưởng phòng Kỹ thuật', 45216663.70, 
    'Sacombank', '2267505685'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP467', 'Võ Trinh Trang', TO_DATE('1995-05-03', 'YYYY-MM-DD'), 'FEMALE', 'emp467@company.com', '+84-967-625-761', 
    '645 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 20034898.58, 
    'Techcombank', '9566256810'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP468', 'Hoàng Mai Yến', TO_DATE('1989-05-05', 'YYYY-MM-DD'), 'FEMALE', 'emp468@company.com', '+84-942-661-881', 
    '829 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'Chuyên viên Nhân sự', 43268954.93, 
    'VPBank', '0408856640'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP469', 'Trần Mai Trang', TO_DATE('1982-11-05', 'YYYY-MM-DD'), 'FEMALE', 'emp469@company.com', '+84-944-655-621', 
    '376 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 48284383.94, 
    'ACB', '9352095788'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP470', 'Vũ Hoàng Trung', TO_DATE('1997-08-05', 'YYYY-MM-DD'), 'MALE', 'emp470@company.com', '+84-993-998-186', 
    '574 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 48377980.84, 
    'MB Bank', '0526411602'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP471', 'Phạm Quỳnh Chi', TO_DATE('1991-08-22', 'YYYY-MM-DD'), 'FEMALE', 'emp471@company.com', '+84-914-688-390', 
    '247 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 17246848.99, 
    'Sacombank', '9406422228'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP472', 'Hoàng Mai Hằng', TO_DATE('1980-04-13', 'YYYY-MM-DD'), 'FEMALE', 'emp472@company.com', '+84-992-141-458', 
    '552 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán trưởng', 32070719.20, 
    'VietinBank', '1882945945'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP473', 'Hồ Bảo Bách', TO_DATE('1992-11-09', 'YYYY-MM-DD'), 'MALE', 'emp473@company.com', '+84-954-258-269', 
    '282 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Product Researcher', 48103573.17, 
    'Techcombank', '9907284932'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP474', 'Lê Hoàng Hùng', TO_DATE('1984-02-25', 'YYYY-MM-DD'), 'MALE', 'emp474@company.com', '+84-918-182-201', 
    '118 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Chuyên viên Bảo mật', 20535405.10, 
    'VietinBank', '4197111074'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP475', 'Trần Ngọc Sơn', TO_DATE('1984-12-09', 'YYYY-MM-DD'), 'MALE', 'emp475@company.com', '+84-976-516-946', 
    '235 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 49782689.55, 
    'BIDV', '1825660608'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP476', 'Dương Quỳnh Duyên', TO_DATE('1989-05-12', 'YYYY-MM-DD'), 'FEMALE', 'emp476@company.com', '+84-918-195-303', 
    '559 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Nghiên cứu & Phát triển', 'Chuyên viên R&D', 49786809.65, 
    'MB Bank', '3417222205'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP477', 'Dương Phương Nhi', TO_DATE('2002-10-19', 'YYYY-MM-DD'), 'FEMALE', 'emp477@company.com', '+84-912-311-928', 
    '135 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 27053784.36, 
    'TPBank', '1983327763'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP478', 'Đỗ Trinh Anh', TO_DATE('1998-04-24', 'YYYY-MM-DD'), 'FEMALE', 'emp478@company.com', '+84-988-835-486', 
    '434 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Nhân sự', 'HRBP', 49035455.64, 
    'Sacombank', '8355952743'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP479', 'Hoàng Đức Việt', TO_DATE('1979-11-11', 'YYYY-MM-DD'), 'MALE', 'emp479@company.com', '+84-965-877-276', 
    '371 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 34591141.68, 
    'Vietcombank', '6245242956'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP480', 'Hoàng Phương Anh', TO_DATE('2001-08-19', 'YYYY-MM-DD'), 'FEMALE', 'emp480@company.com', '+84-946-413-196', 
    '425 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Trợ lý Giám đốc', 25794848.72, 
    'VietinBank', '7469567911'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP481', 'Đỗ Bích Duyên', TO_DATE('1977-08-22', 'YYYY-MM-DD'), 'FEMALE', 'emp481@company.com', '+84-915-699-976', 
    '557 Đường Nguyễn Trãi, Quận Bình Thạnh, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Trưởng phòng Thiết kế', 13328224.13, 
    'MB Bank', '7119110081'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP482', 'Lê Tuyết Nhung', TO_DATE('1991-09-12', 'YYYY-MM-DD'), 'FEMALE', 'emp482@company.com', '+84-995-282-563', 
    '487 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 31286005.33, 
    'VPBank', '2889705675'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP483', 'Phạm Bích Ly', TO_DATE('1997-10-11', 'YYYY-MM-DD'), 'FEMALE', 'emp483@company.com', '+84-969-191-645', 
    '77 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 41205197.25, 
    'Techcombank', '1856568389'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP484', 'Hồ Phương Hương', TO_DATE('1992-08-19', 'YYYY-MM-DD'), 'FEMALE', 'emp484@company.com', '+84-915-541-499', 
    '204 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Account Executive', 13742919.59, 
    'Techcombank', '5602634638'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP485', 'Bùi Thu Vy', TO_DATE('1988-06-04', 'YYYY-MM-DD'), 'FEMALE', 'emp485@company.com', '+84-917-341-921', 
    '176 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Logistics', 'Nhân viên Logistics', 12807141.53, 
    'VietinBank', '1625492901'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP486', 'Hoàng Mai Thảo', TO_DATE('1980-09-09', 'YYYY-MM-DD'), 'FEMALE', 'emp486@company.com', '+84-912-635-535', 
    '275 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 15628223.73, 
    'BIDV', '8456974767'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP487', 'Phạm Ánh Trang', TO_DATE('1998-06-10', 'YYYY-MM-DD'), 'FEMALE', 'emp487@company.com', '+84-942-653-759', 
    '311 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 33164553.20, 
    'Vietcombank', '2325488896'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP488', 'Bùi Bích Hương', TO_DATE('2001-03-13', 'YYYY-MM-DD'), 'FEMALE', 'emp488@company.com', '+84-960-516-753', 
    '638 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'FULL_TIME', 'Phòng Marketing', 'Trưởng phòng Marketing', 15360764.32, 
    'TPBank', '2733741123'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP489', 'Huỳnh Thái Khánh', TO_DATE('2001-06-11', 'YYYY-MM-DD'), 'MALE', 'emp489@company.com', '+84-960-540-549', 
    '45 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Công nghệ thông tin', 'Quản trị Hệ thống', 19122423.49, 
    'TPBank', '6891244304'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP490', 'Lý Thanh Loan', TO_DATE('2003-01-05', 'YYYY-MM-DD'), 'FEMALE', 'emp490@company.com', '+84-974-464-123', 
    '152 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'PART_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 32631781.95, 
    'ACB', '8033994645'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP491', 'Lê Tuấn Trung', TO_DATE('1983-04-24', 'YYYY-MM-DD'), 'MALE', 'emp491@company.com', '+84-937-292-896', 
    '299 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Motion Designer', 31314357.05, 
    'Sacombank', '8062398790'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP492', 'Phạm Bảo Phúc', TO_DATE('1992-06-24', 'YYYY-MM-DD'), 'MALE', 'emp492@company.com', '+84-962-637-989', 
    '67 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 30467015.07, 
    'VietinBank', '7498629534'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP493', 'Phạm Diệu Hương', TO_DATE('1994-07-25', 'YYYY-MM-DD'), 'FEMALE', 'emp493@company.com', '+84-924-544-245', 
    '832 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Kỹ sư Mạng', 40735001.01, 
    'Vietcombank', '2376978682'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP494', 'Nguyễn Thành Quý', TO_DATE('1978-02-14', 'YYYY-MM-DD'), 'MALE', 'emp494@company.com', '+84-986-441-765', 
    '284 Đường Nguyễn Trãi, Quận Tân Bình, TP.HCM', 'PART_TIME', 'Phòng Marketing', 'Content Creator', 28391728.06, 
    'TPBank', '3081529002'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP495', 'Nguyễn Minh Sơn', TO_DATE('1983-04-13', 'YYYY-MM-DD'), 'MALE', 'emp495@company.com', '+84-980-721-967', 
    '120 Đường Nguyễn Trãi, Quận 1, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Trưởng phòng Kinh doanh', 13522098.27, 
    'BIDV', '8077964915'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP496', 'Bùi Thu Ly', TO_DATE('1997-03-22', 'YYYY-MM-DD'), 'FEMALE', 'emp496@company.com', '+84-932-735-179', 
    '714 Đường Nguyễn Trãi, Quận 3, TP.HCM', 'FULL_TIME', 'Phòng Công nghệ thông tin', 'Database Administrator', 47195112.76, 
    'BIDV', '6203310973'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP497', 'Lý Công Phong', TO_DATE('1997-10-04', 'YYYY-MM-DD'), 'MALE', 'emp497@company.com', '+84-911-273-498', 
    '289 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 35196036.15, 
    'VPBank', '8760025663'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP498', 'Đỗ Công Long', TO_DATE('1989-03-06', 'YYYY-MM-DD'), 'MALE', 'emp498@company.com', '+84-998-598-361', 
    '529 Đường Nguyễn Trãi, Quận 7, TP.HCM', 'PART_TIME', 'Phòng Tài chính - Kế toán', 'Kế toán viên', 39445315.92, 
    'MB Bank', '4936253552'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP499', 'Nguyễn Tuấn Phong', TO_DATE('1981-01-14', 'YYYY-MM-DD'), 'MALE', 'emp499@company.com', '+84-949-471-332', 
    '966 Đường Nguyễn Trãi, Quận 5, TP.HCM', 'FULL_TIME', 'Phòng Kinh doanh', 'Chuyên viên Kinh doanh', 37877597.18, 
    'TPBank', '2870007610'
);
INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'EMP500', 'Đỗ Thị Thảo', TO_DATE('2003-04-13', 'YYYY-MM-DD'), 'FEMALE', 'emp500@company.com', '+84-950-956-103', 
    '338 Đường Nguyễn Trãi, Quận Phú Nhuận, TP.HCM', 'FULL_TIME', 'Phòng Thiết kế', 'Chuyên viên UI/UX', 36430151.92, 
    'VPBank', '8520574431'
);

-- 3. Insert Tài khoản (user_accounts)
-- Password mặc định: admin123 -> Hash BCrypt: $2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK
INSERT INTO user_accounts (employee_id, password, role) VALUES ('ADMIN001', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_ADMIN');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP001', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP002', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP003', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP004', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP005', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP006', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP007', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP008', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP009', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP010', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP011', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP012', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP013', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP014', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP015', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP016', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP017', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP018', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP019', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP020', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP021', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP022', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP023', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP024', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP025', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP026', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP027', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP028', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP029', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP030', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP031', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP032', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP033', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP034', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP035', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP036', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP037', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP038', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP039', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP040', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP041', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP042', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP043', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP044', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP045', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP046', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP047', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP048', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP049', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP050', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP051', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP052', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP053', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP054', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP055', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP056', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP057', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP058', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP059', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP060', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP061', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP062', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP063', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP064', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP065', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP066', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP067', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP068', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP069', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP070', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP071', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP072', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP073', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP074', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP075', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP076', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP077', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP078', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP079', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP080', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP081', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP082', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP083', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP084', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP085', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP086', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP087', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP088', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP089', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP090', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP091', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP092', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP093', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP094', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP095', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP096', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP097', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP098', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP099', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP100', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP101', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP102', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP103', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP104', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP105', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP106', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP107', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP108', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP109', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP110', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP111', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP112', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP113', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP114', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP115', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP116', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP117', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP118', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP119', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP120', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP121', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP122', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP123', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP124', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP125', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP126', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP127', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP128', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP129', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP130', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP131', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP132', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP133', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP134', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP135', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP136', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP137', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP138', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP139', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP140', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP141', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP142', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP143', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP144', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP145', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP146', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP147', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP148', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP149', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP150', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP151', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP152', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP153', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP154', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP155', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP156', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP157', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP158', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP159', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP160', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP161', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP162', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP163', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP164', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP165', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP166', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP167', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP168', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP169', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP170', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP171', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP172', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP173', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP174', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP175', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP176', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP177', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP178', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP179', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP180', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP181', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP182', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP183', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP184', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP185', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP186', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP187', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP188', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP189', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP190', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP191', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP192', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP193', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP194', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP195', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP196', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP197', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP198', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP199', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP200', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP201', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP202', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP203', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP204', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP205', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP206', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP207', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP208', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP209', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP210', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP211', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP212', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP213', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP214', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP215', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP216', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP217', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP218', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP219', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP220', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP221', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP222', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP223', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP224', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP225', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP226', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP227', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP228', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP229', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP230', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP231', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP232', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP233', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP234', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP235', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP236', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP237', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP238', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP239', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP240', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP241', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP242', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP243', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP244', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP245', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP246', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP247', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP248', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP249', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP250', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP251', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP252', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP253', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP254', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP255', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP256', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP257', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP258', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP259', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP260', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP261', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP262', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP263', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP264', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP265', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP266', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP267', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP268', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP269', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP270', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP271', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP272', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP273', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP274', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP275', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP276', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP277', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP278', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP279', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP280', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP281', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP282', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP283', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP284', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP285', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP286', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP287', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP288', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP289', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP290', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP291', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP292', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP293', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP294', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP295', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP296', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP297', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP298', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP299', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP300', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP301', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP302', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP303', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP304', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP305', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP306', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP307', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP308', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP309', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP310', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP311', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP312', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP313', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP314', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP315', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP316', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP317', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP318', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP319', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP320', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP321', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP322', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP323', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP324', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP325', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP326', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP327', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP328', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP329', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP330', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP331', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP332', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP333', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP334', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP335', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP336', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP337', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP338', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP339', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP340', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP341', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP342', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP343', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP344', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP345', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP346', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP347', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP348', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP349', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP350', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP351', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP352', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP353', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP354', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP355', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP356', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP357', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP358', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP359', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP360', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP361', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP362', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP363', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP364', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP365', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP366', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP367', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP368', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP369', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP370', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP371', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP372', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP373', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP374', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP375', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP376', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP377', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP378', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP379', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP380', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP381', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP382', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP383', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP384', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP385', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP386', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP387', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP388', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP389', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP390', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP391', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP392', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP393', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP394', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP395', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP396', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP397', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP398', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP399', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP400', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP401', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP402', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP403', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP404', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP405', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP406', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP407', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP408', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP409', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP410', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP411', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP412', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP413', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP414', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP415', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP416', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP417', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP418', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP419', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP420', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP421', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP422', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP423', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP424', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP425', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP426', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP427', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP428', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP429', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP430', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP431', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP432', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP433', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP434', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP435', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP436', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP437', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP438', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP439', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP440', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP441', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP442', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP443', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP444', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP445', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP446', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP447', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP448', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP449', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP450', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP451', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP452', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP453', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP454', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP455', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP456', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP457', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP458', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP459', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP460', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP461', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP462', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP463', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP464', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP465', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP466', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP467', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP468', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP469', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP470', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP471', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP472', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP473', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP474', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP475', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP476', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP477', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP478', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP479', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP480', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP481', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP482', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP483', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP484', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP485', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP486', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP487', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP488', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP489', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP490', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP491', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP492', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP493', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP494', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP495', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP496', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP497', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP498', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP499', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');
INSERT INTO user_accounts (employee_id, password, role) VALUES ('EMP500', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');

-- 4. Insert Dự án (28 projects)
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ001', 'Hệ thống HRM nội bộ v2.0', 'Nâng cấp phân hệ quản lý nhân sự, chấm công, tính lương và đánh giá hiệu suất.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ002', 'Website Thương mại Điện tử B2C', 'Thiết kế và phát triển website bán lẻ online cho đối tác chiến lược.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ003', 'Ứng dụng Mobile App Nội bộ', 'Xây dựng app mobile cho nhân viên: chấm công, xin nghỉ, xem lương, task.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ004', 'Hạ tầng Cloud Migration', 'Chuyển đổi hệ thống on-premise sang AWS/GCP, tối ưu chi phí và bảo mật.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ005', 'Hệ thống CI/CD & DevOps', 'Xây dựng pipeline CI/CD, monitoring, logging cho toàn bộ sản phẩm.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ006', 'Nâng cấp Bảo mật Hệ thống', 'Audit bảo mật, triển khai WAF, 2FA, mã hóa dữ liệu nhạy cảm.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ007', 'Redesign Brand Identity 2026', 'Làm mới bộ nhận diện thương hiệu: logo, màu sắc, guideline, template.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ008', 'UI Kit & Design System', 'Xây dựng Design System và component library dùng chung cho các sản phẩm.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ009', 'Chiến dịch Marketing Q3 2026', 'Campaign quảng cáo digital + content cho ra mắt sản phẩm mới.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ010', 'Mở rộng Thị trường Miền Trung', 'Mở văn phòng đại diện và phát triển đối tác tại Đà Nẵng, Huế.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ011', 'Chương trình Loyalty Khách hàng', 'Xây dựng hệ thống tích điểm, voucher và chăm sóc khách hàng thân thiết.', 'ON_HOLD');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ012', 'Tối ưu SEO & Content Hub', 'Xây dựng content hub, tối ưu SEO on-page/off-page, tăng organic traffic.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ013', 'Tuyển dụng 2026 - Wave 2', 'Tuyển dụng 50+ vị trí kỹ thuật, marketing, sales trong quý 3-4.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ014', 'Chương trình Đào tạo Nội bộ', 'Xây dựng lộ trình đào tạo kỹ năng cứng/mềm cho toàn công ty.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ015', 'Đánh giá Hiệu suất H2 2026', 'Triển khai OKR/KPI và quy trình đánh giá hiệu suất nửa cuối năm.', 'ON_HOLD');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ016', 'Tối ưu Quy trình Kế toán', 'Số hóa quy trình kế toán, tích hợp phần mềm kế toán với HRM.', 'COMPLETED');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ017', 'Báo cáo Tài chính Quý 3', 'Lập báo cáo tài chính, dự toán ngân sách quý 3 và năm 2026.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ018', 'Cải tiến Dây chuyền Sản xuất', 'Tối ưu layout nhà xưởng, giảm thời gian setup, tăng năng suất 15%.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ019', 'Hệ thống Quản lý Kho WMS', 'Triển khai Warehouse Management System tích hợp với ERP.', 'COMPLETED');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ020', 'Kiểm soát Chất lượng ISO', 'Chuẩn bị audit ISO 9001, cập nhật quy trình QC và tài liệu.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ021', 'Nâng cấp Hệ thống CSKH', 'Triển khai CRM, chatbot hỗ trợ, dashboard ticket cho đội CSKH.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ022', 'Rà soát Hợp đồng & Pháp lý', 'Rà soát toàn bộ hợp đồng đối tác, cập nhật điều khoản theo luật mới.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ023', 'Chính sách Bảo mật Dữ liệu', 'Xây dựng chính sách GDPR/PDPA, quy trình xử lý dữ liệu cá nhân.', 'ON_HOLD');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ024', 'Nghiên cứu Sản phẩm Mới 2027', 'Nghiên cứu thị trường, prototype sản phẩm mới cho năm 2027.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ025', 'Chiến lược Chuyển đổi Số', 'Xây dựng roadmap chuyển đổi số toàn công ty 2026-2028.', 'COMPLETED');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ026', 'Tối ưu Chi phí Vận hành', 'Phân tích và cắt giảm chi phí không cần thiết, renegotiate vendor.', 'ACTIVE');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ027', 'Cải thiện Không gian Làm việc', 'Cải tạo văn phòng, thêm meeting room, lounge và thiết bị hỗ trợ.', 'ON_HOLD');
INSERT INTO projects (project_code, name, description, status) VALUES ('PRJ028', 'Sự kiện Team Building 2026', 'Tổ chức team building nửa cuối năm cho toàn công ty.', 'ON_HOLD');

-- 5. Insert Công việc (140 tasks dùng SUBQUERY theo project_code - An toàn tuyệt đối!)
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK001', 'Cấu hình CI/CD Pipeline - Hệ thống HRM nội bộ v2.0', 'Cấu hình tự động hóa build và deploy cho dự án Hệ thống HRM nội bộ v2.0.', TO_DATE('2026-10-05', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ001'), 'EMP288');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK002', 'Thiết kế Database - Hệ thống HRM nội bộ v2.0', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Hệ thống HRM nội bộ v2.0.', TO_DATE('2026-10-20', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ001'), 'EMP260');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK003', 'Thiết kế UI Mockup - Hệ thống HRM nội bộ v2.0', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Hệ thống HRM nội bộ v2.0.', TO_DATE('2026-12-28', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ001'), 'EMP022');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK004', 'Kiểm thử Bảo mật - Hệ thống HRM nội bộ v2.0', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Hệ thống HRM nội bộ v2.0.', TO_DATE('2026-08-26', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ001'), 'EMP172');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK005', 'Thiết kế UI Mockup - Hệ thống HRM nội bộ v2.0', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Hệ thống HRM nội bộ v2.0.', TO_DATE('2026-11-05', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ001'), 'EMP420');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK006', 'Viết Tài liệu API - Website Thương mại Điện tử B2C', 'Cập nhật Swagger và OpenAPI docs cho dự án Website Thương mại Điện tử B2C.', TO_DATE('2026-11-18', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ002'), 'EMP247');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK007', 'Viết Tài liệu API - Website Thương mại Điện tử B2C', 'Cập nhật Swagger và OpenAPI docs cho dự án Website Thương mại Điện tử B2C.', TO_DATE('2026-12-26', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ002'), 'EMP081');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK008', 'Cấu hình CI/CD Pipeline - Website Thương mại Điện tử B2C', 'Cấu hình tự động hóa build và deploy cho dự án Website Thương mại Điện tử B2C.', TO_DATE('2026-11-15', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ002'), 'EMP312');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK009', 'Phân tích Yêu cầu Khách hàng - Website Thương mại Điện tử B2C', 'Thu thập thông tin và chốt spec với đối tác cho dự án Website Thương mại Điện tử B2C.', TO_DATE('2026-09-16', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ002'), 'EMP414');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK010', 'Thiết kế UI Mockup - Website Thương mại Điện tử B2C', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Website Thương mại Điện tử B2C.', TO_DATE('2026-11-06', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ002'), 'EMP454');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK011', 'Phát triển REST API - Ứng dụng Mobile App Nội bộ', 'Tạo API CRUD và tối ưu query cho dự án Ứng dụng Mobile App Nội bộ.', TO_DATE('2026-09-17', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ003'), 'EMP216');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK012', 'Lập Báo cáo Đánh giá - Ứng dụng Mobile App Nội bộ', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Ứng dụng Mobile App Nội bộ.', TO_DATE('2026-11-26', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ003'), 'EMP470');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK013', 'Phân tích Yêu cầu Khách hàng - Ứng dụng Mobile App Nội bộ', 'Thu thập thông tin và chốt spec với đối tác cho dự án Ứng dụng Mobile App Nội bộ.', TO_DATE('2026-09-16', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ003'), 'EMP234');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK014', 'Viết Tài liệu API - Ứng dụng Mobile App Nội bộ', 'Cập nhật Swagger và OpenAPI docs cho dự án Ứng dụng Mobile App Nội bộ.', TO_DATE('2026-08-16', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ003'), 'EMP057');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK015', 'Thiết kế Database - Ứng dụng Mobile App Nội bộ', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Ứng dụng Mobile App Nội bộ.', TO_DATE('2026-11-08', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ003'), 'EMP083');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK016', 'Thiết kế UI Mockup - Hạ tầng Cloud Migration', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Hạ tầng Cloud Migration.', TO_DATE('2026-08-09', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ004'), 'EMP406');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK017', 'Thiết kế UI Mockup - Hạ tầng Cloud Migration', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Hạ tầng Cloud Migration.', TO_DATE('2026-10-14', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ004'), 'EMP420');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK018', 'Viết Unit Test - Hạ tầng Cloud Migration', 'Cover unit test đạt tỷ lệ > 80% cho dự án Hạ tầng Cloud Migration.', TO_DATE('2026-12-28', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ004'), 'EMP367');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK019', 'Phân tích Yêu cầu Khách hàng - Hạ tầng Cloud Migration', 'Thu thập thông tin và chốt spec với đối tác cho dự án Hạ tầng Cloud Migration.', TO_DATE('2026-12-18', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ004'), 'EMP276');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK020', 'Thiết kế UI Mockup - Hạ tầng Cloud Migration', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Hạ tầng Cloud Migration.', TO_DATE('2026-11-19', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ004'), 'EMP402');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK021', 'Phân tích Yêu cầu Khách hàng - Hệ thống CI/CD & DevOps', 'Thu thập thông tin và chốt spec với đối tác cho dự án Hệ thống CI/CD & DevOps.', TO_DATE('2026-10-06', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ005'), 'EMP261');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK022', 'Viết Tài liệu API - Hệ thống CI/CD & DevOps', 'Cập nhật Swagger và OpenAPI docs cho dự án Hệ thống CI/CD & DevOps.', TO_DATE('2026-10-03', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ005'), 'EMP365');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK023', 'Phân tích Yêu cầu Khách hàng - Hệ thống CI/CD & DevOps', 'Thu thập thông tin và chốt spec với đối tác cho dự án Hệ thống CI/CD & DevOps.', TO_DATE('2026-08-04', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ005'), 'EMP427');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK024', 'Thiết kế UI Mockup - Hệ thống CI/CD & DevOps', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Hệ thống CI/CD & DevOps.', TO_DATE('2026-08-21', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ005'), 'EMP205');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK025', 'Viết Tài liệu API - Hệ thống CI/CD & DevOps', 'Cập nhật Swagger và OpenAPI docs cho dự án Hệ thống CI/CD & DevOps.', TO_DATE('2026-08-24', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ005'), 'EMP165');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK026', 'Kiểm thử Bảo mật - Nâng cấp Bảo mật Hệ thống', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Nâng cấp Bảo mật Hệ thống.', TO_DATE('2026-11-14', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ006'), 'EMP433');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK027', 'Viết Tài liệu API - Nâng cấp Bảo mật Hệ thống', 'Cập nhật Swagger và OpenAPI docs cho dự án Nâng cấp Bảo mật Hệ thống.', TO_DATE('2026-11-22', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ006'), 'EMP382');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK028', 'Kiểm thử Bảo mật - Nâng cấp Bảo mật Hệ thống', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Nâng cấp Bảo mật Hệ thống.', TO_DATE('2026-08-09', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ006'), 'EMP479');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK029', 'Phân tích Yêu cầu Khách hàng - Nâng cấp Bảo mật Hệ thống', 'Thu thập thông tin và chốt spec với đối tác cho dự án Nâng cấp Bảo mật Hệ thống.', TO_DATE('2026-12-24', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ006'), 'EMP252');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK030', 'Viết Unit Test - Nâng cấp Bảo mật Hệ thống', 'Cover unit test đạt tỷ lệ > 80% cho dự án Nâng cấp Bảo mật Hệ thống.', TO_DATE('2026-10-13', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ006'), 'EMP015');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK031', 'Cấu hình CI/CD Pipeline - Redesign Brand Identity 2026', 'Cấu hình tự động hóa build và deploy cho dự án Redesign Brand Identity 2026.', TO_DATE('2026-09-28', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ007'), 'EMP418');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK032', 'Viết Tài liệu API - Redesign Brand Identity 2026', 'Cập nhật Swagger và OpenAPI docs cho dự án Redesign Brand Identity 2026.', TO_DATE('2026-12-18', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ007'), 'EMP344');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK033', 'Kiểm thử Bảo mật - Redesign Brand Identity 2026', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Redesign Brand Identity 2026.', TO_DATE('2026-08-24', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ007'), 'EMP239');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK034', 'Kiểm thử Bảo mật - Redesign Brand Identity 2026', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Redesign Brand Identity 2026.', TO_DATE('2026-09-03', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ007'), 'EMP398');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK035', 'Thiết kế Database - Redesign Brand Identity 2026', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Redesign Brand Identity 2026.', TO_DATE('2026-10-07', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ007'), 'EMP474');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK036', 'Thiết kế UI Mockup - UI Kit & Design System', 'Vẽ wireframe và mockup giao diện người dùng cho dự án UI Kit & Design System.', TO_DATE('2026-11-18', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ008'), 'EMP135');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK037', 'Thiết kế Database - UI Kit & Design System', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án UI Kit & Design System.', TO_DATE('2026-11-01', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ008'), 'EMP431');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK038', 'Thiết kế UI Mockup - UI Kit & Design System', 'Vẽ wireframe và mockup giao diện người dùng cho dự án UI Kit & Design System.', TO_DATE('2026-12-06', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ008'), 'EMP345');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK039', 'Viết Unit Test - UI Kit & Design System', 'Cover unit test đạt tỷ lệ > 80% cho dự án UI Kit & Design System.', TO_DATE('2026-10-22', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ008'), 'EMP144');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK040', 'Cấu hình CI/CD Pipeline - UI Kit & Design System', 'Cấu hình tự động hóa build và deploy cho dự án UI Kit & Design System.', TO_DATE('2026-11-17', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ008'), 'EMP384');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK041', 'Lập Báo cáo Đánh giá - Chiến dịch Marketing Q3 2026', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Chiến dịch Marketing Q3 2026.', TO_DATE('2026-11-14', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ009'), 'EMP271');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK042', 'Lập Báo cáo Đánh giá - Chiến dịch Marketing Q3 2026', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Chiến dịch Marketing Q3 2026.', TO_DATE('2026-10-15', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ009'), 'EMP093');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK043', 'Phân tích Yêu cầu Khách hàng - Chiến dịch Marketing Q3 2026', 'Thu thập thông tin và chốt spec với đối tác cho dự án Chiến dịch Marketing Q3 2026.', TO_DATE('2026-08-18', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ009'), 'EMP160');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK044', 'Kiểm thử Bảo mật - Chiến dịch Marketing Q3 2026', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Chiến dịch Marketing Q3 2026.', TO_DATE('2026-12-18', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ009'), 'EMP085');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK045', 'Kiểm thử Bảo mật - Chiến dịch Marketing Q3 2026', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Chiến dịch Marketing Q3 2026.', TO_DATE('2026-11-06', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ009'), 'EMP032');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK046', 'Phân tích Yêu cầu Khách hàng - Mở rộng Thị trường Miền Trung', 'Thu thập thông tin và chốt spec với đối tác cho dự án Mở rộng Thị trường Miền Trung.', TO_DATE('2026-09-03', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ010'), 'EMP006');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK047', 'Cấu hình CI/CD Pipeline - Mở rộng Thị trường Miền Trung', 'Cấu hình tự động hóa build và deploy cho dự án Mở rộng Thị trường Miền Trung.', TO_DATE('2026-12-16', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ010'), 'EMP462');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK048', 'Viết Unit Test - Mở rộng Thị trường Miền Trung', 'Cover unit test đạt tỷ lệ > 80% cho dự án Mở rộng Thị trường Miền Trung.', TO_DATE('2026-09-26', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ010'), 'EMP004');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK049', 'Phát triển REST API - Mở rộng Thị trường Miền Trung', 'Tạo API CRUD và tối ưu query cho dự án Mở rộng Thị trường Miền Trung.', TO_DATE('2026-10-27', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ010'), 'EMP117');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK050', 'Phát triển REST API - Mở rộng Thị trường Miền Trung', 'Tạo API CRUD và tối ưu query cho dự án Mở rộng Thị trường Miền Trung.', TO_DATE('2026-10-19', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ010'), 'EMP220');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK051', 'Refactor Code - Chương trình Loyalty Khách hàng', 'Clean code và tối ưu hóa hiệu năng cho dự án Chương trình Loyalty Khách hàng.', TO_DATE('2026-12-14', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ011'), 'EMP316');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK052', 'Thiết kế Database - Chương trình Loyalty Khách hàng', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Chương trình Loyalty Khách hàng.', TO_DATE('2026-11-07', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ011'), 'EMP229');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK053', 'Cấu hình CI/CD Pipeline - Chương trình Loyalty Khách hàng', 'Cấu hình tự động hóa build và deploy cho dự án Chương trình Loyalty Khách hàng.', TO_DATE('2026-12-14', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ011'), 'EMP108');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK054', 'Viết Tài liệu API - Chương trình Loyalty Khách hàng', 'Cập nhật Swagger và OpenAPI docs cho dự án Chương trình Loyalty Khách hàng.', TO_DATE('2026-09-24', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ011'), 'EMP398');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK055', 'Viết Unit Test - Chương trình Loyalty Khách hàng', 'Cover unit test đạt tỷ lệ > 80% cho dự án Chương trình Loyalty Khách hàng.', TO_DATE('2026-11-11', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ011'), 'EMP424');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK056', 'Kiểm thử Bảo mật - Tối ưu SEO & Content Hub', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Tối ưu SEO & Content Hub.', TO_DATE('2026-10-26', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ012'), 'EMP368');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK057', 'Cấu hình CI/CD Pipeline - Tối ưu SEO & Content Hub', 'Cấu hình tự động hóa build và deploy cho dự án Tối ưu SEO & Content Hub.', TO_DATE('2026-09-21', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ012'), 'EMP381');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK058', 'Phát triển REST API - Tối ưu SEO & Content Hub', 'Tạo API CRUD và tối ưu query cho dự án Tối ưu SEO & Content Hub.', TO_DATE('2026-09-22', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ012'), 'EMP218');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK059', 'Thiết kế Database - Tối ưu SEO & Content Hub', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Tối ưu SEO & Content Hub.', TO_DATE('2026-08-13', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ012'), 'EMP206');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK060', 'Phát triển REST API - Tối ưu SEO & Content Hub', 'Tạo API CRUD và tối ưu query cho dự án Tối ưu SEO & Content Hub.', TO_DATE('2026-09-03', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ012'), 'EMP452');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK061', 'Lập Báo cáo Đánh giá - Tuyển dụng 2026 - Wave 2', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Tuyển dụng 2026 - Wave 2.', TO_DATE('2026-09-20', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ013'), 'EMP458');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK062', 'Lập Báo cáo Đánh giá - Tuyển dụng 2026 - Wave 2', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Tuyển dụng 2026 - Wave 2.', TO_DATE('2026-11-12', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ013'), 'EMP197');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK063', 'Lập Báo cáo Đánh giá - Tuyển dụng 2026 - Wave 2', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Tuyển dụng 2026 - Wave 2.', TO_DATE('2026-12-17', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ013'), 'EMP472');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK064', 'Cấu hình CI/CD Pipeline - Tuyển dụng 2026 - Wave 2', 'Cấu hình tự động hóa build và deploy cho dự án Tuyển dụng 2026 - Wave 2.', TO_DATE('2026-12-13', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ013'), 'EMP061');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK065', 'Phát triển REST API - Tuyển dụng 2026 - Wave 2', 'Tạo API CRUD và tối ưu query cho dự án Tuyển dụng 2026 - Wave 2.', TO_DATE('2026-12-20', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ013'), 'EMP392');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK066', 'Cấu hình CI/CD Pipeline - Chương trình Đào tạo Nội bộ', 'Cấu hình tự động hóa build và deploy cho dự án Chương trình Đào tạo Nội bộ.', TO_DATE('2026-09-02', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ014'), 'EMP461');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK067', 'Thiết kế UI Mockup - Chương trình Đào tạo Nội bộ', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Chương trình Đào tạo Nội bộ.', TO_DATE('2026-08-08', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ014'), 'EMP079');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK068', 'Lập Báo cáo Đánh giá - Chương trình Đào tạo Nội bộ', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Chương trình Đào tạo Nội bộ.', TO_DATE('2026-12-23', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ014'), 'EMP090');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK069', 'Kiểm thử Bảo mật - Chương trình Đào tạo Nội bộ', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Chương trình Đào tạo Nội bộ.', TO_DATE('2026-09-07', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ014'), 'EMP345');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK070', 'Phân tích Yêu cầu Khách hàng - Chương trình Đào tạo Nội bộ', 'Thu thập thông tin và chốt spec với đối tác cho dự án Chương trình Đào tạo Nội bộ.', TO_DATE('2026-08-20', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ014'), 'EMP346');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK071', 'Thiết kế UI Mockup - Đánh giá Hiệu suất H2 2026', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Đánh giá Hiệu suất H2 2026.', TO_DATE('2026-12-02', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ015'), 'EMP177');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK072', 'Phân tích Yêu cầu Khách hàng - Đánh giá Hiệu suất H2 2026', 'Thu thập thông tin và chốt spec với đối tác cho dự án Đánh giá Hiệu suất H2 2026.', TO_DATE('2026-09-27', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ015'), 'EMP107');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK073', 'Thiết kế UI Mockup - Đánh giá Hiệu suất H2 2026', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Đánh giá Hiệu suất H2 2026.', TO_DATE('2026-12-06', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ015'), 'EMP370');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK074', 'Phân tích Yêu cầu Khách hàng - Đánh giá Hiệu suất H2 2026', 'Thu thập thông tin và chốt spec với đối tác cho dự án Đánh giá Hiệu suất H2 2026.', TO_DATE('2026-11-05', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ015'), 'EMP192');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK075', 'Refactor Code - Đánh giá Hiệu suất H2 2026', 'Clean code và tối ưu hóa hiệu năng cho dự án Đánh giá Hiệu suất H2 2026.', TO_DATE('2026-09-12', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ015'), 'EMP286');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK076', 'Viết Unit Test - Tối ưu Quy trình Kế toán', 'Cover unit test đạt tỷ lệ > 80% cho dự án Tối ưu Quy trình Kế toán.', TO_DATE('2026-09-18', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ016'), 'EMP374');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK077', 'Phân tích Yêu cầu Khách hàng - Tối ưu Quy trình Kế toán', 'Thu thập thông tin và chốt spec với đối tác cho dự án Tối ưu Quy trình Kế toán.', TO_DATE('2026-09-04', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ016'), 'EMP096');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK078', 'Kiểm thử Bảo mật - Tối ưu Quy trình Kế toán', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Tối ưu Quy trình Kế toán.', TO_DATE('2026-11-18', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ016'), 'EMP128');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK079', 'Cấu hình CI/CD Pipeline - Tối ưu Quy trình Kế toán', 'Cấu hình tự động hóa build và deploy cho dự án Tối ưu Quy trình Kế toán.', TO_DATE('2026-08-05', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ016'), 'EMP291');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK080', 'Refactor Code - Tối ưu Quy trình Kế toán', 'Clean code và tối ưu hóa hiệu năng cho dự án Tối ưu Quy trình Kế toán.', TO_DATE('2026-12-18', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ016'), 'EMP288');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK081', 'Thiết kế UI Mockup - Báo cáo Tài chính Quý 3', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Báo cáo Tài chính Quý 3.', TO_DATE('2026-08-15', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ017'), 'EMP195');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK082', 'Refactor Code - Báo cáo Tài chính Quý 3', 'Clean code và tối ưu hóa hiệu năng cho dự án Báo cáo Tài chính Quý 3.', TO_DATE('2026-11-11', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ017'), 'EMP248');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK083', 'Cấu hình CI/CD Pipeline - Báo cáo Tài chính Quý 3', 'Cấu hình tự động hóa build và deploy cho dự án Báo cáo Tài chính Quý 3.', TO_DATE('2026-12-26', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ017'), 'EMP327');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK084', 'Kiểm thử Bảo mật - Báo cáo Tài chính Quý 3', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Báo cáo Tài chính Quý 3.', TO_DATE('2026-08-12', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ017'), 'EMP414');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK085', 'Thiết kế UI Mockup - Báo cáo Tài chính Quý 3', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Báo cáo Tài chính Quý 3.', TO_DATE('2026-10-26', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ017'), 'EMP243');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK086', 'Lập Báo cáo Đánh giá - Cải tiến Dây chuyền Sản xuất', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Cải tiến Dây chuyền Sản xuất.', TO_DATE('2026-10-27', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ018'), 'EMP366');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK087', 'Viết Tài liệu API - Cải tiến Dây chuyền Sản xuất', 'Cập nhật Swagger và OpenAPI docs cho dự án Cải tiến Dây chuyền Sản xuất.', TO_DATE('2026-11-01', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ018'), 'EMP038');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK088', 'Viết Tài liệu API - Cải tiến Dây chuyền Sản xuất', 'Cập nhật Swagger và OpenAPI docs cho dự án Cải tiến Dây chuyền Sản xuất.', TO_DATE('2026-11-14', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ018'), 'EMP234');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK089', 'Kiểm thử Bảo mật - Cải tiến Dây chuyền Sản xuất', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Cải tiến Dây chuyền Sản xuất.', TO_DATE('2026-08-27', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ018'), 'EMP015');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK090', 'Phân tích Yêu cầu Khách hàng - Cải tiến Dây chuyền Sản xuất', 'Thu thập thông tin và chốt spec với đối tác cho dự án Cải tiến Dây chuyền Sản xuất.', TO_DATE('2026-09-02', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ018'), 'EMP086');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK091', 'Kiểm thử Bảo mật - Hệ thống Quản lý Kho WMS', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Hệ thống Quản lý Kho WMS.', TO_DATE('2026-11-24', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ019'), 'EMP050');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK092', 'Thiết kế Database - Hệ thống Quản lý Kho WMS', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Hệ thống Quản lý Kho WMS.', TO_DATE('2026-12-03', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ019'), 'EMP491');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK093', 'Phát triển REST API - Hệ thống Quản lý Kho WMS', 'Tạo API CRUD và tối ưu query cho dự án Hệ thống Quản lý Kho WMS.', TO_DATE('2026-11-16', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ019'), 'EMP057');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK094', 'Kiểm thử Bảo mật - Hệ thống Quản lý Kho WMS', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Hệ thống Quản lý Kho WMS.', TO_DATE('2026-10-03', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ019'), 'EMP079');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK095', 'Kiểm thử Bảo mật - Hệ thống Quản lý Kho WMS', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Hệ thống Quản lý Kho WMS.', TO_DATE('2026-11-24', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ019'), 'EMP286');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK096', 'Phân tích Yêu cầu Khách hàng - Kiểm soát Chất lượng ISO', 'Thu thập thông tin và chốt spec với đối tác cho dự án Kiểm soát Chất lượng ISO.', TO_DATE('2026-09-02', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ020'), 'EMP401');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK097', 'Phát triển REST API - Kiểm soát Chất lượng ISO', 'Tạo API CRUD và tối ưu query cho dự án Kiểm soát Chất lượng ISO.', TO_DATE('2026-08-09', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ020'), 'EMP059');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK098', 'Viết Unit Test - Kiểm soát Chất lượng ISO', 'Cover unit test đạt tỷ lệ > 80% cho dự án Kiểm soát Chất lượng ISO.', TO_DATE('2026-09-25', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ020'), 'EMP397');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK099', 'Thiết kế UI Mockup - Kiểm soát Chất lượng ISO', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Kiểm soát Chất lượng ISO.', TO_DATE('2026-09-18', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ020'), 'EMP037');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK100', 'Phân tích Yêu cầu Khách hàng - Kiểm soát Chất lượng ISO', 'Thu thập thông tin và chốt spec với đối tác cho dự án Kiểm soát Chất lượng ISO.', TO_DATE('2026-11-01', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ020'), 'EMP293');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK101', 'Cấu hình CI/CD Pipeline - Nâng cấp Hệ thống CSKH', 'Cấu hình tự động hóa build và deploy cho dự án Nâng cấp Hệ thống CSKH.', TO_DATE('2026-09-01', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ021'), 'EMP037');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK102', 'Refactor Code - Nâng cấp Hệ thống CSKH', 'Clean code và tối ưu hóa hiệu năng cho dự án Nâng cấp Hệ thống CSKH.', TO_DATE('2026-10-14', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ021'), 'EMP435');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK103', 'Kiểm thử Bảo mật - Nâng cấp Hệ thống CSKH', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Nâng cấp Hệ thống CSKH.', TO_DATE('2026-08-26', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ021'), 'EMP135');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK104', 'Lập Báo cáo Đánh giá - Nâng cấp Hệ thống CSKH', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Nâng cấp Hệ thống CSKH.', TO_DATE('2026-08-21', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ021'), 'EMP058');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK105', 'Phân tích Yêu cầu Khách hàng - Nâng cấp Hệ thống CSKH', 'Thu thập thông tin và chốt spec với đối tác cho dự án Nâng cấp Hệ thống CSKH.', TO_DATE('2026-11-28', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ021'), 'EMP089');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK106', 'Lập Báo cáo Đánh giá - Rà soát Hợp đồng & Pháp lý', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Rà soát Hợp đồng & Pháp lý.', TO_DATE('2026-11-16', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ022'), 'EMP294');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK107', 'Thiết kế Database - Rà soát Hợp đồng & Pháp lý', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Rà soát Hợp đồng & Pháp lý.', TO_DATE('2026-10-21', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ022'), 'EMP495');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK108', 'Phân tích Yêu cầu Khách hàng - Rà soát Hợp đồng & Pháp lý', 'Thu thập thông tin và chốt spec với đối tác cho dự án Rà soát Hợp đồng & Pháp lý.', TO_DATE('2026-08-12', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ022'), 'EMP233');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK109', 'Cấu hình CI/CD Pipeline - Rà soát Hợp đồng & Pháp lý', 'Cấu hình tự động hóa build và deploy cho dự án Rà soát Hợp đồng & Pháp lý.', TO_DATE('2026-08-04', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ022'), 'EMP439');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK110', 'Thiết kế Database - Rà soát Hợp đồng & Pháp lý', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Rà soát Hợp đồng & Pháp lý.', TO_DATE('2026-09-24', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ022'), 'EMP084');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK111', 'Thiết kế Database - Chính sách Bảo mật Dữ liệu', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Chính sách Bảo mật Dữ liệu.', TO_DATE('2026-09-22', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ023'), 'EMP101');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK112', 'Refactor Code - Chính sách Bảo mật Dữ liệu', 'Clean code và tối ưu hóa hiệu năng cho dự án Chính sách Bảo mật Dữ liệu.', TO_DATE('2026-11-11', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ023'), 'EMP121');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK113', 'Viết Tài liệu API - Chính sách Bảo mật Dữ liệu', 'Cập nhật Swagger và OpenAPI docs cho dự án Chính sách Bảo mật Dữ liệu.', TO_DATE('2026-09-08', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ023'), 'EMP424');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK114', 'Lập Báo cáo Đánh giá - Chính sách Bảo mật Dữ liệu', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Chính sách Bảo mật Dữ liệu.', TO_DATE('2026-11-20', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ023'), 'EMP177');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK115', 'Lập Báo cáo Đánh giá - Chính sách Bảo mật Dữ liệu', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Chính sách Bảo mật Dữ liệu.', TO_DATE('2026-09-12', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ023'), 'EMP422');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK116', 'Thiết kế UI Mockup - Nghiên cứu Sản phẩm Mới 2027', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Nghiên cứu Sản phẩm Mới 2027.', TO_DATE('2026-12-26', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ024'), 'EMP264');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK117', 'Kiểm thử Bảo mật - Nghiên cứu Sản phẩm Mới 2027', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Nghiên cứu Sản phẩm Mới 2027.', TO_DATE('2026-08-04', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ024'), 'EMP409');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK118', 'Kiểm thử Bảo mật - Nghiên cứu Sản phẩm Mới 2027', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Nghiên cứu Sản phẩm Mới 2027.', TO_DATE('2026-08-20', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ024'), 'EMP459');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK119', 'Viết Tài liệu API - Nghiên cứu Sản phẩm Mới 2027', 'Cập nhật Swagger và OpenAPI docs cho dự án Nghiên cứu Sản phẩm Mới 2027.', TO_DATE('2026-08-19', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ024'), 'EMP491');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK120', 'Lập Báo cáo Đánh giá - Nghiên cứu Sản phẩm Mới 2027', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Nghiên cứu Sản phẩm Mới 2027.', TO_DATE('2026-09-13', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ024'), 'EMP281');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK121', 'Phát triển REST API - Chiến lược Chuyển đổi Số', 'Tạo API CRUD và tối ưu query cho dự án Chiến lược Chuyển đổi Số.', TO_DATE('2026-12-13', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ025'), 'EMP455');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK122', 'Cấu hình CI/CD Pipeline - Chiến lược Chuyển đổi Số', 'Cấu hình tự động hóa build và deploy cho dự án Chiến lược Chuyển đổi Số.', TO_DATE('2026-11-08', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ025'), 'EMP027');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK123', 'Thiết kế UI Mockup - Chiến lược Chuyển đổi Số', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Chiến lược Chuyển đổi Số.', TO_DATE('2026-11-06', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ025'), 'EMP404');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK124', 'Phát triển REST API - Chiến lược Chuyển đổi Số', 'Tạo API CRUD và tối ưu query cho dự án Chiến lược Chuyển đổi Số.', TO_DATE('2026-08-09', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ025'), 'EMP352');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK125', 'Viết Tài liệu API - Chiến lược Chuyển đổi Số', 'Cập nhật Swagger và OpenAPI docs cho dự án Chiến lược Chuyển đổi Số.', TO_DATE('2026-10-19', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ025'), 'EMP225');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK126', 'Viết Unit Test - Tối ưu Chi phí Vận hành', 'Cover unit test đạt tỷ lệ > 80% cho dự án Tối ưu Chi phí Vận hành.', TO_DATE('2026-12-15', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ026'), 'EMP259');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK127', 'Phát triển REST API - Tối ưu Chi phí Vận hành', 'Tạo API CRUD và tối ưu query cho dự án Tối ưu Chi phí Vận hành.', TO_DATE('2026-10-14', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ026'), 'EMP104');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK128', 'Phân tích Yêu cầu Khách hàng - Tối ưu Chi phí Vận hành', 'Thu thập thông tin và chốt spec với đối tác cho dự án Tối ưu Chi phí Vận hành.', TO_DATE('2026-11-27', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ026'), 'EMP305');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK129', 'Lập Báo cáo Đánh giá - Tối ưu Chi phí Vận hành', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Tối ưu Chi phí Vận hành.', TO_DATE('2026-09-27', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ026'), 'EMP139');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK130', 'Cấu hình CI/CD Pipeline - Tối ưu Chi phí Vận hành', 'Cấu hình tự động hóa build và deploy cho dự án Tối ưu Chi phí Vận hành.', TO_DATE('2026-10-02', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ026'), 'EMP254');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK131', 'Thiết kế Database - Cải thiện Không gian Làm việc', 'Lên cấu trúc các bảng và quan hệ dữ liệu cho dự án Cải thiện Không gian Làm việc.', TO_DATE('2026-11-04', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ027'), 'EMP082');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK132', 'Kiểm thử Bảo mật - Cải thiện Không gian Làm việc', 'Scan lỗ hổng bảo mật và kiểm tra phân quyền cho dự án Cải thiện Không gian Làm việc.', TO_DATE('2026-12-14', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ027'), 'EMP193');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK133', 'Thiết kế UI Mockup - Cải thiện Không gian Làm việc', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Cải thiện Không gian Làm việc.', TO_DATE('2026-08-25', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ027'), 'EMP255');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK134', 'Lập Báo cáo Đánh giá - Cải thiện Không gian Làm việc', 'Tổng hợp dữ liệu và gửi báo cáo tiến độ cho dự án Cải thiện Không gian Làm việc.', TO_DATE('2026-10-28', 'YYYY-MM-DD'), 'TODO', (SELECT id FROM projects WHERE project_code = 'PRJ027'), 'EMP406');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK135', 'Phân tích Yêu cầu Khách hàng - Cải thiện Không gian Làm việc', 'Thu thập thông tin và chốt spec với đối tác cho dự án Cải thiện Không gian Làm việc.', TO_DATE('2026-09-10', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ027'), 'EMP103');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK136', 'Phân tích Yêu cầu Khách hàng - Sự kiện Team Building 2026', 'Thu thập thông tin và chốt spec với đối tác cho dự án Sự kiện Team Building 2026.', TO_DATE('2026-10-27', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ028'), 'EMP007');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK137', 'Cấu hình CI/CD Pipeline - Sự kiện Team Building 2026', 'Cấu hình tự động hóa build và deploy cho dự án Sự kiện Team Building 2026.', TO_DATE('2026-12-10', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ028'), 'EMP297');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK138', 'Thiết kế UI Mockup - Sự kiện Team Building 2026', 'Vẽ wireframe và mockup giao diện người dùng cho dự án Sự kiện Team Building 2026.', TO_DATE('2026-10-15', 'YYYY-MM-DD'), 'IN_PROGRESS', (SELECT id FROM projects WHERE project_code = 'PRJ028'), 'EMP449');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK139', 'Phát triển REST API - Sự kiện Team Building 2026', 'Tạo API CRUD và tối ưu query cho dự án Sự kiện Team Building 2026.', TO_DATE('2026-11-01', 'YYYY-MM-DD'), 'DONE', (SELECT id FROM projects WHERE project_code = 'PRJ028'), 'EMP488');
INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('TSK140', 'Phân tích Yêu cầu Khách hàng - Sự kiện Team Building 2026', 'Thu thập thông tin và chốt spec với đối tác cho dự án Sự kiện Team Building 2026.', TO_DATE('2026-12-15', 'YYYY-MM-DD'), 'ON_HOLD', (SELECT id FROM projects WHERE project_code = 'PRJ028'), 'EMP182');

COMMIT;