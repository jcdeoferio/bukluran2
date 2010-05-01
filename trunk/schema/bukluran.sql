CREATE TABLE groups(
	groupid serial PRIMARY KEY,
	groupname varchar(16));
	
CREATE TABLE linkaccounts(
	linkaccountid serial PRIMARY KEY,
	groupid integer REFERENCES groups,
	hashcode char(128) UNIQUE NOT NULL);

CREATE TABLE loginaccounts(
	loginaccountid serial PRIMARY KEY,
	groupid integer REFERENCES groups,
	username varchar(32) UNIQUE NOT NULL,
	password char(32));

CREATE TABLE students(
	studentid serial PRIMARY KEY,
	useraccountid integer REFERENCES linkaccounts,
	webmail varchar(128),
	email varchar(128));

CREATE TABLE faculty(
	facultyid serial PRIMARY KEY,
	useraccountid integer REFERENCES linkaccounts,
	webmail varchar(128),
	email varchar(128));

CREATE TABLE orgnatures(
	orgnatureid serial PRIMARY KEY,
	description text);

CREATE TABLE orgcategories(
	orgcategoryid serial PRIMARY KEY,
	description text);
	
CREATE TABLE orgstatuses(
	orgstatusid serial PRIMARY KEY,
	description text);

CREATE TABLE organizations (
	organizationid serial PRIMARY KEY,
	orgname varchar(128) NOT NULL,
	acronym varchar(32),
	orgnatureid integer REFERENCES orgnatures NOT NULL,
	orgcategoryid integer REFERENCES orgcategories NOT NULL,
	orgstatusid integer REFERENCES orgstatuses NOT NULL,
	mailaddr varchar(512),
	orgemail varchar(128),
	heademail varchar(128),
	establisheddate date NOT NULL,
	secincorporated boolean NOT NULL DEFAULT FALSE,
	incorporationdate date,
	interviewed boolean NOT NULL DEFAULT FALSE,
	approvedby integer REFERENCES linkaccounts(linkaccountid),
	approveddate timestamp);

CREATE TABLE orgmemberships(
	organizationid integer REFERENCES organizations,
	studentid integer REFERENCES students,
	aysem smallint,
	confirmed boolean NOT NULL DEFAULT FALSE,
	CONSTRAINT orgmemberships_pk PRIMARY KEY (organizationid, studentid, aysem));

CREATE TABLE orgadvisers(
	organizationid integer REFERENCES organizations,
	facultyid integer REFERENCES faculty,
	aysem smallint,
	confirmed boolean NOT NULL DEFAULT FALSE,
	CONSTRAINT ogadvisers_pk PRIMARY KEY (organizationid, facultyid, aysem));

CREATE TABLE orgawards(
	orgawardid serial PRIMARY KEY,
	organizationid integer REFERENCES organizations,
	awardname varchar(128));

CREATE TABLE plannedevents(
	plannedeventid serial PRIMARY KEY,
	organizationid integer REFERENCES organizations,
	eventname varchar(128));

CREATE TABLE eventreports(
	eventreportid serial PRIMARY KEY,
	organizationid integer REFERENCES organizations,
	eventname varchar(128));

COPY groups (groupname) FROM stdin;
student
faculty
organization
osa
\.

INSERT INTO loginaccounts (groupid, username, password) VALUES ((SELECT groupid FROM groups WHERE groupname = 'osa'), 'osa', md5('password'));
