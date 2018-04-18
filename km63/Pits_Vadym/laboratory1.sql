CREATE USER pits IDENTIFIED BY pits
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
ALTER USER pits QUOTA 100M ON "USERS";
GRANT "CONNECT" TO pits;


CREATE TABLE WINDOWS
(
version_of_windows VARCHAR2(5),
price NUMBER(10,2),
name VARCHAR2(30),
interface_type VARCHAR2(30)
);

CREATE TABLE COMPUTER
(
computer_age NUMBER(4,0),
processor_model VARCHAR2(30),
color VARCHAR2(30),
computer_type VARCHAR2(30)
);

CREATE TABLE WINDOWS_ON_COMPUTER
(
version_of_OSwindows VARCHAR2(5),
age_of_computer NUMBER(4,0),
age_of_user NUMBER(3,0),
date_of_installing DATE
);

ALTER TABLE computer ADD CONSTRAINT computer_pk PRIMARY KEY (computer_age);
ALTER TABLE windows_on_computer ADD CONSTRAINT windows_on_computer_fk FOREIGN KEY (age_of_computer) REFERENCES computer(computer_age);
ALTER TABLE windows_on_computer ADD CONSTRAINT windows_on_computer_pk PRIMARY KEY (version_of_OSwindows, age_of_computer);
ALTER TABLE windows_on_computer ADD CONSTRAINT windows_version_fk FOREIGN KEY (version_of_OSwindows) REFERENCES windows(version_of_windows);

GRANT CREATE ANY TABLE TO pits;
GRANT INSERT ANY TABLE TO pits;
GRANT SELECT ANY TABLE TO pits;
