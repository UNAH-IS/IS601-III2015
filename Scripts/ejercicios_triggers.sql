CREATE OR REPLACE TRIGGER TRG_VERIFICAR_MANAGER
BEFORE
INSERT
ON EMPLOYEES
FOR EACH ROW
DECLARE
  V_CANTIDAD INTEGER;
BEGIN
  SELECT COUNT(1) INTO V_CANTIDAD
  FROM EMPLOYEES
  WHERE MANAGER_ID = :NEW.MANAGER_ID;
  
  IF (V_CANTIDAD>5) THEN
    raise_application_error(-20600,:NEW.MANAGER_ID||', No se puede supervisar m�s de 5');
  END IF;
END;




CREATE OR REPLACE TRIGGER TRG_VERIFICAR_SALARIO
BEFORE
UPDATE
ON EMPLOYEES
FOR EACH ROW
BEGIN
  IF (:NEW.SALARY>:OLD.SALARY*1.20) THEN
    raise_application_error(-20601,:NEW.MANAGER_ID||', Esta restringido que un empleado tenga un aumento del 20%');
  END IF;
END;

CREATE TABLE EMPLOYEE_
SELECT EMPLOYEE_ID,
  FIRST_NAME,
  LAST_NAME,
  EMAIL,
  PHONE_NUMBER,
  HIRE_DATE,
  JOB_ID,
  SALARY,
  COMMISSION_PCT,
  MANAGER_ID,
  DEPARTMENT_ID
FROM EMPLOYEES ;

CREATE OR REPLACE TRIGGER TRG_VERIFICAR_SALARIO
BEFORE
UPDATE
ON EMPLOYEES
FOR EACH ROW
BEGIN
  IF (:NEW.SALARY>:OLD.SALARY*1.20) THEN
    raise_application_error(-20601,:NEW.MANAGER_ID||', Esta restringido que un empleado tenga un aumento del 20%');
  END IF;
END;