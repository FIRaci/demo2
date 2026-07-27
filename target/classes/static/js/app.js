const API_BASE = '/api';

let currentUser = null;
let currentEmployees = [];
let editingEmpId = null;

let employeePage = { number: 0, size: 10 };
let projectPage = { number: 0, size: 10 };
let taskPage = { number: 0, size: 10 };

document.addEventListener('DOMContentLoaded', () => {
    checkExistingAuth();
});

function showToast(message, type = 'info') {
    const toast = document.getElementById('toast');
    const toastMessage = document.getElementById('toastMessage');
    const toastIcon = document.getElementById('toastIcon');

    toastMessage.textContent = message;
    toast.className = `toast toast-${type}`;
    
    if (type === 'success') {
        toastIcon.className = 'fa-solid fa-circle-check';
    } else if (type === 'error') {
        toastIcon.className = 'fa-solid fa-circle-xmark';
    } else {
        toastIcon.className = 'fa-solid fa-circle-info';
    }

    toast.classList.remove('hidden');
    setTimeout(() => {
        toast.classList.add('hidden');
    }, 4000);
}

function switchAuthTab(tab) {
    const tabLogin = document.getElementById('tabLogin');
    const tabRegister = document.getElementById('tabRegister');
    const formLogin = document.getElementById('formLogin');
    const formRegister = document.getElementById('formRegister');

    if (tab === 'login') {
        tabLogin.classList.add('active');
        tabRegister.classList.remove('active');
        formLogin.classList.remove('hidden');
        formRegister.classList.add('hidden');
    } else {
        tabRegister.classList.add('active');
        tabLogin.classList.remove('active');
        formRegister.classList.remove('hidden');
        formLogin.classList.add('hidden');
    }
}

function fillLogin(empId, password) {
    document.getElementById('loginEmpId').value = empId;
    document.getElementById('loginPassword').value = password;
}

function checkExistingAuth() {
    const token = localStorage.getItem('token');
    const userStr = localStorage.getItem('user');

    if (token && userStr) {
        currentUser = JSON.parse(userStr);
        setupUserUI();
        loadDashboard();
    } else {
        showAuthView();
    }
}

function showAuthView() {
    document.getElementById('userSection').classList.add('hidden');
    document.getElementById('authView').classList.remove('hidden');
    document.getElementById('dashboardView').classList.add('hidden');
}

function setupUserUI() {
    document.getElementById('userSection').classList.remove('hidden');
    document.getElementById('authView').classList.add('hidden');
    document.getElementById('dashboardView').classList.remove('hidden');

    document.getElementById('navUserName').textContent = currentUser.fullName || currentUser.employeeId;
    const roleBadge = document.getElementById('navUserRole');
    roleBadge.textContent = currentUser.role === 'ROLE_ADMIN' ? 'ADMIN' : 'EMPLOYEE';
    roleBadge.className = currentUser.role === 'ROLE_ADMIN' ? 'user-role badge-admin' : 'user-role badge-employee';

    document.getElementById('btnLogout').onclick = handleLogout;
}

async function handleLogin(event) {
    event.preventDefault();
    const empId = document.getElementById('loginEmpId').value;
    const password = document.getElementById('loginPassword').value;

    try {
        const response = await fetch(`${API_BASE}/auth/login`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ employeeId: empId, password: password })
        });
        const result = await response.json();

        if (result.success) {
            localStorage.setItem('token', result.data.token);
            localStorage.setItem('user', JSON.stringify(result.data));
            currentUser = result.data;
            showToast('Login successful!', 'success');
            setupUserUI();
            loadDashboard();
        } else {
            showToast(result.message || 'Login failed', 'error');
        }
    } catch (err) {
        showToast('Network error during login', 'error');
    }
}

async function handleRegister(event) {
    event.preventDefault();
    const empId = document.getElementById('regEmpId').value;
    const password = document.getElementById('regPassword').value;

    try {
        const response = await fetch(`${API_BASE}/auth/register`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ employeeId: empId, password: password })
        });
        const result = await response.json();

        if (result.success) {
            localStorage.setItem('token', result.data.token);
            localStorage.setItem('user', JSON.stringify(result.data));
            currentUser = result.data;
            showToast('Account registered and logged in successfully!', 'success');
            setupUserUI();
            loadDashboard();
        } else {
            showToast(result.message || 'Registration failed', 'error');
        }
    } catch (err) {
        showToast('Network error during registration', 'error');
    }
}

