SET SERVEROUTPUT ON;

DECLARE 
  V_TOTAL_SALARY NUMBER;
BEGIN
  SELECT SUM(SALARY)
  INTO V_TOTAL_SALARY
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 90;
  --IF (V_TOTAL_SALARY >= 2000 AND V_TOTAL_SALARY < 60000) THEN
  DBMS_OUTPUT.PUT_LINE('SALARIO TOTAL: '|| V_TOTAL_SALARY);
  IF (V_TOTAL_SALARY BETWEEN 2000 AND 35000) THEN
    DBMS_OUTPUT.PUT_LINE('PUEDE CONTRATAR MAS PERSONAL');
  ELSIF (V_TOTAL_SALARY >=35001) THEN
    DBMS_OUTPUT.PUT_LINE('TIENE QUE DESPEDIR GENTE');
  END IF;
END;


--SENTENCIA CASE
SELECT CASE
          WHEN SALARY > 9000 THEN 'ES MAYOR A 9000'
          ELSE 'ES MENOR QUE 9000'
        END MENSAJE 
FROM EMPLOYEES;

--SENTENCIA CASE EN UN PROCEDIMIENTO ANONIMO
DECLARE 
  V_VALOR INTEGER:= 500;
BEGIN
  CASE V_VALOR
    WHEN 100 THEN
      DBMS_OUTPUT.PUT_LINE('EL VALOR ES 100');
    WHEN 200 THEN
      DBMS_OUTPUT.PUT_LINE('EL VALOR ES 200');
    ELSE
      DBMS_OUTPUT.PUT_LINE('NO SE SABE NADA');
  END CASE;
END;


DECLARE 
  V_VALOR INTEGER:= 500;
BEGIN
  CASE 
    WHEN V_VALOR = 100 THEN
      DBMS_OUTPUT.PUT_LINE('EL VALOR ES 100');
    WHEN V_VALOR = 200 THEN
      DBMS_OUTPUT.PUT_LINE('EL VALOR ES 200');
    ELSE
      DBMS_OUTPUT.PUT_LINE('NO SE SABE NADA');
  END CASE;
END;


--SENTENCIA LOOP
--LLENAR TABLA CON 100000 REGISTROS
DECLARE 
  V_CONTADOR INTEGER:=1;
BEGIN
  LOOP
    INSERT INTO TMP (CAMPO_NUMERICO, CAMPO_TEXTO)
    VALUES (
        TRUNC(DBMS_RANDOM.VALUE(-100,100)), 
        DBMS_RANDOM.STRING('A',20)
    );
    V_CONTADOR := V_CONTADOR + 1;
    EXIT WHEN V_CONTADOR>=100000;
  END LOOP;
  COMMIT;
END;


--SENTENCIA WHILE
--LLENAR TABLA CON 100000 REGISTROS
DECLARE 
  V_CONTADOR INTEGER:=1;
BEGIN
  WHILE V_CONTADOR<=100000 LOOP
    INSERT INTO TMP (CAMPO_NUMERICO, CAMPO_TEXTO)
    VALUES (
        TRUNC(DBMS_RANDOM.VALUE(-100,100)), 
        DBMS_RANDOM.STRING('A',20)
    );
    V_CONTADOR := V_CONTADOR + 1;
  END LOOP;
  COMMIT;
END;


--NO SE PUEDEN EJECUTAR SENTENCIAS DDL DIRECTAMENTE
--DESDE UN PROCEDIMIENTO ALMACENADO

--SE PUEDEN EJECUTAR UTILIZANDO UNA 
--INSTRUCCION LLAMADA EXECUTE IMMEDIATE


SELECT ROUND(DBMS_RANDOM.VALUE(10,50),5) AS ALEATORIO
FROM DUAL;

SELECT TRUNC(DBMS_RANDOM.VALUE(10,50)) AS ALEATORIO
FROM DUAL;

--U: UPPERCASE
--L: LOWERCASE
--A: MAYUSCULAS Y MINUSCULAS
SELECT DBMS_RANDOM.STRING('A',50) AS ALEATORIO
FROM DUAL;



CREATE TABLE TMP(
  CAMPO_NUMERICO NUMBER,
  CAMPO_TEXTO VARCHAR2(200)
);

TRUNCATE TABLE TMP; --DDL

DELETE FROM TMP; --DML

SELECT * FROM TMP;
COMMIT;








--35000