-- SHOW parameter DB_CREATE_FILE_DEST;
ALTER SYSTEM SET DB_CREATE_FILE_DEST='/opt/oracle/oradata';

-- SHOW PDBS;
CREATE PLUGGABLE DATABASE "SAKILA" ADMIN USER "ADMIN" IDENTIFIED BY password roles=(DBA) STORAGE (MAXSIZE 2G MAX_SHARED_TEMP_SIZE 100M); 

-- Change status of SAKILA database:
ALTER PLUGGABLE DATABASE SAKILA OPEN READ WRITE;

-- Change session to SAKILA;
ALTER SESSION SET CONTAINER=SAKILA;

-- Create user SAKILA:
CREATE USER SAKILA identified by password;
GRANT ALL PRIVILEGES TO SAKILA identified by password;

-- Change to schema SAKILA:
ALTER SESSION SET CURRENT_SCHEMA=SAKILA;

-- Download SAKILA data:
HOST wget https://raw.githubusercontent.com/jOOQ/jOOQ/master/jOOQ-examples/Sakila/oracle-sakila-db/oracle-sakila-schema.sql
HOST wget https://github.com/jOOQ/jOOQ/raw/master/jOOQ-examples/Sakila/oracle-sakila-db/oracle-sakila-insert-data.sql

-- Create schema and import data:
@oracle-sakila-schema.sql
@oracle-sakila-insert-data.sql
