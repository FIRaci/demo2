import random

# Lists for realistic Vietnamese data generation
FIRST_NAMES_MALE = ["Văn", "Hữu", "Thành", "Công", "Đức", "Minh", "Quang", "Bảo", "Tuấn", "Hoàng", "Anh", "Thái", "Gia", "Xung", "Ngọc"]
FIRST_NAMES_FEMALE = ["Thị", "Ngọc", "Phương", "Thanh", "Kim", "Bích", "Thu", "Mai", "Ánh", "Hồng", "Diệu", "Lan", "Quỳnh", "Trinh", "Tuyết"]
MID_NAMES_MALE = ["Hùng", "Dũng", "Nam", "Sơn", "Việt", "Phong", "Phúc", "Quý", "Khánh", "Trung", "Cường", "Bách", "Tuấn", "Long", "Hiếu"]
MID_NAMES_FEMALE = ["Thảo", "Hoa", "Anh", "Linh", "Hằng", "Nhi", "Hương", "Trang", "Nhung", "Chi", "Duyên", "Loan", "Vy", "Ly", "Yến"]
LAST_NAMES = ["Nguyễn", "Trần", "Lê", "Phạm", "Hoàng", "Huỳnh", "Phan", "Vũ", "Võ", "Đặng", "Bùi", "Đỗ", "Hồ", "Nô", "Dương", "Lý"]

DEPARTMENTS = [
    "Ban Giám Đốc", "Phòng Kỹ thuật", "Phòng Thiết kế", "Phòng Nhân sự", 
    "Phòng Kinh doanh", "Phòng Marketing", "Phòng Tài chính - Kế toán", 
    "Phòng Công nghệ thông tin", "Phòng Logistics", "Phòng Nghiên cứu & Phát triển"
]

POSITIONS = {
    "Ban Giám Đốc": ["Giám đốc Điều hành", "Trợ lý Giám đốc", "Thư ký Ban Giám đốc"],
    "Phòng Kỹ thuật": ["Kỹ sư Phần mềm", "Kỹ sư Hệ thống", "Kỹ sư QA", "Trưởng phòng Kỹ thuật"],
    "Phòng Thiết kế": ["Chuyên viên UI/UX", "Senior Designer", "Motion Designer", "Trưởng phòng Thiết kế"],
    "Phòng Nhân sự": ["Chuyên viên Nhân sự", "Trưởng phòng Nhân sự", "HRBP", "Chuyên viên Đào tạo"],
    "Phòng Kinh doanh": ["Chuyên viên Kinh doanh", "Trưởng phòng Kinh doanh", "Account Executive"],
    "Phòng Marketing": ["Digital Marketing", "Content Creator", "Brand Manager", "Trưởng phòng Marketing"],
    "Phòng Tài chính - Kế toán": ["Kế toán viên", "Kế toán trưởng", "Chuyên viên Phân tích Tài chính"],
    "Phòng Công nghệ thông tin": ["Quản trị Hệ thống", "Database Administrator", "Kỹ sư Mạng", "Chuyên viên Bảo mật"],
    "Phòng Logistics": ["Warehouse Supervisor", "Điều phối viên", "Nhân viên Logistics"],
    "Phòng Nghiên cứu & Phát triển": ["Product Researcher", "Nghiên cứu viên", "Chuyên viên R&D"]
}

BANKS = ["Vietcombank", "Techcombank", "MB Bank", "BIDV", "VietinBank", "ACB", "TPBank", "VPBank", "Sacombank"]

