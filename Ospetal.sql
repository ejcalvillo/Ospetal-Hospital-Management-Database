CREATE DATABASE IF NOT EXISTS ospetal;
USE ospetal;

CREATE TABLE IF NOT EXISTS `patients` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `birthdate` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `patients` (`first_name`,`last_name`,`address`,`birthdate`)
VALUES
  ("Paul","Good","Ap #917-743 Dolor Ave","Apr 5, 1981"),
  ("Cathleen","Velez","113-2857 Mattis Ave","Apr 3, 2012"),
  ("Denton","Collier","P.O. Box 758, 6779 Lacinia Av.","Dec 15, 1994"),
  ("Kelly","Greene","240-2974 Sed St.","May 6, 2015"),
  ("Avram","Mack","Ap #351-594 Tempus Av.","Sep 24, 1981"),
  ("Inga","Gardner","Ap #288-3179 Dictum Rd.","Jun 30, 1993"),
  ("Timothy","Peterson","P.O. Box 222, 9542 Purus, Ave","Apr 22, 1993"),
  ("Illiana","Moss","P.O. Box 938, 1267 Consequat Road","Oct 16, 2019"),
  ("Molly","Bird","P.O. Box 760, 5964 Vel Rd.","May 11, 1997"),
  ("Demetrius","Bryant","Ap #981-5659 Enim. St.","Jun 23, 2001"),
  ("Lani","Pugh","5667 Euismod St.","Jun 19, 2020"),
  ("Peter","Briggs","2621 Tincidunt, St.","May 21, 1987"),
  ("Mason","Love","Ap #137-9519 Ut Street","Jun 22, 2023"),
  ("Cullen","Haney","Ap #810-7253 Morbi St.","Dec 13, 2014"),
  ("Xenos","Riggs","Ap #965-4453 Nunc St.","Aug 14, 2006"),
  ("Geoffrey","Craft","Ap #679-9083 Enim Rd.","Jun 10, 2012"),
  ("Eugenia","Evans","8324 Eleifend Ave","Jun 24, 1988"),
  ("Donovan","Pittman","P.O. Box 493, 5769 Vitae St.","Sep 22, 1984"),
  ("Emma","Alford","P.O. Box 751, 1027 Erat Avenue","Oct 16, 1992"),
  ("Madison","Miranda","4141 Lorem Rd.","Aug 15, 1999"),
  ("Aline","Rowland","Ap #781-3296 Ultricies Rd.","Aug 21, 1977"),
  ("Hu","Fulton","260-7879 Non Ave","Mar 3, 1979"),
  ("Robert","Martinez","P.O. Box 828, 6653 Iaculis Ave","Nov 19, 1987"),
  ("Benedict","Foreman","P.O. Box 999, 3552 Dictum Ave","Sep 30, 2001"),
  ("Sebastian","Hatfield","974-6978 Gravida St.","Sep 26, 1983");
  
  SELECT * FROM patients;


  -- Makes Service Catalog table --
  -- More efficent than singular  `services` table --
CREATE TABLE IF NOT EXISTS `ServiceCatalogs`(
	Service_Code INT AUTO_INCREMENT PRIMARY KEY,
    Service_description VARCHAR(255) NOT NULL,
    Service_Unit_Cost DECIMAL(10,2) NOT NULL
);

-- Inserts values into ServiceCatalog --
INSERT INTO `ServiceCatalogs` (Service_Description, Service_Unit_Cost)
VALUES
    ('Blood Test', 25.00),
    ('X-Ray', 150.00),
    ('MRI Scan', 500.00),
    ('CT Scan', 450.00),
    ('IV Drip', 75.00),
    ('Flu Shot', 40.00),
    ('COVID-19 Test', 100.00),
    ('Stitches', 80.00),
    ('Wound Cleaning', 35.00),
    ('Physical Therapy Session', 65.00),
    ('Vaccination - Tetanus', 45.00),
    ('Glucose Test', 30.00),
    ('Ultrasound', 220.00),
    ('Cholesterol Panel', 70.00),
    ('Dental Cleaning', 110.00),
    ('Vision Test', 25.00),
    ('Skin Biopsy', 180.00),
    ('EKG', 90.00),
    ('Suture Removal', 50.00),
    ('Hearing Test', 55.00),
    ('Allergy Test', 120.00),
    ('Nebulizer Treatment', 45.00),
    ('Inhalation Therapy', 60.00),
    ('Dermatology Consultation', 130.00),
    ('Blood Pressure Monitoring', 20.00);

  
  
