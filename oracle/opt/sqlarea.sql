set head off
set wrap off
set linesize 32767
set pagesize 0
set feedback off
select JSON_OBJECT('EXECUTIONS' is EXECUTIONS , 'SQL_ID' is SQL_ID) from v$sqlarea;
exit
