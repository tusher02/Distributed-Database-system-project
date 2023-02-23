clear screen;

DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE SERVICES CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE PreviousProject CASCADE CONSTRAINTS;
DROP TABLE RATING CASCADE CONSTRAINTS;
DROP TABLE WorksOn CASCADE CONSTRAINTS;


CREATE TABLE DEPARTMENT (
	dID int, 
	dName varchar2(70), 
    PRIMARY KEY(dID));


CREATE TABLE PreviousProject (
	pID int, 
	title varchar2(70), 
	timeTaken int,
    budget int,
    PRIMARY KEY(pID));


CREATE TABLE SERVICES (
	sID int, 
	sName varchar2(70), 
	baseBudget int, 
	estimatedDuration int,
    PRIMARY KEY(sID));


CREATE TABLE COMPANY (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int, 
    dID int,
    sID int,
    PRIMARY KEY(cID),
    FOREIGN KEY(sID) REFERENCES SERVICES(sID),
    FOREIGN KEY(dID) REFERENCES DEPARTMENT(dID));


CREATE TABLE EMPLOYEE (
	eID int, 
	eName varchar2(70), 
	age int, 
	gender char(1), 
	salary int,
    dID int,
    cID int,
    PRIMARY KEY(eID),
	FOREIGN KEY(dID) REFERENCES DEPARTMENT(dID),
    FOREIGN KEY(cID) REFERENCES COMPANY(cID));

CREATE TABLE RATING (
	rID int, 
    points int,
    cID int,
    PRIMARY KEY(rID),
    FOREIGN KEY(cID) REFERENCES COMPANY(cID));

CREATE TABLE WorksOn (
    dID int,
	pID int, 
    cID int,
	eID int,
	FOREIGN KEY(dID) REFERENCES DEPARTMENT(dID),
    FOREIGN KEY(pID) REFERENCES PreviousProject(pID),
    FOREIGN KEY(cID) REFERENCES COMPANY(cID),
    FOREIGN KEY(eID) REFERENCES EMPLOYEE(eID));

CREATE OR REPLACE TRIGGER trig 
AFTER INSERT 
ON WorksOn
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Data insert successful!');
END;
/

insert into DEPARTMENT values(1, 'HR'); 
insert into DEPARTMENT values(2, 'Customer Service'); 
insert into DEPARTMENT values(3, 'IT'); 
insert into DEPARTMENT values(4, 'Finance'); 

insert into PreviousProject values(1, 'food delivary app', 2, 30000); 
insert into PreviousProject values(2, 'banking app', 5, 80000); 
insert into PreviousProject values(3, 'ride sharing app', 3, 45000); 
insert into PreviousProject values(4, 'firm management', 1, 25000); 
insert into PreviousProject values(5, 'restaurant management', 1, 30000);
insert into PreviousProject values(6, 'banking app', 5, 95000);  
insert into PreviousProject values(7, 'restaurant management', 2, 17000);
insert into PreviousProject values(8, 'food delivary app', 2, 25000); 
insert into PreviousProject values(9, 'banking system testing', 2, 45000); 
insert into PreviousProject values(10, 'action game', 4, 48000); 
insert into PreviousProject values(11, 'banking app', 4, 100000);  
insert into PreviousProject values(12, 'restaurant management',1, 25000);
insert into PreviousProject values(13, 'food delivary app', 1, 30000); 
insert into PreviousProject values(14, 'java ide', 3, 97000); 
insert into PreviousProject values(15, 'ride sharing app', 1, 50000);
insert into PreviousProject values(16, 'firm management', 1, 25000); 
insert into PreviousProject values(17, 'restaurant management', 2, 20000);
insert into PreviousProject values(18, 'action game', 3, 55000); 
insert into PreviousProject values(19, 'java ide', 4, 60000); 
insert into PreviousProject values(20, 'banking system testing', 1, 40000); 
insert into PreviousProject values(21, 'action game', 4, 40000); 
insert into PreviousProject values(22, 'banking system testing', 1, 48000); 


