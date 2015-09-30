--Bloque anonimo
--No tiene nombre
--No se almacena en la BD
--Se ejecuta en el momento
--Un bloque tiene que tener al menos una instruccion(instruccion minima null)

--Activar consola de oracle:
set serveroutput on;

--Concatenar nombre y apellido
SELECT employee_id, first_name ||' ' || last_name as nombre_completo
FROM EMPLOYEES;


declare
  --definicion de variables
  v_mensaje varchar2(100) := 'Hola ';
  V_NOMBRE VARCHAR2(200);
  V_APELLIDO VARCHAR2(200);
  v_a int;
  v_b int;
  v_c int;
begin
  v_a := 5;
  v_b := 3;
  v_c := v_a + v_b;
  
  --La consulta debe retornar un solo registro
  SELECT FIRST_NAME, LAST_NAME INTO V_NOMBRE, V_APELLIDO
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 100654654;
  --no se puede hacer declaracion de variables aqui.
  v_mensaje := v_mensaje || V_NOMBRE|| ' '||V_APELLIDO; --Asignacion utilizando :=
  --SELECT 'Hola Juan' INTO v_mensaje FROM dual; --Asignacion utilizando Select into
  dbms_output.put_line(v_mensaje);
  dbms_output.put_line('El resultado es: ' || v_c);
exception
  --Listado de las excepciones
  /*
  WHEN TIPO_ERROR THEN
    INSTRUCCIONES  
  */
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('NO SE ENCONTRO INFORMACION EN LA TABLA CONSULTADA');  
  when others then
    dbms_output.put_line('Ocurrio un error '||SQLCODE||', ' || SQLERRM);
    --SQLCODE: Codigo del error
    --SQLERRM: Mensaje de error
end;
