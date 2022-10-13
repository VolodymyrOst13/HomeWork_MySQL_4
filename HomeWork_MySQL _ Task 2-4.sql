CREATE DATABASE MyJoinsDB;

 CREATE TABLE MyJoinsDB.Employee  
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	firstName VARCHAR(30) NOT NULL,   			 
    lastName VARCHAR(30) NOT NULL, 				 
    phone VARCHAR(20) NOT NULL
);

INSERT MyJoinsDB.Employee
(firstName, lastName, phone)
VALUES
('Петро', 'Петренко', '0991234567'),
('Василь', 'Швець', '0997612343'),
('Олег', 'Дзюма', '0997612344'),
('Віктор', 'Барінов', '0997612345');
 SELECT * FROM  MyJoinsDB.Employee ;
 
 CREATE TABLE MyJoinsDB.position 
(	
     positionID INT not null,
     position VARCHAR(30) NOT NULL,    
     salary double NOT NULL, 		    
     FOREIGN KEY(positionID) references Employee(id),
     PRIMARY KEY (positionID)
);

INSERT INTO MyJoinsDB.position																			   
(positionID, position, salary)
VALUES
(1, 'Директор', 150000.00),
(2, 'Менеджер', 120000.00),
(3, 'Продавець', 100000.00),
(4, 'Охоронець', 100000.00);
SELECT * FROM  MyJoinsDB.position;
 
 CREATE TABLE MyJoinsDB.info   
(		 
     EmployeeID INT not null,
     familyStatus VARCHAR(30) NOT NULL,    	
     dateOfBirth DATE NOT NULL, 			
     address VARCHAR(100) NOT NULL, 		   
     FOREIGN KEY(EmployeeID) references Employee(id),
     PRIMARY KEY (EmployeeID)
);

INSERT INTO MyJoinsDB.info 																			   
(EmployeeID, familyStatus, dateOfBirth, address)
VALUES
(1, 'не одружений', '1991-06-16', 'вул. Добрівлянська / 64'),
(2, 'одружений', '1992-03-01', 'вул. Січових Стрільців / 2'),
(3, 'не одружений', '1993-09-20', 'вул. Львівська / 3'),
(4, 'одружений', '1994-10-28', 'вул. Колесси / 4');
SELECT * FROM  MyJoinsDB.info;
 

SELECT phone, address FROM MyJoinsDB.Employee
JOIN MyJoinsDB.info  ON id = EmployeeID;

 
SELECT dateOfBirth, phone FROM MyJoinsDB.Employee 
JOIN MyJoinsDB.info   ON  familyStatus = 'не одружений' and id = EmployeeID;


SELECT phone as ТЕЛЕФОН, dateOfBirth as ДЕНЬ_РОЖДЕНИЯ, CONCAT(lastName, ' ', firstName) as ИМЯ FROM MyJoinsDB.Employee 
JOIN MyJoinsDB.position
ON     position = 'Менеджер'  and id = positionID
JOIN MyJoinsDB.info 
ON id = EmployeeID;