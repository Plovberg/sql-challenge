--List the employee number, 
--last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
INNER join salaries s ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the 
--employees who were hired in 1986. required EXTRACT(YEAR from) function. 
select e.first_name, e.last_name, e.hire_date
from employees e
where extract(year from e.hire_date) = 1986;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name (2 points)
--https://stackoverflow.com/questions/10066166/how-to-use-distinct-when-i-have-multiple-column-in-sql-server
		
SELECT DISTINCT ON (dm.dept_no)
       dm.dept_no,
       d.dept_name,
       e.emp_no,
       e.last_name,
       e.first_name
FROM dept_manager dm
INNER JOIN departments d ON dm.dept_no = d.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no, dm.emp_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name (2 points)
select de.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B (2 points)
--https://stackoverflow.com/questions/55077193/select-all-where-first-letter-begins-with-a-or-b-or-c-or-f-etc-in
select e.first_name, e.last_name, e.sex
from employees e
where e.first_name = 'Hercules' AND e.last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, 
--last name, and first name (2 points)
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';l


--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name (4 points)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).  ##using elegant, single select statement. see:https://stackoverflow.com/questions/2722408/
--how-to-use-count-and-group-by-at-the-same-select-statement
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
