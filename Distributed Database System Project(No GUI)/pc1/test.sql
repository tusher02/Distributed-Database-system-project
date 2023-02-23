SET verify off;
SET SERVEROUTPUT ON;


BEGIN
    DBMS_OUTPUT.PUT_LINE('1. Game development');
    DBMS_OUTPUT.PUT_LINE('2. Web development');
    DBMS_OUTPUT.PUT_LINE('3. Desktop application development');
    DBMS_OUTPUT.PUT_LINE('4. Mobile application development');
    DBMS_OUTPUT.PUT_LINE('5. Testing');
    DBMS_OUTPUT.PUT_LINE('6. Talent acquisition');
    DBMS_OUTPUT.PUT_LINE('7. Customer service');
    DBMS_OUTPUT.PUT_LINE('8. Finance');

    DBMS_OUTPUT.PUT_LINE('9. Companies');
    DBMS_OUTPUT.PUT_LINE('10. Rating');
    DBMS_OUTPUT.PUT_LINE('11. Location');
    DBMS_OUTPUT.PUT_LINE('12. Budget');
    
end;
/



ACCEPT X NUMBER PROMPT "Choose option = ";

DECLARE

    options number;
    userDefException EXCEPTION;
BEGIN

    options := &X;
    
    IF options = 1 THEN
        mypack.game_development;
    ELSIF options = 2 THEN
        mypack.web_development;
    ELSIF options = 3 THEN
         mypack.desktop_app_development;
    ELSIF options = 4 THEN
        mypack.mobile_app_development;
    ELSIF options = 5 THEN
        mypack.testing;
    ELSIF options = 6 THEN
        mypack.talent_finding;
    ELSIF options = 7 THEN
        mypack.customer_service_provider;
    ELSIF options = 8 THEN
        mypack.financial_solution;
    ELSIF options = 9 THEN
        mypack.companies_options;
    ELSIF options = 10 THEN
        mypack.rating_options;
    ELSIF options = 11 THEN
        -- location_options;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Contact No'||chr(9)||chr(9)||'Location'||chr(9)||'Company Name');
            DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');

        end;
        BEGIN
            
            for i in (select * from myview) LOOP
                DBMS_OUTPUT.PUT_LINE(i.view_C||chr(9)||chr(9)||i.view_B||chr(9)||chr(9)||i.view_A);
            end loop;
        end;
    ELSIF options = 12 THEN
        mypack.budget_options;
    
    ELSE
        RAISE userDefException;

    END IF;

    EXCEPTION
        WHEN userDefException THEN
            DBMS_OUTPUT.PUT_LINE('Choose an option from 1 to 12');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
        
END;
/



