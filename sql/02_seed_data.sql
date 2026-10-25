-- Sample data

-- department
INSERT INTO department (dept_id, dept_name, location) VALUES (1, 'HR', 'Dhaka');
INSERT INTO department (dept_id, dept_name, location) VALUES (2, 'IT', 'Dhaka');
INSERT INTO department (dept_id, dept_name, location) VALUES (3, 'Finance', 'Khulna');
INSERT INTO department (dept_id, dept_name, location) VALUES (4, 'Marketing', 'Khulna');

-- grade
INSERT INTO grade (grade_id, grade_name, basic_salary, bonus) VALUES (1, 'A', 5000, 1000);
INSERT INTO grade (grade_id, grade_name, basic_salary, bonus) VALUES (2, 'B', 4000, 800);
INSERT INTO grade (grade_id, grade_name, basic_salary, bonus) VALUES (3, 'C', 3000, 600);
INSERT INTO grade (grade_id, grade_name, basic_salary, bonus) VALUES (4, 'D', 2000, 400);

-- employee
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (1, 'Anto Paul', 'anto@example.com', 'Admin', 1, 1, NULL, '2022-03-01', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (2, 'Niloy Das', 'niloy@example.com', 'Manager', 2, 2, 1, '2023-05-05', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (3, 'Rahul Sen', 'rahul@example.com', 'Worker', 3, 3, 2, '2023-01-15', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (4, 'Raj Roy', 'raj@example.com', 'Worker', 4, 1, 2, '2023-01-15', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (5, 'Mitu Akter', 'mitu@example.com', 'Worker', 2, 3, 2, '2024-11-10', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (6, 'Sumon Ali', 'sumon@example.com', 'Worker', 3, 4, 3, '2025-02-20', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (7, 'Tania Khan', 'tania@example.com', 'Manager', 1, 2, 1, '2022-08-18', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (8, 'Imran Hossain', 'imran@example.com', 'Worker', 2, 2, 2, '2025-06-01', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (9, 'Farhana Islam', 'farhana@example.com', 'Worker', 4, 3, 4, '2024-03-12', 'Active');
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status) VALUES (10, 'Joy Biswas', 'joy@example.com', 'Worker', 3, 4, 3, '2026-01-05', 'Active');

-- payroll
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (1, 1, '2026-07', 5000, 1000, 0, 600, 5400, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (2, 1, '2026-08', 5000, 1000, 60, 606, 5454, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (3, 1, '2026-09', 5000, 1000, 120, 612, 5508, 'Pending');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (4, 2, '2026-07', 4000, 800, 60, 486, 4374, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (5, 2, '2026-08', 4000, 800, 120, 492, 4428, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (6, 2, '2026-09', 4000, 800, 180, 498, 4482, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (7, 3, '2026-07', 3000, 600, 120, 372, 3348, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (8, 3, '2026-08', 3000, 600, 180, 378, 3402, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (9, 3, '2026-09', 3000, 600, 0, 360, 3240, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (10, 4, '2026-07', 5000, 1000, 180, 618, 5562, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (11, 4, '2026-08', 5000, 1000, 0, 600, 5400, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (12, 4, '2026-09', 5000, 1000, 60, 606, 5454, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (13, 5, '2026-07', 3000, 600, 0, 360, 3240, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (14, 5, '2026-08', 3000, 600, 60, 366, 3294, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (15, 5, '2026-09', 3000, 600, 120, 372, 3348, 'Pending');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (16, 6, '2026-07', 2000, 400, 60, 246, 2214, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (17, 6, '2026-08', 2000, 400, 120, 252, 2268, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (18, 6, '2026-09', 2000, 400, 180, 258, 2322, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (19, 7, '2026-07', 4000, 800, 120, 492, 4428, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (20, 7, '2026-08', 4000, 800, 180, 498, 4482, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (21, 7, '2026-09', 4000, 800, 0, 480, 4320, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (22, 8, '2026-07', 4000, 800, 180, 498, 4482, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (23, 8, '2026-08', 4000, 800, 0, 480, 4320, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (24, 8, '2026-09', 4000, 800, 60, 486, 4374, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (25, 9, '2026-07', 3000, 600, 0, 360, 3240, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (26, 9, '2026-08', 3000, 600, 60, 366, 3294, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (27, 9, '2026-09', 3000, 600, 120, 372, 3348, 'Pending');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (28, 10, '2026-07', 2000, 400, 60, 246, 2214, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (29, 10, '2026-08', 2000, 400, 120, 252, 2268, 'Paid');
INSERT INTO payroll (pay_id, emp_id, pay_month, base_salary, bonus, overtime_pay, tax, net_pay, status) VALUES (30, 10, '2026-09', 2000, 400, 180, 258, 2322, 'Paid');

-- attendance
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (1, 1, '2026-07', 26, 0, 0);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (2, 1, '2026-08', 24, 2, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (3, 1, '2026-09', 22, 4, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (4, 2, '2026-07', 23, 3, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (5, 2, '2026-08', 26, 0, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (6, 2, '2026-09', 24, 2, 9);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (7, 3, '2026-07', 25, 1, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (8, 3, '2026-08', 23, 3, 9);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (9, 3, '2026-09', 26, 0, 0);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (10, 4, '2026-07', 22, 4, 9);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (11, 4, '2026-08', 25, 1, 0);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (12, 4, '2026-09', 23, 3, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (13, 5, '2026-07', 24, 2, 0);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (14, 5, '2026-08', 22, 4, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (15, 5, '2026-09', 25, 1, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (16, 6, '2026-07', 26, 0, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (17, 6, '2026-08', 24, 2, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (18, 6, '2026-09', 22, 4, 9);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (19, 7, '2026-07', 23, 3, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (20, 7, '2026-08', 26, 0, 9);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (21, 7, '2026-09', 24, 2, 0);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (22, 8, '2026-07', 25, 1, 9);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (23, 8, '2026-08', 23, 3, 0);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (24, 8, '2026-09', 26, 0, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (25, 9, '2026-07', 22, 4, 0);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (26, 9, '2026-08', 25, 1, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (27, 9, '2026-09', 23, 3, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (28, 10, '2026-07', 24, 2, 3);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (29, 10, '2026-08', 22, 4, 6);
INSERT INTO attendance (att_id, emp_id, pay_month, days_present, days_absent, overtime_hours) VALUES (30, 10, '2026-09', 25, 1, 9);
