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
("Plastic & Reconstructive Surgery"),  
("Otolaryngology"),  
("Obstetrics & Gynecology"),  
("Pediatrics"),  
("Neonatology"),  
("Radiology"),  
("Pathology");

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
  (103, 12, 'Influenza', '11:23 AM', '07/15/2015'),
  (107, 5, 'Lung Cancer', '02:30 PM', '05/20/2017'),
  (112, 18, 'Migraine', '03:15 PM', '09/12/2016'),
  (101, 3, 'Cold', '10:45 AM', '01/05/2021'),
  (105, 10, 'High Blood Pressure', '08:25 AM', '03/18/2019'),
  (119, 7, 'Diabetes', '12:10 PM', '08/23/2022'),
  (106, 14, 'Asthma', '01:50 PM', '02/14/2020'),
  (113, 22, 'Heart Disease', '09:00 AM', '11/01/2019'),
  (108, 8, 'Flu', '02:00 PM', '04/30/2021'),
  (104, 1, 'Anxiety', '11:23 AM', '06/19/2020'),
  (109, 11, 'Cough', '02:30 PM', '10/07/2021'),
  (110, 16, 'Cancer', '12:45 PM', '08/25/2020'),
  (111, 12, 'Back Pain', '03:30 PM', '12/12/2022'),
  (102, 13, 'Allergies', '04:05 PM', '05/09/2022'),
  (114, 5, 'Hypertension', '08:20 AM', '11/22/2023'),
  (115, 17, 'Inflammation', '07:55 AM', '04/18/2024'),
  (116, 18, 'Liver Disease', '10:00 AM', '02/03/2023'),
  (117, 24, 'Arthritis', '11:30 AM', '08/15/2021'),
  (118, 9, 'Diabetes', '02:00 PM', '01/22/2024'),
  (119, 19, 'Chronic Fatigue', '12:00 PM', '07/28/2024');

SELECT * FROM appointment;

