CREATE TABLE titles(
emp_no INT NOT NULL,
title VARCHAR(20) NOT NULL, 
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no));

drop table retirement_titles;
SELECT employees.emp_no,first_name, last_name, title, from_date, to_date, employees.birth_date
INTO retirement_titles
FROM employees, titles
WHERE titles.emp_no = employees.emp_no


SELECT * FROM retirement_titles 
and (birth_date BETWEEN '1952-01-01' AND '1955-12-31');
 -- ORDER BY emp_no



--
 Use Dictinct with Orderby to remove duplicate rows
 -- DROP TABLE unique_title
SELECT DISTINCT ON(emp_no)  emp_no, first_name, last_name, title
INTO unique_title
FROM retirement_titles
ORDER BY emp_no ASC

SELECT * from unique_title

-- Retrieve the number of employees by their most recent job title  who are about to retire.
-- DROP TABLE retiring_titles
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles