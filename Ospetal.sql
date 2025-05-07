CREATE DATABASE IF NOT EXISTS ospetal;
USE ospetal;

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` mediumint unsigned NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `birthdate` varchar(255),
  PRIMARY KEY (`patient_id`)
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

-- Department Table (Has Department ID and Name)
CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` mediumint unsigned NOT NULL auto_increment,
  `department_name` varchar(255),
  PRIMARY KEY (`department_id`)
) AUTO_INCREMENT=1;

INSERT INTO `departments` (`department_name`)
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

SELECT * FROM departments; 



create TABLE IF NOT EXISTS `Employees`(
  `Employee_ID` mediumint unsigned NOT NULL auto_increment,
  `Department_ID` mediumint unsigned,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `email` VARCHAR(150) UNIQUE,
  `hire_date` DATE,
  `exit_date` DATE,
  `Salary` FLOAT NOT NULL,
  PRIMARY KEY (`employee_ID`),
  FOREIGN KEY (`Department_ID`) REFERENCES departments(`department_id`)
) AUTO_INCREMENT=10000;

INSERT INTO Employees
  (Employee_ID, Department_ID, first_name, last_name, email, hire_date, exit_date, Salary)
VALUES
  (101, 1, 'Len', 'Graham', 'lee.Graham@email.com',
       '2023-09-08', NULL, 146500),
  (102, 2, 'Drake', 'Dale', 'Drake.Dale@gmail.com',
       '2023-06-15', '2020-01-01', 80000),
  (103, 3, 'kane', 'Miranda', 'Kane.Miranda@gmail.com',
       '2022-02-05', NULL, 90000),
  (104, 4, 'Katell', 'Vazquez', 'Katell.Vazquez@gmail.com',
       '2023-05-16', NULL, 100000),
  (105, 5, 'Ella', 'Best', 'varius.orci@aol.couk',
       '2024-02-15', NULL, 75000),
  (106, 6, 'Ieoma', 'sellers', 'pretium.neque@icloud.com',
       '2024-01-01', '2020-02-15', 81000),
  (107, 7, 'deborah', 'blake', 'summernielsen2106@google.com',
       '2023-05-19', NULL, 75000),
  (108, 8, 'Yen', 'welson', 'lareinakline3989@aol.couk',
       '2023-05-20', NULL, 110000),
  (109, 9, 'Marvin', 'Spear', 'rahimclemons6030@protonmail.net',
       '2023-05-19', '2020-03-10', 150000),
  (110, 10, 'Herman', 'Maddox', 'ardenvalentine@protonmail.ca',
       '2021-05-01', NULL, 160000),
  (111, 11, 'dona', 'Griffith', 'myratravis5112@yahoo.net',
       '2021-05-16', NULL, 210000),
  (112, 12, 'Piper', 'Snyder', 'imperdiet.ullamcorper.duis@hotmail.net',
       '2020-04-12', NULL, 180000),
  (113, 13, 'Josiah', 'Eaton', 'varius.orci123@aol.couk',
       '2024-07-14', '2020-04-05', 200000),
  (114, 14, 'Nasim', 'Bird', 'summernielsen210632@google.com',
       '2019-10-29', '2020-05-20', 196800),
  (115, 15, 'Erasmus', 'Mendez', 'ut.sem.nulla@yahoo.couk',
       '2018-05-15', '2020-06-25', 1780000),
  (116, 10, 'Kuame', 'Mckinney', 'pretium.neque234@icloud.com',
       '2021-05-20', '2020-07-30', 90000),
  (117, 9, 'Gillian', 'Sears', 'Gilliam.Sears@gmail.com',
       '2021-04-20', '2020-08-15', 100000),
  (118, 8, 'Wayne', 'Jarvis', 'ultrices.vivamus@protonmail.edu',
       '2016-05-29', '2020-09-12', 95000),
  (119, 5, 'Victoria', 'Gilmore', 'congue.in@icloud.com',
       '2015-08-08', '2020-10-08', 200000),
  (120, 1, 'Nicholas', 'Mclean', 'commodo.auctor@icloud.com',
       '2020-08-06', '2020-11-05', 120000),
  (121, 1, 'Chastity', 'Owen', 'tempus.non@hotmail.edu',
       '2024-08-09', NULL, 140000),
  (122, 2, 'Mara', 'Hancock', 'Mara.Hancock@hotmail.com',
       '2023-08-08', '2020-12-31', 85000),
  (123, 1, 'Ray', 'Fuentes', 'Ray.Fuentes@gmail.com',
       '2022-05-19', NULL, 80000),
  (124, 6, 'Daniel', 'sheppard', 'arcu.vel@icloud.org',
       '2016-08-18', '2022-01-15', 70000),
  (125, 4, 'Odysseus', 'Austin', 'nibh.sit.amet@yahoo.net',
       '2016-08-05', NULL, 65000),
  (126, 5, 'Daniel', 'Brock', 'egestas@outlook.net',
       '2016-08-18', '2022-02-10', 72100),
  (127, 8, 'Kira', 'yamato', 'GundamStrike@gmail.com',
       '2010-05-01', NULL, 250000),
  (128, 3, 'Lacus', 'Clyne', 'PeaceGundam@gmail.com',
       '2024-01-01', '2022-03-20', 160000),
  (129, 10, 'oliver', 'queen', 'GreenArrow@icloud.com',
       '2020-05-30', '2022-04-17', 175164),
  (130, 2, 'Madara', 'uchiha', 'spartan1980@hotmail.com',
       '2021-03-25', '2022-05-22', 75640);
