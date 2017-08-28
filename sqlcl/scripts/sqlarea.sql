HISTORY clear;
SET feedback off;
SPOOL spool.log;

-- Retrieve records from v$sqlarea
select /*json*/
sql_text,
sql_id,
sharable_mem
persistent_mem,
runtime_mem,
sorts,
version_count,
loaded_versions,
open_versions,
users_opening,
fetches,
executions,
users_executing,
loads,
first_load_time,
invalidations,
parse_calls,
disk_reads,
direct_writes,
buffer_gets,
application_wait_time,
concurrency_wait_time,
cluster_wait_time,
user_io_wait_time,
plsql_exec_time,
java_exec_time,
rows_processed,
TRUNC(rows_processed/DECODE(executions,0,1,executions)) "rows_processed_per_execution",
command_type,
optimizer_mode,
optimizer_cost,
parsing_user_id,
parsing_schema_id,
parsing_schema_name,
module,
action,
serializable_aborts,
cpu_time,
elapsed_time,
TRUNC(elapsed_time/DECODE(executions,0,1,executions)) "elapsed_time_per_execution",
remote,
object_status,
to_char(last_load_time,'DD-MM-YYYY HH24:MI:SS') AS last_load_time,
is_obsolete,
program_id,
to_char(last_active_time,'DD-MM-YYYY HH24:MI:SS') AS last_active_time,
physical_read_requests,
physical_read_bytes,
physical_write_requests,
physical_write_bytes,
locked_total,
pinned_total,
'sqlarea' AS tag
FROM v$sqlarea WHERE last_active_time > sysdate-1/1440;

-- Retrieve records from v$session table
SELECT /*json*/ v$session.*,'session' AS "tag" FROM v$session WHERE status='ACTIVE' AND TYPE != 'BACKGROUND';

SPOOL off;

-- Convert results to compact json
! jq -c '.results[].items[]' spool.log >> /tmp/sqlarea.json

-- Repeat 2147483647 times, every 60 seconds
REPEAT 2147483647 60
