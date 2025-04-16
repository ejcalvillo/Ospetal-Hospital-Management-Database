USE ospetal;

-- write a query that lits alls the employees in the table.
SELECT Employee_ID, Department_ID, first_name,Last_name,hire_date,exit_date,Salary
FROM employees;

-- write a query thats lists all the employees with a salary greater then 100,000 
SELECT Employee_ID,Department_ID,First_name,Last_name,Salary
from employees
where salary > 100000;

-- Write a query that lists all the employees salary that is the highest the medium and the lowest.
select Employee_ID,
CASE 
	WHEN salary > 150000 THEN 'High' 
	WHEN salary BETWEEN 80000 AND 100000 THEN 'Medium' 
	ELSE 'Low' 
END AS salary
FROM employees;

-- Write a query that lists what department the employees are assigned to*/
select E.first_name,E.last_name,D.department_name
from employees E
join departments D
on E.department_ID = D.department_ID;

-- Query that shows which lists diagnosis and patient_id in sorted order--
SELECT patient_id, diagnosis
FROM appointments
ORDER BY patient_id;

-- Query that shows patient's name and diagnosis --
SELECT 
  patients.first_name,
  patients.last_name,
  appointments.diagnosis
FROM 
  patients
JOIN 
  appointments ON patients.patient_id = appointments.patient_id;

-- Query that shows the time patient was appointed into the hospital -- 
SELECT 
  patients.first_name,
  patients.last_name,
  appointments.time
FROM 
  patients
JOIN 
  appointments ON patients.patient_id = appointments.patient_id;
  
  /* -----------------------------------------------------------------------------------
  -- Query for listing all currently active employees --
  -----------------------------------------------------------------------------------*/
SELECT
	EMPLOYEE_ID,
    first_name,
    last_name,
    hire_date
FROM Employees
WHERE exit_date IS NULL;

/* -----------------------------------------------------------------------------------
  -- Query for listing appointments with patient and doctor names --
  -----------------------------------------------------------------------------------*/
  SELECT 
	  a.appointment_id,
	  p.first_name AS patient_first_name,
	  p.last_name AS patient_last_name,
	  e.first_name AS doctor_first_name,
	  e.last_name AS doctor_last_name,
	  a.diagnosis,
	  a.date,
	  a.time
FROM appointments AS a
JOIN patients AS p
ON a.patient_id = p.patient_id
JOIN Employees AS e 
ON a.employee_id = e.employee_id;

/* -----------------------------------------------------------------------------------
  -- Query for listing all departments and number of employees in each --
  -----------------------------------------------------------------------------------*/
SELECT 
  d.department_name,
  COUNT(e.Employee_ID) AS number_of_employees
FROM departments AS d
LEFT JOIN Employees AS e
ON d.department_id = e.Department_ID
GROUP BY d.department_name
ORDER BY number_of_employees DESC;

/* -----------------------------------------------------------------------------------
  -- Query for listing patients who had more than one appointment --
  -----------------------------------------------------------------------------------*/
SELECT 
  p.patient_id,
  p.first_name,
  p.last_name,
  COUNT(a.appointment_id) AS appointment_count
FROM patients AS p
JOIN appointments AS a
ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING appointment_count > 1
ORDER BY appointment_count DESC;
  
 /* -----------------------------------------------------------------------------------
  -- Query for Stored Procedure Calculating total service cost for an appointment --
  -----------------------------------------------------------------------------------*/
  DELIMITER $$
CREATE PROCEDURE sp_CalcAppointmentCost(IN in_appointment_id MEDIUMINT(8) UNSIGNED)
BEGIN
  SELECT
    s.appointment_ID  AS AppointmentID,
    SUM(s.UnitCost * s.Quantity) AS TotalCost
  FROM Services AS s
  WHERE s.appointment_ID = in_appointment_id
  GROUP BY s.appointment_ID;
END$$
DELIMITER ;
-- Calculates or appointment number 10002 as an example --
CALL sp_CalcAppointmentCost(10002);

 /* -----------------------------------------------------------------------------------
  -- 	Trigger to prevent employees from double booking same time and  date         --
  -----------------------------------------------------------------------------------*/
  DELIMITER $$
CREATE TRIGGER trg_check_double_booking
BEFORE INSERT ON appointments
FOR EACH ROW
BEGIN
  DECLARE cnt INT;
  SELECT COUNT(*) INTO cnt
    FROM appointments
   WHERE employee_id = NEW.employee_id
     AND date        = NEW.date
     AND time        = NEW.time;
     
  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Error: Employee already has an appointment at this date & time.';
  END IF;
END$$
DELIMITER ;
-- Testing trg_check_double_booking --
INSERT INTO appointments
  (employee_id, patient_id, diagnosis, time, date)
VALUES
  (101, 25, 'Test Booking', '10:00 AM', '2025-01-01');

SELECT * 
  FROM appointments
 WHERE employee_id = 101
   AND time        = '10:00 AM'
   AND date        = '2025-01-01';
   
INSERT INTO appointments
  (employee_id, patient_id, diagnosis, time, date)
VALUES
  (101, 25, 'Duplicate Booking', '10:00 AM', '2025-01-01');
-- Testing works --


