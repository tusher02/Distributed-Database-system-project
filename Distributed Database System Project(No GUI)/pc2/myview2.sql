SET verify off;
SET SERVEROUTPUT ON;

create or replace view comp as (select * from COMPANY@site_link);

create or replace view serv as (select * from SERVICES@site_link);

create or replace view rats as (select * from RATING@site_link);


commit;