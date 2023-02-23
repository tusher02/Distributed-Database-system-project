clear screen;

DROP TABLE COMPANY_IN_FRANCE CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_BANGLADESH CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_INDIA CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_CHINA CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_USA CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_UK CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_GERMANY CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_ITALY CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_TAIWAN CASCADE CONSTRAINTS;
DROP TABLE COMPANY_IN_POLAND CASCADE CONSTRAINTS;


CREATE TABLE COMPANY_IN_FRANCE (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int
);

CREATE TABLE COMPANY_IN_BANGLADESH (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_CHINA (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_TAIWAN (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_INDIA (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_USA (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_UK (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_GERMANY (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_ITALY (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );

CREATE TABLE COMPANY_IN_POLAND (
	cID int, 
	cName varchar2(70), 
    cLocation varchar2(70), 
	contactNo int 
    );


CREATE OR REPLACE TRIGGER trig_site2
AFTER INSERT 
ON COMPANY_IN_POLAND
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Data insert successful!');
END;
/


insert into COMPANY_IN_FRANCE values(1, 'tech solver', 'france', 032567996);
insert into COMPANY_IN_FRANCE values(7, 'innovations', 'france', 0325474914);
insert into COMPANY_IN_FRANCE values(8, 'leads', 'france', 032487013);


insert into COMPANY_IN_BANGLADESH values(6, 'tech solver', 'bangladesh', 01954505389);
insert into COMPANY_IN_BANGLADESH values(18, 'innovations', 'bangladesh', 01754501460);


insert into COMPANY_IN_ITALY values(2, 'innovations', 'italy', 332567390);
insert into COMPANY_IN_ITALY values(9, 'leads', 'italy', 332016110);


insert into COMPANY_IN_GERMANY values(3, 'approx', 'germany', 572567996);
insert into COMPANY_IN_GERMANY values(19, 'leads', 'germany', 572567896);


insert into COMPANY_IN_USA values(4, 'leads', 'usa', 112567459);
insert into COMPANY_IN_USA values(22, 'tech solver', 'usa', 112567012);

insert into COMPANY_IN_UK values(5, 'approx', 'uk', 172567502);
insert into COMPANY_IN_UK values(17, 'leads', 'uk', 172567647);
insert into COMPANY_IN_UK values(20, 'tech solver', 'uk', 172540196);


insert into COMPANY_IN_CHINA values(10, 'tech solver', 'china', 122565737);
insert into COMPANY_IN_CHINA values(13, 'approx', 'china', 124568996);

insert into COMPANY_IN_INDIA values(11, 'tech solver', 'india', 9975365679957);
insert into COMPANY_IN_INDIA values(12, 'innovations', 'india', 9946365483102);

insert into COMPANY_IN_POLAND values(14, 'tech solver', 'poland', 562567126);
insert into COMPANY_IN_POLAND values(23, 'approx', 'poland', 562567996);

insert into COMPANY_IN_TAIWAN values(15, 'approx', 'taiwan', 195167996);
insert into COMPANY_IN_TAIWAN values(16, 'tech solver', 'taiwan', 192567098);
insert into COMPANY_IN_TAIWAN values(21, 'innovations', 'taiwan', 192565376);

commit;

@"J:\4.1\DDS Lab\DDS Project\myview2.sql";
@"J:\4.1\DDS Lab\DDS Project\mypack2.sql";
@"J:\4.1\DDS Lab\DDS Project\test2.sql";