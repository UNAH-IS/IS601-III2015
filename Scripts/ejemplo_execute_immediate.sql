/*crear tablas
modicar tablas
crear vistas
truncar tablas*/

DROP TABLE NOMBRE_TABLA;
TRUNCATE TABLE NOMBRE_TABLA;  --DDL

DELETE FROM NOMBRE_TABLA; COMMIT; --DML

CREATE TABLE TMP (CAMPO1 VARCHAR2(500)); 
DROP TABLE TMP;

BEGIN
  EXECUTE IMMEDIATE 'CREATE TABLE TMP (CAMPO1 VARCHAR2(500))';
END;


BEGIN
  EXECUTE IMMEDIATE 'TRUNCATE TABLE TBL_FACTURA_DETALLE';
END;

CREATE OR REPLACE PROCEDURE SP_TRUNCAR_TABLA(P_NOMBRE_TABLA VARCHAR2) AS
  V_SQL VARCHAR2(500):= 'TRUNCATE TABLE ';
BEGIN
  EXECUTE IMMEDIATE  V_SQL || P_NOMBRE_TABLA;
END;


EXECUTE SP_TRUNCAR_TABLA('TMP');



drop table tmp;

create table tmp (fecha date);


select * from tmp;

insert into tmp (fecha) 
values (TO_DATE('2015-14-10','YYYY-DD-MM'));


SELECT TO_CHAR(FECHA, 'YYYY/MM/DD') as fecha
FROM tmp;


--STR_TO_DATE --Mysql
--DATE_FORMAT --Mysql