select * FROM Employees;


create table Employees_phones(
`Phone_Number_ID` mediumint unsigned not null AUTO_INCREMENT,
`Employee_ID` MEDIUMINT unsigned not null,
`Employee_Phone_number` varchar(20) DEFAULT null,
primary key(`Phone_Number_ID`),
foreign key (employee_ID) references employees(employee_ID)
);

INSERT INTO `Employees_phones` (`Phone_number_ID`, `Employee_ID`, `Employee_Phone_number`)
VALUES
  (1, 101, '210-1155-1178'),
  (2, 102, '210-889-4422'),
  (3, 103, '210-223-3322'),
  (4, 104, '210-855-9955'),
  (5, 105, '210-666-8899'),
  (6, 106, '210-556-9999'),
  (7, 107, '210-456-2233'),
  (8, 108, '210-556-8552'),
  (9, 109, '210-897-8899'),
  (10, 110, '210-465-7889'),
  (11, 111, '210-336-4478'),
  (12, 112, '210-556-7788'),
  (13, 113, '210-556-4487'),
  (14, 114, '210-445-4457'),
  (15, 115, '210-789-4567'),
  (16, 116, '210-785-7823'),
  (17, 117, '210-789-4563'),
  (18, 118, '210-458-1457'),
  (19, 119, '210-458-1236'),
  (20, 120, '210-126-1245'),
  (21,121, '210-567-2567'),
  (22,122, '210-254-2678'),
  (23,123, '210-458-8964'),
  (24,124, '210-256-4589'),
  (25,125, '210-456-7896'),
  (26,126, '210-568-7854'),
  (27,127, '210-363-4123'),
  (28,128, '210-345-4587'),
  (29,129, '210-789-4589'),
  (30,130, '210-896-8912');
  
  select *from Employees_Phones;
  
create table Patients_Phones(
`Patient_Phone_Number_ID` MEDIUMINT not null AUTO_INCREMENT,
`Patient_ID` MEDIUMINT UNSIGNED not null,
`Patient_Phone_number` varchar(20) DEFAULT null,
primary key(`Patient_Phone_Number_ID`),
foreign key (Patient_ID) references patients(patient_id)
);

