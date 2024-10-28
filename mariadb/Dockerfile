# Base Image
FROM mariadb:10.11.6

# data directory for databases, tables and dummy data
COPY ./data /var/lib/mysql

# Set owner mysql
RUN chown -R mysql:mysql /var/lib/mysql