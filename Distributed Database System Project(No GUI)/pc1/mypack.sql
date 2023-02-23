SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE mypack AS
	PROCEDURE game_development;
	PROCEDURE web_development;
	PROCEDURE desktop_app_development;
	PROCEDURE mobile_app_development;
	PROCEDURE testing;
	PROCEDURE talent_finding;
	PROCEDURE customer_service_provider;
	PROCEDURE financial_solution;

	
	PROCEDURE title_print;
	PROCEDURE service_options(serviceName SERVICES.sName%TYPE);
	PROCEDURE companies_show;
    PROCEDURE companies_options;
    PROCEDURE company_title_print;
	PROCEDURE rating_title_print;
	PROCEDURE rating_show;
	PROCEDURE rating_options;

	PROCEDURE budget_title_print;
	PROCEDURE budget_show;
	PROCEDURE budget_options;
    
END mypack;
/

CREATE OR REPLACE PACKAGE BODY mypack AS

    PROCEDURE title_print
    IS
    BEGIN
        BEGIN
            DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('   service name'||chr(9)||'    Base Price'||chr(9)||'Duration'||chr(9)||'Rating'||chr(9)||'company name');
            DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------');

        end;
    END title_print;


    PROCEDURE company_title_print
    IS
    BEGIN
        BEGIN
            DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Rating'||chr(9)||'Contact No'||chr(9)||'Location'||chr(9)||'Company Name');
            DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');

        end;
    END company_title_print;

    PROCEDURE rating_title_print
    IS
    BEGIN
        BEGIN
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Rating'||chr(9)||'Contact No'||chr(9)||chr(9)||'Company Name');
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------');

        end;
    END rating_title_print;


    PROCEDURE budget_title_print
    IS
    BEGIN
        BEGIN
            DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Base Budget'||chr(9)||'Estiated Duration(Month)'||chr(9)||chr(9)||'Service Name');
            DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');

        end;
    END budget_title_print;



    PROCEDURE service_options(serviceName SERVICES.sName%TYPE)
    IS
        service_name SERVICES.sName%TYPE := serviceName;
    BEGIN
        FOR i IN(select * from ((COMPANY left join SERVICES on SERVICES.sID =   COMPANY.sID )left join RATING
            on RATING.cID = COMPANY.cID) where SERVICES.sName = service_name) LOOP

            DBMS_OUTPUT.PUT_LINE(i.sName||chr(9)||i.baseBudget||chr(9)||i.estimatedDuration||chr(9)||chr(9)||i.points||chr(9)||i.cName);
        END LOOP;
    END service_options;


    
    PROCEDURE companies_show
    IS
    BEGIN
        FOR i IN (select * from (COMPANY left join RATING on RATING.cID = COMPANY.cID))LOOP
            DBMS_OUTPUT.PUT_LINE(i.points||chr(9)||i.contactNo||chr(9)||i.cLocation||chr(9)||chr(9)||i.cName); 
        END LOOP;
    END companies_show;


    PROCEDURE rating_show
    IS
    BEGIN
        FOR i IN (select * from (COMPANY left join RATING on RATING.cID = COMPANY.cID))LOOP
            DBMS_OUTPUT.PUT_LINE(i.points||chr(9)||i.contactNo||chr(9)||chr(9)||i.cName); 
        END LOOP;
    END rating_show;


    PROCEDURE budget_show
    IS
    BEGIN
        FOR i IN (select * from SERVICES) LOOP
            DBMS_OUTPUT.PUT_LINE(i.baseBudget||chr(9)||chr(9)||chr(9)||i.estimatedDuration||chr(9)||chr(9)||chr(9)||i.sName); 
        END LOOP;
    END budget_show;



    PROCEDURE game_development
    IS
        service_name varchar(70):= 'game development';
        num number;
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);
        
    END game_development;

    
    
    PROCEDURE web_development
    IS
        service_name varchar(70):= 'web development';
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);
    END web_development;


    PROCEDURE desktop_app_development
    IS
        service_name varchar(70):= 'desktop app development';
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);

    END desktop_app_development;


    PROCEDURE mobile_app_development
    IS
        service_name varchar(70):= 'mobile app development';
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);

    END mobile_app_development;


    PROCEDURE testing
    IS
        service_name varchar(70):= 'testing';
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);

    END testing;
    

    PROCEDURE talent_finding
    IS
        service_name varchar(70):= 'talent finding';
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);
    END talent_finding;


    PROCEDURE customer_service_provider
    IS
        service_name varchar(70):= 'customer service provider';
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);
    END customer_service_provider;


    PROCEDURE financial_solution
    IS
        service_name varchar(70):= 'financial solution';
    BEGIN
        mypack.title_print;
        mypack.service_options(service_name);

    END financial_solution;


    -- companies_options
    PROCEDURE companies_options
    IS
    BEGIN
        mypack.company_title_print;
        mypack.companies_show;
    END companies_options;


    -- rating_options
    PROCEDURE rating_options
    IS 
    BEGIN
        mypack.rating_title_print;
        mypack.rating_show;
    END rating_options;

    
    -- budget_options
    PROCEDURE budget_options
    IS
    BEGIN
        mypack.budget_title_print;
        mypack.budget_show;
    END budget_options;
        
    
END mypack;
/
