# Use an official PostgreSQL runtime as a parent image
FROM postgres:latest

# Set environment variables
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Copy initialization scripts into the container
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 8299