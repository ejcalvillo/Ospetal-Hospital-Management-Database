CREATE TABLE IF NOT EXISTS `Employees` (
  `Employee_ID` mediumint(8) unsigned NOT NULL auto_increment,
  `Departmnet_ID` INT,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
	`email` VARCHAR(150) UNIQUE,
  `Salary` FLOAT NOT NULL,
  PRIMARY KEY (`employee_ID`),
  FOREIGN KEY (department_id) REFERENCES (department_id)
   -- FOREIGN KEY(`departmnet_ID`) REFERENCES employees(`employee_ID`)
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
    
    
    