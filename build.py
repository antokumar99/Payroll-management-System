import json, sqlite3, csv, re, os
dept=[(1,'HR','Dhaka'),(2,'IT','Dhaka'),(3,'Finance','Khulna'),(4,'Marketing','Khulna')]
G=[(1,'A',5000,1000),(2,'B',4000,800),(3,'C',3000,600),(4,'D',2000,400)]
E=[('Anto Paul','Admin',1,1,None,'2022-03-01'),('Niloy Das','Manager',2,2,1,'2023-05-05'),('Rahul Sen','Worker',3,3,2,'2023-01-15'),('Raj Roy','Worker',4,1,2,'2023-01-15'),('Mitu Akter','Worker',2,3,2,'2024-11-10'),('Sumon Ali','Worker',3,4,3,'2025-02-20'),('Tania Khan','Manager',1,2,1,'2022-08-18'),('Imran Hossain','Worker',2,2,2,'2025-06-01'),('Farhana Islam','Worker',4,3,4,'2024-03-12'),('Joy Biswas','Worker',3,4,3,'2026-01-05')]
data={'department':[dict(dept_id=a,dept_name=b,location=c) for a,b,c in dept],
 'grade':[dict(grade_id=a,grade_name=b,basic_salary=c,bonus=d) for a,b,c,d in G],
 'employee':[dict(emp_id=i+1,full_name=r[0],email=r[0].split()[0].lower()+'@example.com',role=r[1],dept_id=r[2],grade_id=r[3],manager_id=r[4],hire_date=r[5],status='Active') for i,r in enumerate(E)],
 'payroll':[],'attendance':[]}
pid=1
for i,r in enumerate(E):
  for j,m in enumerate(['2026-07','2026-08','2026-09']):
    g=G[r[3]-1];ab=(i*3+j*2)%5;ot=(i+j)%4*3;otp=ot*20;tax=round((g[2]+g[3]+otp)*0.1)
    data['attendance'].append(dict(att_id=pid,emp_id=i+1,pay_month=m,days_present=26-ab,days_absent=ab,overtime_hours=ot))
    data['payroll'].append(dict(pay_id=pid,emp_id=i+1,pay_month=m,base_salary=g[2],bonus=g[3],overtime_pay=otp,tax=tax,net_pay=g[2]+g[3]+otp-tax,status='Pending' if (m=='2026-09' and i%4==0) else 'Paid'))
    pid+=1
schema='''-- Payroll Management System: schema (SQLite / ANSI-friendly)
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
'''
open('sql/01_schema.sql','w').write(schema)
def lit(v): return 'NULL' if v is None else (str(v) if isinstance(v,(int,float)) else "'"+v.replace("'","''")+"'")
seed='-- Sample data\n'
for t,rows in data.items():
  seed+=f'\n-- {t}\n'
  for r in rows: seed+=f"INSERT INTO {t} ({', '.join(r)}) VALUES ({', '.join(lit(v) for v in r.values())});\n"
