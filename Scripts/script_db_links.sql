--Estoy en windows (Local)

--Database Link publico: 
--  Cualquier usuario puede utilizar el DB Link
--Database Link privado:
--  Solo el usuario due�o puede utilizarlo

CREATE [PUBLIC] DATABASE LINK NOMBRE_DB_LINK
CONNECT TO USUARIO IDENTIFIED BY "PASSWORD"
USING 'DEFINICION_EN_TNSNAMES.ORA';

CREATE PUBLIC DATABASE LINK DBLINK_LINUX
CONNECT TO HR IDENTIFIED BY "oracle"
USING 'REMOTE_LINUX_XE';

SELECT *
FROM HR.TMP@DBLINK_LINUX;

SELECT *
FROM SYSTEM.HELP@DBLINK_LINUX;

--EJECUTAR UN PROCEDIMIENTO ALMACENADO 
--QUE ESTA EN OTRO ESQUEMA, EN UN PAQUETE 
--Y EN UNA BASE DE DATOS REMOTA.
EXECUTE ESQUEMA.PAQUETE.NOMBRE_PROCEDIMIENTO@DBLINK();



--INSERT SELECT
--CREATE SELECT

CREATE TABLE TMP_REMOTE_EMPLOYEES AS
SELECT * 
FROM HR.EMPLOYEES@DBLINK_LINUX;

SELECT *
FROM TMP_REMOTE_EMPLOYEES;