INSERT INTO `Patients_phones` (`Patient_Phone_number_ID`, `Patient_ID`, `Patient_Phone_number`) VALUES
  (1, 1, '210-555-3890'),
  (2, 2, '210-555-4099'),
  (3, 3, '210-555-5584'),
  (4, 4, '210-458-2296'),
  (5, 5, '210-888-9985'),
  (6, 6, '210-899-2244'),
  (7, 7, '210-111-1155'),
  (8, 8, '210-222-6000'),
  (9, 9, '210-205-0055'),
  (10, 10, '210-066-0598'),
  (11, 11, '210-101-0236'),
  (12, 12, '210-660-4499'),
  (13, 13, '210-998-7045'),
  (14, 14, '210-780-0444'),
  (15, 15, '210-809-5600'),
  (16, 16, '210-789-9999'),
  (17, 17, '210-645-6655'),
  (18, 18, '210-333-4433'),
  (19, 19, '210-231-1234'),
  (20, 20, '210-166-3366'),
  (21, 21, '210-678-6895'),
  (22, 22, '210-133-1344'),
  (23, 23, '210-233-9988'),
  (24, 24, '210-333-8956'),
  (25, 25, '210-445-8933');

  
  select *from Patients_Phones;
  
     -- Table for Appointment
CREATE TABLE IF NOT EXISTS `appointments` (
  `appointment_id` mediumint unsigned NOT NULL auto_increment,
  `employee_id` mediumint unsigned NOT NULL,
  `patient_id` mediumint unsigned NOT NULL,
  `diagnosis` varchar(255),
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  FOREIGN KEY(`employee_id`) REFERENCES Employees(`employee_id`),
  FOREIGN KEY(`patient_id`) REFERENCES patients(`patient_id`)
) AUTO_INCREMENT=10000;


INSERT INTO `appointments` (`employee_id`, `patient_id`, `diagnosis`, `time`, `date`)
VALUES
  (101, 12, 'Influenza', '11:23 AM', '07/15/2015'),
  (105, 5, 'Lung Cancer', '02:30 PM', '05/20/2017'),
  (104, 18, 'Migraine', '03:15 PM', '09/12/2016'),
  (121, 3, 'Cold', '10:45 AM', '01/05/2021'),
  (103, 10, 'High Blood Pressure', '08:25 AM', '03/18/2019'),
  (107, 10, 'Diabetes', '12:10 PM', '08/23/2022'),
  (108, 14, 'Asthma', '01:50 PM', '02/14/2020'),
  (103, 22, 'Heart Disease', '09:00 AM', '11/01/2019'),
  (123, 8, 'Flu', '02:00 PM', '04/30/2021'),
  (125, 1, 'Anxiety', '11:23 AM', '06/19/2020'),
  (127, 13, 'Cough', '02:30 PM', '10/07/2021'),
  (112, 12, 'Back Pain', '03:30 PM', '12/12/2022'),
  (101, 13, 'Allergies', '04:05 PM', '05/09/2022'),
  (103, 5, 'Hypertension', '08:20 AM', '11/22/2023'),
  (111, 17, 'Inflammation', '07:55 AM', '04/18/2024'),
  (101, 2, 'Sinus Infection', '09:10 AM', '03/02/2020'),
  (110, 4, 'Arthritis', '01:45 PM', '08/12/2021'),
  (108, 19, 'Bronchitis', '10:05 AM', '10/10/2020'),
  (121, 2, 'Strep Throat', '02:50 PM', '09/25/2023'),
  (123, 15, 'Tonsillitis', '11:40 AM', '05/14/2022'),
  (111, 6, 'Vertigo', '09:45 AM', '06/21/2022'),
  (102, 7, 'Skin Rash', '11:10 AM', '01/30/2021'),
  (106, 9, 'Allergic Rhinitis', '01:00 PM', '03/10/2023'),
  (110, 11, 'Chronic Fatigue', '03:20 PM', '07/19/2021'),
  (122, 16, 'Osteoarthritis', '10:30 AM', '05/12/2022'),
  (115, 20, 'Anemia', '12:15 PM', '02/22/2023'),
  (104, 21, 'Gastroenteritis', '02:40 PM', '09/14/2022'),
  (128, 23, 'Acid Reflux', '04:10 PM', '03/27/2023'),
  (130, 24, 'Sciatica', '01:30 PM', '11/11/2022'),
  (114, 25, 'Pneumonia', '09:00 AM', '08/05/2023');


SELECT * FROM appointments;

