# Payroll Management System

A payroll database plus a browser SQL workbench: write a query, get autocomplete and JOIN suggestions, see the results.

## Structure
```
index.html          <- open this in your browser (needs internet once for the AlaSQL library)
data/
  payroll.db        SQLite database (schema + sample data)
  data.js / .json   same data, used by index.html
  *.csv             one CSV per table
sql/
  01_schema.sql     CREATE TABLE statements (PKs, FKs, CHECKs)
  02_seed_data.sql  INSERT statements
  03_queries.sql    all ready-made queries (SELECT + DML)
build.py            regenerates everything above from one place
```

## Tables
department, grade, employee (has manager_id), payroll (monthly pay slips), attendance.

## Use the SQL files with SQLite
```
sqlite3 mydb.db < sql/01_schema.sql
sqlite3 mydb.db < sql/02_seed_data.sql
sqlite3 mydb.db < sql/03_queries.sql
```
Or just open `data/payroll.db` in DB Browser for SQLite.

## Notes
- In the web UI the data lives in memory; "Reset sample data" restores it from data/data.js.
- Dates are text: `YYYY-MM-DD`, months `YYYY-MM`.
- To change sample data, edit `build.py` and run `python3 build.py`.
