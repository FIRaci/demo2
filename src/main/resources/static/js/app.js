const API_BASE = '/api';

let currentUser = null;
let currentEmployees = [];
let editingEmpId = null;

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
    const adminPanel = document.getElementById('adminPanel');
    const employeePanel = document.getElementById('employeePanel');

    if (currentUser.role === 'ROLE_ADMIN') {
        adminPanel.classList.remove('hidden');
        employeePanel.classList.add('hidden');
        fetchEmployees();
    } else {
        adminPanel.classList.add('hidden');
        employeePanel.classList.remove('hidden');
        fetchMyProfile();
    }
}

async function fetchEmployees() {
    const token = localStorage.getItem('token');
    const nameSearch = document.getElementById('searchInput').value;
    const typeFilter = document.getElementById('filterType').value;

    let queryParams = new URLSearchParams();
    if (nameSearch) queryParams.append('name', nameSearch);
    if (typeFilter) queryParams.append('employeeType', typeFilter);

    try {
        const response = await fetch(`${API_BASE}/employees?${queryParams.toString()}`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        const result = await response.json();

        if (result.success) {
            currentEmployees = result.data;
            renderEmployeeTable(currentEmployees);
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
