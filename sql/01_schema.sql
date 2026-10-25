-- Payroll Management System: schema (SQLite / ANSI-friendly)
PRAGMA foreign_keys = ON;

CREATE TABLE department (
  dept_id    INTEGER PRIMARY KEY,
  dept_name  TEXT NOT NULL UNIQUE,
  location   TEXT
);

CREATE TABLE grade (
  grade_id     INTEGER PRIMARY KEY,
  grade_name   TEXT NOT NULL UNIQUE,
  basic_salary NUMERIC NOT NULL CHECK (basic_salary >= 0),
  bonus        NUMERIC NOT NULL DEFAULT 0
);

CREATE TABLE employee (
  emp_id     INTEGER PRIMARY KEY,
  full_name  TEXT NOT NULL,
  email      TEXT NOT NULL UNIQUE,
  role       TEXT NOT NULL CHECK (role IN ('Admin','Manager','Worker')),
  dept_id    INTEGER NOT NULL REFERENCES department(dept_id),
  grade_id   INTEGER NOT NULL REFERENCES grade(grade_id),
  manager_id INTEGER REFERENCES employee(emp_id),
  hire_date  TEXT NOT NULL,           -- YYYY-MM-DD
  status     TEXT NOT NULL DEFAULT 'Active'
);

CREATE TABLE payroll (
  pay_id       INTEGER PRIMARY KEY,
  emp_id       INTEGER NOT NULL REFERENCES employee(emp_id),
  pay_month    TEXT NOT NULL,         -- YYYY-MM
  base_salary  NUMERIC NOT NULL,
  bonus        NUMERIC NOT NULL DEFAULT 0,
  overtime_pay NUMERIC NOT NULL DEFAULT 0,
  tax          NUMERIC NOT NULL DEFAULT 0,
  net_pay      NUMERIC NOT NULL,
  status       TEXT NOT NULL DEFAULT 'Pending' CHECK (status IN ('Paid','Pending')),
  UNIQUE (emp_id, pay_month)
);

CREATE TABLE attendance (
  att_id         INTEGER PRIMARY KEY,
  emp_id         INTEGER NOT NULL REFERENCES employee(emp_id),
  pay_month      TEXT NOT NULL,
  days_present   INTEGER NOT NULL,
  days_absent    INTEGER NOT NULL,
  overtime_hours INTEGER NOT NULL DEFAULT 0,
  UNIQUE (emp_id, pay_month)
);
