# docker-oracleplus

## Overview
Oracle database with Kibana dashboard running on Docker. Tested on Ubuntu 16.04 with Docker version 17.05.0-ce.

### Prerequisites
Build Oracle docker image (https://github.com/oracle/docker-images/tree/master/OracleDatabase):
```bash
cd ~/
git clone https://github.com/oracle/docker-images
cd docker-images/OracleDatabase/dockerfiles
./buildDockerImage.sh -v 12.2.0.1 -e
```
Install Docker
Set max_map_count for Elasticsearch: 
```bash
sudo echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
```

### Download this repo and start containers
```bash
cd ~/
git clone https://github.com/rudibroekhuizen/docker-oracleplus
cd docker-oracleplus
docker-compose up
```

### Connect to Oracle using SQL\*Plus from host
```bash
sqlplus sys/manager@//localhost:1521/ORCLCDB as sysdba
```

### Connect to Oracle database using SQL\*Plus from container
```bash
$ docker-compose exec sqlcl sh
or
$ docker exec -it dockeroracleplus_sqlcl_1 sh
$ sqlplus / as sysdba
```

### Connect to Oracle database using SQLcl from container
```bash
$ docker-compose exec sqlcl sh
$ sqlcl sys/manager@//oracle:1521/ORCLCDB as sysdba
```

### Send all records from v$sqlarea to Elasticsearch, repeat every minute, for 1 hour
```bash
$ docker-compose exec sqlcl sh
$ sqlcl sys/manager@//oracle:1521/ORCLCDB as sysdba
SQL> @tojson.sql
SQL> repeat 60 60
```

### Open Kibana
```bash
http://localhost:5601
```

### Open EM
```bash
https://localhost:5500/em
```

### Useful commands
```bash
# Check CPU consumption
$ docker stats $(docker inspect -f "{{ .Name }}" $(docker ps -q))

# Remove containers, volumes and images
$ docker-compose down -v --remove-orphans --rmi all

# Delete all indexes in Elasticsearch (except dashboard:
$ docker-compose exec logstash sh
$ curl -XDELETE elasticsearch:9200/logstash-*
```
