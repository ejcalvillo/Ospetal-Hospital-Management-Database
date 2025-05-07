-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ospetal
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` mediumint unsigned NOT NULL,
  `patient_id` mediumint unsigned NOT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `employee_id` (`employee_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`Employee_ID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (10001,105,5,'Lung Cancer','02:30 PM','05/20/2017'),(10002,104,18,'Migraine','03:15 PM','09/12/2016'),(10003,121,3,'Cold','10:45 AM','01/05/2021'),(10004,103,10,'High Blood Pressure','08:25 AM','03/18/2019'),(10005,107,10,'Diabetes','12:10 PM','08/23/2022'),(10006,108,14,'Asthma','01:50 PM','02/14/2020'),(10007,103,22,'Heart Disease','09:00 AM','11/01/2019'),(10008,123,8,'Flu','02:00 PM','04/30/2021'),(10009,125,1,'Anxiety','11:23 AM','06/19/2020'),(10010,127,13,'Cough','02:30 PM','10/07/2021'),(10012,101,13,'Allergies','04:05 PM','05/09/2022'),(10013,103,5,'Hypertension','08:20 AM','11/22/2023'),(10014,111,17,'Inflammation','07:55 AM','04/18/2024'),(10015,101,2,'Sinus Infection','09:10 AM','03/02/2020'),(10016,110,4,'Arthritis','01:45 PM','08/12/2021'),(10017,108,19,'Bronchitis','10:05 AM','10/10/2020'),(10018,121,2,'Strep Throat','02:50 PM','09/25/2023'),(10019,123,15,'Tonsillitis','11:40 AM','05/14/2022'),(10020,111,6,'Vertigo','09:45 AM','06/21/2022'),(10021,102,7,'Skin Rash','11:10 AM','01/30/2021'),(10022,106,9,'Allergic Rhinitis','01:00 PM','03/10/2023'),(10023,110,11,'Chronic Fatigue','03:20 PM','07/19/2021'),(10024,122,16,'Osteoarthritis','10:30 AM','05/12/2022'),(10025,115,20,'Anemia','12:15 PM','02/22/2023'),(10026,104,21,'Gastroenteritis','02:40 PM','09/14/2022'),(10027,128,23,'Acid Reflux','04:10 PM','03/27/2023'),(10028,130,24,'Sciatica','01:30 PM','11/11/2022'),(10029,114,25,'Pneumonia','09:00 AM','08/05/2023'),(10030,101,26,'Sprained Ankle','01:45 PM','04/20/2025'),(10031,101,25,'Test Booking','10:00 AM','2025-01-01');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_check_double_booking` BEFORE INSERT ON `appointments` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Emergency Department'),(2,'Intensive Care Unit'),(3,'Cardiology'),(4,'Neurology'),(5,'Oncology'),(6,'Nephrology'),(7,'Endocrinology'),(8,'Pulmonology'),(9,'Gastroenterology'),(10,'Rheumatology'),(11,'General Surgery'),(12,'Orthopedic Surgery'),(13,'Neurosurgery'),(14,'Cardiothoracic Surgery'),(15,'Plastic & Reconstructive Surgery');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Employee_ID` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Department_ID` mediumint unsigned DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `Salary` float NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `email` (`email`),
  KEY `Department_ID` (`Department_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (101,1,'Len','Graham','lee.Graham@email.com','2023-09-08',NULL,161150),(102,2,'Drake','Dale','Drake.Dale@gmail.com','2023-06-15','2020-01-01',80000),(103,3,'kane','Miranda','Kane.Miranda@gmail.com','2022-02-05',NULL,90000),(104,4,'Katell','Vazquez','Katell.Vazquez@gmail.com','2023-05-16',NULL,100000),(105,5,'Ella','Best','varius.orci@aol.couk','2024-02-15',NULL,75000),(106,6,'Ieoma','sellers','pretium.neque@icloud.com','2024-01-01','2020-02-15',81000),(107,7,'deborah','blake','summernielsen2106@google.com','2023-05-19',NULL,75000),(108,8,'Yen','welson','lareinakline3989@aol.couk','2023-05-20',NULL,110000),(109,9,'Marvin','Spear','rahimclemons6030@protonmail.net','2023-05-19','2020-03-10',150000),(110,10,'Herman','Maddox','ardenvalentine@protonmail.ca','2021-05-01',NULL,160000),(111,11,'dona','Griffith','myratravis5112@yahoo.net','2021-05-16',NULL,210000),(112,12,'Piper','Snyder','imperdiet.ullamcorper.duis@hotmail.net','2020-04-12',NULL,180000),(113,13,'Josiah','Eaton','varius.orci123@aol.couk','2024-07-14','2020-04-05',200000),(114,14,'Nasim','Bird','summernielsen210632@google.com','2019-10-29','2020-05-20',196800),(115,15,'Erasmus','Mendez','ut.sem.nulla@yahoo.couk','2018-05-15','2020-06-25',1780000),(116,10,'Kuame','Mckinney','pretium.neque234@icloud.com','2021-05-20','2020-07-30',90000),(117,9,'Gillian','Sears','Gilliam.Sears@gmail.com','2021-04-20','2020-08-15',100000),(118,8,'Wayne','Jarvis','ultrices.vivamus@protonmail.edu','2016-05-29','2020-09-12',95000),(119,5,'Victoria','Gilmore','congue.in@icloud.com','2015-08-08','2020-10-08',200000),(120,1,'Nicholas','Mclean','commodo.auctor@icloud.com','2020-08-06','2020-11-05',132000),(121,1,'Chastity','Owen','tempus.non@hotmail.edu','2024-08-09',NULL,154000),(122,2,'Mara','Hancock','Mara.Hancock@hotmail.com','2023-08-08','2020-12-31',85000),(123,1,'Ray','Fuentes','Ray.Fuentes@gmail.com','2022-05-19',NULL,88000),(124,6,'Daniel','sheppard','arcu.vel@icloud.org','2016-08-18','2022-01-15',70000),(125,4,'Odysseus','Austin','nibh.sit.amet@yahoo.net','2016-08-05',NULL,65000),(126,5,'Daniel','Brock','egestas@outlook.net','2016-08-18','2022-02-10',72100),(127,8,'Kira','yamato','GundamStrike@gmail.com','2010-05-01',NULL,250000),(128,3,'Lacus','Clyne','PeaceGundam@gmail.com','2024-01-01','2022-03-20',160000),(129,10,'oliver','queen','GreenArrow@icloud.com','2020-05-30','2022-04-17',175164),(130,2,'Madara','uchiha','spartan1980@hotmail.com','2021-03-25','2022-05-22',75640);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_phones`
--

DROP TABLE IF EXISTS `employees_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_phones` (
  `Phone_Number_ID` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Employee_ID` mediumint unsigned NOT NULL,
  `Employee_Phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Phone_Number_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `employees_phones_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_phones`
--

LOCK TABLES `employees_phones` WRITE;
/*!40000 ALTER TABLE `employees_phones` DISABLE KEYS */;
INSERT INTO `employees_phones` VALUES (1,101,'210-1155-1178'),(2,102,'210-889-4422'),(3,103,'210-223-3322'),(4,104,'210-855-9955'),(5,105,'210-666-8899'),(6,106,'210-556-9999'),(7,107,'210-456-2233'),(8,108,'210-556-8552'),(9,109,'210-897-8899'),(10,110,'210-465-7889'),(11,111,'210-336-4478'),(12,112,'210-556-7788'),(13,113,'210-556-4487'),(14,114,'210-445-4457'),(15,115,'210-789-4567'),(16,116,'210-785-7823'),(17,117,'210-789-4563'),(18,118,'210-458-1457'),(19,119,'210-458-1236'),(20,120,'210-126-1245'),(21,121,'210-567-2567'),(22,122,'210-254-2678'),(23,123,'210-458-8964'),(24,124,'210-256-4589'),(25,125,'210-456-7896'),(26,126,'210-568-7854'),(27,127,'210-363-4123'),(28,128,'210-345-4587'),(29,129,'210-789-4589'),(30,130,'210-896-8912');
/*!40000 ALTER TABLE `employees_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `Invoice_ID` int NOT NULL AUTO_INCREMENT,
  `Appointment_ID` mediumint unsigned NOT NULL,
  `Total_Amount` decimal(10,2) NOT NULL,
  `Status` enum('Unpaid','Paid','Pending') DEFAULT 'Unpaid',
  `Issued_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Invoice_ID`),
  UNIQUE KEY `Appointment_ID` (`Appointment_ID`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointments` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (2,10001,2000.00,'Unpaid','2025-05-07 23:10:26'),(3,10002,150.00,'Pending','2025-05-07 23:10:26'),(4,10003,50.00,'Paid','2025-05-07 23:10:26'),(5,10004,120.00,'Unpaid','2025-05-07 23:10:26'),(6,10005,180.00,'Pending','2025-05-07 23:10:26'),(7,10006,75.00,'Unpaid','2025-05-07 23:10:26'),(8,10007,500.00,'Paid','2025-05-07 23:10:26'),(9,10008,65.00,'Pending','2025-05-07 23:10:26'),(10,10009,90.00,'Unpaid','2025-05-07 23:10:26'),(11,10010,55.00,'Paid','2025-05-07 23:10:26'),(13,10012,80.00,'Paid','2025-05-07 23:10:26'),(14,10013,110.00,'Pending','2025-05-07 23:10:26'),(15,10014,130.00,'Unpaid','2025-05-07 23:10:26'),(16,10015,85.00,'Unpaid','2025-05-07 23:10:26'),(17,10016,140.00,'Paid','2025-05-07 23:10:26'),(18,10017,95.00,'Unpaid','2025-05-07 23:10:26'),(19,10018,70.00,'Pending','2025-05-07 23:10:26'),(20,10019,115.00,'Paid','2025-05-07 23:10:26'),(21,10020,95.00,'Unpaid','2025-05-07 23:10:26'),(22,10021,60.00,'Paid','2025-05-07 23:10:26'),(23,10022,70.00,'Pending','2025-05-07 23:10:26'),(24,10023,150.00,'Unpaid','2025-05-07 23:10:26'),(25,10024,120.00,'Paid','2025-05-07 23:10:26'),(26,10025,90.00,'Unpaid','2025-05-07 23:10:26'),(27,10026,65.00,'Pending','2025-05-07 23:10:26'),(28,10027,75.00,'Paid','2025-05-07 23:10:26'),(29,10028,100.00,'Unpaid','2025-05-07 23:10:26'),(30,10029,130.00,'Unpaid','2025-05-07 23:10:26');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_log`
--

DROP TABLE IF EXISTS `patient_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `log_message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_log`
--

LOCK TABLES `patient_log` WRITE;
/*!40000 ALTER TABLE `patient_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patientappointmentdetails`
--

DROP TABLE IF EXISTS `patientappointmentdetails`;
/*!50001 DROP VIEW IF EXISTS `patientappointmentdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientappointmentdetails` AS SELECT 
 1 AS `appointment_id`,
 1 AS `patient_id`,
 1 AS `patient_name`,
 1 AS `doctor_name`,
 1 AS `diagnosis`,
 1 AS `date`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Paul','Good','456 New Address Blvd','Apr 5, 1981'),(2,'Cathleen','Velez','113-2857 Mattis Ave','Apr 3, 2012'),(3,'Denton','Collier','P.O. Box 758, 6779 Lacinia Av.','Dec 15, 1994'),(4,'Kelly','Greene','240-2974 Sed St.','May 6, 2015'),(5,'Avram','Mack','Ap #351-594 Tempus Av.','Sep 24, 1981'),(6,'Inga','Gardner','Ap #288-3179 Dictum Rd.','Jun 30, 1993'),(7,'Timothy','Peterson','P.O. Box 222, 9542 Purus, Ave','Apr 22, 1993'),(8,'Illiana','Moss','P.O. Box 938, 1267 Consequat Road','Oct 16, 2019'),(9,'Molly','Bird','P.O. Box 760, 5964 Vel Rd.','May 11, 1997'),(10,'Demetrius','Bryant','Ap #981-5659 Enim. St.','Jun 23, 2001'),(11,'Lani','Pugh','5667 Euismod St.','Jun 19, 2020'),(13,'Mason','Love','Ap #137-9519 Ut Street','Jun 22, 2023'),(14,'Cullen','Haney','Ap #810-7253 Morbi St.','Dec 13, 2014'),(15,'Xenos','Riggs','Ap #965-4453 Nunc St.','Aug 14, 2006'),(16,'Geoffrey','Craft','Ap #679-9083 Enim Rd.','Jun 10, 2012'),(17,'Eugenia','Evans','8324 Eleifend Ave','Jun 24, 1988'),(18,'Donovan','Pittman','P.O. Box 493, 5769 Vitae St.','Sep 22, 1984'),(19,'Emma','Alford','P.O. Box 751, 1027 Erat Avenue','Oct 16, 1992'),(20,'Madison','Miranda','4141 Lorem Rd.','Aug 15, 1999'),(21,'Aline','Rowland','Ap #781-3296 Ultricies Rd.','Aug 21, 1977'),(22,'Hu','Fulton','260-7879 Non Ave','Mar 3, 1979'),(23,'Robert','Martinez','P.O. Box 828, 6653 Iaculis Ave','Nov 19, 1987'),(24,'Benedict','Foreman','P.O. Box 999, 3552 Dictum Ave','Sep 30, 2001'),(25,'Sebastian','Hatfield','974-6978 Gravida St.','Sep 26, 1983'),(26,'Nina','Lopez','123 Harmony Ln','Jan 10, 1995');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients_phones`
--

DROP TABLE IF EXISTS `patients_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients_phones` (
  `Patient_Phone_Number_ID` mediumint NOT NULL AUTO_INCREMENT,
  `Patient_ID` mediumint unsigned NOT NULL,
  `Patient_Phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Patient_Phone_Number_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `patients_phones_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_phones`
--

LOCK TABLES `patients_phones` WRITE;
/*!40000 ALTER TABLE `patients_phones` DISABLE KEYS */;
INSERT INTO `patients_phones` VALUES (1,1,'210-555-3890'),(2,2,'210-555-4099'),(3,3,'210-555-5584'),(4,4,'210-458-2296'),(5,5,'210-888-9985'),(6,6,'210-899-2244'),(7,7,'210-111-1155'),(8,8,'210-222-6000'),(9,9,'210-205-0055'),(10,10,'210-066-0598'),(11,11,'210-101-0236'),(13,13,'210-998-7045'),(15,15,'210-809-5600'),(16,16,'210-789-9999'),(17,17,'210-645-6655'),(18,18,'210-333-4433'),(19,19,'210-231-1234'),(20,20,'210-166-3366'),(21,21,'210-678-6895'),(22,22,'210-133-1344'),(23,23,'210-233-9988'),(24,24,'210-333-8956'),(25,25,'210-445-8933'),(26,26,'210-889-5566');
/*!40000 ALTER TABLE `patients_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `Service_ID` int NOT NULL AUTO_INCREMENT,
  `appointment_ID` mediumint unsigned NOT NULL,
  `Description` text,
  `UnitCost` decimal(10,2) DEFAULT NULL,
  `Quantity` int DEFAULT '1',
  PRIMARY KEY (`Service_ID`),
  KEY `appointment_ID` (`appointment_ID`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`appointment_ID`) REFERENCES `appointments` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (2,10001,'Patient with Lung Cancer: I advise a multi-modality treatment approach including consultation with oncology for possible chemotherapy, radiation therapy, and/or surgical evaluation. Early intervention is crucial.',2000.00,1),(3,10002,'Patient with Migraine: I suggest initiating treatment with appropriate pain relievers and preventive medications, along with lifestyle modifications to reduce triggers. Follow-up is recommended if symptoms persist.',150.00,1),(4,10003,'Patient with Cold: I recommend supportive care including hydration, rest, and over-the-counter decongestants. The patient should monitor symptoms and return if the condition worsens.',50.00,1),(5,10004,'Patient with High Blood Pressure: I emphasize the importance of lifestyle modifications, dietary adjustments, and potentially starting or titrating antihypertensive medications to maintain optimal blood pressure levels.',120.00,1),(6,10005,'Patient with Diabetes: I suggest a coordinated approach involving nutrition counseling, regular blood sugar monitoring, and appropriate medication management to control glycemic levels effectively.',180.00,1),(7,10006,'Patient with Asthma: I recommend inhaled bronchodilators and corticosteroids, along with a review of trigger avoidance strategies and regular monitoring of peak flow measurements.',75.00,1),(8,10007,'Patient with Heart Disease: I propose a comprehensive management plan that includes lifestyle modifications, medication adherence, and possibly further interventional cardiology evaluation based on stress testing results.',500.00,1),(9,10008,'Patient with Flu: I advise symptomatic treatment with rest, fluids, and monitoring for any respiratory distress. Consider antiviral medication if indicated by risk factors.',65.00,1),(10,10009,'Patient with Anxiety: I recommend a combined approach of cognitive behavioral therapy and, if necessary, short-term pharmacological interventions while monitoring for improvement in symptoms.',90.00,1),(11,10010,'Patient with Cough: I suggest supportive care with cough suppressants and hydration, and I will evaluate further if the cough persists or worsens.',55.00,1),(13,10012,'Patient with Allergies: I advise antihistamines and avoidance of known allergens, and in certain cases, immunotherapy may be considered if symptoms are severe.',80.00,1),(14,10013,'Patient with Hypertension: I emphasize continued blood pressure monitoring and adjusting medication as needed along with sustained lifestyle modifications for long-term control.',110.00,1),(15,10014,'Patient with Inflammation: I propose a regimen of anti-inflammatory medications coupled with possible physical therapy; I will monitor inflammatory markers and reassess treatment based on response.',130.00,1),(16,10015,'Patient with Sinus Infection: I advise initiating an appropriate course of antibiotics along with decongestants and nasal saline irrigation to relieve symptoms and clear the infection.',85.00,1),(17,10016,'Patient with Arthritis: I recommend a tailored management plan including pain management with NSAIDs, physical therapy, and if needed, referral to a specialist for further evaluation and treatment.',140.00,1),(18,10017,'Patient with Bronchitis: I suggest supportive care with rest, inhaled bronchodilators, and maintaining hydration, with follow-up to ensure resolution of respiratory symptoms.',95.00,1),(19,10018,'Patient with Strep Throat: I recommend prompt administration of antibiotics as per current guidelines along with supportive measures such as hydration and rest to reduce symptom severity.',70.00,1),(20,10019,'Patient with Tonsillitis: I advise evaluation for recurrent cases and a combination of antibiotic therapy with supportive care. In cases of chronic recurrence, surgical options may be discussed.',115.00,1),(21,10020,'Patient with Vertigo: I recommend vestibular rehabilitation therapy and monitoring of symptoms. Evaluate for underlying causes such as inner ear issues.',95.00,1),(22,10021,'Patient with Skin Rash: I suggest topical corticosteroids and allergen avoidance. If symptoms persist, refer to dermatology.',60.00,1),(23,10022,'Patient with Allergic Rhinitis: I recommend antihistamines, nasal corticosteroids, and review of environmental allergens.',70.00,1),(24,10023,'Patient with Chronic Fatigue: Initiate comprehensive evaluation including thyroid and nutritional screening; suggest rest and counseling.',150.00,1),(25,10024,'Patient with Osteoarthritis: Recommend NSAIDs and physical therapy. Refer to orthopedics if joint degradation is advanced.',120.00,1),(26,10025,'Patient with Anemia: Suggest iron supplements and dietary adjustments; follow-up labs to monitor hemoglobin and ferritin.',90.00,1),(27,10026,'Patient with Gastroenteritis: Recommend oral rehydration, rest, and bland diet. Monitor for signs of dehydration.',65.00,1),(28,10027,'Patient with Acid Reflux: Prescribe proton pump inhibitors and advise dietary modifications. Evaluate for GERD if recurrent.',75.00,1),(29,10028,'Patient with Sciatica: Suggest pain relief, physical therapy, and postural correction. Refer to neurology if severe.',100.00,1),(30,10029,'Patient with Pneumonia: Prescribe antibiotics based on severity and patient risk factors. Recommend rest and fluid intake.',130.00,1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ospetal'
--

--
-- Dumping routines for database 'ospetal'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CalcAppointmentCost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CalcAppointmentCost`(IN in_appointment_id MEDIUMINT(8) UNSIGNED)
BEGIN
  SELECT
    s.appointment_ID  AS AppointmentID,
    SUM(s.UnitCost * s.Quantity) AS TotalCost
  FROM Services AS s
  WHERE s.appointment_ID = in_appointment_id
  GROUP BY s.appointment_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `patientappointmentdetails`
--

/*!50001 DROP VIEW IF EXISTS `patientappointmentdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientappointmentdetails` AS select `a`.`appointment_id` AS `appointment_id`,`p`.`patient_id` AS `patient_id`,concat(`p`.`first_name`,' ',`p`.`last_name`) AS `patient_name`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `doctor_name`,`a`.`diagnosis` AS `diagnosis`,`a`.`date` AS `date`,`a`.`time` AS `time` from ((`appointments` `a` join `patients` `p` on((`a`.`patient_id` = `p`.`patient_id`))) join `employees` `e` on((`a`.`employee_id` = `e`.`Employee_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07 18:25:33
