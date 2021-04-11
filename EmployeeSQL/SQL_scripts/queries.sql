/* NUMBER 1
*/
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

/*NUMBER 2
*/
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE hire_date 
LIKE '%98';

/* NUMBER 3
*/
CREATE VIEW e AS
SELECT last_name, first_name, emp_no
FROM employees
WHERE emp_no IN 
	(SELECT emp_no
	 FROM dept_manager
	 WHERE dept_no IN
	 	(SELECT dept_no 
		 FROM departments
		)
	);
	
		
CREATE VIEW b AS	
SELECT dept_manager.dept_no,
	dept_manager.emp_no,
	departments.dept_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no;



SELECT e.last_name,
	e.first_name,
	e.emp_no,
	b.dept_no,
	b.dept_name
FROM e
INNER JOIN b ON 
e.emp_no = b.emp_no;


/*NUMBER 4
*/
CREATE VIEW four AS
SELECT last_name, first_name, emp_no
FROM employees
WHERE emp_no IN 
	(SELECT emp_no
	 FROM dept_emp
	);


/*NUMBER 5
*/
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


/* NUMBER 6
*/



CREATE VIEW six AS
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no 
	 FROM dept_emp
	 WHERE dept_no IN
	 	(SELECT dept_no
		 FROM departments
		 WHERE dept_name = 'Sales'
		)
	);



Select dep.dept_name,
	s.emp_no,
	s.last_name,
	s.first_name
FROM six as s
	JOIN dept_emp as d
	ON (s.emp_no = d.emp_no)
		JOIN departments as dep 
		ON dep.dept_no=d.dept_no;

/* NUMBER 8
*/

SELECT e.last_name, count(e.emp_no) as c
FROM employees as e
GROUP BY e.last_name
ORDER BY c desc;