-- Makes the service table --  
CREATE TABLE `AppointmentServices` (
    Service_ID INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_ID INT,
    Service_Code INT,
    Service_Quantity INT DEFAULT 1,
    TotalCost DECIMAL(10,2) GENERATED ALWAYS AS (
        Service_Quantity * (
            SELECT Service_Unit_Cost 
            FROM ServiceCatalog 
            WHERE ServiceCatalog.Service_Code = Service.Service_Code
        )
    ) STORED,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID),
    FOREIGN KEY (Service_Code) REFERENCES ServiceCatalog(Service_Code)
);

-- Department Table (Has Department ID and Name)
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` mediumint(8) unsigned NOT NULL auto_increment,
  `department_name` varchar(255),
  PRIMARY KEY (`department_id`)
) AUTO_INCREMENT=1000;

INSERT INTO `department` (`department_name`)
VALUES
("Emergency Department"),  
("Intensive Care Unit"),  
("Cardiology"),  
("Neurology"),  
("Oncology"),  
("Nephrology"),  
("Endocrinology"),  
("Pulmonology"),  
("Gastroenterology"),  
("Rheumatology"),  
("General Surgery"),  
("Orthopedic Surgery"),  
("Neurosurgery"),  
("Cardiothoracic Surgery"),  
("Plastic & Reconstructive Surgery");

SELECT * FROM department; 

-- Table for Appointment
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `employee_id` mediumint(8) unsigned NOT NULL,
  `patient_id` mediumint(8) unsigned NOT NULL,
  `diagnosis` varchar(255),
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`appointment_id`)
  -- FOREIGN KEY(`employee_id`) REFERENCES employee(`employee_id`),
  -- FOREIGN KEY(`patient_id`) REFERENCES patient(`patient_id`)
) AUTO_INCREMENT=10000;

INSERT INTO `appointment` (`employee_id`, `patient_id`, `diagnosis`, `time`, `date`)
VALUES
  (118, 12, 'Influenza', '11:23 AM', '07/15/2015'),
  (107, 5, 'Lung Cancer', '02:30 PM', '05/20/2017'),
  (116, 18, 'Migraine', '03:15 PM', '09/12/2016'),
  (112, 3, 'Cold', '10:45 AM', '01/05/2021'),
  (101, 10, 'High Blood Pressure', '08:25 AM', '03/18/2019'),
  (120, 10, 'Diabetes', '12:10 PM', '08/23/2022'),
  (107, 14, 'Asthma', '01:50 PM', '02/14/2020'),
  (115, 22, 'Heart Disease', '09:00 AM', '11/01/2019'),
  (104, 8, 'Flu', '02:00 PM', '04/30/2021'),
  (109, 1, 'Anxiety', '11:23 AM', '06/19/2020'),
  (104, 13, 'Cough', '02:30 PM', '10/07/2021'),
  (109, 12, 'Back Pain', '03:30 PM', '12/12/2022'),
  (114, 13, 'Allergies', '04:05 PM', '05/09/2022'),
  (108, 5, 'Hypertension', '08:20 AM', '11/22/2023'),
  (105, 17, 'Inflammation', '07:55 AM', '04/18/2024'),
  (119, 2, 'Sinus Infection', '09:10 AM', '03/02/2020'),
  (111, 4, 'Arthritis', '01:45 PM', '08/12/2021'),
  (111, 19, 'Bronchitis', '10:05 AM', '10/10/2020'),
  (119, 2, 'Strep Throat', '02:50 PM', '09/25/2023'),
  (117, 15, 'Tonsillitis', '11:40 AM', '05/14/2022');

SELECT * FROM appointment;


CREATE TABLE IF NOT EXISTS `Employees` (
  `Employee_ID` mediumint(8) unsigned NOT NULL auto_increment,
  `Departmnet_ID` INT,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
	`email` VARCHAR(150) UNIQUE,
  `Salary` FLOAT NOT NULL,
  PRIMARY KEY (`employee_ID`),
  FOREIGN KEY (department_id) REFERENCES (department_id)
  FOREIGN KEY(`departmnet_ID`) REFERENCES employees(`employee_ID`)
) AUTO_INCREMENT=10000;

	insert into `Employees`(`Employee_ID`, `Department_ID`, `email`, `hire_date`, `exist_date`,`salary`)

	values
	(101,1, Len,Graham,'lee.Graham@email.com', 2023-09-08, 2025-12-19,146500),
	(102,2,Drake,Dale,'Drake.Dale@gmail.com',2023-06-15,null,80000),
    (103,3,kane, Miranda,'Kane.Miranda@gmail.com',2022-02-05,2025-10-01,90000),
    (104,4,Katell,Vazquez,'Katell.Vazquez@gmail.com',2023-05-16,2025-10-02,100000),
    (105,5,Ella,Best,'varius.orci@aol.couk',2024-02-15,2024-12-16,75000),
    (106,6,Ieoma,sellers,'pretium.neque@icloud.com',2024-01-01,2024-12-31,81000),
    (107,7,deborah,blake,'summernielsen2106@google.com',2023-05-19,2025-04-11,75000),
    (108,8,Yen,welson,'lareinakline3989@aol.couk',2023-05-20,2025-04-11,110000),
    (109,9,Marvin,Spear,'rahimclemons6030@protonmail.net',2023-05-19,null,150000),
    (110,10,Herman,Maddox,'ardenvalentine@protonmail.ca',2021-05-01,null,160000),
	(111,11,dona,Griffith,'myratravis5112@yahoo.net',2021-05-16,2025-04-11,210000),
    (112,12,Piper ,Snyder,'imperdiet.ullamcorper.duis@hotmail.net',2020-04-12,2025-04-11,180000),
    (113,13,Josiah,Eaton,'varius.orci@aol.couk', 2024-07-14,2025-04-03,200000),
    (114,14,Nasim ,Bird,'summernielsen2106@google.com', 2019-10-29,2025-04-11,196,800),
    (115,15,Erasmus ,Mendez,'ut.sem.nulla@yahoo.couk',2018-05-15,2019-05-06,178,0000),
    (116,16,Kuame ,Mckinney,'pretium.neque@icloud.com',20217-05-20,2020-08-23,90000),
    (117,17,Gillian ,Sears, 'Gilliam,.Sears@gmail.com',20217-04-20,2020-08-23,100000),
    (118,18,Wayne ,Jarvis, 'ultrices.vivamus@protonmail.edu',2016-05-29,2020-08-30,95000),
    (119,19,Victoria ,Gilmore, 'congue.in@icloud.com',2015-08-08,20217-08-28,200000),
    (120,20,Nicholas ,Mclean, 'commodo.auctor@icloud.com',2020-08-06,2021-07-08,120000),
    (121,1,Chastity ,Owen,'tempus.non@hotmail.edu',2024-08-09,2025-01-31,140000),
    (122,2,Mara, Hancock,'Mara.Hancock@hotmail.com',2023-08-08,2025-01-01,85000),
    (123,1,Ray ,Fuentes,'Ray.Fuentes@gmail.com',2022-05-19,2023-01-01,80000),
    (124,6,Daniel ,sheppard,'arcu.vel@icloud.org',2016-08-18,204-01-01,70000),
    (125,4,Odysseus ,Austin,'nibh.sit.amet@yahoo.net',2016-08-05,2020-05-09,65000),
    (126,5,Daniel ,Brock,'egestas@outlook.net',2016-08-18,2021-08-18,72100),
    (127,8,Kira,yamato,'GundamStrike@gmail.com',2010-05-01,2025-04-10,250000),
    (128,18,Lacus,Clyne,'PeaceGundam@gmail.com',2024-01-01,2025-04-11,160000),
    (129,14,oliver,queen,'GreenArrow@icloud.com',2020-05-30,2025-01-31,175164),
    (130,12,Madara,uchiha,'spartan1980@hotmail.com',2021-03-25,2024-12-31,75640);

    drop table employees;
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

