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

CREATE TABLE orgcategories(
	orgcategoryid serial PRIMARY KEY,
	description text);
	
CREATE TABLE orgstatuses(
	orgstatusid serial PRIMARY KEY,
	description text);

CREATE TABLE organizations (
	organizationid serial PRIMARY KEY,
	loginaccountid integer REFERENCES loginaccounts,
	orgname varchar(128) NOT NULL);
	
CREATE TABLE orgprofiles (
	organizationid integer REFERENCES organizations,
	aysem smallint,
	orgstatusid integer REFERENCES orgstatuses,
	acronym varchar(32),
	orgdescription text,
	orgcategoryid integer REFERENCES orgcategories,
	mailaddr varchar(512),
	orgemail varchar(128),
	heademail varchar(128),
	establisheddate date,
	secincorporated boolean NOT NULL DEFAULT FALSE,
	incorporationdate date,
	interviewed boolean NOT NULL DEFAULT FALSE,
	approvedby integer REFERENCES linkaccounts(linkaccountid),
	approveddate timestamp,
	CONSTRAINT orgprofiles_pk PRIMARY KEY (organizationid, aysem));

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
	
CREATE TABLE variables(
	varname varchar(32),
	value text);
	
CREATE TABLE announcements(
	announcementid serial PRIMARY KEY,
	title text,
	loginaccountid integer REFERENCES loginaccounts,
	date_created timestamp without time zone,
	date_modified timestamp without time zone,
	content text);
	
CREATE TABLE studentpictures(
	studentpictureid serial PRIMARY KEY,
	studentid integer REFERENCES students,
	aysem smallint,
	filepath text,
	UNIQUE(studentid,aysem));
	
CREATE TABLE facultyprofile(
	facultyid integer REFERENCES faculty,
	firstname varchar(32),
	lastname varchar(32),
	department varchar(32),
	college varchar(32),
	faculty_position_and_rank varchar(64),
	mobile_number varchar(16),
	home_number varchar(16),
	office_number varchar(16),	
);

COPY groups (groupname) FROM stdin;
student
faculty
organization
osa
\.

COPY orgcategories (description) FROM stdin;
Academic
Alliance
Cause-Oriented
Community Service
Fraternity
Regional/Provincial
Religious
Sorority
Special Interest
Sports and Recreation
\.

COPY orgstatuses (description) FROM stdin;
Application Not Yet Submitted
Application Pending
Rejected
Renewed
\.

INSERT INTO variables (varname,value) VALUES ('current_aysem','20093');
INSERT INTO loginaccounts (groupid, username, password) VALUES ((SELECT groupid FROM groups WHERE groupname = 'osa'), 'osa', md5('password'));
INSERT INTO loginaccounts (groupid, username, password) VALUES ((SELECT groupid FROM groups WHERE groupname = 'organization'), 'org1', md5('password'));
INSERT INTO linkaccounts (groupid, hashcode) VALUES ((SELECT groupid FROM groups WHERE groupname = 'student'), 'student');
INSERT INTO linkaccounts (groupid, hashcode) VALUES ((SELECT groupid FROM groups WHERE groupname = 'faculty'), 'faculty');
INSERT INTO faculty (useraccountid, webmail, email) VALUES ((SELECT linkaccountid FROM linkaccounts WHERE hashcode = 'faculty'), 'faculty@up.edu.ph','faculty@up.edu.ph');
INSERT INTO students (useraccountid, webmail, email) VALUES ((SELECT linkaccountid FROM linkaccounts WHERE hashcode = 'student'), 'student@up.edu.ph','student@up.edu.ph');
INSERT INTO organizations (loginaccountid, orgname) VALUES ((SELECT loginaccountid FROM loginaccounts WHERE username = 'org1'),'organization 1');
INSERT INTO orgadvisers (organizationid, facultyid, aysem) VALUES ((SELECT organizationid FROM organizations WHERE orgname = 'organization 1'),(SELECT facultyid FROM faculty WHERE email = 'faculty@up.edu.ph'),to_number((SELECT value FROM variables WHERE varname = 'current_aysem'),'99999'));
INSERT INTO orgmemberships (organizationid, studentid, aysem) VALUES ((SELECT organizationid FROM organizations WHERE orgname = 'organization 1'),(SELECT studentid FROM students WHERE email = 'student@up.edu.ph'),to_number((SELECT value FROM variables WHERE varname = 'current_aysem'),'99999'));
INSERT INTO orgprofiles (organizationid, aysem, orgcategoryid, orgstatusid) VALUES ((SELECT organizationid FROM organizations WHERE orgname = 'organization 1'),to_number((SELECT value FROM variables WHERE varname = 'current_aysem'),'99999'),(SELECT orgcategoryid FROM orgcategories WHERE description='Fraternity'),(SELECT orgstatusid FROM orgstatuses WHERE description = 'Renewed'));
INSERT INTO announcements (title,loginaccountid,date_created,date_modified,content) VALUES ('Sample announcement1',(SELECT loginaccountid FROM loginaccounts WHERE username = 'osa'),now(),now(),'Sample announcement content1');