-- Makes the service table --  
CREATE TABLE `Services` (
    Service_ID INT AUTO_INCREMENT PRIMARY KEY,
    appointment_ID MEDIUMINT UNSIGNED NOT NULL,
    Description TEXT,  
    UnitCost DECIMAL(10,2),      
    Quantity INT DEFAULT 1,
    FOREIGN KEY (appointment_ID) REFERENCES appointments(appointment_ID)
);

INSERT INTO Services (Appointment_ID, Description, UnitCost, Quantity)
VALUES
  (10000, 'Patient with Influenza: I recommend bed rest, increased fluid intake, and consideration of antiviral medications if the patient is at risk of complications. Monitor temperature and oxygen saturation closely.', 100.00, 1),
  (10001, 'Patient with Lung Cancer: I advise a multi-modality treatment approach including consultation with oncology for possible chemotherapy, radiation therapy, and/or surgical evaluation. Early intervention is crucial.', 2000.00, 1),
  (10002, 'Patient with Migraine: I suggest initiating treatment with appropriate pain relievers and preventive medications, along with lifestyle modifications to reduce triggers. Follow-up is recommended if symptoms persist.', 150.00, 1),
  (10003, 'Patient with Cold: I recommend supportive care including hydration, rest, and over-the-counter decongestants. The patient should monitor symptoms and return if the condition worsens.', 50.00, 1),
  (10004, 'Patient with High Blood Pressure: I emphasize the importance of lifestyle modifications, dietary adjustments, and potentially starting or titrating antihypertensive medications to maintain optimal blood pressure levels.', 120.00, 1),
  (10005, 'Patient with Diabetes: I suggest a coordinated approach involving nutrition counseling, regular blood sugar monitoring, and appropriate medication management to control glycemic levels effectively.', 180.00, 1),
  (10006, 'Patient with Asthma: I recommend inhaled bronchodilators and corticosteroids, along with a review of trigger avoidance strategies and regular monitoring of peak flow measurements.', 75.00, 1),
  (10007, 'Patient with Heart Disease: I propose a comprehensive management plan that includes lifestyle modifications, medication adherence, and possibly further interventional cardiology evaluation based on stress testing results.', 500.00, 1),
  (10008, 'Patient with Flu: I advise symptomatic treatment with rest, fluids, and monitoring for any respiratory distress. Consider antiviral medication if indicated by risk factors.', 65.00, 1),
  (10009, 'Patient with Anxiety: I recommend a combined approach of cognitive behavioral therapy and, if necessary, short-term pharmacological interventions while monitoring for improvement in symptoms.', 90.00, 1),
  (10010, 'Patient with Cough: I suggest supportive care with cough suppressants and hydration, and I will evaluate further if the cough persists or worsens.', 55.00, 1),
  (10011, 'Patient with Back Pain: I recommend initiating physical therapy and conservative management with NSAIDs, with imaging studies considered if the pain does not improve over time.', 200.00, 1),
  (10012, 'Patient with Allergies: I advise antihistamines and avoidance of known allergens, and in certain cases, immunotherapy may be considered if symptoms are severe.', 80.00, 1),
  (10013, 'Patient with Hypertension: I emphasize continued blood pressure monitoring and adjusting medication as needed along with sustained lifestyle modifications for long-term control.', 110.00, 1),
  (10014, 'Patient with Inflammation: I propose a regimen of anti-inflammatory medications coupled with possible physical therapy; I will monitor inflammatory markers and reassess treatment based on response.', 130.00, 1),
  (10015, 'Patient with Sinus Infection: I advise initiating an appropriate course of antibiotics along with decongestants and nasal saline irrigation to relieve symptoms and clear the infection.', 85.00, 1),
  (10016, 'Patient with Arthritis: I recommend a tailored management plan including pain management with NSAIDs, physical therapy, and if needed, referral to a specialist for further evaluation and treatment.', 140.00, 1),
  (10017, 'Patient with Bronchitis: I suggest supportive care with rest, inhaled bronchodilators, and maintaining hydration, with follow-up to ensure resolution of respiratory symptoms.', 95.00, 1),
  (10018, 'Patient with Strep Throat: I recommend prompt administration of antibiotics as per current guidelines along with supportive measures such as hydration and rest to reduce symptom severity.', 70.00, 1),
  (10019, 'Patient with Tonsillitis: I advise evaluation for recurrent cases and a combination of antibiotic therapy with supportive care. In cases of chronic recurrence, surgical options may be discussed.', 115.00, 1),
  (10020, 'Patient with Vertigo: I recommend vestibular rehabilitation therapy and monitoring of symptoms. Evaluate for underlying causes such as inner ear issues.', 95.00, 1),
  (10021, 'Patient with Skin Rash: I suggest topical corticosteroids and allergen avoidance. If symptoms persist, refer to dermatology.', 60.00, 1),
  (10022, 'Patient with Allergic Rhinitis: I recommend antihistamines, nasal corticosteroids, and review of environmental allergens.', 70.00, 1),
  (10023, 'Patient with Chronic Fatigue: Initiate comprehensive evaluation including thyroid and nutritional screening; suggest rest and counseling.', 150.00, 1),
  (10024, 'Patient with Osteoarthritis: Recommend NSAIDs and physical therapy. Refer to orthopedics if joint degradation is advanced.', 120.00, 1),
  (10025, 'Patient with Anemia: Suggest iron supplements and dietary adjustments; follow-up labs to monitor hemoglobin and ferritin.', 90.00, 1),
  (10026, 'Patient with Gastroenteritis: Recommend oral rehydration, rest, and bland diet. Monitor for signs of dehydration.', 65.00, 1),
  (10027, 'Patient with Acid Reflux: Prescribe proton pump inhibitors and advise dietary modifications. Evaluate for GERD if recurrent.', 75.00, 1),
  (10028, 'Patient with Sciatica: Suggest pain relief, physical therapy, and postural correction. Refer to neurology if severe.', 100.00, 1),
  (10029, 'Patient with Pneumonia: Prescribe antibiotics based on severity and patient risk factors. Recommend rest and fluid intake.', 130.00, 1);
  
  SELECT * FROM Services;

