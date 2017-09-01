-- Create PDB Sakila:

CREATE PLUGGABLE DATABASE "SAKILA" ADMIN USER "Admin" IDENTIFIED BY "password"
  FILE_NAME_CONVERT=(
    '/opt/oracle/oradata/ORCLCDB/pdbseed/system01.dbf', '/opt/oracle/oradata/ORCLCDB/pdbseed/system0-SAKILA.dbf',
    '/opt/oracle/oradata/ORCLCDB/pdbseed/sysaux01.dbf', '/opt/oracle/oradata/ORCLCDB/pdbseed/sysaux0-SAKILA.dbf',
    '/opt/oracle/oradata/ORCLCDB/pdbseed/undotbs01.dbf', '/opt/oracle/oradata/ORCLCDB/pdbseed/undotbs0-SAKILA.dbf',
    '/opt/oracle/oradata/ORCLCDB/pdbseed/temp012017-09-01_13-42-54-149-PM.dbf', '/opt/oracle/oradata/ORCLCDB/pdbseed/temp012017-09-01_13-42-54-149-P-SAKILA.dbf'
  )
  STORAGE UNLIMITED TEMPFILE REUSE;

-- SHOW PDBS;

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
