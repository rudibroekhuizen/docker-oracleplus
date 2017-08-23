#!/bin/bash
while :
do
sql -s sys/manager@oracle:1521/ORCLCDB as sysdba @/scripts/sqlarea.sql | jq -c '.results[].items[]' >> /tmp/sqlarea.json
sleep 60
date
done
