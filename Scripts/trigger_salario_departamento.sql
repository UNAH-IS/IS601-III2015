SELECT DEPARTMENT_ID,SUM(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID;

SET SERVEROUTPUT ON;

UPDATE EMPLOYEES 
SET SALARY = 10000
WHERE EMPLOYEE_ID = 109;


create or replace FUNCTION F_SALARIO_DEPARTAMENTO(P_DEPARTMENT_ID INTEGER) 
RETURN NUMBER AS 
  V_SALARIO_TOTAL NUMBER;
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    SELECT SUM(SALARY) INTO V_SALARIO_TOTAL
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = P_DEPARTMENT_ID;
    RETURN V_SALARIO_TOTAL;
END;


create or replace TRIGGER TRG_VERIFICAR_SALARIO 
BEFORE INSERT OR UPDATE
ON EMPLOYEES 
FOR EACH ROW
DECLARE 
  V_SALARY NUMBER;
  v_NEW_SALARY NUMBER;
  v_OLD_SALARY NUMBER;
BEGIN

  IF INSERTING THEN
    SELECT SUM(SALARY) INTO V_SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = :NEW.DEPARTMENT_ID;
    /*:NEW.SALARY -> Un salario de un empleado
    V_SALARY -> Salario total antes de el insert*/
    IF ((V_SALARY+:NEW.SALARY)>=52000) THEN
      RAISE_APPLICATION_ERROR(-20600,'(INSERT) EL SALARIO SUPERA LOS 52MIL DOLARES, DEPARTAMENTO:'||:NEW.DEPARTMENT_ID);
    END IF;
  ELSIF UPDATING THEN
    v_SALARY := F_SALARIO_DEPARTAMENTO(:old.DEPARTMENT_ID);
    DBMS_OUTPUT.PUT_LINE('SALARIO: ' || v_SALARY);
    DBMS_OUTPUT.PUT_LINE('SALARIO VIEJO: ' || :old.SALARY);
    DBMS_OUTPUT.PUT_LINE('SALARIO NUEVO: ' || :new.SALARY);
    DBMS_OUTPUT.PUT_LINE('TOTAL: ' || (V_SALARY - :old.SALARY + :new.SALARY));
    IF ((V_SALARY - :old.SALARY + :new.SALARY)>=52000) THEN
      RAISE_APPLICATION_ERROR(-20600,'(UPDATE) EL SALARIO SUPERA LOS 52MIL DOLARES, DEPARTAMENTO:');
    END IF;
  END IF;
END;