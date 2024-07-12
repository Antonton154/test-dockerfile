DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT
      FROM pg_catalog.pg_database
      WHERE datname = 'mydatabase') THEN
      PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE mydatabase');
   END IF;
END
$do$;

-- Connect to mydatabase
\connect mydatabase;

-- Create user 'myuser' with password 'mypassword' and grant privileges
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT
      FROM pg_catalog.pg_roles
      WHERE rolname = 'myuser') THEN
      PERFORM dblink_exec('dbname=mydatabase', 'CREATE USER myuser WITH ENCRYPTED PASSWORD ''mypassword''');
   END IF;
END
$do$;

GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;

-- Create ESIGN_ACCOUNT table if it does not exist
CREATE TABLE IF NOT EXISTS ESIGN_ACCOUNT (
    id SERIAL PRIMARY KEY,
    accountId TEXT NOT NULL,
    eSignId TEXT NOT NULL,
    status TEXT,
    description TEXT,
    createdAt TIMESTAMP,
    updatedAt TIMESTAMP,
    cert TEXT,
    tcbsId TEXT,
    party TEXT,
    sub TEXT
);

-- Insert sample data into ESIGN_ACCOUNT table
INSERT INTO ESIGN_ACCOUNT (accountId, eSignId, status, description, createdAt, updatedAt, cert, tcbsId, party, sub)
VALUES
    ('acc001', 'esign001', 'active', 'Account 1', '2023-01-01 00:00:00', '2023-01-02 00:00:00', 'cert1', 'tcbs001', 'party1', 'sub1'),
    ('acc002', 'esign002', 'inactive', 'Account 2', '2023-02-01 00:00:00', '2023-02-02 00:00:00', 'cert2', 'tcbs002', 'party2', 'sub2'),
    ('acc003', 'esign003', 'active', 'Account 3', '2023-03-01 00:00:00', '2023-03-02 00:00:00', 'cert3', 'tcbs003', 'party3', 'sub3');