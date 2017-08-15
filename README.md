# docker-oracleplus
Oracle database with Kibana dashboard running on Docker

Build image (https://github.com/oracle/docker-images/tree/master/OracleDatabase):
```bash
./buildDockerImage.sh -v 12.2.0.1 -e
```
Start containers:
```bash
docker-compose up
```

Connect to Oracle database using sqlplus from remote machine:
```bash
sqlplus sys/manager@//localhost:1521/ORCLCDB as sysdba
```

Connect to Oracle database:
```bash
docker exec -it dockeroracleplus_sqlcl_1 sh
sqlplus / as sysdba
```

Send all records from v$sqlarea to Elasticsearch using sqlcl:
```bash
docker exec -it dockeroracleplus_sqlcl_1 sh
sql -s sys/manager@oracle:1521/ORCLCDB as sysdba @/scripts/sqlarea.sql | jq -c '.results[].items[]' > /tmp/sqlarea.json
```
