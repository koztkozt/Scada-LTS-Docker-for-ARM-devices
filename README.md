# Scada-LTS_Docker
Scada-LTS Docker for ARM/AMD Devices\

## Info
1. Use mariadb:10.3.32 instead of mysql/mysql-server:5.7 as only mariadb supports ARM\
2. Revised Dockerfile for Scada-LTS to wait (https://github.com/vishnubob/wait-for-it) for database service (port 3306) to be ready
