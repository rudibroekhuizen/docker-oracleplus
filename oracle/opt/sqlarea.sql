set head off
set wrap off
set linesize 32767
set pagesize 0
set feedback off
select JSON_OBJECT (
'sql_text' is regexp_replace(SQL_TEXT,'"|:|\s|"','|'),
'sql_id' is SQL_ID,
'sharable_mem' is SHARABLE_MEM,
'persistent_mem' is PERSISTENT_MEM,
'runtime_mem ' is RUNTIME_MEM,
'sorts' is SORTS,
'version_count' is VERSION_COUNT,
'loaded_versions' is LOADED_VERSIONS,
'open_versions' is OPEN_VERSIONS,
'users_opening' is USERS_OPENING,
'fetches' is FETCHES,
'executions' is EXECUTIONS,
'users_executing' is USERS_EXECUTING,
'loads' is LOADS,
'first_load_time' is FIRST_LOAD_TIME,
'parse_calls' is PARSE_CALLS,
'disk_reads' is DISK_READS,
'buffer_gets' is BUFFER_GETS,
'rows_processed' is ROWS_PROCESSED,
'command_type' is COMMAND_TYPE,
'optimizer_mode' is OPTIMIZER_MODE,
'action' is ACTION,
'serializable_aborts' is SERIALIZABLE_ABORTS,
'cpu_time' is CPU_TIME,
'elapsed_time' is ELAPSED_TIME,
'last_active_time' is LAST_ACTIVE_TIME,
'last_load_time' is LAST_LOAD_TIME
) from v$sqlarea where last_active_time > sysdate-1/1440;
exit
