SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE mypack2 AS

	PROCEDURE no_of_company_in_bd;
	PROCEDURE no_of_company_in_france;
	PROCEDURE no_of_company_in_china;
	PROCEDURE no_of_company_in_india;
	PROCEDURE no_of_company_in_usa;
	PROCEDURE no_of_company_in_uk;
	PROCEDURE no_of_company_in_germany;
	PROCEDURE no_of_company_in_italy;
	PROCEDURE no_of_company_in_poland;
	PROCEDURE no_of_company_in_taiwan;
	PROCEDURE compare;
	PROCEDURE compare_by_rating(rat number);
	PROCEDURE compare_by_budget;
	
	FUNCTION companyNoInFrance RETURN NUMBER;
	FUNCTION companyNoInBD RETURN NUMBER;
	FUNCTION companyNoInIndia RETURN NUMBER;
	FUNCTION companyNoInChina RETURN NUMBER;
	FUNCTION companyNoInUSA RETURN NUMBER;
	FUNCTION companyNoInUK RETURN NUMBER;
	FUNCTION companyNoInGermany RETURN NUMBER;
	FUNCTION companyNoInItaly RETURN NUMBER;
	FUNCTION companyNoInPoland RETURN NUMBER;
	FUNCTION companyNoInTaiwan RETURN NUMBER;

END mypack2;
/

CREATE OR REPLACE PACKAGE BODY mypack2 AS

    FUNCTION companyNoInFrance
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_FRANCE) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInFrance;



    FUNCTION companyNoInBD
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_BANGLADESH) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInBD;


    FUNCTION companyNoInChina
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_CHINA) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInChina;


    FUNCTION companyNoInIndia
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_INDIA) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInIndia;


    FUNCTION companyNoInUSA
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_USA) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInUSA;


    FUNCTION companyNoInUK
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_UK) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInUK;


    FUNCTION companyNoInPoland
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_POLAND) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInPoland;


    FUNCTION companyNoInTaiwan
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_TAIWAN) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInTaiwan;


    FUNCTION companyNoInGermany
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_GERMANY) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInGermany;


    FUNCTION companyNoInItaly
    RETURN NUMBER
    IS
        cnt NUMBER := 0;
    BEGIN 
        FOR i IN(select * from COMPANY_IN_ITALY) LOOP

            cnt := cnt + 1;
        END LOOP;

        return cnt;
    END companyNoInItaly;


    PROCEDURE compare_by_rating(rat number)
    IS
    BEGIN
        BEGIN
            DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Rating'||chr(9)||chr(9)||'Contact No'||chr(9)||chr(9)||'Company Name');
            DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');

        end;

        FOR i IN(select * from (comp left join rats on comp.cID = rats.cID) where rats.points = rat) LOOP
            DBMS_OUTPUT.PUT_LINE(i.points||chr(9)||chr(9)||i.contactNo||chr(9)||chr(9)||i.cName);
        END LOOP;
    END compare_by_rating;
    


    PROCEDURE compare_by_budget
    IS
    BEGIN
        BEGIN
            DBMS_OUTPUT.PUT_LINE('============================ Compare BY BUDGET ==============================');
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('B. Budget'||chr(9)||'Company'||chr(9)||chr(9)||'Contact'||chr(9)||chr(9)||chr(9)||'Service');
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------');

        end;

        FOR i IN(select * from (serv left join comp on comp.sID = serv.sID) order by serv.baseBudget) LOOP
            DBMS_OUTPUT.PUT_LINE(i.baseBudget||chr(9)||chr(9)||i.cName||chr(9)||chr(9)||i.contactNo||chr(9)||chr(9)||chr(9)||i.sName);
            
        END LOOP;
    END compare_by_budget;
    


    


    PROCEDURE no_of_company_in_france
    IS
        france_company_no number;
    BEGIN
        france_company_no := mypack2.companyNoInFrance;
        DBMS_OUTPUT.PUT_LINE('France has '||france_company_no||' company');
    END no_of_company_in_france;
   

    PROCEDURE no_of_company_in_bd
    IS
        bd_company_no number;
    BEGIN
        bd_company_no := mypack2.companyNoInBD;
        DBMS_OUTPUT.PUT_LINE('Bangladesh has '||bd_company_no||' company');
    END no_of_company_in_bd;


    PROCEDURE no_of_company_in_china
    IS
        china_company_no number;
    BEGIN
        china_company_no := mypack2.companyNoInChina;
        DBMS_OUTPUT.PUT_LINE('China has '||china_company_no||' company');
    END no_of_company_in_China;


    PROCEDURE no_of_company_in_india
    IS
        india_company_no number;
    BEGIN
        india_company_no := mypack2.companyNoInIndia;
        DBMS_OUTPUT.PUT_LINE('India has '||india_company_no||' company');
    END no_of_company_in_India;


    PROCEDURE no_of_company_in_usa
    IS
        usa_company_no number;
    BEGIN
        usa_company_no := mypack2.companyNoInUSA;
        DBMS_OUTPUT.PUT_LINE('USA has '||usa_company_no||' company');
    END no_of_company_in_usa;


    PROCEDURE no_of_company_in_uk
    IS
        uk_company_no number;
    BEGIN
        uk_company_no := mypack2.companyNoInUK;
        DBMS_OUTPUT.PUT_LINE('UK has '||uk_company_no||' company');
    END no_of_company_in_uk;



    PROCEDURE no_of_company_in_germany
    IS
        germany_company_no number;
    BEGIN
        germany_company_no := mypack2.companyNoInGermany;
        DBMS_OUTPUT.PUT_LINE('Germany has '||germany_company_no||' company');
    END no_of_company_in_germany;



    PROCEDURE no_of_company_in_italy
    IS
        italy_company_no number;
    BEGIN
        italy_company_no := mypack2.companyNoInBD;
        DBMS_OUTPUT.PUT_LINE('Italy has '||italy_company_no||' company');
    END no_of_company_in_italy;


    PROCEDURE no_of_company_in_poland
    IS
        poland_company_no number;
    BEGIN
        poland_company_no := mypack2.companyNoInPoland;
        DBMS_OUTPUT.PUT_LINE('Poland has '||poland_company_no||' company');
    END no_of_company_in_poland;


    PROCEDURE no_of_company_in_taiwan
    IS
        taiwan_company_no number;
    BEGIN
        taiwan_company_no := mypack2.companyNoInTaiwan;
        DBMS_OUTPUT.PUT_LINE('Taiwan has '||taiwan_company_no||' company');
    END no_of_company_in_taiwan;


    PROCEDURE compare
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('============================ Compare BY RATING ==============================');
        FOR i in 1..5 loop
            mypack2.compare_by_rating(i);
        END LOOP;
        mypack2.compare_by_budget;

    END compare;
   
    
END mypack2;
/