PROJECTS_DATA = [
    ("PRJ001", "Hệ thống HRM nội bộ v2.0", "Nâng cấp phân hệ quản lý nhân sự, chấm công, tính lương và đánh giá hiệu suất.", "ACTIVE"),
    ("PRJ002", "Website Thương mại Điện tử B2C", "Thiết kế và phát triển website bán lẻ online cho đối tác chiến lược.", "ACTIVE"),
    ("PRJ003", "Ứng dụng Mobile App Nội bộ", "Xây dựng app mobile cho nhân viên: chấm công, xin nghỉ, xem lương, task.", "ACTIVE"),
    ("PRJ004", "Hạ tầng Cloud Migration", "Chuyển đổi hệ thống on-premise sang AWS/GCP, tối ưu chi phí và bảo mật.", "IN_PROGRESS"),
    ("PRJ005", "Hệ thống CI/CD & DevOps", "Xây dựng pipeline CI/CD, monitoring, logging cho toàn bộ sản phẩm.", "ACTIVE"),
    ("PRJ006", "Nâng cấp Bảo mật Hệ thống", "Audit bảo mật, triển khai WAF, 2FA, mã hóa dữ liệu nhạy cảm.", "ACTIVE"),
    ("PRJ007", "Redesign Brand Identity 2026", "Làm mới bộ nhận diện thương hiệu: logo, màu sắc, guideline, template.", "ACTIVE"),
    ("PRJ008", "UI Kit & Design System", "Xây dựng Design System và component library dùng chung cho các sản phẩm.", "IN_PROGRESS"),
    ("PRJ009", "Chiến dịch Marketing Q3 2026", "Campaign quảng cáo digital + content cho ra mắt sản phẩm mới.", "ACTIVE"),
    ("PRJ010", "Mở rộng Thị trường Miền Trung", "Mở văn phòng đại diện và phát triển đối tác tại Đà Nẵng, Huế.", "ACTIVE"),
    ("PRJ011", "Chương trình Loyalty Khách hàng", "Xây dựng hệ thống tích điểm, voucher và chăm sóc khách hàng thân thiết.", "ON_HOLD"),
    ("PRJ012", "Tối ưu SEO & Content Hub", "Xây dựng content hub, tối ưu SEO on-page/off-page, tăng organic traffic.", "ACTIVE"),
    ("PRJ013", "Tuyển dụng 2026 - Wave 2", "Tuyển dụng 50+ vị trí kỹ thuật, marketing, sales trong quý 3-4.", "ACTIVE"),
    ("PRJ014", "Chương trình Đào tạo Nội bộ", "Xây dựng lộ trình đào tạo kỹ năng cứng/mềm cho toàn công ty.", "ACTIVE"),
    ("PRJ015", "Đánh giá Hiệu suất H2 2026", "Triển khai OKR/KPI và quy trình đánh giá hiệu suất nửa cuối năm.", "ON_HOLD"),
    ("PRJ016", "Tối ưu Quy trình Kế toán", "Số hóa quy trình kế toán, tích hợp phần mềm kế toán với HRM.", "IN_PROGRESS"),
    ("PRJ017", "Báo cáo Tài chính Quý 3", "Lập báo cáo tài chính, dự toán ngân sách quý 3 và năm 2026.", "ACTIVE"),
    ("PRJ018", "Cải tiến Dây chuyền Sản xuất", "Tối ưu layout nhà xưởng, giảm thời gian setup, tăng năng suất 15%.", "ACTIVE"),
    ("PRJ019", "Hệ thống Quản lý Kho WMS", "Triển khai Warehouse Management System tích hợp với ERP.", "IN_PROGRESS"),
    ("PRJ020", "Kiểm soát Chất lượng ISO", "Chuẩn bị audit ISO 9001, cập nhật quy trình QC và tài liệu.", "ACTIVE"),
    ("PRJ021", "Nâng cấp Hệ thống CSKH", "Triển khai CRM, chatbot hỗ trợ, dashboard ticket cho đội CSKH.", "ACTIVE"),
    ("PRJ022", "Rà soát Hợp đồng & Pháp lý", "Rà soát toàn bộ hợp đồng đối tác, cập nhật điều khoản theo luật mới.", "ACTIVE"),
    ("PRJ023", "Chính sách Bảo mật Dữ liệu", "Xây dựng chính sách GDPR/PDPA, quy trình xử lý dữ liệu cá nhân.", "ON_HOLD"),
    ("PRJ024", "Nghiên cứu Sản phẩm Mới 2027", "Nghiên cứu thị trường, prototype sản phẩm mới cho năm 2027.", "ACTIVE"),
    ("PRJ025", "Chiến lược Chuyển đổi Số", "Xây dựng roadmap chuyển đổi số toàn công ty 2026-2028.", "IN_PROGRESS"),
    ("PRJ026", "Tối ưu Chi phí Vận hành", "Phân tích và cắt giảm chi phí không cần thiết, renegotiate vendor.", "ACTIVE"),
    ("PRJ027", "Cải thiện Không gian Làm việc", "Cải tạo văn phòng, thêm meeting room, lounge và thiết bị hỗ trợ.", "ON_HOLD"),
    ("PRJ028", "Sự kiện Team Building 2026", "Tổ chức team building nửa cuối năm cho toàn công ty.", "ON_HOLD")
]

