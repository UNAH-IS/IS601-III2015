--Procedimientos almacenados con nombre:
--Se almacenan en la base de datos
--No se ejecutan en el momento, solo se compilan
--Puede llevar o no parametros
--A los tipos de datos no se les define un tama~no
CREATE OR REPLACE PROCEDURE SP_HOLA_MUNDO(P_NOMBRE VARCHAR2, P_EDAD INT) AS
--VARIABLES
  V_MENSAJE VARCHAR2(100) := 'HOLA ';
  PROCEDURE SP_PROCEDIMIENTO_INTERNO AS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('DESDE EL PROCEDIMIENTO INTERNO');
  END;
BEGIN
  DBMS_OUTPUT.PUT_LINE(V_MENSAJE||P_NOMBRE||' ('||P_EDAD||')');
  SP_PROCEDIMIENTO_INTERNO();
  --Se pueden ejecutar bloques anonimos dentro de un procedimiento almacenado con nombre
  DECLARE
  BEGIN
    NULL;
  END;  
END;


--Ejecutar un procedimiento almacenado con nombre:
--Existen 3 formas:

--Utilizando Execute
EXECUTE SP_HOLA_MUNDO(P_EDAD=>23,P_NOMBRE=>'PEDRO');

--Utilizando Call
CALL SP_HOLA_MUNDO('PEDRO',22);

--Dentro de un bloque anonimo
BEGIN
  SP_HOLA_MUNDO('PEDRO',20);
END;