CREATE TABLE Invoices (
    Invoice_ID INT AUTO_INCREMENT PRIMARY KEY,
    Appointment_ID MEDIUMINT UNSIGNED NOT NULL UNIQUE,
    Total_Amount DECIMAL(10,2) NOT NULL,
    Status ENUM('Unpaid', 'Paid', 'Pending') DEFAULT 'Unpaid',
    Issued_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Appointment_ID) REFERENCES appointments(appointment_id)
);

INSERT INTO Invoices (Appointment_ID, Total_Amount, Status)
VALUES
  (10000, 100.00, 'Paid'),
  (10001, 2000.00, 'Unpaid'),
  (10002, 150.00, 'Pending'),
  (10003, 50.00, 'Paid'),
  (10004, 120.00, 'Unpaid'),
  (10005, 180.00, 'Pending'),
  (10006, 75.00, 'Unpaid'),
  (10007, 500.00, 'Paid'),
  (10008, 65.00, 'Pending'),
  (10009, 90.00, 'Unpaid'),
  (10010, 55.00, 'Paid'),
  (10011, 200.00, 'Unpaid'),
  (10012, 80.00, 'Paid'),
  (10013, 110.00, 'Pending'),
  (10014, 130.00, 'Unpaid'),
  (10015, 85.00, 'Unpaid'),
  (10016, 140.00, 'Paid'),
  (10017, 95.00, 'Unpaid'),
  (10018, 70.00, 'Pending'),
  (10019, 115.00, 'Paid'),
  (10020, 95.00, 'Unpaid'),
  (10021, 60.00, 'Paid'),
  (10022, 70.00, 'Pending'),
  (10023, 150.00, 'Unpaid'),
  (10024, 120.00, 'Paid'),
  (10025, 90.00, 'Unpaid'),
  (10026, 65.00, 'Pending'),
  (10027, 75.00, 'Paid'),
  (10028, 100.00, 'Unpaid'),
  (10029, 130.00, 'Unpaid');

SELECT COUNT(*) FROM Invoices;


-- the patient_notes table to store automatic notes -- 
CREATE TABLE IF NOT EXISTS patient_log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  log_message VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

