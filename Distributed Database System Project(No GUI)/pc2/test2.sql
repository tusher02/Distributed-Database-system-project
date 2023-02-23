SET verify off;
SET SERVEROUTPUT ON;


BEGIN  
    DBMS_OUTPUT.PUT_LINE('1. Search by location');
    DBMS_OUTPUT.PUT_LINE('2. Compare');
end;
/


ACCEPT X NUMBER PROMPT "Choose an option: ";
ACCEPT Y char PROMPT "Choose location: ";

DECLARE

    options number := &X;
    location varchar2(70) := '&Y';
    userDefException EXCEPTION;

BEGIN

    IF options = 1 THEN

        IF LOWER(location) = 'france' THEN
            mypack2.no_of_company_in_france;
        ELSIF LOWER(location) = 'bangladesh' THEN
            mypack2.no_of_company_in_bd;
        ELSIF LOWER(location) = 'china' THEN
            mypack2.no_of_company_in_china;
        ELSIF LOWER(location) = 'india' THEN
            mypack2.no_of_company_in_india;
        ELSIF LOWER(location) = 'usa' THEN
            mypack2.no_of_company_in_usa;
        ELSIF LOWER(location) = 'uk' THEN
            mypack2.no_of_company_in_uk;
        ELSIF LOWER(location) = 'germany' THEN
            mypack2.no_of_company_in_germany;
        ELSIF LOWER(location) = 'italy' THEN
            mypack2.no_of_company_in_italy;
        ELSIF LOWER(location) = 'poland' THEN
            mypack2.no_of_company_in_poland;
        ELSIF LOWER(location) = 'taiwan' THEN
            mypack2.no_of_company_in_taiwan;

        end if;

    ELSIF options = 2 THEN
        mypack2.compare;
    ELSE
        RAISE userDefException;

    END IF;

    EXCEPTION
        WHEN userDefException THEN
            DBMS_OUTPUT.PUT_LINE('Choose an option between 1 and 2');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
        
END;
/



