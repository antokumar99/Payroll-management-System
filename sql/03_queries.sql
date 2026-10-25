-- Ready-made queries (same ones as the UI)

-- All employees with department & grade
SELECT e.emp_id, e.full_name, d.dept_name, g.grade_name, e.hire_date
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
JOIN grade g ON e.grade_id = g.grade_id
ORDER BY e.emp_id;

-- Headcount per department
SELECT d.dept_name, COUNT(*) AS headcount
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY headcount DESC;

-- Payroll cost per department (latest month)
SELECT d.dept_name, SUM(p.net_pay) AS total_net_pay
FROM payroll p
JOIN employee e ON p.emp_id = e.emp_id
JOIN department d ON e.dept_id = d.dept_id
WHERE p.pay_month = '2026-09'
GROUP BY d.dept_name
ORDER BY total_net_pay DESC;

-- Pay slip for one employee (change emp_id)
SELECT e.full_name, p.pay_month, p.base_salary, p.bonus, p.overtime_pay, p.tax, p.net_pay
FROM payroll p
JOIN employee e ON p.emp_id = e.emp_id
WHERE e.emp_id = 3
ORDER BY p.pay_month DESC;

-- Top 5 net pay records
SELECT e.full_name, p.pay_month, p.net_pay
FROM payroll p
JOIN employee e ON p.emp_id = e.emp_id
ORDER BY p.net_pay DESC
LIMIT 5;

-- Average net pay by grade
SELECT g.grade_name, ROUND(AVG(p.net_pay)) AS avg_net
FROM payroll p
JOIN employee e ON p.emp_id = e.emp_id
JOIN grade g ON e.grade_id = g.grade_id
GROUP BY g.grade_name
ORDER BY g.grade_name;

-- Pending payroll
SELECT e.full_name, p.pay_month, p.net_pay, p.status
FROM payroll p
JOIN employee e ON p.emp_id = e.emp_id
WHERE p.status = 'Pending';

-- Employees with most absences
SELECT e.full_name, SUM(a.days_absent) AS total_absent
FROM attendance a
JOIN employee e ON a.emp_id = e.emp_id
GROUP BY e.full_name
ORDER BY total_absent DESC;

-- Employees and their managers (self join)
SELECT e.full_name AS employee, m.full_name AS manager
FROM employee e
LEFT JOIN employee m ON e.manager_id = m.emp_id;

-- Hired on or after a date
SELECT full_name, hire_date FROM employee
WHERE hire_date >= '2024-10-01'
ORDER BY hire_date;

-- Search by name
SELECT * FROM employee WHERE full_name LIKE '%an%';

-- Total paid vs pending per month
SELECT pay_month, status, COUNT(*) AS slips, SUM(net_pay) AS total
FROM payroll
GROUP BY pay_month, status
ORDER BY pay_month;

-- Employees with no Pending payroll
SELECT full_name FROM employee
WHERE emp_id NOT IN (SELECT emp_id FROM payroll WHERE status = 'Pending');

-- [DML] Raise Grade B basic salary
UPDATE grade SET basic_salary = 4500 WHERE grade_name = 'B';

-- [DML] Add a new employee
INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status)
VALUES (11, 'New Hire', 'newhire@example.com', 'Worker', 2, 3, 2, '2026-10-01', 'Active');

-- [DML] Mark a payslip as Paid
UPDATE payroll SET status = 'Paid' WHERE pay_id = 1;
