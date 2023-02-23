SET verify off;
SET SERVEROUTPUT ON;

BEGIN
EXECUTE IMMEDIATE('create or replace view myview(view_A, view_B, view_C) as
select S.cName, S.cLocation, S.contactNo
from COMPANY S');
END;
/