insert into SERVICES values(1, 'game development', 35000, 2); 
insert into SERVICES values(2, 'web development', 50000, 2); 
insert into SERVICES values(3, 'desktop app development', 55000, 3); 
insert into SERVICES values(4, 'mobile app development', 27000, 1); 
insert into SERVICES values(5, 'testing', 20000, 1); 
insert into SERVICES values(6, 'talent finding', 10000, 1);
insert into SERVICES values(7, 'financial solution', 12000, 2); 
insert into SERVICES values(8, 'web development', 45000, 2); 
insert into SERVICES values(9, 'customer service provider', 10000, 2); 
insert into SERVICES values(10, 'mobile app development', 30000, 2); 
insert into SERVICES values(11, 'desktop app development', 50000, 2); 
insert into SERVICES values(12, 'talent finding', 12000, 1);
insert into SERVICES values(13, 'customer service provider', 12000, 1); 
insert into SERVICES values(14, 'financial solution', 20000, 1); 
insert into SERVICES values(15, 'testing', 15000, 1); 
insert into SERVICES values(16, 'game development', 30000, 2); 
insert into SERVICES values(17, 'mobile app development', 30000, 2); 
insert into SERVICES values(18, 'talent finding', 8000, 2); 
insert into SERVICES values(19, 'customer service provider', 8000, 1); 
insert into SERVICES values(20, 'financial solution', 15000, 2); 

-- 1.HR, 2.cus 3.IT 4.finance

insert into COMPANY values(1, 'tech solver', 'france', 032567996, 1, 6);
insert into COMPANY values(2, 'innovations', 'italy', 332567390, 2, 19);
insert into COMPANY values(3, 'approx', 'germany', 572567996, 4, 14);
insert into COMPANY values(4, 'leads', 'usa', 112567459, 1, 6);
insert into COMPANY values(5, 'approx', 'uk', 172567502, 2, 9);
insert into COMPANY values(6, 'tech solver', 'bangladesh', 01954505389, 2, 13);
insert into COMPANY values(7, 'innovations', 'france', 0325474914, 3, 1);
insert into COMPANY values(8, 'leads', 'france', 032487013, 1, 18);
insert into COMPANY values(9, 'leads', 'italy', 332016110, 2, 9);
insert into COMPANY values(10, 'tech solver', 'china', 122565737, 3, 3);
insert into COMPANY values(11, 'tech solver', 'india', 9975365679957, 4, 7);
insert into COMPANY values(12, 'innovations', 'india', 9946365483102, 3, 5);
insert into COMPANY values(13, 'approx', 'china', 124568996, 1, 18);
insert into COMPANY values(14, 'tech solver', 'poland', 562567126, 4, 14);
insert into COMPANY values(15, 'approx', 'taiwan', 195167996, 2, 19);
insert into COMPANY values(16, 'tech solver', 'taiwan', 192567098, 3, 10);
insert into COMPANY values(17, 'leads', 'uk', 172567647, 2, 13);
insert into COMPANY values(18, 'innovations', 'bangladesh', 01754501460, 3, 15);
insert into COMPANY values(19, 'leads', 'germany', 572567896, 3, 16);
insert into COMPANY values(20, 'tech solver', 'uk', 172540196, 3, 17);
insert into COMPANY values(21, 'innovations', 'taiwan', 192565376, 4, 20);
insert into COMPANY values(22, 'tech solver', 'usa', 112567012, 3, 1);
insert into COMPANY values(23, 'approx', 'poland', 562567996, 3, 11);



