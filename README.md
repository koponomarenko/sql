## PostgreSQL in Docker:
### Create a docker container from Docker image (map to port "5401"):

    $ docker run --name postgresql -p 5401:5432 -e POSTGRES_PASSWORD=Adam123456 -d postgres:14.8

### Retrieve information about all the databases in the current PostgreSQL instance

    SELECT * FROM pg_database; -- postgresql

## MS SQLServer in Docker:
### Create a docker container from Docker image (map to port "1401"):

    $ docker run --name sqlserver2019-kineteco -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=Adam123456" -e "MSSQL_PID=Express" \
    -p 1401:1433 -d mcr.microsoft.com/mssql/server:2019-latest

## Retrieve information about all the databases in the current MS SQL Server instance

    SELECT * FROM sys.databases; -- sql-server

