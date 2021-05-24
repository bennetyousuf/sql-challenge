--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT data_employees.emp_no, data_employees.last_name, data_employees.first_name, data_employees.sex, data_salaries.salary
FROM data_employees
INNER JOIN data_salaries ON data_employees.emp_no =data_salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
--note: cannot use LIKE and wildcrd on date format

SELECT data_employees.first_name, data_employees.last_name,data_employees.hire_date
FROM data_employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--first select * from data_title to find title_id that corresponded with Manager, use in where clause
--to check select statemetn: can use data_titles.title_id, data_titles.title data_titles.title_id, data_titles.title

SELECT data_dept_manager.dept_no, data_departments.dept_name,data_employees.emp_no, data_employees.last_name,data_employees.first_name
FROM data_employees
JOIN data_titles ON data_employees.emp_title_id = data_titles.title_id
JOIN data_dept_manager ON data_employees.emp_no = data_dept_manager.emp_no
JOIN data_departments ON data_dept_manager.dept_no = data_departments.dept_no
WHERE data_titles.title_id = 'm0001'

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT data_departments.dept_name,data_employees.emp_no, data_employees.last_name,data_employees.first_name
FROM data_employees
JOIN data_dept_manager ON data_employees.emp_no = data_dept_manager.emp_no
JOIN data_departments ON data_dept_manager.dept_no = data_departments.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT data_employees.first_name, data_employees.last_name, sex
FROM data_employees
WHERE data_employees.first_name = 'Hercules' AND data_employees.last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT data_employees.emp_no, data_employees.last_name, data_employees.first_name, data_departments.dept_name
FROM data_employees 
JOIN data_dept_manager ON data_employees.emp_no = data_dept_manager.emp_no
JOIN data_departments ON data_dept_manager.dept_no = data_departments.dept_no
WHERE data_departments.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT data_employees.emp_no, data_employees.last_name, data_employees.first_name, data_departments.dept_name
FROM data_employees 
JOIN data_dept_manager ON data_employees.emp_no = data_dept_manager.emp_no
JOIN data_departments ON data_dept_manager.dept_no = data_departments.dept_no
WHERE data_departments.dept_name = 'Sales' OR data_departments.dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT data_employees.last_name, COUNT(data_employees.last_name)
FROM data_employees
GROUP BY data_employees.last_name
ORDER BY COUNT(data_employees.last_name) DESC;