insert into EMPLOYEE values(1, 'A', 32, 'M', 32000, 3, 1); 
insert into EMPLOYEE values(2, 'B', 45, 'F', 39000, 2, 6); 
insert into EMPLOYEE values(3, 'C', 48, 'M', 40000, 2, 10); 
insert into EMPLOYEE values(4, 'D', 25, 'F', 25000, 4, 11); 
insert into EMPLOYEE values(5, 'E', 56, 'M', 60000, 1, 14); 
insert into EMPLOYEE values(6, 'F', 49, 'F', 42000, 3, 16); 
insert into EMPLOYEE values(7, 'F', 49, 'F', 42000, 3, 20); 
insert into EMPLOYEE values(8, 'F', 49, 'F', 42000, 1, 22); 
insert into EMPLOYEE values(9, 'DD', 25, 'F', 25000, 4, 2); 
insert into EMPLOYEE values(10, 'EF', 56, 'M', 56000, 1, 7); 
insert into EMPLOYEE values(11, 'FE', 49, 'F', 48000, 3, 12); 
insert into EMPLOYEE values(12, 'FG', 25, 'M', 22000, 3, 18); 
insert into EMPLOYEE values(13, 'FA', 28, 'F', 52000, 2, 21); 
insert into EMPLOYEE values(14, 'DMD', 25, 'M', 28000, 1, 3); 
insert into EMPLOYEE values(15, 'EFO', 56, 'M', 80000, 2, 5); 
insert into EMPLOYEE values(16, 'LFE', 49, 'F', 66000, 4, 13); 
insert into EMPLOYEE values(17, 'FPG', 25, 'F', 27000, 3, 15); 
insert into EMPLOYEE values(18, 'FAU', 28, 'F', 55000, 3, 22); 
insert into EMPLOYEE values(19, 'DMDR', 23, 'F', 24000, 3, 4); 
insert into EMPLOYEE values(20, 'EFTO', 44, 'F', 70000, 2, 8); 
insert into EMPLOYEE values(21, 'LUFE', 52, 'M', 82000, 3, 9); 
insert into EMPLOYEE values(22, 'FVPG', 27, 'M', 30000, 4, 17); 
insert into EMPLOYEE values(23, 'FNAU', 26, 'F', 44000, 1, 19); 


insert into RATING values(1, 5, 1); 
insert into RATING values(2, 4, 2); 
insert into RATING values(3, 2, 20); 
insert into RATING values(4, 3, 13); 
insert into RATING values(5, 4, 11); 
insert into RATING values(6, 3, 12); 
insert into RATING values(7, 4, 22); 
insert into RATING values(8, 2, 7); 
insert into RATING values(9, 5, 6); 
insert into RATING values(10, 4, 9); 
insert into RATING values(11, 4, 10); 
insert into RATING values(12, 1, 5); 
insert into RATING values(13, 5, 4); 
insert into RATING values(14, 1, 3); 
insert into RATING values(15, 5, 8); 
insert into RATING values(16, 3, 17); 
insert into RATING values(17, 5, 14); 
insert into RATING values(18, 4, 16); 
insert into RATING values(19, 4, 15); 
insert into RATING values(20, 5, 19); 
insert into RATING values(21, 5, 18); 
insert into RATING values(22, 2, 21);  


insert into WorksOn values(3, 22, 1, 1); 
insert into WorksOn values(1, 2, 2, 2); 
insert into WorksOn values(2, 1, 3, 3); 
insert into WorksOn values(3, 5, 4, 4); 
insert into WorksOn values(4, 3, 5, 7); 
insert into WorksOn values(3, 6, 6, 19); 
insert into WorksOn values(4, 21, 7, 11); 
insert into WorksOn values(1, 19, 8, 6); 
insert into WorksOn values(2, 11, 9, 8); 
insert into WorksOn values(3, 7, 10, 15); 
insert into WorksOn values(1, 15, 11, 20); 
insert into WorksOn values(4, 10, 12, 13); 
insert into WorksOn values(3, 9, 13, 10); 
insert into WorksOn values(3, 8, 14, 5); 
insert into WorksOn values(2, 20, 15, 14); 
insert into WorksOn values(1, 12, 16, 17); 
insert into WorksOn values(3, 18, 17, 21); 
insert into WorksOn values(3, 17, 18, 12); 

commit;


@"J:\4.1\DDS Lab\DDS Project\myview.sql";
@"J:\4.1\DDS Lab\DDS Project\mypack.sql";
@"J:\4.1\DDS Lab\DDS Project\test.sql";
