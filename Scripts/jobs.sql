SELECT * FROM ALL_SCHEDULER_JOBS;

SELECT * FROM ALL_SCHEDULER_PROGRAMS;

SELECT * FROM SYS.ALL_SCHEDULER_SCHEDULES;

begin
dbms_scheduler.create_job (  
   job_name            => 'JOB_TEST',  
   job_type            => 'PLSQL_BLOCK',  
   job_action          => 'begin PROCTEST(2); end;',  
   number_of_arguments => 0,  
   start_date          => sysdate +10/24/59, -- sysdate + 10 minutos  
   job_class           => 'DEFAULT_JOB_CLASS',  -- Priority Group  
   enabled             => TRUE,  
   auto_drop           => TRUE,  
   comments            => 'JOB de prueba');
end;
