-- Start of Challenge 
-- Deliverable 1
-- create table to hold titles of all retirees
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date
--INTO retirement_titles
FROM employees as e
LEFT JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	e.first_name,
	e.last_name,
	rt.title
INTO unique_titles
FROM employees as e
LEFT JOIN retirement_titles as rt
ON (e.emp_no = rt.emp_no)
ORDER BY rt.emp_no, to_date DESC;

-- retrieve number of retirees by title 
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title 
ORDER BY COUNT (ut.title) DESC;

-- Deliverable 2
--create table to hold elegible employees
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tl.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;


			  