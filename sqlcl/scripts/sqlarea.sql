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
parse_calls,
disk_reads,
buffer_gets,
rows_processed,
command_type,
optimizer_mode,
action,
serializable_aborts,
cpu_time,
elapsed_time,
last_active_time,
last_load_time
from v$sqlarea;
exit
