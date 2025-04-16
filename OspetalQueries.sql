    /*(1) write a query that lits alls the employees in the table.
    (2) write e a query thats lists all the employees with a salary greater then 100,000 
    (3) Write a query that lists all the employees salary that is the highest the medium and the lowest.
    (4) Write a query that lists what department the employees are assigned too*/
    
    SELECT Employee_ID, Department_ID, first_name,Last_name,hire_date,exit_date,Salary
	FROM employees;

    SELECT Employee_ID,Departmnet_ID,First_name,Last_name,Salary
    from employees
    where salary > 100000;
    
    select Employee_ID,
	CASE 
		WHEN salary > 150000 THEN 'High' 
		WHEN salary BETWEEN 80000 AND 100000 THEN 'Medium' 
		ELSE 'Low' 
	END AS salary
	FROM employees;
    
    select E.employees.first_name,E.employees.last_name,D.department_name
    from employees E
    join departments D
    on E.department_ID = D.department_ID;
    
    
    
SELECT * FROM appointment
ORDER BY patient_id;

DROP TABLE appointment;

-- 4 Query that shows which lists diagnosis and patient_id in sorted order--
SELECT patient_id, diagnosis
FROM appointment
ORDER BY patient_id;

-- 5 Query that shows patient's name and diagnosis --
SELECT 
  patients.first_name,
  patients.last_name,
  appointment.diagnosis
FROM 
  patients
JOIN 
  appointment ON patients.id = appointment.patient_id;

-- 6 Query that shows the time patient was appointed into the hospital -- 
SELECT 
  patients.first_name,
  patients.last_name,
  appointment.time
FROM 
  patients
JOIN 
  appointment ON patients.id = appointment.patient_id;