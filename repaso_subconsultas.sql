SELECT * 
FROM EMPLOYEES;

SELECT * 
FROM DEPARTMENTS;

SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID);

--Obtener el empleado que gana menos
SELECT FIRST_NAME, SALARY, ROWNUM_SUBCONSULTA, ROWNUM 
FROM (
  SELECT FIRST_NAME, SALARY, ROWNUM AS ROWNUM_SUBCONSULTA
  FROM EMPLOYEES
  ORDER BY SALARY
)
WHERE ROWNUM = 1;



--Identificar cuanto es el porcentaje de gastos en salarios por departamento
SELECT DEPARTMENT_NAME, 
      100 * round(SALARIO_DEPTO/
      (
        SELECT SUM(SALARY) SALARIO_TOTAL
        FROM EMPLOYEES
      ),2) AS SALARIO_TOTAL --Se puede utilizar una subconsulta como campo porque retorna una sola columna y un solo registro
FROM (
  SELECT DEPARTMENT_NAME, 
        SUM(SALARY) SALARIO_DEPTO
  FROM EMPLOYEES A
  LEFT JOIN DEPARTMENTS B
  ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
  GROUP BY DEPARTMENT_NAME
  ORDER BY DEPARTMENT_NAME
);

--20308/691416
--4400/691416 = 2.93%
SELECT SUM(SALARY) SALARIO_TOTAL
FROM EMPLOYEES;