TASK_TEMPLATES = [
    ("Thiết kế Database", "Lên cấu trúc các bảng và quan hệ dữ liệu"),
    ("Phát triển REST API", "Tạo API CRUD và tối ưu query"),
    ("Thiết kế UI Mockup", "Vẽ wireframe và mockup giao diện người dùng"),
    ("Kiểm thử Bảo mật", "Scan lỗ hổng bảo mật và kiểm tra phân quyền"),
    ("Refactor Code", "Clean code và tối ưu hóa hiệu năng"),
    ("Viết Unit Test", "Cover unit test đạt tỷ lệ > 80%"),
    ("Cấu hình CI/CD Pipeline", "Cấu hình tự động hóa build và deploy"),
    ("Viết Tài liệu API", "Cập nhật Swagger và OpenAPI docs"),
    ("Phân tích Yêu cầu Khách hàng", "Thu thập thông tin và chốt spec với đối tác"),
    ("Lập Báo cáo Đánh giá", "Tổng hợp dữ liệu và gửi báo cáo tiến độ")
]

def generate_sql():
    lines = []
    lines.append("-- DBeaver Seed Data for HRM (Oracle Database) - 500 Employees, 28 Projects, 140 Tasks")
    lines.append("-- Chú ý: Cần bấm Alt + X (Execute Script) để chạy toàn bộ file.")
    lines.append("")
    lines.append("-- 1. Xóa dữ liệu cũ và reset sequence")
    lines.append("DELETE FROM tasks;")
    lines.append("DELETE FROM projects;")
    lines.append("DELETE FROM user_accounts;")
    lines.append("DELETE FROM employees;")
    lines.append("")
    lines.append("-- Reset identity column (Oracle 12c+)")
    lines.append("ALTER TABLE tasks MODIFY id GENERATED BY DEFAULT AS IDENTITY (START WITH 1);")
    lines.append("ALTER TABLE projects MODIFY id GENERATED BY DEFAULT AS IDENTITY (START WITH 1);")
    lines.append("")

    # Admin
    lines.append("-- 2. Insert dữ liệu Nhân viên Admin & 500 Employees")
    lines.append("""INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    'ADMIN001', 'Trần Văn Quản Trị', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'MALE', 'admin@company.com', '+84-901-234-567', 
    '123 Đường Nguyễn Huệ, Quận 1, TP.HCM', 'FULL_TIME', 'Ban Giám Đốc', 'Giám đốc Điều hành', 75000000.00, 
    'Vietcombank', '0123456789'
);""")

    # 500 Employees
    for i in range(1, 501):
        emp_id = f"EMP{i:03d}"
        gender = random.choice(["MALE", "FEMALE"])
        if gender == "MALE":
            name = f"{random.choice(LAST_NAMES)} {random.choice(FIRST_NAMES_MALE)} {random.choice(MID_NAMES_MALE)}"
        else:
            name = f"{random.choice(LAST_NAMES)} {random.choice(FIRST_NAMES_FEMALE)} {random.choice(MID_NAMES_FEMALE)}"
        
        dob_year = random.randint(1975, 2003)
        dob_month = random.randint(1, 12)
        dob_day = random.randint(1, 28)
        dob_str = f"{dob_year}-{dob_month:02d}-{dob_day:02d}"
        
        email = f"emp{i:03d}@company.com"
        phone = f"+84-9{random.randint(10,99)}-{random.randint(100,999)}-{random.randint(100,999)}"
        district = random.choice(["Quận 1", "Quận 3", "Quận 5", "Quận 7", "Quận Tân Bình", "Quận Bình Thạnh", "Quận Phú Nhuận"])
        address = f"{random.randint(1, 999)} Đường Nguyễn Trãi, {district}, TP.HCM"
        emp_type = random.choice(["FULL_TIME", "FULL_TIME", "FULL_TIME", "PART_TIME"])
        dept = random.choice(DEPARTMENTS)
        pos = random.choice(POSITIONS[dept])
        salary = round(random.uniform(12000000, 50000000), 2)
        bank = random.choice(BANKS)
        acc_num = "".join([str(random.randint(0, 9)) for _ in range(10)])

        lines.append(f"""INSERT INTO employees (
    employee_id, full_name, date_of_birth, gender, email, phone, 
    address, employee_type, department, position, salary, 
    bank_name, account_number
) VALUES (
    '{emp_id}', '{name}', TO_DATE('{dob_str}', 'YYYY-MM-DD'), '{gender}', '{email}', '{phone}', 
    '{address}', '{emp_type}', '{dept}', '{pos}', {salary:.2f}, 
    '{bank}', '{acc_num}'
);""")

    # User Accounts
    lines.append("\n-- 3. Insert dữ liệu Tài khoản (user_accounts)")
    lines.append("-- Password mặc định: admin123 -> Hash BCrypt: $2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK")
    lines.append("INSERT INTO user_accounts (employee_id, password, role) VALUES ('ADMIN001', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_ADMIN');")
    for i in range(1, 501):
        emp_id = f"EMP{i:03d}"
        lines.append(f"INSERT INTO user_accounts (employee_id, password, role) VALUES ('{emp_id}', '$2a$10$YDTWjFu3pQOOLaN6ICzx2u9XHlOd5W3TIJXlkbyPM75IYfrTseKbK', 'ROLE_EMPLOYEE');")

    # Projects (28 Projects)
    lines.append("\n-- 4. Insert dữ liệu Dự án (28 projects)")
    for p_code, name, desc, status in PROJECTS_DATA:
        lines.append(f"INSERT INTO projects (project_code, name, description, status) VALUES ('{p_code}', '{name}', '{desc}', '{status}');")

    # Tasks (140 Tasks distributed across 28 Projects)
    lines.append("\n-- 5. Insert dữ liệu Công việc (140 tasks)")
    task_count = 1
    for proj_index, (p_code, p_name, _, _) in enumerate(PROJECTS_DATA, start=1):
        # 5 tasks per project
        for t_idx in range(5):
            t_code = f"TSK{task_count:03d}"
            title_prefix, desc_prefix = random.choice(TASK_TEMPLATES)
            title = f"{title_prefix} - {p_name}"
            desc = f"{desc_prefix} cho dự án {p_name}."
            
            month = random.randint(8, 12)
            day = random.randint(1, 28)
            deadline = f"2026-{month:02d}-{day:02d}"
            status = random.choice(["TODO", "IN_PROGRESS", "DONE", "ON_HOLD"])
            assignee = f"EMP{random.randint(1, 500):03d}"
            
            # Using numeric project_id corresponding to identity sequence 1..28
            lines.append(f"INSERT INTO tasks (task_code, title, description, deadline, status, project_id, assignee_id) VALUES ('{t_code}', '{title}', '{desc}', TO_DATE('{deadline}', 'YYYY-MM-DD'), '{status}', {proj_index}, '{assignee}');")
            task_count += 1

    lines.append("\nCOMMIT;")

    with open("oracle_seed_data.sql", "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print("Successfully generated oracle_seed_data.sql with 500 employees, 28 projects, and 140 tasks!")

if __name__ == "__main__":
    generate_sql()
