set feedback off;
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
pinned_total
from v$sqlarea;
exit
