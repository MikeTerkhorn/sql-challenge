--Query # 1
--List the following details of each employee: employee number, last name, first name, gender, and salary

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from "Employees" as e

inner join "Salaries" as s
on e.emp_no = s.emp_no

--Query #2
--List employees who were hired in 1986.

select first_name, last_name, hire_date
from "Employees"
where hire_date between '1986-01-01' and '1987-01-01';

--Query #3
--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

select d.dept_no, d.dept_name, d.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
from "Departments" as d
join "Department_Manager"
on d.dept_no = m.dept_no
join "Employees" as e
on d.emp_no = e.emp_no;

--Query 4
--List the department of each employee with the following information: employee number, last name, first name, and department name.


select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from "Departments" as d
right join "Department_Manager" as dm
on d.dept_no = dm.dept_no
join "Employees" as e
on dm.emp_no = e.emp_no;

--Query 5
--List all employees whose first name is "Hercules" and last names begin with "B."

select e.first_name, e.last_name
from "Employees" as e
where first_name = 'Hercules'
and last_name like 'B%';

--Query 6
--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select d.dept_name, de.emp_no, e.last_name, e.first_name
from "Departments" as d
join "Department_Employee" as de
on d.dept_no = de.dept_no
join "Employees" as e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales';

--Query 7 
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select d.dept_name, de.emp_no, e.last_name, e.first_name
from "Departments" as d
join "Department_Employee" as de
on d.dept_no = de.dept_no
join "Employees" as e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--Query 8
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select e.last_name, count(e.emp_no)
from "Employees" as e
group by e.last_name
order by count(e.emp_no) desc;