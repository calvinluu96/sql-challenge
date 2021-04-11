-- Data Analysis

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM employees e, salaries s
	WHERE e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
	FROM employees
	WHERE hire_date <= '1986-12-31' AND hire_date >= '1986-1-1';

-- List the manager of each department with the department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
	FROM departments d, dept_manager dm, employees e
	WHERE e.emp_no = dm.emp_no AND d.dept_no = dm.dept_no;

-- List the department of each employee with the employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departments d, employees e, dept_emp de
	WHERE d.dept_no = de.dept_no AND e.emp_no = de.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
	FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dept_name
	FROM employees e, departments d, dept_emp de
	WHERE d.dept_name = 'Sales' AND d.dept_no = de.dept_no AND e.emp_no = de.emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dept_name
	FROM employees e, departments d, dept_emp de
	WHERE (d.dept_name = 'Sales' OR d.dept_name = 'Development') AND d.dept_no = de.dept_no AND e.emp_no = de.emp_no;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
DO
$do$
DECLARE
	temprow VARCHAR(30);
BEGIN
	FOR temprow IN
		SELECT DISTINCT last_name
			FROM employees
	LOOP
		SELECT COUNT (*)
			FROM employees
			WHERE last_name = temprow;
	END LOOP;
END;
$do$

SELECT * FROM employees;


	