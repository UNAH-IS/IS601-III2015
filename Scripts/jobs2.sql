--Crear componentes de prueba
create sequence sq_prueba_job;

create table tbl_prueba_job (
  numero_ejecucion number,  
  fecha_ejecucion date
);

create or replace PROCEDURE SP_PRUEBA_JOB AS
BEGIN
  INSERT INTO TBL_PRUEBA_JOB(NUMERO_EJECUCION, FECHA_EJECUCION)
  VALUES (SQ_PRUEBA_JOB.NEXTVAL, SYSDATE);
  COMMIT;
END;

SELECT * 
FROM TBL_PRUEBA_JOB;

SELECT *
FROM TABLA;


/*BEGIN SP_PRUEBA_JOB; END;
begin dbms_scheduler.create_job ( 
    job_name => 'PRUEBA_JOB', 
    job_type => 'PLSQL_BLOCK', 
    job_action => 'BEGIN SP_PRUEBA_JOB; END;', 
    number_of_arguments => 0, 
    start_date => sysdate + 1/24/59, -- sysdate + 10 minutos 
    job_class => 'DEFAULT_JOB_CLASS', -- Priority Group 
    enabled => TRUE, 
    auto_drop => TRUE, 
    comments => 'JOB de prueba'); 
end;

begin dbms_scheduler.run_job('PRUEBA_JOB',TRUE); end;
SELECT * 
FROM ALL_SCHEDULER_JOBS;

begin
  dbms_scheduler.drop_job('PRUEBA_JOB');
end;

*/


--PASO 1: CREAR HORARIO
begin 
    dbms_scheduler.create_schedule( 
    schedule_name => 'INTERVALO_CADA_MINUTO', 
    start_date => TRUNC(sysdate)-5, 
    repeat_interval => 'freq=MINUTELY;interval=1', 
    comments => 'Ejecucion: cada 1 minuto'); 
end;


begin 
  dbms_scheduler.drop_schedule('INTERVALO_CADA_MINUTO'); 
end;

SELECT *
FROM ALL_SOURCE;

SELECT *
FROM ALL_SCHEDULER_SCHEDULES;


--PASO 2: CREAR PROGRAMA
begin 
  dbms_scheduler.create_program (
    program_name=> 'PROGRA_PRUEBA', 
    program_type=> 'PLSQL_BLOCK',
    program_action=> 'SP_PRUEBA_JOB;', 
    enabled=>true, 
    comments=>'Programa de PRUEBA' 
  ); 
end;

BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM('PROGRA_PRUEBA');
END;


SELECT *
FROM ALL_SCHEDULER_PROGRAMS;

--PASO 3: CREAR JOB QUE ASOCIE EL PROGRAMA CON EL HORARIO
begin 
    dbms_scheduler.create_job (
        job_name => 'PRUEBA_JOB_HORARIO', 
        program_name=> 'PROGRA_PRUEBA', 
        schedule_name=>'INTERVALO_CADA_MINUTO', 
        enabled=>true, 
        auto_drop=>false, 
        comments=>'Job que ejecuta el procedimiento SP_PRUEBA_JOB cada MINUTO'
      ); 
end;

BEGIN
  DBMS_SCHEDULER.DROP_JOB('PRUEBA_JOB_HORARIO');
END;


