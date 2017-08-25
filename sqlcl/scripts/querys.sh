## doesn't work, too slow after a couple of repeated connections

#!/bin/bash
while :
do
sql -s sys/manager@oracle:1521/ORCLCDB as sysdba @/scripts/sqlarea.sql > tmp.json &&
jq -c '.results[].items[]' tmp.json >> /tmp/sqlarea.json
sleep 60
date
done
