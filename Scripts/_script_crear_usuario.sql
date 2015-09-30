--Crear nuevo usuario(esquema) con el password "PASSWORD" 
CREATE USER PRUEBA
  IDENTIFIED BY "oracle"
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP;
--asignar cuota ilimitada al tablespace por defecto  
ALTER USER PRUEBA QUOTA UNLIMITED ON USERS;

--Asignar privilegios basicos
GRANT create session TO PRUEBA;
GRANT create table TO PRUEBA;
GRANT create view TO PRUEBA;
GRANT create any trigger TO PRUEBA;
GRANT create any procedure TO PRUEBA;
GRANT create sequence TO PRUEBA;
GRANT create synonym TO PRUEBA;