open('sql/02_seed_data.sql','w').write(seed)
Q=[('All employees with department & grade','SELECT e.emp_id, e.full_name, d.dept_name, g.grade_name, e.hire_date\nFROM employee e\nJOIN department d ON e.dept_id = d.dept_id\nJOIN grade g ON e.grade_id = g.grade_id\nORDER BY e.emp_id'),
('Headcount per department','SELECT d.dept_name, COUNT(*) AS headcount\nFROM employee e\nJOIN department d ON e.dept_id = d.dept_id\nGROUP BY d.dept_name\nORDER BY headcount DESC'),
('Payroll cost per department (latest month)',"SELECT d.dept_name, SUM(p.net_pay) AS total_net_pay\nFROM payroll p\nJOIN employee e ON p.emp_id = e.emp_id\nJOIN department d ON e.dept_id = d.dept_id\nWHERE p.pay_month = '2026-09'\nGROUP BY d.dept_name\nORDER BY total_net_pay DESC"),
('Pay slip for one employee (change emp_id)','SELECT e.full_name, p.pay_month, p.base_salary, p.bonus, p.overtime_pay, p.tax, p.net_pay\nFROM payroll p\nJOIN employee e ON p.emp_id = e.emp_id\nWHERE e.emp_id = 3\nORDER BY p.pay_month DESC'),
('Top 5 net pay records','SELECT e.full_name, p.pay_month, p.net_pay\nFROM payroll p\nJOIN employee e ON p.emp_id = e.emp_id\nORDER BY p.net_pay DESC\nLIMIT 5'),
('Average net pay by grade','SELECT g.grade_name, ROUND(AVG(p.net_pay)) AS avg_net\nFROM payroll p\nJOIN employee e ON p.emp_id = e.emp_id\nJOIN grade g ON e.grade_id = g.grade_id\nGROUP BY g.grade_name\nORDER BY g.grade_name'),
('Pending payroll',"SELECT e.full_name, p.pay_month, p.net_pay, p.status\nFROM payroll p\nJOIN employee e ON p.emp_id = e.emp_id\nWHERE p.status = 'Pending'"),
('Employees with most absences','SELECT e.full_name, SUM(a.days_absent) AS total_absent\nFROM attendance a\nJOIN employee e ON a.emp_id = e.emp_id\nGROUP BY e.full_name\nORDER BY total_absent DESC'),
('Employees and their managers (self join)','SELECT e.full_name AS employee, m.full_name AS manager\nFROM employee e\nLEFT JOIN employee m ON e.manager_id = m.emp_id'),
('Hired on or after a date',"SELECT full_name, hire_date FROM employee\nWHERE hire_date >= '2024-10-01'\nORDER BY hire_date"),
('Search by name',"SELECT * FROM employee WHERE full_name LIKE '%an%'"),
('Total paid vs pending per month','SELECT pay_month, status, COUNT(*) AS slips, SUM(net_pay) AS total\nFROM payroll\nGROUP BY pay_month, status\nORDER BY pay_month'),
('Employees with no Pending payroll','SELECT full_name FROM employee\nWHERE emp_id NOT IN (SELECT emp_id FROM payroll WHERE status = \'Pending\')'),
('[DML] Raise Grade B basic salary',"UPDATE grade SET basic_salary = 4500 WHERE grade_name = 'B'"),
('[DML] Add a new employee',"INSERT INTO employee (emp_id, full_name, email, role, dept_id, grade_id, manager_id, hire_date, status)\nVALUES (11, 'New Hire', 'newhire@example.com', 'Worker', 2, 3, 2, '2026-10-01', 'Active')"),
('[DML] Mark a payslip as Paid',"UPDATE payroll SET status = 'Paid' WHERE pay_id = 1")]
open('sql/03_queries.sql','w').write('-- Ready-made queries (same ones as the UI)\n\n'+'\n\n'.join(f'-- {n}\n{q};' for n,q in Q)+'\n')
# sqlite db
if os.path.exists('data/payroll.db'): os.remove('data/payroll.db')
con=sqlite3.connect('data/payroll.db');con.executescript(schema);con.executescript(seed);con.commit()
# validate queries on a copy
mem=sqlite3.connect(':memory:');mem.executescript(schema);mem.executescript(seed)
for n,q in Q:
  mem.execute(q); print('OK',n)
# csv
for t,rows in data.items():
  with open(f'data/{t}.csv','w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
open('data/data.js','w').write('// Data store used by index.html\nwindow.PAYROLL_DATA = '+json.dumps(data,indent=1)+';\n')
open('data/data.json','w').write(json.dumps(data,indent=1))
# app
h=open('/mnt/user-data/outputs/payroll-sql-workbench.html').read()
a=h.index('function seed(){');b=h.index('function renderSide')
new='''function seed(){
 ['department','grade','employee','payroll','attendance'].forEach(n=>{try{alasql('DROP TABLE IF EXISTS '+n)}catch(e){};alasql('CREATE TABLE '+n);alasql.tables[n].data=JSON.parse(JSON.stringify(window.PAYROLL_DATA[n]))});
}

'''
h=h[:a]+new+h[b:]
h=h.replace('<script src="https://cdn.jsdelivr.net','<script src="data/data.js"></script>\n<script src="https://cdn.jsdelivr.net',1)
open('index.html','w').write(h)
