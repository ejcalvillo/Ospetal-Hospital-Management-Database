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


