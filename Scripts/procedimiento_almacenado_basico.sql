--PARAMETROS DE ENTRADA
--PARAMETROS DE SALIDA
CREATE OR REPLACE PROCEDURE SP_INSERT_EMPLOYEE(
    P_FIRST_NAME IN VARCHAR2,
    P_LAST_NAME IN VARCHAR2,
    P_EMAIL IN VARCHAR2,
    P_PHONE_NUMBER IN VARCHAR2,
    P_HIRE_DATE IN DATE,
    P_JOB_ID IN VARCHAR2,
    P_SALARY IN NUMBER,
    P_COMMISSION_PCT IN NUMBER,
    P_MANAGER_ID IN INTEGER,
    P_DEPARTMENT_ID IN INTEGER,
    P_EMPLOYEE_ID OUT INTEGER,
    P_MENSAJE OUT VARCHAR2
) AS
BEGIN
  P_EMPLOYEE_ID := SEQ_EMPLOYEE_ID.NEXTVAL;
  --SELECT SEQ_EMPLOYEE_ID.NEXTVAL INTO V_EMPLOYEE_ID FROM DUAL;
  INSERT INTO EMPLOYEES(
    EMPLOYEE_ID,
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
  )
  VALUES
  (
    P_EMPLOYEE_ID,
    P_FIRST_NAME,
    P_LAST_NAME,
    P_EMAIL,
    P_PHONE_NUMBER,
    P_HIRE_DATE,
    P_JOB_ID,
    P_SALARY,
    P_COMMISSION_PCT,
    P_MANAGER_ID,
    P_DEPARTMENT_ID
  );
  COMMIT;
  P_MENSAJE := 'Registro insertado con exito';
EXCEPTION
  WHEN OTHERS THEN  
    ROLLBACK;
    P_MENSAJE := 'Error al insertar un registro ' || SQLCODE || SQLERRM;
END;


---Ejecutar procedimiento almacenado:
set serveroutput on;

DECLARE
  V_EMPLOYEE_ID INTEGER;
  V_MENSAJE VARCHAR2(1000);
BEGIN
  hr.SP_INSERT_EMPLOYEE('MARIA',
    'RODRIGUEZ',
    'MRODRIGUEZ4@gmail.com',
    '99999999',
    sysdate,
    'AD_VP',
    456777,
    0,
    150,
    10,
    V_EMPLOYEE_ID,
    V_MENSAJE);
    
    dbms_output.put_line('Employee_id: '||v_employee_id);
    dbms_output.put_line('Mensaje: '||v_mensaje);
END;


