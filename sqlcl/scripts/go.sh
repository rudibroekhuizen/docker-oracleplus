#!/bin/bash
sql sys/manager@oracle:1521/ORCLCDB as sysdba @/scripts/go.sql
yes "jq -c '.results[].items[]' /scripts/spool.log" | head -n 60 | parallel -j1 --delay 60 > /tmp/sqlarea.json
