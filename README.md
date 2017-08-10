# docker-oracleplus
Oracle database with Kibana dashboard running on Docker

Build image (https://github.com/oracle/docker-images/tree/master/OracleDatabase):
```bash
./buildDockerImage.sh -v 12.2.0.1 -e
```
Start container:
```bash
docker-compose up
```

Connect to Oracle database using sqlplus from remote machine:
```bash
sqlplus sys/manager@//localhost:1521/ORCLCDB as sysdba
```

Connect to Oracle database in container:
```bash
sqlplus / as sysdba
```
