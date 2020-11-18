--
-- (1)
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
--
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee.employees e
	 JOIN employee.salaries s ON e.emp_no = s.emp_no;
	 
--
-- (2)	 
-- List first name, last name, and hire date for employees who were hired in 1986.
--
SELECT e.first_name, e.last_name, e.hire_date
FROM employee.employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

--
-- (3)
-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.
--
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employee.departments d
     JOIN employee.dept_manager dm ON d.dept_no = dm.dept_no
	 JOIN employee.employees e ON dm.emp_no = e.emp_no;
	 
--
-- (4)
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
-- 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee.employees e
     JOIN employee.dept_emp de ON e.emp_no = de.emp_no
	 JOIN employee.departments d ON de.dept_no = d.dept_no;
	 
-- (5)
-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
--
SELECT e.first_name, e.last_name, e.sex
FROM employee.employees e
WHERE e.first_name = 'Hercules'
  AND e.last_name LIKE 'B%';
	 
--
-- (6)
-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
--
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee.employees e
     JOIN employee.dept_emp de ON e.emp_no = de.emp_no
	 JOIN employee.departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--
-- (7)
-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
--
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee.employees e
     JOIN employee.dept_emp de ON e.emp_no = de.emp_no
	 JOIN employee.departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 
-- (8)
-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
-- 
SELECT e.last_name, COUNT(e.last_name) AS total
FROM employee.employees e
GROUP BY e.last_name
ORDER BY total DESC;