function handleLogout() {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    currentUser = null;
    showToast('Logged out successfully');
    showAuthView();
}

async function loadDashboard() {
    const isAdmin = currentUser.role === 'ROLE_ADMIN';
    document.getElementById('tabAdminEmployees').classList.toggle('hidden', !isAdmin);
    document.getElementById('tabAdminProjects').classList.toggle('hidden', !isAdmin);
    document.getElementById('tabAdminTasks').classList.toggle('hidden', !isAdmin);
    
    document.getElementById('tabEmpProfile').classList.toggle('hidden', isAdmin);
    document.getElementById('tabEmpTasks').classList.toggle('hidden', isAdmin);

    if (isAdmin) {
        switchDashboardTab('adminEmployees');
    } else {
        switchDashboardTab('empProfile');
    }
}

function switchDashboardTab(tabName) {
    // Hide all panels
    document.getElementById('adminPanel').classList.add('hidden');
    document.getElementById('employeePanel').classList.add('hidden');
    document.getElementById('projectPanel').classList.add('hidden');
    document.getElementById('taskPanel').classList.add('hidden');
    
    // Reset active tabs
    document.querySelectorAll('#dashboardTabs .tab-btn').forEach(btn => btn.classList.remove('active'));
    
    document.getElementById('schedulePanel').classList.add('hidden');
    
    if (tabName === 'adminEmployees') {
        document.getElementById('tabAdminEmployees').classList.add('active');
        document.getElementById('adminPanel').classList.remove('hidden');
        fetchEmployees();
    } else if (tabName === 'adminProjects') {
        document.getElementById('tabAdminProjects').classList.add('active');
        document.getElementById('projectPanel').classList.remove('hidden');
        fetchProjects();
    } else if (tabName === 'adminTasks' || tabName === 'empTasks') {
        const isEmp = tabName === 'empTasks';
        if(isEmp) {
            document.getElementById('tabEmpTasks').classList.add('active');
            document.getElementById('taskPanelDesc').textContent = "View and update your assigned tasks";
        } else {
            document.getElementById('tabAdminTasks').classList.add('active');
            document.getElementById('taskPanelDesc').textContent = "Manage all tasks in the system";
        }
        document.getElementById('taskPanel').classList.remove('hidden');
        document.getElementById('btnAddTask').classList.remove('hidden');
        fetchTasks(isEmp);
    } else if (tabName === 'empProfile') {
        document.getElementById('tabEmpProfile').classList.add('active');
        document.getElementById('employeePanel').classList.remove('hidden');
        fetchMyProfile();
    } else if (tabName === 'adminSchedule') {
        document.getElementById('tabAdminSchedule').classList.add('active');
        document.getElementById('schedulePanel').classList.remove('hidden');
        fetchSchedule();
    }
}
async function fetchEmployees() {
    const token = localStorage.getItem('token');
    const nameSearch = document.getElementById('searchInput').value;
    const typeFilter = document.getElementById('filterType').value;

    let queryParams = new URLSearchParams();
    if (nameSearch) queryParams.append('name', nameSearch);
    if (typeFilter) queryParams.append('employeeType', typeFilter);
    queryParams.append('page', employeePage.number);
    queryParams.append('size', employeePage.size);

    try {
        const response = await fetch(`${API_BASE}/employees?${queryParams.toString()}`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();

        if (result.success) {
            currentEmployees = result.data.content;
            renderEmployeeTable(currentEmployees);
            renderPagination('employeePagination', result.data, (page, size) => {
                employeePage.number = page;
                employeePage.size = size;
                fetchEmployees();
            });
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error loading employee list', 'error');
    }
}

function triggerFilter() {
    fetchEmployees();
}

function renderEmployeeTable(employees) {
    const tbody = document.getElementById('employeeTableBody');
    tbody.innerHTML = '';

    if (employees.length === 0) {
        tbody.innerHTML = `<tr><td colspan="8" style="text-align:center; padding: 2rem; color: var(--text-muted);">No employees found matching criteria.</td></tr>`;
        return;
    }

    employees.forEach(emp => {
        const tr = document.createElement('tr');
        const formattedSalary = emp.salary != null ? `$${parseFloat(emp.salary).toLocaleString()}` : '<span class="text-muted">Hidden</span>';
        const typeBadgeClass = emp.employeeType === 'FULL_TIME' ? 'badge-fulltime' : 'badge-parttime';

        tr.innerHTML = `
            <td><strong>${emp.employeeId}</strong></td>
            <td>${emp.fullName}</td>
            <td>${emp.age != null ? `${emp.age} yrs` : '-'} <br><small class="text-muted">${emp.dateOfBirth || '-'}</small></td>
            <td>${emp.gender || '-'}</td>
            <td><span class="badge ${typeBadgeClass}">${emp.employeeType}</span></td>
            <td>${emp.position || '-'} <br><small class="text-muted">${emp.department || '-'}</small></td>
            <td class="text-success">${formattedSalary}</td>
            <td>
                <div class="action-btns">
                    <button class="btn btn-secondary btn-sm" onclick="viewEmployeeDetail('${emp.employeeId}')" title="View Detail"><i class="fa-solid fa-eye"></i></button>
                    <button class="btn btn-primary btn-sm" onclick="openEditModal('${emp.employeeId}')" title="Edit"><i class="fa-solid fa-pen"></i></button>
                    <button class="btn btn-danger btn-sm" onclick="deleteEmployee('${emp.employeeId}')" title="Delete"><i class="fa-solid fa-trash"></i></button>
                </div>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

async function fetchMyProfile() {
    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/employees/me`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();

        if (result.success) {
            const emp = result.data;
            document.getElementById('empProfName').textContent = emp.fullName;
            document.getElementById('empProfPos').textContent = `${emp.position || 'Employee'} • ${emp.department || 'General'}`;
            document.getElementById('empProfType').textContent = emp.employeeType;
            document.getElementById('empProfId').textContent = emp.employeeId;
            document.getElementById('empProfDob').textContent = `${emp.dateOfBirth || 'N/A'} (${emp.age != null ? emp.age + ' years old' : 'N/A'})`;
            document.getElementById('empProfGender').textContent = emp.gender || 'N/A';
            document.getElementById('empProfEmail').textContent = emp.email || 'N/A';
            document.getElementById('empProfPhone').textContent = emp.phone || 'N/A';
            document.getElementById('empProfAddress').textContent = emp.address || 'N/A';
            document.getElementById('empProfSalary').textContent = emp.salary != null ? `$${parseFloat(emp.salary).toLocaleString()} USD` : 'Confidential';
            document.getElementById('empProfBank').textContent = emp.bankName ? `${emp.bankName} (${emp.accountNumber || 'N/A'})` : 'N/A';
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error loading personal profile', 'error');
    }
}

async function viewEmployeeDetail(empId) {
    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/employees/${empId}`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();

        if (result.success) {
            const emp = result.data;
            const content = document.getElementById('detailsContent');
            content.innerHTML = `
                <div class="detail-row"><label>Employee ID</label><span>${emp.employeeId}</span></div>
                <div class="detail-row"><label>Full Name</label><span>${emp.fullName}</span></div>
                <div class="detail-row"><label>Age / Date of Birth</label><span>${emp.age != null ? emp.age + ' yrs' : '-'} (${emp.dateOfBirth || 'N/A'})</span></div>
                <div class="detail-row"><label>Gender</label><span>${emp.gender || 'N/A'}</span></div>
                <div class="detail-row"><label>Employee Type</label><span>${emp.employeeType}</span></div>
                <div class="detail-row"><label>Department</label><span>${emp.department || 'N/A'}</span></div>
                <div class="detail-row"><label>Position</label><span>${emp.position || 'N/A'}</span></div>
                <div class="detail-row"><label>Email</label><span>${emp.email || 'N/A'}</span></div>
                <div class="detail-row"><label>Phone</label><span>${emp.phone || 'N/A'}</span></div>
                <div class="detail-row"><label>Salary ($)</label><span class="text-success">${emp.salary != null ? '$' + parseFloat(emp.salary).toLocaleString() : 'Hidden'}</span></div>
                <div class="detail-row"><label>Bank Name</label><span>${emp.bankName || 'N/A'}</span></div>
                <div class="detail-row"><label>Account Number</label><span>${emp.accountNumber || 'N/A'}</span></div>
            `;
            document.getElementById('detailsModal').classList.remove('hidden');
        }
    } catch (err) {
        showToast('Error getting employee details', 'error');
    }
}

function closeDetailsModal() {
    document.getElementById('detailsModal').classList.add('hidden');
}

function openAddModal() {
    editingEmpId = null;
    document.getElementById('modalTitle').innerHTML = `<i class="fa-solid fa-user-plus"></i> Add New Employee`;
    document.getElementById('employeeForm').reset();
    document.getElementById('mEmpId').disabled = false;
    document.getElementById('employeeModal').classList.remove('hidden');
}

function openEditModal(empId) {
    const emp = currentEmployees.find(e => e.employeeId === empId);
    if (!emp) return;

    editingEmpId = empId;
    document.getElementById('modalTitle').innerHTML = `<i class="fa-solid fa-user-pen"></i> Edit Employee (${empId})`;
    document.getElementById('mEmpId').value = emp.employeeId;
    document.getElementById('mEmpId').disabled = true;
    document.getElementById('mFullName').value = emp.fullName || '';
    document.getElementById('mDob').value = emp.dateOfBirth || '';
    document.getElementById('mGender').value = emp.gender || 'MALE';
    document.getElementById('mEmail').value = emp.email || '';
    document.getElementById('mPhone').value = emp.phone || '';
    document.getElementById('mAddress').value = emp.address || '';
    document.getElementById('mEmpType').value = emp.employeeType || 'FULL_TIME';
    document.getElementById('mDepartment').value = emp.department || '';
    document.getElementById('mPosition').value = emp.position || '';
    document.getElementById('mSalary').value = emp.salary != null ? emp.salary : '';
    document.getElementById('mBankName').value = emp.bankName || '';
    document.getElementById('mAccountNumber').value = emp.accountNumber || '';

    document.getElementById('employeeModal').classList.remove('hidden');
}

function closeModal() {
    document.getElementById('employeeModal').classList.add('hidden');
}

async function handleSaveEmployee(event) {
    event.preventDefault();
    const token = localStorage.getItem('token');

    const empData = {
        employeeId: document.getElementById('mEmpId').value,
        fullName: document.getElementById('mFullName').value,
        dateOfBirth: document.getElementById('mDob').value || null,
        gender: document.getElementById('mGender').value,
        email: document.getElementById('mEmail').value || null,
        phone: document.getElementById('mPhone').value || null,
        address: document.getElementById('mAddress').value || null,
        employeeType: document.getElementById('mEmpType').value,
        department: document.getElementById('mDepartment').value || null,
        position: document.getElementById('mPosition').value || null,
        salary: document.getElementById('mSalary').value ? parseFloat(document.getElementById('mSalary').value) : null,
        bankName: document.getElementById('mBankName').value || null,
        accountNumber: document.getElementById('mAccountNumber').value || null
    };

    const isEdit = editingEmpId !== null;
    const url = isEdit ? `${API_BASE}/employees/${editingEmpId}` : `${API_BASE}/employees`;
    const method = isEdit ? 'PUT' : 'POST';

    try {
        const response = await fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(empData)
        });
        const result = await response.json();

        if (result.success) {
            showToast(result.message || 'Saved successfully', 'success');
            closeModal();
            fetchEmployees();
        } else {
            showToast(result.message || 'Failed to save', 'error');
        }
    } catch (err) {
        showToast('Error saving employee record', 'error');
    }
}

async function deleteEmployee(empId) {
    if (!confirm(`Are you sure you want to delete employee [${empId}]?`)) return;

    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/employees/${empId}`, {
            method: 'DELETE',
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();

        if (result.success) {
            showToast('Employee deleted successfully', 'success');
            fetchEmployees();
        } else {
            showToast(result.message || 'Failed to delete', 'error');
        }
    } catch (err) {
        showToast('Error deleting employee', 'error');
    }
}

async function fetchProjects() {
    const token = localStorage.getItem('token');
    const keyword = document.getElementById('searchProjectInput') ? document.getElementById('searchProjectInput').value : '';
    const sortVal = document.getElementById('sortProjectSelect') ? document.getElementById('sortProjectSelect').value : 'id,desc';
    const [sortBy, sortDir] = sortVal.split(',');
    
    let queryParams = new URLSearchParams();
    if (keyword) queryParams.append('keyword', keyword);
    queryParams.append('sortBy', sortBy);
    queryParams.append('sortDir', sortDir);
    queryParams.append('page', projectPage.number);
    queryParams.append('size', projectPage.size);
    
    try {
        const response = await fetch(`${API_BASE}/projects?${queryParams.toString()}`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();

        if (result.success) {
            renderProjectTable(result.data.content);
            renderPagination('projectPagination', result.data, (page, size) => {
                projectPage.number = page;
                projectPage.size = size;
                fetchProjects();
            });
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error loading project list', 'error');
    }
}

function renderProjectTable(projects) {
    const tbody = document.getElementById('projectTableBody');
    tbody.innerHTML = '';

    if (projects.length === 0) {
        tbody.innerHTML = `<tr><td colspan="4" style="text-align:center; padding: 2rem; color: var(--text-muted);">No projects found.</td></tr>`;
        return;
    }

    projects.forEach(proj => {
        const tr = document.createElement('tr');
        
        let actionHtml = '-';
        if (currentUser && currentUser.role === 'ROLE_ADMIN') {
            actionHtml = `
                <div class="action-btns">
                    <button class="btn btn-secondary btn-sm" onclick="viewProjectTasks(${proj.id}, '${proj.projectId}')" title="View Tasks"><i class="fa-solid fa-list-check"></i></button>
                    <button class="btn btn-primary btn-sm" onclick="editProject(${proj.id})" title="Edit"><i class="fa-solid fa-pen"></i></button>
                    <button class="btn btn-danger btn-sm" onclick="deleteProject(${proj.id})" title="Delete"><i class="fa-solid fa-trash"></i></button>
                </div>
            `;
        }

        tr.innerHTML = `
            <td><strong>${proj.projectId}</strong></td>
            <td>${proj.name}</td>
            <td>${proj.description || '-'}</td>
            <td><span class="badge badge-primary">${proj.status}</span></td>
            <td>${actionHtml}</td>
        `;
        tbody.appendChild(tr);
    });
}

function triggerProjectFilter() {
    projectPage.number = 0;
    fetchProjects();
}

let editingProjectId = null;

function openProjectModal() {
    editingProjectId = null;
    document.getElementById('projectModalTitle').innerHTML = `<i class="fa-solid fa-briefcase"></i> Add New Project`;
    document.getElementById('projectForm').reset();
    document.getElementById('pCode').disabled = false;
    document.getElementById('projectModal').classList.remove('hidden');
}

function closeProjectModal() {
    document.getElementById('projectModal').classList.add('hidden');
}

async function editProject(id) {
    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/projects/${id}`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();
        
        if (result.success) {
            const proj = result.data;
            editingProjectId = id;
            document.getElementById('projectModalTitle').innerHTML = `<i class="fa-solid fa-pen"></i> Edit Project (${proj.projectId})`;
            document.getElementById('pId').value = proj.id;
            document.getElementById('pCode').value = proj.projectId;
            document.getElementById('pCode').disabled = true;
            document.getElementById('pName').value = proj.name;
            document.getElementById('pDescription').value = proj.description || '';
            document.getElementById('pStatus').value = proj.status;
            document.getElementById('projectModal').classList.remove('hidden');
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error loading project details', 'error');
    }
}

async function handleSaveProject(event) {
    event.preventDefault();
    const token = localStorage.getItem('token');
    
    const projData = {
        projectId: document.getElementById('pCode').value,
        name: document.getElementById('pName').value,
        description: document.getElementById('pDescription').value || null,
        status: document.getElementById('pStatus').value
    };
    
    const url = editingProjectId ? `${API_BASE}/projects/${editingProjectId}` : `${API_BASE}/projects`;
    const method = editingProjectId ? 'PUT' : 'POST';
    
    try {
        const response = await fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(projData)
        });
        const result = await response.json();
        
        if (result.success) {
            showToast(result.message || 'Project saved successfully', 'success');
            closeProjectModal();
            fetchProjects();
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error saving project', 'error');
    }
}

async function deleteProject(id) {
    if (!confirm(`Are you sure you want to delete Project ID: ${id}?`)) return;
    
    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/projects/${id}`, {
            method: 'DELETE',
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();
        
        if (result.success) {
            showToast('Project deleted successfully', 'success');
            fetchProjects();
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error deleting project', 'error');
    }
}

async function fetchTasks(isEmp = false) {
    const token = localStorage.getItem('token');
    
    const keyword = document.getElementById('searchTaskInput') ? document.getElementById('searchTaskInput').value : '';
    const sortVal = document.getElementById('sortTaskSelect') ? document.getElementById('sortTaskSelect').value : 'id,desc';
    const [sortBy, sortDir] = sortVal.split(',');
    
    let queryParams = new URLSearchParams();
    if (keyword) queryParams.append('keyword', keyword);
    queryParams.append('sortBy', sortBy);
    queryParams.append('sortDir', sortDir);
    queryParams.append('page', taskPage.number);
    queryParams.append('size', taskPage.size);
    
    if (isEmp && currentUser && currentUser.employeeId) {
        queryParams.append('assigneeId', currentUser.employeeId);
    }
    
    let url = `${API_BASE}/tasks?${queryParams.toString()}`;
    
    try {
        const response = await fetch(url, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();

        if (result.success) {
            renderTaskTable(result.data.content, isEmp);
            renderPagination('taskPagination', result.data, (page, size) => {
                taskPage.number = page;
                taskPage.size = size;
                fetchTasks(isEmp);
            });
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error loading task list', 'error');
    }
}

function renderTaskTable(tasks, isEmp) {
    const tbody = document.getElementById('taskTableBody');
    tbody.innerHTML = '';

    if (tasks.length === 0) {
        tbody.innerHTML = `<tr><td colspan="7" style="text-align:center; padding: 2rem; color: var(--text-muted);">No tasks found.</td></tr>`;
        return;
    }

    const today = new Date();
    today.setHours(0,0,0,0);

    tasks.forEach(task => {
        const tr = document.createElement('tr');
        
        // Determine status and CSS class
        let rowClass = 'task-normal';
        if (task.status === 'DONE') {
            rowClass = 'task-done';
        } else if (task.status === 'ON_HOLD') {
            rowClass = 'task-on-hold';
        } else {
            // Check deadline
            if (task.deadline) {
                const deadlineDate = new Date(task.deadline);
                deadlineDate.setHours(0,0,0,0);
                if (deadlineDate < today) {
                    rowClass = 'task-late';
                }
            }
        }
        
        tr.className = rowClass;

        const projectName = task.project ? task.project.projectId : '-';
        const assigneeName = task.assignee ? task.assignee.fullName : 'Unassigned';

        let actionHtml = '-';
        if (isEmp) {
            actionHtml = `
                <div class="action-btns" style="flex-wrap: wrap;">
                    <select class="form-select" style="padding: 4px; font-size: 0.8rem; min-width: 110px;" onchange="updateTaskStatus(${task.id}, this.value)">
                        <option value="TODO" ${task.status === 'TODO' ? 'selected' : ''}>TODO</option>
                        <option value="IN_PROGRESS" ${task.status === 'IN_PROGRESS' ? 'selected' : ''}>IN_PROGRESS</option>
                        <option value="DONE" ${task.status === 'DONE' ? 'selected' : ''}>DONE</option>
                        <option value="ON_HOLD" ${task.status === 'ON_HOLD' ? 'selected' : ''}>ON_HOLD</option>
                    </select>
                    <button class="btn btn-primary btn-sm" onclick="editTask(${task.id})" title="Edit"><i class="fa-solid fa-pen"></i></button>
                    <button class="btn btn-danger btn-sm" onclick="deleteTask(${task.id})" title="Delete"><i class="fa-solid fa-trash"></i></button>
                </div>
            `;
        } else {
            actionHtml = `
                <div class="action-btns">
                    <button class="btn btn-primary btn-sm" onclick="editTask(${task.id})" title="Edit"><i class="fa-solid fa-pen"></i></button>
                    <button class="btn btn-danger btn-sm" onclick="deleteTask(${task.id})" title="Delete"><i class="fa-solid fa-trash"></i></button>
                </div>
            `;
        }

        tr.innerHTML = `
            <td><strong>${task.taskId}</strong></td>
            <td>${task.title}</td>
            <td>${projectName}</td>
            <td>${assigneeName}</td>
            <td>${task.deadline || '-'}</td>
            <td><strong>${task.status}</strong></td>
            <td>${actionHtml}</td>
        `;
        tbody.appendChild(tr);
    });
}

function triggerTaskFilter() {
    taskPage.number = 0;
    const isEmp = document.getElementById('tabEmpTasks').classList.contains('active');
    fetchTasks(isEmp);
}

let editingTaskId = null;

function openTaskModal() {
    editingTaskId = null;
    document.getElementById('taskModalTitle').innerHTML = `<i class="fa-solid fa-list-check"></i> Add New Task`;
    document.getElementById('taskForm').reset();
    document.getElementById('tCode').disabled = false;
    document.getElementById('taskModal').classList.remove('hidden');
}

function closeTaskModal() {
    document.getElementById('taskModal').classList.add('hidden');
}

async function editTask(id) {
    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/tasks/${id}`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();
        
        if (result.success) {
            const task = result.data;
            editingTaskId = id;
            document.getElementById('taskModalTitle').innerHTML = `<i class="fa-solid fa-pen"></i> Edit Task (${task.taskId})`;
            document.getElementById('tId').value = task.id;
            document.getElementById('tCode').value = task.taskId;
            document.getElementById('tCode').disabled = true;
            document.getElementById('tTitle').value = task.title;
            document.getElementById('tDescription').value = task.description || '';
            document.getElementById('tProjectId').value = task.project ? task.project.projectId : '';
            document.getElementById('tAssigneeId').value = task.assignee ? task.assignee.employeeId : '';
            document.getElementById('tDeadline').value = task.deadline || '';
            document.getElementById('tStatus').value = task.status;
            document.getElementById('taskModal').classList.remove('hidden');
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error loading task details', 'error');
    }
}

async function handleSaveTask(event) {
    event.preventDefault();
    const token = localStorage.getItem('token');
    
    const taskData = {
        taskId: document.getElementById('tCode').value,
        title: document.getElementById('tTitle').value,
        description: document.getElementById('tDescription').value || null,
        projectId: document.getElementById('tProjectId').value,
        assigneeId: document.getElementById('tAssigneeId').value,
        deadline: document.getElementById('tDeadline').value || null,
        status: document.getElementById('tStatus').value
    };
    
    const url = editingTaskId ? `${API_BASE}/tasks/${editingTaskId}` : `${API_BASE}/tasks`;
    const method = editingTaskId ? 'PUT' : 'POST';
    
    try {
        const response = await fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(taskData)
        });
        const result = await response.json();
        
        if (result.success) {
            showToast(result.message || 'Task saved successfully', 'success');
            closeTaskModal();
            fetchTasks(false);
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error saving task', 'error');
    }
}

async function deleteTask(id) {
    if (!confirm(`Are you sure you want to delete Task ID: ${id}?`)) return;
    
    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/tasks/${id}`, {
            method: 'DELETE',
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();
        
        if (result.success) {
            showToast('Task deleted successfully', 'success');
            fetchTasks(false);
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error deleting task', 'error');
    }
}

async function updateTaskStatus(taskId, newStatus) {
    const token = localStorage.getItem('token');
    try {
        const response = await fetch(`${API_BASE}/tasks/${taskId}/status`, {
            method: 'PATCH',
            headers: { 
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ status: newStatus })
        });
        const result = await response.json();
        
        if (result.success) {
            showToast('Task updated successfully', 'success');
            // Refresh current view
            if (currentUser.role === 'ROLE_ADMIN') {
                fetchTasks(false);
            } else {
                fetchTasks(true);
            }
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error updating task', 'error');
    }
}

function renderPagination(containerId, pageData, onPageChange) {
    const container = document.getElementById(containerId);
    if (!container) return;
    
    if (pageData.totalElements === 0) {
        container.innerHTML = '';
        return;
    }

    const { number, size, totalElements, totalPages } = pageData;
    const startItem = number * size + 1;
    const endItem = Math.min((number + 1) * size, totalElements);

    // Create container
    container.innerHTML = `
        <div class="pagination-info">
            Showing <strong>${startItem}</strong> to <strong>${endItem}</strong> of <strong>${totalElements}</strong> entries
        </div>
        <div class="pagination-actions">
            <div>
                Rows per page: 
                <select id="${containerId}-size-select">
                    <option value="10" ${size === 10 ? 'selected' : ''}>10</option>
                    <option value="20" ${size === 20 ? 'selected' : ''}>20</option>
                    <option value="50" ${size === 50 ? 'selected' : ''}>50</option>
                </select>
            </div>
            <div class="pagination-buttons">
                <button id="${containerId}-prev" ${number === 0 ? 'disabled' : ''}>
                    <i class="fa-solid fa-chevron-left"></i> Prev
                </button>
                <span style="padding: 6px 12px; font-weight: 600;">Page ${number + 1} / ${totalPages}</span>
                <button id="${containerId}-next" ${number >= totalPages - 1 ? 'disabled' : ''}>
                    Next <i class="fa-solid fa-chevron-right"></i>
                </button>
            </div>
        </div>
    `;

    // Add Event Listeners
    document.getElementById(`${containerId}-size-select`).addEventListener('change', (e) => {
        onPageChange(0, parseInt(e.target.value));
    });
    
    const prevBtn = document.getElementById(`${containerId}-prev`);
    if (prevBtn) {
        prevBtn.addEventListener('click', () => {
            if (number > 0) onPageChange(number - 1, size);
        });
    }

    const nextBtn = document.getElementById(`${containerId}-next`);
    if (nextBtn) {
        nextBtn.addEventListener('click', () => {
            if (number < totalPages - 1) onPageChange(number + 1, size);
        });
    }
}

// PROJECT TASKS MODAL & SCHEDULE VIEW

async function viewProjectTasks(projectId, projectCode) {
    const token = localStorage.getItem('token');
    document.getElementById('projectTasksTitle').innerHTML = `<i class="fa-solid fa-list-check"></i> Tasks for Project (${projectCode})`;
    
    try {
        const response = await fetch(`${API_BASE}/tasks?projectId=${projectId}&size=50`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();
        
        if (result.success) {
            const tbody = document.getElementById('projectTasksTableBody');
            tbody.innerHTML = '';
            
            if (result.data.content.length === 0) {
                tbody.innerHTML = `<tr><td colspan="5" style="text-align:center;">No tasks found for this project.</td></tr>`;
            } else {
                result.data.content.forEach(task => {
                    const assigneeName = task.assignee ? task.assignee.fullName : 'Unassigned';
                    tbody.innerHTML += `
                        <tr>
                            <td><strong>${task.taskId}</strong></td>
                            <td>${task.title}</td>
                            <td>${assigneeName}</td>
                            <td>${task.deadline || '-'}</td>
                            <td><strong>${task.status}</strong></td>
                        </tr>
                    `;
                });
            }
            
            document.getElementById('projectTasksModal').classList.remove('hidden');
        } else {
            showToast(result.message, 'error');
        }
    } catch (err) {
        showToast('Error loading project tasks', 'error');
    }
}

function closeProjectTasksModal() {
    document.getElementById('projectTasksModal').classList.add('hidden');
}

async function fetchSchedule() {
    const token = localStorage.getItem('token');
    try {
        // Fetch top projects and tasks
        const projRes = await fetch(`${API_BASE}/projects?size=10&sortBy=id&sortDir=desc`, { headers: { 'Authorization': `Bearer ${token}` }});
        const taskRes = await fetch(`${API_BASE}/tasks?size=20&sortBy=deadline&sortDir=asc`, { headers: { 'Authorization': `Bearer ${token}` }});
        
        const pResult = await projRes.json();
        const tResult = await taskRes.json();
        
        if (pResult.success && tResult.success) {
            const tbody = document.getElementById('scheduleTableBody');
            tbody.innerHTML = '';
            
            let timeline = [];
            
            pResult.data.content.forEach(p => {
                timeline.push({
                    deadline: 'N/A', // Projects don't have explicit deadline in our basic schema
                    type: 'Project',
                    idName: `[${p.projectId}] ${p.name}`,
                    status: p.status,
                    detail: 'Admin/Manager'
                });
            });
            
            tResult.data.content.forEach(t => {
                timeline.push({
                    deadline: t.deadline || 'No Deadline',
                    type: 'Task',
                    idName: `[${t.taskId}] ${t.title}`,
                    status: t.status,
                    detail: t.assignee ? t.assignee.fullName : 'Unassigned'
                });
            });
            
            // Sort timeline by deadline string (basic sort)
            timeline.sort((a, b) => a.deadline.localeCompare(b.deadline));
            
            timeline.forEach(item => {
                let badgeClass = item.type === 'Project' ? 'badge-primary' : 'badge-admin';
                if (item.status === 'DONE' || item.status === 'COMPLETED') badgeClass = 'badge-fulltime';
                if (item.status === 'ON_HOLD') badgeClass = 'badge-parttime';
                
                tbody.innerHTML += `
                    <tr>
                        <td><strong>${item.deadline}</strong></td>
                        <td><span class="badge ${item.type === 'Project' ? 'badge-employee' : 'badge-admin'}">${item.type}</span></td>
                        <td>${item.idName}</td>
                        <td><span class="badge ${badgeClass}">${item.status}</span></td>
                        <td>${item.detail}</td>
                    </tr>
                `;
            });
        }
    } catch (err) {
        showToast('Error loading schedule', 'error');
    }
}
