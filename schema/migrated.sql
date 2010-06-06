--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: announcements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE announcements (
    announcementid integer NOT NULL,
    title text,
    loginaccountid integer,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    content text
);


ALTER TABLE public.announcements OWNER TO postgres;

--
-- Name: announcements_announcementid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE announcements_announcementid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.announcements_announcementid_seq OWNER TO postgres;

--
-- Name: announcements_announcementid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE announcements_announcementid_seq OWNED BY announcements.announcementid;


--
-- Name: announcements_announcementid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('announcements_announcementid_seq', 1, false);


--
-- Name: appsems; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE appsems (
    appsemid smallint NOT NULL,
    insertedon timestamp without time zone DEFAULT now(),
    insertedby integer
);


ALTER TABLE public.appsems OWNER TO postgres;

--
-- Name: awardclassifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE awardclassifications (
    awardclassificationid integer NOT NULL,
    description text
);


ALTER TABLE public.awardclassifications OWNER TO postgres;

--
-- Name: awardclassifications_awardclassificationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE awardclassifications_awardclassificationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.awardclassifications_awardclassificationid_seq OWNER TO postgres;

--
-- Name: awardclassifications_awardclassificationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE awardclassifications_awardclassificationid_seq OWNED BY awardclassifications.awardclassificationid;


--
-- Name: awardclassifications_awardclassificationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('awardclassifications_awardclassificationid_seq', 4, true);


--
-- Name: email_queue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE email_queue (
    emailqueueid integer NOT NULL,
    emailtypeid integer NOT NULL,
    organizationid integer DEFAULT (-1),
    facultyid integer DEFAULT (-1),
    studentid integer DEFAULT (-1),
    announcementid integer DEFAULT (-1),
    orgclarificationid integer DEFAULT (-1),
    sent boolean DEFAULT false
);


ALTER TABLE public.email_queue OWNER TO postgres;

--
-- Name: email_queue_emailqueueid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_queue_emailqueueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.email_queue_emailqueueid_seq OWNER TO postgres;

--
-- Name: email_queue_emailqueueid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE email_queue_emailqueueid_seq OWNED BY email_queue.emailqueueid;


--
-- Name: email_queue_emailqueueid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('email_queue_emailqueueid_seq', 1, false);


--
-- Name: email_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE email_types (
    emailtypeid integer NOT NULL,
    description character varying(32)
);


ALTER TABLE public.email_types OWNER TO postgres;

--
-- Name: email_types_emailtypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_types_emailtypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.email_types_emailtypeid_seq OWNER TO postgres;

--
-- Name: email_types_emailtypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE email_types_emailtypeid_seq OWNED BY email_types.emailtypeid;


--
-- Name: email_types_emailtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('email_types_emailtypeid_seq', 4, true);


--
-- Name: eventcategories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE eventcategories (
    eventcategoryid integer NOT NULL,
    description text
);


ALTER TABLE public.eventcategories OWNER TO postgres;

--
-- Name: eventcategories_eventcategoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventcategories_eventcategoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.eventcategories_eventcategoryid_seq OWNER TO postgres;

--
-- Name: eventcategories_eventcategoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventcategories_eventcategoryid_seq OWNED BY eventcategories.eventcategoryid;


--
-- Name: eventcategories_eventcategoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventcategories_eventcategoryid_seq', 4, true);


--
-- Name: eventreports; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE eventreports (
    eventreportid integer NOT NULL,
    organizationid integer,
    appsemid integer NOT NULL,
    eventname character varying(128),
    eventcategoryid integer NOT NULL,
    description character varying(1024)
);


ALTER TABLE public.eventreports OWNER TO postgres;

--
-- Name: eventreports_eventreportid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE eventreports_eventreportid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.eventreports_eventreportid_seq OWNER TO postgres;

--
-- Name: eventreports_eventreportid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE eventreports_eventreportid_seq OWNED BY eventreports.eventreportid;


--
-- Name: eventreports_eventreportid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('eventreports_eventreportid_seq', 1, false);


--
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE faculty (
    facultyid integer NOT NULL,
    useraccountid integer,
    webmail character varying(128)
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- Name: faculty_facultyid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE faculty_facultyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.faculty_facultyid_seq OWNER TO postgres;

--
-- Name: faculty_facultyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE faculty_facultyid_seq OWNED BY faculty.facultyid;


--
-- Name: faculty_facultyid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('faculty_facultyid_seq', 1, false);


--
-- Name: facultyprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE facultyprofile (
    facultyprofileid integer NOT NULL,
    facultyid integer NOT NULL,
    firstname character varying(32),
    middlename character varying(32),
    lastname character varying(32),
    department character varying(32),
    college character varying(32),
    faculty_position_and_rank character varying(64),
    mobile_number character varying(16),
    home_number character varying(16),
    office_number character varying(16)
);


ALTER TABLE public.facultyprofile OWNER TO postgres;

--
-- Name: facultyprofile_facultyprofileid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE facultyprofile_facultyprofileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.facultyprofile_facultyprofileid_seq OWNER TO postgres;

--
-- Name: facultyprofile_facultyprofileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE facultyprofile_facultyprofileid_seq OWNED BY facultyprofile.facultyprofileid;


--
-- Name: facultyprofile_facultyprofileid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facultyprofile_facultyprofileid_seq', 1, false);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    groupid integer NOT NULL,
    groupname character varying(16)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_groupid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_groupid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.groups_groupid_seq OWNER TO postgres;

--
-- Name: groups_groupid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_groupid_seq OWNED BY groups.groupid;


--
-- Name: groups_groupid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_groupid_seq', 4, true);


--
-- Name: linkaccounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE linkaccounts (
    linkaccountid integer NOT NULL,
    groupid integer,
    hashcode character(128) NOT NULL
);


ALTER TABLE public.linkaccounts OWNER TO postgres;

--
-- Name: linkaccounts_linkaccountid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE linkaccounts_linkaccountid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.linkaccounts_linkaccountid_seq OWNER TO postgres;

--
-- Name: linkaccounts_linkaccountid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE linkaccounts_linkaccountid_seq OWNED BY linkaccounts.linkaccountid;


--
-- Name: linkaccounts_linkaccountid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('linkaccounts_linkaccountid_seq', 1, false);


--
-- Name: loginaccounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE loginaccounts (
    loginaccountid integer NOT NULL,
    groupid integer,
    username character varying(32) NOT NULL,
    password character(32)
);


ALTER TABLE public.loginaccounts OWNER TO postgres;

--
-- Name: loginaccounts_loginaccountid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE loginaccounts_loginaccountid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.loginaccounts_loginaccountid_seq OWNER TO postgres;

--
-- Name: loginaccounts_loginaccountid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE loginaccounts_loginaccountid_seq OWNED BY loginaccounts.loginaccountid;


--
-- Name: loginaccounts_loginaccountid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('loginaccounts_loginaccountid_seq', 322, true);


--
-- Name: orgadvisers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgadvisers (
    organizationid integer NOT NULL,
    email character varying(128),
    facultyid integer NOT NULL,
    appsemid smallint NOT NULL,
    confirmed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.orgadvisers OWNER TO postgres;

--
-- Name: organizations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE organizations (
    organizationid integer NOT NULL,
    loginaccountid integer,
    orgname character varying(128) NOT NULL
);


ALTER TABLE public.organizations OWNER TO postgres;

--
-- Name: organizations_organizationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE organizations_organizationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.organizations_organizationid_seq OWNER TO postgres;

--
-- Name: organizations_organizationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE organizations_organizationid_seq OWNED BY organizations.organizationid;


--
-- Name: organizations_organizationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('organizations_organizationid_seq', 321, true);


--
-- Name: orgawards; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgawards (
    orgawardid integer NOT NULL,
    organizationid integer NOT NULL,
    appsemid integer NOT NULL,
    awardname character varying(128) NOT NULL,
    filepath text,
    awardclassificationid integer DEFAULT 1 NOT NULL,
    description character varying(512),
    giver character varying(128)
);


ALTER TABLE public.orgawards OWNER TO postgres;

--
-- Name: orgawards_orgawardid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orgawards_orgawardid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orgawards_orgawardid_seq OWNER TO postgres;

--
-- Name: orgawards_orgawardid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orgawards_orgawardid_seq OWNED BY orgawards.orgawardid;


--
-- Name: orgawards_orgawardid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orgawards_orgawardid_seq', 1, false);


--
-- Name: orgcategories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgcategories (
    orgcategoryid integer NOT NULL,
    description text
);


ALTER TABLE public.orgcategories OWNER TO postgres;

--
-- Name: orgcategories_orgcategoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orgcategories_orgcategoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orgcategories_orgcategoryid_seq OWNER TO postgres;

--
-- Name: orgcategories_orgcategoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orgcategories_orgcategoryid_seq OWNED BY orgcategories.orgcategoryid;


--
-- Name: orgcategories_orgcategoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orgcategories_orgcategoryid_seq', 10, true);


--
-- Name: orgclarifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgclarifications (
    orgclarificationid integer NOT NULL,
    appsemid integer,
    organizationid integer,
    date_created timestamp without time zone DEFAULT now(),
    description text
);


ALTER TABLE public.orgclarifications OWNER TO postgres;

--
-- Name: orgclarifications_orgclarificationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orgclarifications_orgclarificationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orgclarifications_orgclarificationid_seq OWNER TO postgres;

--
-- Name: orgclarifications_orgclarificationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orgclarifications_orgclarificationid_seq OWNED BY orgclarifications.orgclarificationid;


--
-- Name: orgclarifications_orgclarificationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orgclarifications_orgclarificationid_seq', 1, false);


--
-- Name: orgcollections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgcollections (
    orgcollectionid integer NOT NULL,
    appsemid integer,
    organizationid integer,
    amount numeric(10,2),
    description character varying(128)
);


ALTER TABLE public.orgcollections OWNER TO postgres;

--
-- Name: orgcollections_orgcollectionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orgcollections_orgcollectionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orgcollections_orgcollectionid_seq OWNER TO postgres;

--
-- Name: orgcollections_orgcollectionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orgcollections_orgcollectionid_seq OWNED BY orgcollections.orgcollectionid;


--
-- Name: orgcollections_orgcollectionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orgcollections_orgcollectionid_seq', 1, false);


--
-- Name: orgdisbursements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgdisbursements (
    orgdisbursementid integer NOT NULL,
    appsemid integer,
    organizationid integer,
    amount numeric(10,2),
    description character varying(128)
);


ALTER TABLE public.orgdisbursements OWNER TO postgres;

--
-- Name: orgdisbursements_orgdisbursementid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orgdisbursements_orgdisbursementid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orgdisbursements_orgdisbursementid_seq OWNER TO postgres;

--
-- Name: orgdisbursements_orgdisbursementid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orgdisbursements_orgdisbursementid_seq OWNED BY orgdisbursements.orgdisbursementid;


--
-- Name: orgdisbursements_orgdisbursementid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orgdisbursements_orgdisbursementid_seq', 1, false);


--
-- Name: orgmemberships; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgmemberships (
    organizationid integer NOT NULL,
    studentid integer NOT NULL,
    appsemid smallint NOT NULL,
    email character varying(128),
    "position" character varying(128),
    confirmed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.orgmemberships OWNER TO postgres;

--
-- Name: orgprofiles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgprofiles (
    organizationid integer NOT NULL,
    appsemid integer NOT NULL,
    orgstatusid integer DEFAULT 1 NOT NULL,
    acronym character varying(32),
    orgdescription text,
    orgcategoryid integer DEFAULT 1 NOT NULL,
    mailaddr character varying(512),
    orgemail character varying(128),
    heademail character varying(128),
    establisheddate date,
    secincorporated boolean DEFAULT false NOT NULL,
    incorporationdate date,
    interviewed boolean DEFAULT false NOT NULL,
    approvedby integer,
    approveddate timestamp without time zone,
    startingbalance numeric(10,2),
    acknowledged boolean DEFAULT false NOT NULL
);


ALTER TABLE public.orgprofiles OWNER TO postgres;

--
-- Name: orgstatuses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgstatuses (
    orgstatusid integer NOT NULL,
    description text
);


ALTER TABLE public.orgstatuses OWNER TO postgres;

--
-- Name: orgstatuses_orgstatusid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orgstatuses_orgstatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orgstatuses_orgstatusid_seq OWNER TO postgres;

--
-- Name: orgstatuses_orgstatusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orgstatuses_orgstatusid_seq OWNED BY orgstatuses.orgstatusid;


--
-- Name: orgstatuses_orgstatusid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orgstatuses_orgstatusid_seq', 4, true);


--
-- Name: orgsubmittedrequirements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgsubmittedrequirements (
    organizationid integer NOT NULL,
    requirementid integer NOT NULL,
    submittedon date DEFAULT now() NOT NULL,
    comments character varying(1024),
    insertedon timestamp without time zone DEFAULT now(),
    insertedby integer,
    updatedon timestamp without time zone DEFAULT now(),
    updatedby integer
);


ALTER TABLE public.orgsubmittedrequirements OWNER TO postgres;

--
-- Name: plannedevents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plannedevents (
    plannedeventid integer NOT NULL,
    organizationid integer,
    appsemid integer NOT NULL,
    eventname character varying(128),
    eventcategoryid integer NOT NULL,
    description character varying(1024)
);


ALTER TABLE public.plannedevents OWNER TO postgres;

--
-- Name: plannedevents_plannedeventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plannedevents_plannedeventid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.plannedevents_plannedeventid_seq OWNER TO postgres;

--
-- Name: plannedevents_plannedeventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plannedevents_plannedeventid_seq OWNED BY plannedevents.plannedeventid;


--
-- Name: plannedevents_plannedeventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plannedevents_plannedeventid_seq', 1, false);


--
-- Name: requirements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requirements (
    requirementid integer NOT NULL,
    appsemid smallint NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(1024),
    insertedon timestamp without time zone DEFAULT now(),
    insertedby integer,
    updatedon timestamp without time zone DEFAULT now(),
    updatedby integer
);


ALTER TABLE public.requirements OWNER TO postgres;

--
-- Name: requirements_requirementid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requirements_requirementid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.requirements_requirementid_seq OWNER TO postgres;

--
-- Name: requirements_requirementid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requirements_requirementid_seq OWNED BY requirements.requirementid;


--
-- Name: requirements_requirementid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requirements_requirementid_seq', 1, false);


--
-- Name: studentpictures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE studentpictures (
    studentpictureid integer NOT NULL,
    studentid integer,
    appsemid smallint,
    filepath text
);


ALTER TABLE public.studentpictures OWNER TO postgres;

--
-- Name: studentpictures_studentpictureid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE studentpictures_studentpictureid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.studentpictures_studentpictureid_seq OWNER TO postgres;

--
-- Name: studentpictures_studentpictureid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE studentpictures_studentpictureid_seq OWNED BY studentpictures.studentpictureid;


--
-- Name: studentpictures_studentpictureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('studentpictures_studentpictureid_seq', 1, false);


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE students (
    studentid integer NOT NULL,
    useraccountid integer,
    webmail character varying(128)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_studentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE students_studentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.students_studentid_seq OWNER TO postgres;

--
-- Name: students_studentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE students_studentid_seq OWNED BY students.studentid;


--
-- Name: students_studentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('students_studentid_seq', 1, false);


--
-- Name: variables; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE variables (
    varname character varying(32),
    value text
);


ALTER TABLE public.variables OWNER TO postgres;

--
-- Name: announcementid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE announcements ALTER COLUMN announcementid SET DEFAULT nextval('announcements_announcementid_seq'::regclass);


--
-- Name: awardclassificationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE awardclassifications ALTER COLUMN awardclassificationid SET DEFAULT nextval('awardclassifications_awardclassificationid_seq'::regclass);


--
-- Name: emailqueueid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE email_queue ALTER COLUMN emailqueueid SET DEFAULT nextval('email_queue_emailqueueid_seq'::regclass);


--
-- Name: emailtypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE email_types ALTER COLUMN emailtypeid SET DEFAULT nextval('email_types_emailtypeid_seq'::regclass);


--
-- Name: eventcategoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE eventcategories ALTER COLUMN eventcategoryid SET DEFAULT nextval('eventcategories_eventcategoryid_seq'::regclass);


--
-- Name: eventreportid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE eventreports ALTER COLUMN eventreportid SET DEFAULT nextval('eventreports_eventreportid_seq'::regclass);


--
-- Name: facultyid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE faculty ALTER COLUMN facultyid SET DEFAULT nextval('faculty_facultyid_seq'::regclass);


--
-- Name: facultyprofileid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE facultyprofile ALTER COLUMN facultyprofileid SET DEFAULT nextval('facultyprofile_facultyprofileid_seq'::regclass);


--
-- Name: groupid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE groups ALTER COLUMN groupid SET DEFAULT nextval('groups_groupid_seq'::regclass);


--
-- Name: linkaccountid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE linkaccounts ALTER COLUMN linkaccountid SET DEFAULT nextval('linkaccounts_linkaccountid_seq'::regclass);


--
-- Name: loginaccountid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE loginaccounts ALTER COLUMN loginaccountid SET DEFAULT nextval('loginaccounts_loginaccountid_seq'::regclass);


--
-- Name: organizationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE organizations ALTER COLUMN organizationid SET DEFAULT nextval('organizations_organizationid_seq'::regclass);


--
-- Name: orgawardid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE orgawards ALTER COLUMN orgawardid SET DEFAULT nextval('orgawards_orgawardid_seq'::regclass);


--
-- Name: orgcategoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE orgcategories ALTER COLUMN orgcategoryid SET DEFAULT nextval('orgcategories_orgcategoryid_seq'::regclass);


--
-- Name: orgclarificationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE orgclarifications ALTER COLUMN orgclarificationid SET DEFAULT nextval('orgclarifications_orgclarificationid_seq'::regclass);


--
-- Name: orgcollectionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE orgcollections ALTER COLUMN orgcollectionid SET DEFAULT nextval('orgcollections_orgcollectionid_seq'::regclass);


--
-- Name: orgdisbursementid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE orgdisbursements ALTER COLUMN orgdisbursementid SET DEFAULT nextval('orgdisbursements_orgdisbursementid_seq'::regclass);


--
-- Name: orgstatusid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE orgstatuses ALTER COLUMN orgstatusid SET DEFAULT nextval('orgstatuses_orgstatusid_seq'::regclass);


--
-- Name: plannedeventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE plannedevents ALTER COLUMN plannedeventid SET DEFAULT nextval('plannedevents_plannedeventid_seq'::regclass);


--
-- Name: requirementid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE requirements ALTER COLUMN requirementid SET DEFAULT nextval('requirements_requirementid_seq'::regclass);


--
-- Name: studentpictureid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE studentpictures ALTER COLUMN studentpictureid SET DEFAULT nextval('studentpictures_studentpictureid_seq'::regclass);


--
-- Name: studentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE students ALTER COLUMN studentid SET DEFAULT nextval('students_studentid_seq'::regclass);


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY announcements (announcementid, title, loginaccountid, date_created, date_modified, content) FROM stdin;
\.


--
-- Data for Name: appsems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY appsems (appsemid, insertedon, insertedby) FROM stdin;
20101	2010-06-06 23:18:18.496238	\N
20091	2010-06-06 23:36:21.071599	\N
\.


--
-- Data for Name: awardclassifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY awardclassifications (awardclassificationid, description) FROM stdin;
1	University
2	Local
3	National
4	International
\.


--
-- Data for Name: email_queue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY email_queue (emailqueueid, emailtypeid, organizationid, facultyid, studentid, announcementid, orgclarificationid, sent) FROM stdin;
\.


--
-- Data for Name: email_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY email_types (emailtypeid, description) FROM stdin;
1	member confirmation
2	faculty confirmation
3	osa to organization
4	announcement
\.


--
-- Data for Name: eventcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventcategories (eventcategoryid, description) FROM stdin;
1	Academic Activities
2	Advocacy and Extension Service
3	Organization - Capacity Building Activities
4	UP Community Service
\.


--
-- Data for Name: eventreports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY eventreports (eventreportid, organizationid, appsemid, eventname, eventcategoryid, description) FROM stdin;
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY faculty (facultyid, useraccountid, webmail) FROM stdin;
\.


--
-- Data for Name: facultyprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facultyprofile (facultyprofileid, facultyid, firstname, middlename, lastname, department, college, faculty_position_and_rank, mobile_number, home_number, office_number) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (groupid, groupname) FROM stdin;
1	student
2	faculty
3	organization
4	osa
\.


--
-- Data for Name: linkaccounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY linkaccounts (linkaccountid, groupid, hashcode) FROM stdin;
\.


--
-- Data for Name: loginaccounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY loginaccounts (loginaccountid, groupid, username, password) FROM stdin;
1	4	osa	d26a2084a380e74dd32db06c1fe8ac76
2	3	alchemes	9df0becf5946604c200bafae8dd55a27
3	3	adelfe	4f66d076b7e2b47cc3e57e65a6c38a2f
4	3	upamicus	015ae4dc17297e6f5368cdc90a9bb511
5	3	advertc	2b1dc6a16c787381082d11350e2660e4
6	3	aggregates	6752b06482ca9464736121c546b6a8d8
7	3	agham	4189400d73dfd769ffac01c33d0ced89
8	3	aguman	bc5c2dde699cb0df7e40c929715caa52
9	3	aiesec	5aecc6e27e4ea20d2555664b8388d4b9
10	3	akbayan	85e3e7b3620e518aa1c215836e6498e0
11	3	uparise	affbafb864b4bed64549af21b593e4c4
12	3	aoisa	adb9dcc0e803a7743aa93e9f238d1265
13	3	apoicsf	cd3a0616414caa5b7744a637a031d877
14	3	apoicss	0fafe0242e13e2ad17e1e653ed89b0dc
15	3	alsigma	2dce4931e28b80c49b43d46a39821485
16	3	alyansa	b03e50915ca49e172768ebc9fe305d41
17	3	angkan	1f4d0372226f25946bbd4d631939f716
18	3	anido	4232778dd4aae93d9800f555e1aba6bc
19	3	upame	3185391003689175871a673b23231281
20	3	anacagayan	d3bfde49356288ab7a1b8b2954973614
21	3	arirang	e7895b8e6c5e22596d658c403e0ca954
22	3	artistscf	1ab0fc709d05f5a21160e8eb4b72aa43
23	3	artistscs	1ab0fc709d05f5a21160e8eb4b72aa43
24	3	asterisk	22b5f2eb6c37028d6940988bd0a75676
25	3	upamp	03ae0732a89eb777b5e68daab50417f3
26	3	upacm	abe931760a51f0800b550208324e6903
27	3	abm	7170cbb3675d2d6934b9092baa7646f0
28	3	abam	e820b13e79c7070db7110ed3b37ca461
29	3	aces	9d9c05b1500a4f3542bb15b657d665fe
30	3	upcursor	9cf4ded18f87c8e1220dcf136a83c652
31	3	asas	ddaafa5d551a582bc924d09cc8d33ee5
32	3	ascent	b4bf389b279801d307171ed2575cb4c6
33	3	avcom	af784f23c04ddc4f28f338bf57a39063
34	3	astrosoc	a2ba5053dde35b87a3d8c1b37c1c1359
35	3	athlaction	3894c7e8bc3173b30a1d0ccd17936b01
36	3	babaylan	c164b42aeb636d107a5907247913c439
37	3	balanghai	dd73d61aef12995b21324d67a3cdd522
38	3	bannuar	34d88e7e60d41e65d2f58dc6adbff969
39	3	batangan	7edf860cba559826acf039e0c98095e9
40	3	betasigma	f5b5b2b36bc6ffd9d6758121304f050c
41	3	betasigmalc	f5b5b2b36bc6ffd9d6758121304f050c
42	3	upbread	17c6e8d77c7d6fd1d0cd4b819f2e5e67
43	3	broadcast	4801bfea3592e6f7813304272a9090c2
44	3	brofil	ac2e8a3436e7203a5dedbf09643b838b
45	3	buklodisip	006508d3deb84eff2fa60faceca467e0
46	3	busanalysts	fa903edb1848a21648ef0662a1bb8f63
47	3	cvsf	10914f4c44b73acdfdc121fc636e7980
48	3	ccfc	e51798a5c7df8550469b53d5430492a2
49	3	cap	6153c9df8050c7e6b6c867e13104c89d
50	3	catandungan	a41621ddaaf659894ef09e322d94b38a
51	3	cfns	adb3c01a502f5b61d7366fbcd2ae3c11
52	3	upkem	0d7983ae1704b97dbfa22bc1b207ae84
53	3	chemsociety	608e92d9e81dca65eca874d579a8ae61
54	3	cradle	755841c23dc6cead34dd8a1359e0d43a
55	3	upcsa	3318f3b04bd476956144a911cbd94174
56	3	upcoc	110d46fcd978c24f306cd7fa23464d73
57	3	christyouth	69660bade42bc3740df65d342175b448
58	3	christbro	a81d199927006a4a3217ce5aea3bc21a
59	3	chrislife	e6602949dddebc07ad205dc8778c6fb2
60	3	christyouth2	5696458d548192b56aaafd59e6c8b7ae
61	3	cineastes	db203823c0811a3fddab48972dcc3f10
62	3	cinema	7a034a07594d6f9e35e011ebebd05604
63	3	cinema2	c53b13fce4adebabd7f5ab8bd26434f0
64	3	cinema3	e45d841ade7dbcabf733d27f7191f00e
65	3	circa	f786890c39fd56d959572bfe26aa57db
66	3	upcrest	042142cf0ce89dd4119451dbb3e83ec0
67	3	entrepreneurs	c478cfc116ceb8440e6b3f4c26d5fd1c
68	3	upciem	69cb818f461db4d103bd2c5309db4564
69	3	core	7be26ae6f98f807634e112be4a861208
70	3	circuit	1df65b5a378a12153c7763afc26a34b2
71	3	ecotour	d8da34a446b4ae7b849b1bfa1e863b08
72	3	broadass	b9b2d8775f9bf443c4cf453afd3b67e6
73	3	researchsoc	1af1b1bc94252aff14f6e6c460b6a450
74	3	upcgg	231167ab4cb869b1571d621cd934ac99
75	3	upcreed	b58f7e1d06815d217e9a69739d09074c
76	3	dancesp	19b71eec42e2d8e3c10b8302c98f1ef5
77	3	dansa	ceae27de3c858a412e7f90b4a602d6fc
78	3	debatesoc	31f6064b8785134e21882de6ae4aac92
79	3	dlssor	2b0c484bc5cdd1edeb3696164b4c563b
80	3	dposor	1aec9d635b6d8eb9df462a9abb88be19
81	3	updcf	f3fce594037829356831a98493828559
82	3	dostsa	fec54dcbc81befa35cd203f9fa42d91b
83	3	dragonboat	156ec98d331af171b2dd81f0fb9c4003
84	3	dzuprc	719ca3a932ff0542ed23e5d063304226
85	3	economicssoc	34695533685aaef02a9bbabf0fbad590
86	3	economicstc	2a28941e264e92e9d311956aa1cbdbd0
87	3	educs	38416270e4d51585f14a940d89e7d073
88	3	educc	0a55ef9c5e9bc6b784f5348939990420
89	3	uperg	dc88fe3647feeef4e8f9c487c9032c4a
90	3	enggsoc	744c9eda95866776bacae38d48b846b2
91	3	emc2	aa8f82055a2ceba35bb799bb9bf49340
92	3	epchi	0c0399073026732b30f3d0c8a8912689
93	3	eurofil	4c3319a7a8fbc862cd209e9ac34d722d
94	3	upencm	b005a1a9cd5aa5f85137955727bd7b83
95	3	exlibris	a0bd9a5bca54457af68cfabe9865bf2a
96	3	fldc	28c08e83a9702c9dc0e04c837e0faca4
97	3	fencing	c2901eca717f74798b5daa14a652158d
98	3	force	33e15126959608c67894f22f09e6d915
99	3	futbolsikad	f3891360abddd14383bf8cc19446b553
100	3	flipp	b4dc40fcd7783adcabe32184d63bab6f
101	3	gabriela	c1eb2625e12f41255ba74e7fa2914da4
102	3	gkalinga	0053055ed928657ac26ae6a931b71d06
103	3	gearspinions	43cde7631e4e05876a4c9df1ed357959
104	3	geodengg	81d133740421735b2b8a2240b812235c
105	3	geolsoc	34b9ce2ab700a04eae418c65bafb428d
106	3	kalinga	8ace98f809670092e3cd93a9c7c41104
107	3	greenl	6c93405be32198bb7143a6c8fe7d2afb
108	3	greenm	a1f321a9641e816649f37534191477df
109	3	guscsa	9f06b85771589f70452bf99618c078db
110	3	guilderins	0e8398ce0609ecc666eccf6370c0f44d
111	3	haringibon	9f2592f32f2ac1ea74076003c02a61cf
112	3	harong	9291c14f4eac27d13d5963467a96b656
113	3	hiligaynon	31fcf8f1d6d472c79205cbb245794ea6
114	3	hobbygamers	6457f881349fbdf2bc26315fb156e03f
115	3	uphima	ce2f627e1ab3a9f63985dcdecc0e7519
116	3	ibalon	38a818c5a1e1dd2670dd3807561f4e48
117	3	upictus	4f01a60fea1f9804b17abf081f13a8b1
118	3	upisa	f3aef70b5360ebc2ab6396c417ee32b5
119	3	idea	e216bb08cfec0ceb666ae226ccf81d2e
120	3	indengg	518ecd9ed139b9d7939660ccde949396
121	3	iecep	eecc50592c414038d64b16d048fd1e3e
122	3	iiee	774ba692093f0a602e98656cd9d1da79
123	3	intlclub	8c6ac9887f33b5f79188a4eae7fb2803
124	3	intbusassoc	a57e28b4704063b7de77b2818ba3b371
125	3	iris	3ceb1ef2523a2cab605f57b4ab794925
126	3	isodabaw	f724ae58275e447ccdeb8044061fd37c
127	3	jambangan	df4e558c916f0e52f2e6e8e09ed70de9
128	3	jodera	eb8ab8cca82ef69cb775704fa570c099
129	3	journalism	1bb488d74171ca69e7bf57ab214611d9
130	3	judoclub	40dcea6227954a2c27633ad67dc2bf90
131	3	juniorfin	98bc46fc9620269cada7bc245e039ed3
132	3	juniormar	089a4abc656e234e61d6512fea9548db
133	3	juniormus	4d47205c4e68bb74988e5fd47f914fcf
134	3	jpia	0aecc7a2d7284b62f4e58870f3ce52ca
135	3	kaamulan	e5d073cddfa1a4e7f3b8e1d660cff0d7
136	3	upkkk	e83a08a7ea63591cc4c8c4439edebd44
137	3	kalinangan	190e633df45893e410352be32ae2d2db
138	3	kadbolanon	ff47896e5ff5887228f7cc83563d256d
139	3	kagayhaan	7e0df6a3e9d2c5df09624617c3a1ef4d
140	3	kaisa	b855ce1a3bb7867d483f3adc8ab6f037
141	3	kalilayan	e25d41cc16c406566aad57bde5a837d3
142	3	kaisa2	a0e342a24e5e855eb4322777a0284f53
143	3	upkapp	f58268680ad1932538f261fb7ad1ce22
144	3	kamangyan	8b85c0685af583393292dd1f2eb4c9bb
145	3	kamayo	1a56229d11cfefce1095362460e5b733
146	3	kasimanwa	44845c68576ac31ff075f75b146b9a16
147	3	kasaysayan	5347b249d98e934bf86cbe6395fb988b
148	3	koreanstud	af8cb6ea4390530fff89c85bd73f18fd
149	3	krishnamurti	a5a64f9c276a5e6deebc99ca7ea3f548
150	3	kkb	792db841066a18e33fea7ec6f222e273
151	3	kustura	3ac0a22dcc89a07d03e6a1646a67a6a7
152	3	lagunense	97f0d06db5213645b252df8748619464
153	3	lakan	2d2c95de1d81e89c7b1c8244a6419e11
154	3	lakaykalikasan	d8d76ae27dc466c86a214e4d74d2ba8b
155	3	laonglaan	150fb021c56c33f82eef99253eb36ee1
156	3	upldssa	8f5baba0edb835453cdc8e27b27b33f7
157	3	lawod	f3bc3801626c0f9daba40ed7faaf85a3
158	3	layafootball	142360c2106f7bbbf051037ca41f0e91
159	3	lcfrancais	7122672a4471e53de7ac3119a2a8271d
160	3	lead	3fc4c802dd0f2f967e8e9b4deaa302fe
161	3	lfs	2b07d2a16931946de5de3709c7324bb7
162	3	lissa	1025e57ff73e23eb2614921a93d7c967
163	3	lingfranca	9e5a0d84519bb4fbb00a45efa14133e3
164	3	unplug	2b805051bff0a60e12f57c8b6f1cdf12
165	3	likas	1ffaf7de4da2600992ed5d9713b28eeb
166	3	limeproject	bbae8cce96793821ed5a684e8f90ac13
167	3	markaradjaw	add341438562b367d4744079cec0cd5b
168	3	marinebio	7306b0a84ab4e550672e9c4bef9eb6ee
169	3	masscomorg	239f35908158ab55a8f40b009fd7a6b8
170	3	matsci	2c84dbf84c92fdfdd11ed7b5d9cd5162
171	3	mathclub	8d35da4ad9eb73de2521e1a21b68037f
172	3	mathmajors	1f7c6592fdbe8912f3fc72df0668af49
173	3	methodist	30a88d46d9b69483f252c492cb58d4c1
174	3	miners	9c505c4cac90dcdb00c390ff1c6d010f
175	3	49ers	cd45ab974e03cf56cf98f5af188e14dd
176	3	mma	63f4f1e9b725370f459720575cd5f953
177	3	mbbs	bc21640f77c7b7897e0bb8785545cd0e
178	3	moriones	188532d3e0a4701a0d19bf8b7ab71ee9
179	3	mountaineers	10523808e121020cae0938b4c49a6dab
180	3	musiccir	51434272ddcb40e9ca2e2a3ae6231fa9
181	3	muslimsa	a385bc3d9787c494aab2477495742003
182	3	namnama	726426f464451279bc905368f4b9be28
183	3	navigators	6a7a13470cc68bd501d97e82e4ef08ce
184	3	nnarayouth	9dbbbd265137f9193443ce579c3d0322
185	3	obem	f31fc63e837d9ba8f2f5b3fa3e685948
186	3	one	e9b74766edff1096ba7c67999ca259b6
187	3	ose	5fb49aadf3be8e5f079ec784a274591d
188	3	uporg	e89aa13d727049e2fc7d382ed3dd13be
189	3	overcomers	2990277b41abe7a086f1362dd27558ca
190	3	pagdumala	aef506511c44b3e760fe23586f2b6603
191	3	palawenos	086ff137f78b3660079e101db54faae2
192	3	pxipftf	6c59293bb4aa5ca757cdab8d3de1ec1d
193	3	paralegal	2baee8405f969b9ce1f88a03ebb24cb2
194	3	pdas	2bba273bdf99d266cd5dbe292b469ef1
195	3	pcts	a8d37ee6d3b17fde722c3868500c1723
196	3	paft	002eacd5f7ae501fcddf060d03e8a9bc
197	3	panac	3f4c3a662c76b0bec36882b230018e9b
198	3	psme	837ffc055240ed6586b6798d1fa9d77a
199	3	uppsysc	83eec9cabfc43b26d86beb1277e2c470
200	3	upoptics	0840a9b9667dc3a98d44bcee6a03b314
201	3	physicsassoc	713e48dc6ad47260c1c8fb02fa3d3287
202	3	piomicron	723379e7a8228a5aa31e9ccc3693daf4
203	3	psd	9cbb6a387868db421cb3a2ac97ce576d
204	3	pisigma	2654075996e5923ad6580d1efcae198a
205	3	portia	9b063cd1ce2a9ea0ace1e071e72ffe10
206	3	pradsoc	e8e8d3c3bfea3d6a216cb539906b8192
207	3	premedhs	cc94e621e1fbd2f11eaf67bd358a74ba
208	3	premedsoc	4f088d416a123f86250f07e83c319334
209	3	prep	84743f1db152bf5501fcc3e186fccdef
210	3	prime	51edacfa297cb306a276c85f0c7eb39b
211	3	psyca	8401c7a11f94b8424e96a6de38668962
212	3	psychosoc	8570e78845a4513553bf3a6980cdeaaf
213	3	redcross	8bf38eb96df890322404972948632132
214	3	uprep	9586f0b23874553e0008f2d20a1de852
215	3	rescue	64104121650f79b878cb8ba1e7c6f149
216	3	riflept	e3070c927b172a48ea00d8ee4ea50545
217	3	runfchange	9293937ea8b17cb901d7a9d8664c06c5
218	3	samaskom	4f2981fd7c64bef5f6c5c443f11b0b36
219	3	stpa	85c7543ab7fd896dcc8610f08e88c7a2
220	3	sandigan	88f972c7f232c6b60c21c10cc02a696a
221	3	sandiwa	65f37f43ac75ceb3b0409112573a7ca7
222	3	sanlahi	89dae41c0d705ceb55aa778e27033d7b
223	3	sanlakas	5d608d7d677cdc40fe016ba28c9d814f
224	3	saro	c4988dbf8716d62d17180dd114f15c71
225	3	smmart	2fa6d78ed0195eaf069f7cbd498af63f
226	3	scintij	ca7251c8a55134acdc423664d06fb9c0
227	3	seedsnat	110d46fcd978c24f306cd7fa23464d73
228	3	sidlangan	ae362833722cf4e8a008fceb0e5e37e0
229	3	sansor	c57c58880963453d793be52ab13ae1ed
230	3	sarsor	696a637b73f13f4641114cc5e2ff0ba7
231	3	sbsor	ee181712431b2b92e3e8d4abc6cbbbee
232	3	sdphi	db45c6f65bff4f925b7a326fc8e8cdd7
233	3	sdpi	791f47d4a951fb7f1ff79889fd67d057
234	3	skpi	9c75a0becd140bdf9707a6c241d2da26
235	3	srho	3372c9008c05e1465bc8df8132e1dbcb
236	3	silaksilab	81026f91be0b5f985709163ac2bb4d0e
237	3	sillag	14ebb2cda4b9d3e3f65d3607af568d04
238	3	sinagbayan	aebc8f755f9b4c536d29f82010570e3a
239	3	sharp	2854f14d0aebc2103d6350b42186e046
240	3	spies	023779c5653cffb9e4222b91e8d9a9b7
241	3	upsemen	411491fd9fe39b784fd2e6267d4fc142
242	3	geop	93f3a5d3bd73e343e0adf5301c4afcd6
243	3	manengs	43f2cf66fe1b5ae5da9754ad04aae4fc
244	3	socsksargen	141c04ad944fffd9a314ad2b0cbb8340
245	3	satsci	3a389752a0fa3a6c35ff112aca023c58
246	3	sorsoguenos	6228bd57c9a858eb305e0fd0694890f7
247	3	speecoun	541574cf5c94673681265011a3a1ea47
248	3	speca	ffe0aa6871d5d0159815f0390f0fc4c7
249	3	soam	a6c856ad2c7e061052b007558997b62c
250	3	stvcf	17d720b0966d5603c62faa160261b1a2
251	3	statsoc	d26bd80a271fedb2913702cc4105882c
252	3	stratsmart	739a51947b85238451f048b147af9c03
253	3	strdance	acbde574cbd6f06fd06009341f1742f7
254	3	standup	54529607fa8aff7dd9e4ce082c4caaee
255	3	upsaver	6ee4733b4f9b004fac9f04a9dd3d842d
256	3	upsca	50d137096c14069f6d39377be034f0bb
257	3	studdest	b6b08d6bcc8412aab95f5513e738182e
258	3	seals	7ceb3776c2be91632834af018907238c
259	3	subaquatica	82ad6a14478319802a0e5c7b715cc254
260	3	subolsoc	bc91f4a1702c3c287a73cdd712f0cf91
261	3	tangway	3e399e5d31644d72cb5d57cba466e192
262	3	tgpc	7ad8628761318447c343f71f96a68ead
263	3	trxi	68bae3675929ab7111447f75b15518c7
264	3	tenup	2464815dfc3185fd2ad495969b4c582d
265	3	theatcoun	5b1127bd84c340ea7a73ff9bb1840ac2
266	3	thetaep	424f10ebb2ad9c221e607d0421cab513
267	3	tomokai	5bc08a5fc6d836cba8e46b9ab8c2e768
268	3	trclub	c2f726291bbb732e45b8e7fed3ff4e98
269	3	tomasoc	6a2c7c01b883188d644af2e8805b2552
270	3	umusiccom	71fd3d5d7ab4a9766def1475d2a96913
271	3	unesco	5b407d6357aca6aaf3e945e2e8c2f981
272	3	uproject	c55b41d0be39bef1868f9624b6397e81
273	3	usphi	e56b6520d7467f5ccb46d6939eb5532e
274	3	variates	1a23ac33af487d77fb89e7135143ee83
275	3	vocensem	7d34f7762c4c74cfb0dbaf27a18a629b
276	3	volclub	6a14fb845480c197c10aeda55c525a22
277	3	womilaw	2925f1abe7f851a445f805600c11076b
278	3	bolera	3b02eca8fca6e7eb0ecce8fb235185bc
279	3	writersc	7db8f026af6a1ee3ca8d6d5fde99ae1e
280	3	yfchrist	6e6033b8aede2f45b56c8a13ec7227d7
281	3	zoosoc	d8c42b4396bd63cd7483cb9ed169e639
282	3	quiwarriors	c44a471bd78cc6c2fea32b9fe028d30a
283	3	klubtala	0e6b2d8f5ead8ad6a0d56b2ee0b77a8e
284	3	una	c73db213db5d8f2f6d2a5e2333639c32
285	3	upshift	baf6f6bf0ca47d402cbc26d6cc92c067
286	3	tiklado	7bfac6d11096be767d1ac95c877e05e0
287	3	upnupl	a6a9b37f977b871dd44054678649485e
288	3	upsigaw	4bdec768f727fb72f1445f6bccbbdaba
289	3	upduo	973a7698691179233e7385f2c5ae5d22
290	3	upas	5afd7d0c2e3976c997afd1f2108f5ccb
291	3	upidea	baa9ade93e38e4fe34df72cf56f3a761
292	3	lens	11b95dd1a40973077df8cf9621b612de
293	3	cdcircle	70d033f481437d59f3d2c03102a328af
294	3	uplente	9a22d4c33086546acde0f7460e915fb7
295	3	uphero	ed54a5fff1d483f30ecd4f2fba33357b
296	3	volunteers	8814488f5458676b78b42ff24f2b2e1d
297	3	sample	4851783129f3ed4e392aef1804b1409c
298	3	bibliotech	851dc3990140c02345fecab4ee1a25d9
299	3	upgolf	b6d02b54f2a1c5de37dd6319e46117dc
300	3	scrabble	4ea65b835a88b1c9a483e6b38eaf3615
301	3	alphaphibeta	337cb882fd71a8487fab54f02035f683
302	3	alphaphibetafrat	337cb882fd71a8487fab54f02035f683
303	3	powerlifting	330d0c7bcc4525906c3270f5297a614a
304	3	acts	ce81c61e53db9cbaf7cc3ceee60dcfea
305	3	jzone	600f37236b99fd201ba57d72ea70c692
306	3	lambak	d8b92d0eea299ae2765d9bb35dd7b07d
307	3	mayon	b03c93b270a138dcd58b4dd5065c8a31
308	3	travel	cd01c840c861d808171505b42cfbaa32
309	3	sample2	a1d13efa928a2a3de4f38bbbf9f608b1
310	3	jesuslovesyou	649bce995dda11373587b57616668cc5
311	3	upjzone	47d5ed7ae0972effceccd8f9bd22cbb5
312	3	peasantadvocates	70383e2092ad0c10d17bde38e6542dde
313	3	uptravel	6fa16ef1cbb4ccbe1f9dfce6e1462429
314	3	trial1	237103b50b9aa3496711e628fa073d6f
315	3	upak	3949e247375c9e0fe9cead3f0c005271
316	3	nupl	734b51ea0b5777e6a56677eb649fb4c4
317	3	upkkb	17fff731144c3c20112453f6e101223d
318	3	sample3	827ccb0eea8a706c4c34a16891f84e7b
319	3	khrisnamurti	785a9121344fdd4e0d1e8cd321fa3199
320	3	upkrishnamurti	8c0f239cce8d58f3d05e6d5807d27f91
321	3	anthrosoc	0bc2ef0ffb55ad1af328039034e21037
322	3	testorg	4dfb2f26013a210129a0fe19bf8e849f
\.


--
-- Data for Name: orgadvisers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgadvisers (organizationid, email, facultyid, appsemid, confirmed) FROM stdin;
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY organizations (organizationid, loginaccountid, orgname) FROM stdin;
1	2	ACADEMIC LEAGUE OF CHEMICAL ENGINEERING STUDENTS
2	3	ADELFE ENU CREA SORORITY
3	4	ADVENTIST MINISTRY TO COLLEGE AND UNIVERSITY STUDENTS
4	5	ADVERTISING CORE
5	6	AGGREGATES INC
6	7	AGHAM YOUTH
7	8	AGUMAN
8	9	AIESEC UPD
9	10	AKBAYAN YOUTH
10	11	ALLIANCE FOR RESPONSIVE INVOLVEMENT AND STUDENT EMPOWERMENT
11	12	ALPHA  & OMEGA INTERNATIONAL STUDENTS ASSOCIATION
12	13	ALPHA PHI OMEGA INTERNATIONAL COLLEGIATE SERVICE FRATERNITY
13	14	ALPHA PHI OMEGA INTERNATIONAL COLLEGIATE SERVICE SORORITY
14	15	ALPHA SIGMA FRATERNITY
15	16	ALYANSA NG MGA MAG-AARAL PARA SA PANLIPUNANG KATWIRAN AT KAUNLARAN
16	17	ANIBAN NG MGA KABITENYO
17	18	ANIDO
18	19	ANIME MANGA ENTHUSIASTS
19	20	ANNA NA CAGAYAN
20	21	ARIRANG
21	22	ARTISTS CIRCLE FRATERNITY
22	23	ARTISTS CIRCLE SORORITY
23	24	ASOSASYON NG MGA KABATAANG ARTISTA, KRITIKO AT ISKOLAR NG SNING AT KULTURA
24	25	ASSEMBLY-ASSOCIATION OF MASCI PARTISANS
25	26	ASSOCIATION FOR COMPUTING MACHINERY
26	27	ASSOCIATION OF BIOLOGY MAJORS
27	28	ASSOCIATION OF BUSINESS ADMINISTRATION MAJORS
28	29	ASSOCIATION OF CIVIL ENGG STUDENTS
29	30	ASSOCIATION OF COMPUTER SCIENCE MAJORS
30	31	ASSOCIATION OF SOUTHEAST ASIAN STUDIES
31	32	ASSOCIATION OF SPEECH COMMUNICATION ENTHUSIASTS
32	33	ASSOCIATION OF VISUAL COMMUNICATORS
33	34	ASTRONOMICAL SOCIETY
34	35	ATHLETES IN ACTION
35	36	BABAYLAN
36	37	BALANGHAI
37	38	BANNUAR
38	39	BATANGAN
39	40	BETA SIGMA FRATERNITY
40	41	BETA SIGMA LADIES  CORPS
41	42	BIBLE READERS SOCIETY
42	43	BROADCASTERS GUILD
43	44	BROTHERHOOD OF THE FILIPINOS
44	45	BUKLURAN SA SIKOLOHIYANG PILIPINO
45	46	BUSINESS ANALYSTS SOCIETY
46	47	CAGAYAN VALLEY STUDENT FORUM
47	48	CAMPUS CRUSADE FOR CHRIST
48	49	CAREER ASSISTANCE PROGRAM
49	50	CATANDUNGAN
50	51	CENTER FOR NATIONALISTS  STUDIES
51	52	CHEMICAL ENGINEERING SOCIETY, INC
52	53	CHEMICAL SOCIETY
53	54	CHILDRENS RIGHTS ADVOCATES LEAGUE
54	55	CHINESE STUDENTS ASSOCIATION
55	56	CHRIST ON CAMPUS
56	57	CHRIST YOUTH IN ACTION
57	58	CHRISTIAN BROTHERHOOD
58	59	CHRISTIAN LIFE COMMUNITY
59	60	CHRISTIAN YOUTH MOVEMENT
60	61	CINEASTES STUDIO
61	62	CINEMA
62	63	CINEMA  AS  ART MOVEMENT
63	64	CINEMA ARTS SOCIETY
64	65	CIRCLE OF ADMINISTRATORS
65	66	CIRCLE OF ENGINEERING STUDENTS
66	67	CIRCLE OF ENTREPRENEURS
67	68	CIRCLE OF INDUSTRIAL ENGINEERING MAJORS
68	69	CIRCLE OF RESEARCH ENTHUSIASTS
69	70	CIRCUIT
70	71	CLUB FOR THE ENVIRONMENT AND TOURISM
71	72	CMC BROADCASTING ASSOCIATION
72	73	COMMUNICATION RESEARCH SOCIETY
73	74	COMMUNICATORS FOR GOOD GOVERNANCE
74	75	CRADLE OF ART ENTHUSIASTS AND EVERGREEN DISCIPLES
75	76	DANCE SPORT SOCIETY
76	77	DANSA
77	78	DEBATE SOCIETY
78	79	DELTA LAMBDA SIGMA SORORITY
79	80	DELTA PI OMICRON SORORITY
80	81	DORMITORIES CHRISTIAN FELLOWSHIP
81	82	DOST SCHOLARS ASSOCIATION
82	83	DRAGONBOAT TEAM
83	84	DZUP RADIO CIRCLE
84	85	ECONOMICS SOCIETY
85	86	ECONOMICS TOWARDS CONSCIOUSNESS
86	87	EDUCATION SOCIETY
87	88	EDUCATORS CIRCLE
88	89	ENGINEERING RADIO GUILD
89	90	ENGINEERING SOCIETY
90	91	ENGINEERS AND MEN FOR THE COLLEGE AND COUNTRY
91	92	EPSILON CHI FRATERNITY
92	93	EURO-FILIPINO UNDERSTANDING AND RELATIONS
93	94	EVERY NATION CAMPUS MINISTRIES
94	95	EX LIBRIS UP
95	96	FAMILY LIFE AND DEVELOPMENT CIRCLE
96	97	FENCING CLUB
97	98	FRONTRUNNER FOR A RESPONSIVE AND RESPONSIBLE  COLLEGE OF ENGINEERING
98	99	FUTBOL CLUB SIKAD
99	100	FUTURE LIBRARY AND INFORMATION PROFESSIONALS OF THE PHILIPPINES
100	101	GABRIELA-UPD
101	102	GAWAD KALINGA
102	103	GEARS AND PINIONS
103	104	GEODETIC ENGINEERING CLUB
104	105	GEOLOGICAL SOCIETY
105	106	GIMPONG
106	107	GREEN LEAGUE
107	108	GREEN MINDS
108	109	GRIP UP SPORT CLIMBING ASSOCIATION
109	110	GUILDER INSTITUTE
110	111	HARING IBON
111	112	HARONG
112	113	HILIGAYNON
113	114	HOBBY GAMERS CIRCLE
114	115	HUBEAG IT MGA AKEANON
115	116	IBALON
116	117	IN-CHRIST TRUST FOR UNIVERSITY STUDENTS
117	118	INTERDEPENDENT STUDENT-CENTERED ACTIVISM
118	119	INDUSTRIAL DESIGNERS ASSOCIATION
119	120	INDUSTRIAL ENGINEERING CLUB
120	121	INSTITUTE OF ELECTRONICS AND COMMUNICATIONS ENGINEERS OF THE PHILIPPINES
121	122	INSTITUTE OF INTEGRATED ELECTRICAL ENGINEERS
122	123	INTERNATIONAL CLUB OF UP
123	124	INTERSCHOOL BUSINESS ASSOCIATION INC
124	125	IRIS
125	126	ISO DABAW
126	127	JAMBANGAN
127	128	JODERA CLUB
128	129	JOURNALISM CLUB
129	130	JUDO CLUB
130	131	JUNIOR FINANCE ASSOCIATION
131	132	JUNIOR MARKETING ASSOCIATION
132	133	JUNIOR MUSIC EDUCATION GUILD
133	134	JUNIOR PHILIPPINE INSTITUTE OF ACCOUNTANTS
134	135	KAAMULAN
135	136	KABATAAN KONTRA KAHIRAPAN
136	137	KABATAANG LINGKOD NG BAYAN
137	138	KADUGONG BOL-ANON
138	139	KAGAYHAAN
139	140	KAISA- NAGKAKAISANG ISKOLAR PARA SA PAMANTASA AT SAMBAYANAN
140	141	KALILAYAN
141	142	KALIPUNAN NG MGA ANAK NG ISABELA
142	143	KALIPUNAN PARA SA AGHAM PANLIPUNAN AT PILOSOPIYANG PILIPINO
143	144	KAMANGYAN
144	145	KAMAYO
145	146	KASIMANWA
146	147	KATIPUNAN NG MGA MANANALAYSAY NG BAYAN
147	148	KOREAN STUDENTS AND ALUMNI ASSOCIATION
148	149	KRISHNAMURTI SOCIETY
149	150	KRISTIYANONG YOUTH IKABATAAN PARA SA BAYAN
150	151	KUSTURA
151	152	LAGUNENSE
152	153	LAKAN
153	154	LAKAY KALIKASAN MOUNTAINEERS
154	155	LAONG LAAN
155	156	LATTER-DAY SAINTS STUDENTS ASSOCIATION
156	157	LAWOD
157	158	LAYA FOOTBALL CLUB
158	159	LE CLUB FRANCAIS
159	160	LEADERS EMPOWERMENT ACTION AND DISCIPLESHIP
160	161	LEAGUE OF FILIPINO STUDENTS
161	162	LIBRARY AND INFORMATION SCIENCE STUDENTS ASSOCIATION
162	163	LINGUA FRANCA
163	164	LINUX USERS GROUP
164	165	LIPUNANG PANGKASAYSAYAN
165	166	LOCAL INDEPENDENT MUSIC EXPOSURE PROJECT
166	167	MARADJAW KARADJAW
167	168	MARINE BIOLOGICAL SOCIETY
168	169	MASS COMMUNICATORS ORGANIZATION
169	170	MATERIALS SCIENCE SOCIETY
170	171	MATHEMATICS CLUB
171	172	MATHEMATICS MAJORS CIRCLE
172	173	METHODIST STUDENT MOVEMENT
173	174	MINING ENGINEERING SOCIETY
174	175	MINING, METALLURGICAL AND MATERIALS ENGINEERING
175	176	MIXED MARTIAL ARTS
176	177	MOLECULAR BIOLOGY AND BIOTECHNOLOGICAL SOCIETY
177	178	MORIONES
178	179	MOUNTAINEERS
179	180	MUSIC CIRCLE
180	181	MUSLIM STUDENTS ASSOCIATION
181	182	NAMNAMA
182	183	NAVIGATORS
183	184	NATIONAL NETWORK OF AGRARIAN REFORM ADVOCATES
184	185	ORGANIZATION OF BUSINESS ECONOMICS MAJORS
185	186	ORGANIZATION OF NOVO ECIJANOS
186	187	ORGANIZATION OF STUDENT EDUCATORS
187	188	OUTDOOR RECREATION GROUP
188	189	OVERCOMERS CLUB
189	190	PAGDUMALA
190	191	PALAWENOS
191	192	PAN XENIA INTERNATIONAL PROFESSIONAL FOREIGN TRADE FRATERNITY
192	193	PARALEGAL VOLUNTEER ORGANIZATION
193	194	PHI  DELTA  ALPHA SORORITY
194	195	PHI CHI THETA SORORITY
195	196	PHIL ASSOCIATION OF FOOD TECHNOLOGISTS - (PAFT) ALPHA
196	197	PHIL ASSOCIATION OF NUTRITION ALPHA CHAPTER
197	198	PHILIPPINE SOCIETY OF MECHANICAL ENGINEERS-UP STUDENT UNIT
198	199	PHILIPPINE SOCIETY OF YOUTH SCIENCE CLUB
199	200	PHOTOGRAPHY SOCIETY
200	201	PHYSICS ASSOCIATION
201	202	PI OMICRON FRATERNITY
202	203	PI SIGMA DELTA SORORITY
203	204	PI SIGMA FRATERNITY
204	205	PORTIA SORORITY
205	206	PR  ADVERTISING SOCIETY
206	207	PRE MEDICAL HONOR SOCIETY
207	208	PRE-MEDICAL SOCIETY
208	209	PRESCHOOL PRACTITIONERS
209	210	PROGRESSIVE RESPONSIBLE INNOVATIVE MOVEMENT IN ENGINEERING
210	211	PSYCHOLOGICAL ASSOCIATION
211	212	PSYCHOLOGY SOCIETY
212	213	RED CROSS YOUTH
213	214	REPERTORY COMPANY
214	215	RESCUE
215	216	RIFLE PISTOL TEAM
216	217	RUN FOR CHANGE
217	218	SAMAHAN NG MGA MAG-AARAL SA KOMUNIKASYON
218	219	SAMAHAN TUNGO SA SA PROGRESIBONG ADMINISTRASYON
219	220	SANDIGAN
220	221	SANDIWA
221	222	SANLAHI
222	223	SANLAKAS YOUTH-UPD
223	224	SARO
224	225	SCIENCE AND MATH MAJORS ADVOCATING RESPONSIBLE TEACHING
225	226	SCINTILLA JURIS
226	227	SEEDS OF THE NATIONS
227	228	SIDLANGAN
228	229	SIGMA ALPHA NU SORORITY
229	230	SIGMA ALPHA SORORITY
230	231	SIGMA BETA SORORITY
231	232	SIGMA DELTA PHI SORORITY
232	233	SIGMA DELTA PI SORORITY
233	234	SIGMA KAPPA PI FRATERNITY
234	235	SIGMA RHO FRATERNITY
235	236	SILAK-SILAB
236	237	SILLAG
237	238	SINING NA NAGLILINGKOD SA BAYAN-UP
238	239	SOCIETY FOR HOTEL AND RESTAURANT PROGRESS
239	240	SOCIETY FOR THE PROMOTION OF INTELLIGENT ENGINEERING AND SCIENCES STUDENTRY
240	241	SOCIETY OF EMANCIPATED MEN
241	242	SOCIETY OF GEODETIC ENGINEERING MAJORS
242	243	SOCIETY OF MANUFACTURING ENGINEERS
243	244	SOCCSKSARGEN
244	245	SORORITAS ASTRUM SCIENTIS
245	246	SORSOGUENOS
246	247	SPECIAL EDUCATION COUNCIL
247	248	SPEECH COMMUNICATION ASSOCIATION
248	249	SPORTS ORG AND MANAGEMENT
249	250	STATE VARSTIY CHIRSTIAN FELLOWSHIP
250	251	STATISTICAL SOCIETY
251	252	STRATEGIC SOCIAL MARKETING AND ALTERNATIVE RESOURCE TRAINING
252	253	STREET DANCE CLUB
253	254	STUDENT ALLIANCE FOR THE ADVANCEMENT OF DEMOCRATIC RIGHTS IN UP
254	255	STUDENT ASSOCIATION OF VALUERS OF ENERGY
255	256	STUDENT CATHOLIC ACTION
256	257	STUDENTS OF DESTINY
257	258	STUDENTS OF EXCELLENCE, ACTION, LEADERSHIP AND SERVICE
258	259	SUBAQUATICA
259	260	SUBOL SOCIETY
260	261	TANGWAY
261	262	TAU GAMMA PHI CONFRATERNITY
262	263	TAU RHO XI FRATERNITY
263	264	TENNIS UP
264	265	THEATER COUNCIL
265	266	THETA EPSILON SORORITY
266	267	TOMO-KAI, PHILIPPINES-JAPAN FRIENDSHIP CLUB
267	268	TOUCH RUGBY CLUB
268	269	TOURISM MANAGEMENT SOCIETY
269	270	UNDERGROUND MUSIC COMMUNITY
270	271	UNESCO
271	272	UPROJECT
272	273	UPSILON SIGMA PHI
273	274	VARIATES
274	275	VOCAL ENSEMBLE
275	276	VOLLEYBALL CLUB
276	277	WOMEN IN LAW
277	278	WOMENS BASKETBALL CLUB
278	279	WRITERS CLUB
279	280	YOUTH FOR CHRIST
280	281	ZOOLOGICAL SOCIETY
281	282	UP PROGRAMMING GUILD
282	283	UP KLUB TALA
283	284	UGNAYAN NG NAGKAKAISANG ARTISTA
284	285	UPSHIFT
285	286	UP TIKLADO
286	287	UP NATIONAL UNION OF PEOPLES' LAWYERS
287	288	UP SA ISIP, SA SALITA AT SA GAWA
288	289	UP DILIMAN ULTIMATE ORGANIZATION
289	290	UP ANTHROPOLOGY SOCIETY
290	291	UP IDEA
291	292	LAW ENTHUSIASTS SOCIETY
292	293	UP COMMUNITY DEVELOPMENT CIRCLE
293	294	UP LEGAK NETWORK FOR TRUTHFUL ELECTIONS
294	295	UP HEROES CORE
295	296	UP VOLUNTEERS FOR CHILDREN
296	297	SAMPLE ORGANIZATION
297	298	UP BIBLIOTECH
298	299	UP GOLF
299	300	UP SCRABBLE CLUB
300	301	ALPHA PHI BETA
301	302	UP ALPHA PHI BETA FRATERNITY
302	303	UP POWERLIFTING TEAM
303	304	ASSOCIATION OF CLOTHING TECHNOLOGY STUDENTS
304	305	UP JZONE
305	306	UP LAMBAK
306	307	UP MAYON
307	308	UP TRAVEL SOCIETY
308	309	SAMPLE2
309	310	UP JZONE
310	311	JZONE UP
311	312	NNARA YOUTH
312	313	UP TRAVEL SOCIETY
313	314	TRIAL ORGANIZATION1
314	315	UP ASSOCIATION OF KARATE
315	316	UPNUPL
316	317	KRISTIYANONG YOUTH KABATAAN PARA SA BAYAN (KKB)
317	318	SAMPLE ORG 3
318	319	UP KHRISNAMURTI SOCIETY
319	320	UP KRISHNAMURTI SOCIETY
320	321	UP ANTHROPOLOGY SOCIETY
321	322	TESTORG
\.


--
-- Data for Name: orgawards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgawards (orgawardid, organizationid, appsemid, awardname, filepath, awardclassificationid, description, giver) FROM stdin;
\.


--
-- Data for Name: orgcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgcategories (orgcategoryid, description) FROM stdin;
1	Academic
2	Alliance
3	Cause-Oriented
4	Community Service
5	Fraternity
6	Regional/Provincial
7	Religious
8	Sorority
9	Special Interest
10	Sports and Recreation
\.


--
-- Data for Name: orgclarifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgclarifications (orgclarificationid, appsemid, organizationid, date_created, description) FROM stdin;
\.


--
-- Data for Name: orgcollections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgcollections (orgcollectionid, appsemid, organizationid, amount, description) FROM stdin;
\.


--
-- Data for Name: orgdisbursements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgdisbursements (orgdisbursementid, appsemid, organizationid, amount, description) FROM stdin;
\.


--
-- Data for Name: orgmemberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgmemberships (organizationid, studentid, appsemid, email, "position", confirmed) FROM stdin;
\.


--
-- Data for Name: orgprofiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgprofiles (organizationid, appsemid, orgstatusid, acronym, orgdescription, orgcategoryid, mailaddr, orgemail, heademail, establisheddate, secincorporated, incorporationdate, interviewed, approvedby, approveddate, startingbalance, acknowledged) FROM stdin;
1	20091	1			9			notepad1432000@yahoo.com	\N	f	\N	f	\N	\N	\N	f
1	20101	1			9			notepad1432000@yahoo.com	\N	f	\N	f	\N	\N	\N	f
2	20091	2	UP AEC Sorority	Adelfe Enu Crea Sorority is the first and only business sorority in the University of the Philippines. The sorority is committed to the pursuit of excellence in the academe, most especially in business.	8	Rm 406 College of Business Administration, UP-Diliman, QC 1101	adelfeenucreamarketing@yahoo.com.ph	kreezmhey@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
2	20101	1	UP AEC Sorority	Adelfe Enu Crea Sorority is the first and only business sorority in the University of the Philippines. The sorority is committed to the pursuit of excellence in the academe, most especially in business.	8	Rm 406 College of Business Administration, UP-Diliman, QC 1101	adelfeenucreamarketing@yahoo.com.ph	kreezmhey@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
3	20091	1	AMiCUS-UPD	The Adventist Ministry to College and University Students-UP Diliman (AMiCUS-UPD) is a religious organization, a student ministry, and a socio-civic group that aims to nurture the physical, mental, social, and most of all, spiritual needs of its members who believe in the Seventh-Day Adventist faith. The members are UP Dilimanstudents coming from diverse fields of study. The Ministry stems from a hierarchy of AMiCUS organizations: locally from the AMiCUS Federation of the North PhilippineUnion Conference (NPUC), and internationally from the AMiCUS of Youth, Ministry and Education Departments of the General Conference of Seventh-Day Adventists (GC) located at Silver Springs, Maryland. The GC is the head organization of Seventh-Day Adventists worldwide.	7	c/o Al Jay T. MejosIpil Residence HallUP Diliman	AMiCUS-UPD@yahoogroups.com	pepper.scissors@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
3	20101	1	AMiCUS-UPD	The Adventist Ministry to College and University Students-UP Diliman (AMiCUS-UPD) is a religious organization, a student ministry, and a socio-civic group that aims to nurture the physical, mental, social, and most of all, spiritual needs of its members who believe in the Seventh-Day Adventist faith. The members are UP Dilimanstudents coming from diverse fields of study. The Ministry stems from a hierarchy of AMiCUS organizations: locally from the AMiCUS Federation of the North PhilippineUnion Conference (NPUC), and internationally from the AMiCUS of Youth, Ministry and Education Departments of the General Conference of Seventh-Day Adventists (GC) located at Silver Springs, Maryland. The GC is the head organization of Seventh-Day Adventists worldwide.	7	c/o Al Jay T. MejosIpil Residence HallUP Diliman	AMiCUS-UPD@yahoogroups.com	pepper.scissors@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
4	20091	3	AdCore	We are UP's first and premier advertising organization based in CBA, established in 1Y 2006-2007. We are dedicated to promoting awareness on effective and responsible advertising to the Filipino youth. 	1	College of Business Administration, UP Diliman, Quezon City	upadcore@gmail.com	blumoon_001@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
4	20101	1	AdCore	We are UP's first and premier advertising organization based in CBA, established in 1Y 2006-2007. We are dedicated to promoting awareness on effective and responsible advertising to the Filipino youth. 	1	College of Business Administration, UP Diliman, Quezon City	upadcore@gmail.com	blumoon_001@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
5	20091	1			9			mrperdiguerra@yahoo.com	\N	f	\N	f	\N	\N	\N	f
5	20101	1			9			mrperdiguerra@yahoo.com	\N	f	\N	f	\N	\N	\N	f
6	20091	1			9			odguela@gmail.com	\N	f	\N	f	\N	\N	\N	f
6	20101	1			9			odguela@gmail.com	\N	f	\N	f	\N	\N	\N	f
7	20091	3	Agu	UP Aguman is a socio-civic, not-for-profit, service-oriented organization of Pampango-speaking students in the Universtiy of the Philippines.	6	East Wing, Palma Hall, UP Diliman, Quezon City, 1101	up_aguman_tfk@yahoo.com	kvz_pekepate@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
7	20101	1	Agu	UP Aguman is a socio-civic, not-for-profit, service-oriented organization of Pampango-speaking students in the Universtiy of the Philippines.	6	East Wing, Palma Hall, UP Diliman, Quezon City, 1101	up_aguman_tfk@yahoo.com	kvz_pekepate@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
8	20091	3	AIESEC UPD	AIESEC is the international platform for the youth to explore and develop their potential. It offers international programs, international conferences, and leadership opportunities.	9	408 College of Business Administration Diliman Quezon City Philippines, 1101	crisette.arcilla@aiesec.net	crisette.arcilla@aiesec.net	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
8	20101	1	AIESEC UPD	AIESEC is the international platform for the youth to explore and develop their potential. It offers international programs, international conferences, and leadership opportunities.	9	408 College of Business Administration Diliman Quezon City Philippines, 1101	crisette.arcilla@aiesec.net	crisette.arcilla@aiesec.net	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
9	20091	1			9			kristoffer.lamug@gmail.com	\N	f	\N	f	\N	\N	\N	f
9	20101	1			9			kristoffer.lamug@gmail.com	\N	f	\N	f	\N	\N	\N	f
10	20091	1			9			kristineciriaco@gmail.com	\N	f	\N	f	\N	\N	\N	f
10	20101	1			9			kristineciriaco@gmail.com	\N	f	\N	f	\N	\N	\N	f
11	20091	3	AOISA	AOISA is a religious organization that aims to form leaders in society. It is a leadership school that teaches biblical values and encourage the people to put them into practice.	7	Mount Olympus No 8, Filinvest 1, Quezon City. Metro Manila	aoisap@gmail.com	jacecuevas@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
11	20101	1	AOISA	AOISA is a religious organization that aims to form leaders in society. It is a leadership school that teaches biblical values and encourage the people to put them into practice.	7	Mount Olympus No 8, Filinvest 1, Quezon City. Metro Manila	aoisap@gmail.com	jacecuevas@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
12	20091	1	APO Fraternity	Prof. Buensuceso teaches at the Department of Civil Engineeering,UP Diliman.	5	Greenhouse, Palma Hall Building, UP Diliman	upd_apo@yahoo.com	fritz_sapon25@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
12	20101	1	APO Fraternity	Prof. Buensuceso teaches at the Department of Civil Engineeering,UP Diliman.	5	Greenhouse, Palma Hall Building, UP Diliman	upd_apo@yahoo.com	fritz_sapon25@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
13	20091	1	APO Sorority	Alpha Phi Omega Sorority, an international collegiate service sorority, is a non-governmental, non-political and non-profit organization concerned primarily with bonafide college students.  It is aimed at developing leadership, friendship and service.	8	12E Dolop St., Cubao, Quezon City 1109	apos_eta@yahoogroups.com	ldvelasco@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
13	20101	1	APO Sorority	Alpha Phi Omega Sorority, an international collegiate service sorority, is a non-governmental, non-political and non-profit organization concerned primarily with bonafide college students.  It is aimed at developing leadership, friendship and service.	8	12E Dolop St., Cubao, Quezon City 1109	apos_eta@yahoogroups.com	ldvelasco@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
38	20101	1	n/a	Provincial Organization of Batangueno UP Diliman Students	6	1247 UP Bliss San Vicente, Diliman, Quezon City	upbatangan@yahoo.com	rmldecastro@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
104	20101	1			9			bea_canto@yahoo.com	\N	f	\N	f	\N	\N	\N	f
105	20091	1			9			sundy_620@yahoo.com	\N	f	\N	f	\N	\N	\N	f
14	20091	3	ΑΣ, Masig	The UP Alpha Sigma fraternity is a duly recognized fraternity of the University of the Philippines since October 10, 1962. It has long upheld its relevance and committment to humanitarian service through projects and pursuits that reflect its own name: Alay sa Sambayanan	5	17 Dama de Noche st.La Colina SubdivisionBrgy. Fortune, Marikina CityPhilippines 1809	biome_tobie@yahoo.com	jjaize@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
14	20101	1	ΑΣ, Masig	The UP Alpha Sigma fraternity is a duly recognized fraternity of the University of the Philippines since October 10, 1962. It has long upheld its relevance and committment to humanitarian service through projects and pursuits that reflect its own name: Alay sa Sambayanan	5	17 Dama de Noche st.La Colina SubdivisionBrgy. Fortune, Marikina CityPhilippines 1809	biome_tobie@yahoo.com	jjaize@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
15	20091	1			9			jvlachica@gmail.com	\N	f	\N	f	\N	\N	\N	f
15	20101	1			9			jvlachica@gmail.com	\N	f	\N	f	\N	\N	\N	f
16	20091	2	ANGKAN	UP Aniban ng mga Kabitenyo aims to unite and empower Caviteno students in UP Diliman and to impart knowledge and foster camaraderie among younger Caviteno students	6	048 Salitran 1, Dasmarinas, Cavite 4114	upanibanngmgakabitenyo@yahoo.com	israel_samson@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
16	20101	1	ANGKAN	UP Aniban ng mga Kabitenyo aims to unite and empower Caviteno students in UP Diliman and to impart knowledge and foster camaraderie among younger Caviteno students	6	048 Salitran 1, Dasmarinas, Cavite 4114	upanibanngmgakabitenyo@yahoo.com	israel_samson@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
17	20091	1	Anido	A cause-oriented organization of students from Cordillera Administrative Region focused on cultural development and indigenous people's rights.	3	#40 Viola Street, Area 3, UP Campus, Q.C 1101 	upanido@yahoo.com	rutayaban@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
17	20101	1	Anido	A cause-oriented organization of students from Cordillera Administrative Region focused on cultural development and indigenous people's rights.	3	#40 Viola Street, Area 3, UP Campus, Q.C 1101 	upanido@yahoo.com	rutayaban@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
18	20091	2	UP AME	The University of the Philippines Anime Manga Enthusiasts is a College of Arts and Letters based non-political and non-sectarian organization which aims to gather anime and manga enthusiasts all over UP Diliman. The organization also exists to provide an atmosphere for an open exchange of ideas and share in-depth information on the nature of anime and manga.	9	UP AME Alumni Relations and Extension Services Committee (University of the Philippines Anime Manga Enthusiasts)Faculty Center Tambayan Complex, Bulwagang Rizal, University of the Philippines, Diliman,Quezon City, Manila, 1101Philippines	upame.arescom@gmail.com	jutsbarredo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
18	20101	1	UP AME	The University of the Philippines Anime Manga Enthusiasts is a College of Arts and Letters based non-political and non-sectarian organization which aims to gather anime and manga enthusiasts all over UP Diliman. The organization also exists to provide an atmosphere for an open exchange of ideas and share in-depth information on the nature of anime and manga.	9	UP AME Alumni Relations and Extension Services Committee (University of the Philippines Anime Manga Enthusiasts)Faculty Center Tambayan Complex, Bulwagang Rizal, University of the Philippines, Diliman,Quezon City, Manila, 1101Philippines	upame.arescom@gmail.com	jutsbarredo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
19	20091	2	UP ANC	UP ANC is an organization composed of Cagayano students, geares towards promoting camaraderie and unity among the youth and initiating socio-cultural and academic awareness.	6	Yakal Residence Hall, UP Diliman, 1101 c/o Manilyn Raquedan	up_anc@rocketmail.com	nhachanzar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
19	20101	1	UP ANC	UP ANC is an organization composed of Cagayano students, geares towards promoting camaraderie and unity among the youth and initiating socio-cultural and academic awareness.	6	Yakal Residence Hall, UP Diliman, 1101 c/o Manilyn Raquedan	up_anc@rocketmail.com	nhachanzar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
20	20091	3	UPA	The University of the Philippines Arirang is the premier socio-cultural Filipino-Korean Students' Friendship Organization in the University of the Philippines - Diliman. Our organization aims to strengthen ties and culture between the Filipino and Korean community of the university.	9	 Center for International Studies Benton Hall University of the Philippines Diliman, Quezon City, 1101	updarirang@gmail.com	lex_tabulog@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
20	20101	1	UPA	The University of the Philippines Arirang is the premier socio-cultural Filipino-Korean Students' Friendship Organization in the University of the Philippines - Diliman. Our organization aims to strengthen ties and culture between the Filipino and Korean community of the university.	9	 Center for International Studies Benton Hall University of the Philippines Diliman, Quezon City, 1101	updarirang@gmail.com	lex_tabulog@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
21	20091	1			9			ginohoytaghoy@yahoo.com	\N	f	\N	f	\N	\N	\N	f
21	20101	1			9			ginohoytaghoy@yahoo.com	\N	f	\N	f	\N	\N	\N	f
22	20091	1			9			cacky18@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
22	20101	1			9			cacky18@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
23	20091	1	UP Asterisk	UP ASTERISK or University of the Philippines Asosasyon ng Kabataang Artista, Kritiko, at Iskolar ng Sining at Kultura is one of the youngest yet one of the most accomplished academic organizations in the College of Arts and Letters in UP Diliman. The organization is comprised of students who are dedicated in bringing art to a broader audience through art appreciation and practice.\r\n\r\nIn the past years, the organization has achieved its goals through its regular activities namely: Kwenkaps (Kwentuhan at Kapehan) which is an informal discussion with art related topics and socially oriented issues over coffee; Palihan or Workshops which serves as venue for members and non-members alike to explore their creativity and exchange knowledge on different art media; Sining Series which aims to broaden perspectives through attending exhibits and festivals that would present the benefits of viewing and experiencing art first hand; and Freelikula, as the term suggests, concretizes an advocacy of the organization through one of the art media which is film.\r\n	1		upasterisk@gmail.com	macristina88@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
39	20091	3	Beta Sigma, BS, UPBSF, Tabets, B	The U.P. Beta Sigma Fraternity is a duly recognized non-stock, non-profit, university-based organization dedicated to the pursuit of academic excellence and service to the society. It aims to mold its members into productive, principled citizens of the country through strong fraternal kinship and common aspirations. Founded on 14 July 1946, the Brotherhood of Scholars has become a vast society with significant contributions in education, business, environment, mass media, music, sports, politics, and other fields of endeavor.	5	2E Masinsinan St., Teacher's Vill., Diliman, Quezon City	up_beta_sigma_dil@yahoo.com	prince_elmer.reyes@up.edu.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
52	20101	1	CHEMSOC	An academic organization. 	1	Pavillion 1, Institute of Chemistry, College of Science University of the Philippines, Diliman, Quezon City	upchemsoc@yahoo.com	christian_11_lr@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
23	20101	1	UP Asterisk	UP ASTERISK or University of the Philippines Asosasyon ng Kabataang Artista, Kritiko, at Iskolar ng Sining at Kultura is one of the youngest yet one of the most accomplished academic organizations in the College of Arts and Letters in UP Diliman. The organization is comprised of students who are dedicated in bringing art to a broader audience through art appreciation and practice.\r\n\r\nIn the past years, the organization has achieved its goals through its regular activities namely: Kwenkaps (Kwentuhan at Kapehan) which is an informal discussion with art related topics and socially oriented issues over coffee; Palihan or Workshops which serves as venue for members and non-members alike to explore their creativity and exchange knowledge on different art media; Sining Series which aims to broaden perspectives through attending exhibits and festivals that would present the benefits of viewing and experiencing art first hand; and Freelikula, as the term suggests, concretizes an advocacy of the organization through one of the art media which is film.\r\n	1		upasterisk@gmail.com	macristina88@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
24	20091	1			9			sweet_kittycat13@yahoo.com	\N	f	\N	f	\N	\N	\N	f
24	20101	1			9			sweet_kittycat13@yahoo.com	\N	f	\N	f	\N	\N	\N	f
25	20091	2	UP ACM	UP ACM is an academic organization that aims to promote the application of the bodies of knowledge in Computer Science for the welfare of the computer science community and the UP as well.	1	UP Alumni Engineers Centennial Hall Building, Velasquez St., University of the Philippines, Diliman, Quezon City 1101	council@upacm.net	jpmontalbo@upacm.net	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
25	20101	1	UP ACM	UP ACM is an academic organization that aims to promote the application of the bodies of knowledge in Computer Science for the welfare of the computer science community and the UP as well.	1	UP Alumni Engineers Centennial Hall Building, Velasquez St., University of the Philippines, Diliman, Quezon City 1101	council@upacm.net	jpmontalbo@upacm.net	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
26	20091	1			9			leprohollic_king@yahoo.com	\N	f	\N	f	\N	\N	\N	f
26	20101	1			9			leprohollic_king@yahoo.com	\N	f	\N	f	\N	\N	\N	f
27	20091	3	UP ABAM	UP ABAM is exclusively composed of BS Business Administration Majors, upholding its aim of developing managerial and leadership skills among its members and through value-adding projects and activities	1	Room 408 4th floor, UP College of Business Administration, UP Diliman, Quezon City, 1101	upabam@gmail.com	salvador.nico@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
27	20101	1	UP ABAM	UP ABAM is exclusively composed of BS Business Administration Majors, upholding its aim of developing managerial and leadership skills among its members and through value-adding projects and activities	1	Room 408 4th floor, UP College of Business Administration, UP Diliman, Quezon City, 1101	upabam@gmail.com	salvador.nico@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
28	20091	1			9			icecrusher87@yahoo.com	\N	f	\N	f	\N	\N	\N	f
28	20101	1			9			icecrusher87@yahoo.com	\N	f	\N	f	\N	\N	\N	f
29	20091	1			9			danmariedelgado@gmail.com	\N	f	\N	f	\N	\N	\N	f
29	20101	1			9			danmariedelgado@gmail.com	\N	f	\N	f	\N	\N	\N	f
30	20091	1	UP ASEAS	UP ASEAS is an interdisciplinary academic and leadership association that promotes scholarly awareness, understanding, and appreciation of Southeast Asia and fosters meaningful cooperation among Southeast Asian peoples.	1	99a Matahimik St. Teachers Village West Diliman, QC	upaseas10@gmail.com	sisatoako@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
30	20101	1	UP ASEAS	UP ASEAS is an interdisciplinary academic and leadership association that promotes scholarly awareness, understanding, and appreciation of Southeast Asia and fosters meaningful cooperation among Southeast Asian peoples.	1	99a Matahimik St. Teachers Village West Diliman, QC	upaseas10@gmail.com	sisatoako@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
31	20091	1			9			maryrose.magtubo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
31	20101	1			9			maryrose.magtubo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
32	20091	1	AVCOM	AVCOM aims to contribut to the betterment of the creatives and artistic field in our college and in our university, commit to institute an organization that aims to produce optimum professionals adept in conceptualization, production and communication, in oder to promote and uplift the arts and to serve the Philippine society.	9	College of Fine Arts, University of the Philippines, Barlett Hall, Emilio Jacinto St. Diliman, 1101 Quezon City, Philippines	AVCOM_official	paulina_disimulacion@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
32	20101	1	AVCOM	AVCOM aims to contribut to the betterment of the creatives and artistic field in our college and in our university, commit to institute an organization that aims to produce optimum professionals adept in conceptualization, production and communication, in oder to promote and uplift the arts and to serve the Philippine society.	9	College of Fine Arts, University of the Philippines, Barlett Hall, Emilio Jacinto St. Diliman, 1101 Quezon City, Philippines	AVCOM_official	paulina_disimulacion@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
33	20091	3	UP ASTROSOC	UP Astrosoc hopes to bring together individuals interested in astronomy, to broaden the awareness, interest, knowledge, and understanding of astronomy among students and the general public, to contribute to the general body of knowledge in astronomy, and to promote the common interest and individual development of its members.	9	PAGASA Astronomical Observatory, UP Diliman, Diliman, Quezon City 1101	upastrosociety@gmail.com	djavila@ymail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
33	20101	1	UP ASTROSOC	UP Astrosoc hopes to bring together individuals interested in astronomy, to broaden the awareness, interest, knowledge, and understanding of astronomy among students and the general public, to contribute to the general body of knowledge in astronomy, and to promote the common interest and individual development of its members.	9	PAGASA Astronomical Observatory, UP Diliman, Diliman, Quezon City 1101	upastrosociety@gmail.com	djavila@ymail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
34	20091	1			9			raramos24@gmail.com	\N	f	\N	f	\N	\N	\N	f
34	20101	1			9			raramos24@gmail.com	\N	f	\N	f	\N	\N	\N	f
35	20091	1			9			castillo.nicole@yahoo.com	\N	f	\N	f	\N	\N	\N	f
35	20101	1			9			castillo.nicole@yahoo.com	\N	f	\N	f	\N	\N	\N	f
36	20091	1			9			glezelgalenzoga@yahoo.com	\N	f	\N	f	\N	\N	\N	f
36	20101	1			9			glezelgalenzoga@yahoo.com	\N	f	\N	f	\N	\N	\N	f
37	20091	3	none	UP Bannuar is a non-stock,non-profit, non-sectarian and non-political organization of bona fide Ilocano students in the University of the Philippines, Diliman	1	Cluster E, Vinzons Tambayan Complex, Vinzons Hall UP Diliman, Quezon City, 1101	up_bannuar@yahoo.com	maloriejoymones@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
37	20101	1	none	UP Bannuar is a non-stock,non-profit, non-sectarian and non-political organization of bona fide Ilocano students in the University of the Philippines, Diliman	1	Cluster E, Vinzons Tambayan Complex, Vinzons Hall UP Diliman, Quezon City, 1101	up_bannuar@yahoo.com	maloriejoymones@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
38	20091	3	n/a	Provincial Organization of Batangueno UP Diliman Students	6	1247 UP Bliss San Vicente, Diliman, Quezon City	upbatangan@yahoo.com	rmldecastro@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
39	20101	1	Beta Sigma, BS, UPBSF, Tabets, B	The U.P. Beta Sigma Fraternity is a duly recognized non-stock, non-profit, university-based organization dedicated to the pursuit of academic excellence and service to the society. It aims to mold its members into productive, principled citizens of the country through strong fraternal kinship and common aspirations. Founded on 14 July 1946, the Brotherhood of Scholars has become a vast society with significant contributions in education, business, environment, mass media, music, sports, politics, and other fields of endeavor.	5	2E Masinsinan St., Teacher's Vill., Diliman, Quezon City	up_beta_sigma_dil@yahoo.com	prince_elmer.reyes@up.edu.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
40	20091	1			9			miss_steph_uy@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
40	20101	1			9			miss_steph_uy@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
41	20091	3	UP BREAD	Bible Readers Society (UP BREAD) aims to promote Bible reading in the academe and to instill Christian values that are written therein	7	33 20th Avenue Cubao Quezon City (1109)	breadmmdivs1updil@yahoo.com	reneveesahagun@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
41	20101	1	UP BREAD	Bible Readers Society (UP BREAD) aims to promote Bible reading in the academe and to instill Christian values that are written therein	7	33 20th Avenue Cubao Quezon City (1109)	breadmmdivs1updil@yahoo.com	reneveesahagun@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
42	20091	3	UP BroadGuild	The UP BROADCASTERS’ GUILD (UP BROADGUILD) is a duly recognized, non-stock, non-profit, socio-civic organization based in the College of Mass Communication, UP Diliman.  With a vision to create an inspired world transformed by compelling communication, the organization is dedicated to the promotion of effective and responsible communication for positive change.	3	Broadcast Department, college of Mass communication, University of the Philippines, Diliman, 1101	upbroadguild_0910@yahoo.com	edenflores33@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
42	20101	1	UP BroadGuild	The UP BROADCASTERS’ GUILD (UP BROADGUILD) is a duly recognized, non-stock, non-profit, socio-civic organization based in the College of Mass Communication, UP Diliman.  With a vision to create an inspired world transformed by compelling communication, the organization is dedicated to the promotion of effective and responsible communication for positive change.	3	Broadcast Department, college of Mass communication, University of the Philippines, Diliman, 1101	upbroadguild_0910@yahoo.com	edenflores33@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
43	20091	1			9			pinoy55@yahoo.com	\N	f	\N	f	\N	\N	\N	f
43	20101	1			9			pinoy55@yahoo.com	\N	f	\N	f	\N	\N	\N	f
44	20091	3	UP Buklod Isip	Ang UP Bukluran sa Sikolohiyang Pilipino o UP Buklod-Isip ay isang pang-akademikong organisasyon ng mga mag-aaral ng Sikolohiya sa UP Diliman. Pangunahin sa mga isinusulong ng samahan ay ang pagtataguyod at pagpapalaganap ng Sikolohiyang Pilipino (SP), isang sikolohiyang sumasalamin sa diwa ng sambayanang Pilipino at sa gayo'y tunay ding tumutugon sa mga pangangailangan at adhikain nito. 	1	Ground Floor, East Wing, Palma Hall, UP Diliman, Quezon City, 1101	bukids_kami@yahoogroups.com	wigsterdam_7000@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
44	20101	1	UP Buklod Isip	Ang UP Bukluran sa Sikolohiyang Pilipino o UP Buklod-Isip ay isang pang-akademikong organisasyon ng mga mag-aaral ng Sikolohiya sa UP Diliman. Pangunahin sa mga isinusulong ng samahan ay ang pagtataguyod at pagpapalaganap ng Sikolohiyang Pilipino (SP), isang sikolohiyang sumasalamin sa diwa ng sambayanang Pilipino at sa gayo'y tunay ding tumutugon sa mga pangangailangan at adhikain nito. 	1	Ground Floor, East Wing, Palma Hall, UP Diliman, Quezon City, 1101	bukids_kami@yahoogroups.com	wigsterdam_7000@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
45	20091	1			9			marjowyn@yahoo.com	\N	f	\N	f	\N	\N	\N	f
45	20101	1			9			marjowyn@yahoo.com	\N	f	\N	f	\N	\N	\N	f
46	20091	1			9			htguinto@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
46	20101	1			9			htguinto@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
47	20091	3	CCC, UPCCC	UP Campus Crusade for Christ is an international, interdenominational Christian organization which aims to share the claims of Christ to students and its relevance to their lives.  UPCCC has been accredited as a student organization in UP for the past 40 years.  CCC offers different activities to meet holistically the needs of the students.	7	40 Scout Borromeo StreetBrygy. South Triangle,Quezon City1103, Philippines	ccc.upd@gmail.com	jeftyjrdavid@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
47	20101	1	CCC, UPCCC	UP Campus Crusade for Christ is an international, interdenominational Christian organization which aims to share the claims of Christ to students and its relevance to their lives.  UPCCC has been accredited as a student organization in UP for the past 40 years.  CCC offers different activities to meet holistically the needs of the students.	7	40 Scout Borromeo StreetBrygy. South Triangle,Quezon City1103, Philippines	ccc.upd@gmail.com	jeftyjrdavid@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
48	20091	3	UP CAP CBA-SE	The Career Assistance Program is a service organization committed to helping BS BA, BS BAA, BS BE, and BS Econ students get good jobs and fulfilling careers as they leave the relative safety of the University to face the challenges of the real world. 	9	403 College of Business Administration, UP Diliman	upcap0910@gmail.com	jpunida@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
48	20101	1	UP CAP CBA-SE	The Career Assistance Program is a service organization committed to helping BS BA, BS BAA, BS BE, and BS Econ students get good jobs and fulfilling careers as they leave the relative safety of the University to face the challenges of the real world. 	9	403 College of Business Administration, UP Diliman	upcap0910@gmail.com	jpunida@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
49	20091	1			9			jhonrhenergianan@yahoo.com	\N	f	\N	f	\N	\N	\N	f
49	20101	1			9			jhonrhenergianan@yahoo.com	\N	f	\N	f	\N	\N	\N	f
50	20091	1	CNS	The Center for Nationalist Studies is a political mass-organization promoting a nationalist, scientific and mass-oriented education since its founding in 1982. Our organization has been providing discussions, teach-ins, and was the originator of the Alternative Classroom Learning Experience or ACLE. 	2	1/Flr, Benitez Hall, University of the Philippines, Diliman, Quezon City	centerfornationaliststudies@gmail.com	lcaghina@ymail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
50	20101	1	CNS	The Center for Nationalist Studies is a political mass-organization promoting a nationalist, scientific and mass-oriented education since its founding in 1982. Our organization has been providing discussions, teach-ins, and was the originator of the Alternative Classroom Learning Experience or ACLE. 	2	1/Flr, Benitez Hall, University of the Philippines, Diliman, Quezon City	centerfornationaliststudies@gmail.com	lcaghina@ymail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
51	20091	1			9			mkraguila@gmail.com	\N	f	\N	f	\N	\N	\N	f
51	20101	1			9			mkraguila@gmail.com	\N	f	\N	f	\N	\N	\N	f
52	20091	2	CHEMSOC	An academic organization. 	1	Pavillion 1, Institute of Chemistry, College of Science University of the Philippines, Diliman, Quezon City	upchemsoc@yahoo.com	christian_11_lr@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
79	20101	1			9			ica_geronimo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
105	20101	1			9			sundy_620@yahoo.com	\N	f	\N	f	\N	\N	\N	f
53	20091	3	UP CRAdLe	UP CRAdLe is a university-based organization that strives to promote the welfare of Filipino children and uphold their rights through social awareness, public advocacy and civic action.	3	3 San Martin St., Magellanes Village, Makati City 1232	upcradleexecom0910@yahoogroups.com	claudiahrivera@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
53	20101	1	UP CRAdLe	UP CRAdLe is a university-based organization that strives to promote the welfare of Filipino children and uphold their rights through social awareness, public advocacy and civic action.	3	3 San Martin St., Magellanes Village, Makati City 1232	upcradleexecom0910@yahoogroups.com	claudiahrivera@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
54	20091	1	UP CSA		9			kizztar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
54	20101	1	UP CSA		9			kizztar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
55	20091	3	UP COC	UP Christ on Campus is a religious oraganization which aims to reach out to UP students and them to a dynamic relationship with Jesus Christ the Savior.	7	#56 Apacible St., UP Diliman, Quezon City	coc_students@yahoogroups.com	aubs_rap@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
55	20101	1	UP COC	UP Christ on Campus is a religious oraganization which aims to reach out to UP students and them to a dynamic relationship with Jesus Christ the Savior.	7	#56 Apacible St., UP Diliman, Quezon City	coc_students@yahoogroups.com	aubs_rap@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
56	20091	2	CYA	Christ's Youth in Action aims to train young leaders for the service of the church and the society	7	Unit D 4/F Korben Place, 91 Don A. Roces Ave, Quezon City, 1103, Philippines	cya_upd_st@yahoogroups.com;cya_main@yahoo.com	jmescarro@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
56	20101	1	CYA	Christ's Youth in Action aims to train young leaders for the service of the church and the society	7	Unit D 4/F Korben Place, 91 Don A. Roces Ave, Quezon City, 1103, Philippines	cya_upd_st@yahoogroups.com;cya_main@yahoo.com	jmescarro@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
57	20091	1			9			a10shou@yahoo.com	\N	f	\N	f	\N	\N	\N	f
57	20101	1			9			a10shou@yahoo.com	\N	f	\N	f	\N	\N	\N	f
58	20091	1			9			ia_gassy@yahoo.com	\N	f	\N	f	\N	\N	\N	f
58	20101	1			9			ia_gassy@yahoo.com	\N	f	\N	f	\N	\N	\N	f
59	20091	1			9			elleica@yahoo.com	\N	f	\N	f	\N	\N	\N	f
59	20101	1			9			elleica@yahoo.com	\N	f	\N	f	\N	\N	\N	f
60	20091	2	Cineastes	The UP CINEASTES’ STUDIO is the first-ever student film organization in the Philippines and the student arm of the UP Film Institute.  It started out as an organization just for the film students of UP Diliman. But later on, it expanded to include students from other colleges as well. It has produced a number of prominent alumni which include Bb. Joyce Bernal, Cathy Garcia-Molina, Christine Bersola-Babao, Ely Buendia among others. As it enters its 25th year, the UP Cineastes’ Studio is considered one of the biggest organizations in its home college, the College of Mass Communication. The organization exists to uphold the art of filmmaking and spread its passion to a larger population. It also initiates activities that would elevate the knowledge and craftsmanship in its field of endeavor, and to promote fellowship among film enthusiasts. 	1	UP Film Institute, College of Mass Communication, Plaridel Hall, Ylanan Road, UP Diliman, QC	upcineastesstudio@yahoo.com	diceperez@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
60	20101	1	Cineastes	The UP CINEASTES’ STUDIO is the first-ever student film organization in the Philippines and the student arm of the UP Film Institute.  It started out as an organization just for the film students of UP Diliman. But later on, it expanded to include students from other colleges as well. It has produced a number of prominent alumni which include Bb. Joyce Bernal, Cathy Garcia-Molina, Christine Bersola-Babao, Ely Buendia among others. As it enters its 25th year, the UP Cineastes’ Studio is considered one of the biggest organizations in its home college, the College of Mass Communication. The organization exists to uphold the art of filmmaking and spread its passion to a larger population. It also initiates activities that would elevate the knowledge and craftsmanship in its field of endeavor, and to promote fellowship among film enthusiasts. 	1	UP Film Institute, College of Mass Communication, Plaridel Hall, Ylanan Road, UP Diliman, QC	upcineastesstudio@yahoo.com	diceperez@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
61	20091	1			9			jp_habac@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
61	20101	1			9			jp_habac@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
62	20091	1			9			marius_talampas@yahoo.com	\N	f	\N	f	\N	\N	\N	f
62	20101	1			9			marius_talampas@yahoo.com	\N	f	\N	f	\N	\N	\N	f
63	20091	3	UP CAST	UP CAST is an academic organization based in the College of Mass Communication. It specializes on the field of film and audio-visual communication and provides technical and academic assistance to both film students and film enthusiasts. 	1	College of Mass Communication, University of the Philippines, Diliman Quezon City, 1100	up_cast@yahoo.com	judd_pogi@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
63	20101	1	UP CAST	UP CAST is an academic organization based in the College of Mass Communication. It specializes on the field of film and audio-visual communication and provides technical and academic assistance to both film students and film enthusiasts. 	1	College of Mass Communication, University of the Philippines, Diliman Quezon City, 1100	up_cast@yahoo.com	judd_pogi@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
64	20091	3	UP CIRCA	The UP Circle of Administrators is a duly recognized NCPAG-based, socio-civic organization. UP CIRCA has been continually striving to uphold the principles of academic excellence, social commitment, solidarity and human resource development.True enough, the UP CIRCA has produced individuals who not only proved themselves academically, but also young student leaders who have the heart and passion for genuine public service. The organization is the home of numerous magna cum laude and cum laude graduates of the college as well as student council leaders that were molded by this organization.Emancipated to Empower: UP CIRCA. Bigger. Better. Brighter.	1	Tambayan Complex, National College of Public Administration and Governance, Jacinto St., University of the Philippines Diliman, Quezon City	up.circa@yahoo.com	ross.abelido@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
64	20101	1	UP CIRCA	The UP Circle of Administrators is a duly recognized NCPAG-based, socio-civic organization. UP CIRCA has been continually striving to uphold the principles of academic excellence, social commitment, solidarity and human resource development.True enough, the UP CIRCA has produced individuals who not only proved themselves academically, but also young student leaders who have the heart and passion for genuine public service. The organization is the home of numerous magna cum laude and cum laude graduates of the college as well as student council leaders that were molded by this organization.Emancipated to Empower: UP CIRCA. Bigger. Better. Brighter.	1	Tambayan Complex, National College of Public Administration and Governance, Jacinto St., University of the Philippines Diliman, Quezon City	up.circa@yahoo.com	ross.abelido@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
65	20091	1			9			paolobenitez19@yahoo.com	\N	f	\N	f	\N	\N	\N	f
65	20101	1			9			paolobenitez19@yahoo.com	\N	f	\N	f	\N	\N	\N	f
101	20091	1			9			leurej_1287@yahoo.com	\N	f	\N	f	\N	\N	\N	f
66	20091	2	CE	An entrepreneurial organization that promotes entrepreneurship to its members, UP students and communities.	9	Rm 407B College of Business Administration, University of the Philippines, Diliman, Quezon City	na	june093@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
66	20101	1	CE	An entrepreneurial organization that promotes entrepreneurship to its members, UP students and communities.	9	Rm 407B College of Business Administration, University of the Philippines, Diliman, Quezon City	na	june093@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
67	20091	1			9			honeylane.ante@yahoo.com	\N	f	\N	f	\N	\N	\N	f
67	20101	1			9			honeylane.ante@yahoo.com	\N	f	\N	f	\N	\N	\N	f
68	20091	2	UP CORE	UP CORE is an academic and socio-civic organization for bona fide students of the University of the Philippines Diliman, based in the UP College of Mass Communication.	1	Department of Communication Research, College of Mass Communication, Plaridel Hall, Ylanan Road, UP Diliman, 1101	updcore@gmail.com	mj.bungcayao@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
68	20101	1	UP CORE	UP CORE is an academic and socio-civic organization for bona fide students of the University of the Philippines Diliman, based in the UP College of Mass Communication.	1	Department of Communication Research, College of Mass Communication, Plaridel Hall, Ylanan Road, UP Diliman, 1101	updcore@gmail.com	mj.bungcayao@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
69	20091	1			9			jadecastle27@yahoo.com	\N	f	\N	f	\N	\N	\N	f
69	20101	1			9			jadecastle27@yahoo.com	\N	f	\N	f	\N	\N	\N	f
70	20091	3	UP Club Ecotour	A university-wide student organization that commits itself to integrate the concepts of environmental protection with tourism.	3	Asian Institute of Tourism, Commonwealth Avenue, Quezon City 1101	up.clubecotour@yahoo.com	cpsvillarama@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
70	20101	1	UP Club Ecotour	A university-wide student organization that commits itself to integrate the concepts of environmental protection with tourism.	3	Asian Institute of Tourism, Commonwealth Avenue, Quezon City 1101	up.clubecotour@yahoo.com	cpsvillarama@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
71	20091	2	UP BROAD ASS	The UP-CMC BROADCASTING ASSOCIATION is a non-stock, non-profit student organization of the University of the Philippines Diliman, based in the College of Mass Communication. More popularly known as BROAD ASS, the organization seeks to provide the best hands-on training to future mass communicators through its worthwhile activities.	1	Broadcast Department, College of Mass Communication, University of the Philippines, Diliman, Quezon City, Philippines, 1101	Broadcast Department, College of Mass Communication, University of the Philippines, Diliman, Quezon City, Philippines	dolph_16@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
71	20101	1	UP BROAD ASS	The UP-CMC BROADCASTING ASSOCIATION is a non-stock, non-profit student organization of the University of the Philippines Diliman, based in the College of Mass Communication. More popularly known as BROAD ASS, the organization seeks to provide the best hands-on training to future mass communicators through its worthwhile activities.	1	Broadcast Department, College of Mass Communication, University of the Philippines, Diliman, Quezon City, Philippines, 1101	Broadcast Department, College of Mass Communication, University of the Philippines, Diliman, Quezon City, Philippines	dolph_16@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
72	20091	3	UP CommRes Soc	UP Commucaition Research Society is a goldmine of exceptional commres majors, whose skills and talents ahave remained unparalelled throughtout the organization's 30 years of existence. The organization has created activities that promote, build and maintain academic excellence in the field of communication	1	Plaridel Hall, Ylanan Road, University of the Philippines-Dilman, Quezon City, 1101	upcommressoc1977@yahoo.com	fren_vinerete@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
72	20101	1	UP CommRes Soc	UP Commucaition Research Society is a goldmine of exceptional commres majors, whose skills and talents ahave remained unparalelled throughtout the organization's 30 years of existence. The organization has created activities that promote, build and maintain academic excellence in the field of communication	1	Plaridel Hall, Ylanan Road, University of the Philippines-Dilman, Quezon City, 1101	upcommressoc1977@yahoo.com	fren_vinerete@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
73	20091	1			9			antonioluisdeguzman@yahoo.com	\N	f	\N	f	\N	\N	\N	f
73	20101	1			9			antonioluisdeguzman@yahoo.com	\N	f	\N	f	\N	\N	\N	f
74	20091	1	UP CREED	A non-denominational Christian organization which promotes unity, peace, fellowship and love for the Creator through the arts, sports and culture.	7	#355 AGCOR Bldg., Katipunan Road, Brgy. Loyola Heights, Quezon City	upcreed@gmail.com	jiboyjuego@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
74	20101	1	UP CREED	A non-denominational Christian organization which promotes unity, peace, fellowship and love for the Creator through the arts, sports and culture.	7	#355 AGCOR Bldg., Katipunan Road, Brgy. Loyola Heights, Quezon City	upcreed@gmail.com	jiboyjuego@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
75	20091	2	UP Dance Sport (UP DSS)	UP DanceSport Society is a university-wide organization based on CHK that promotes competitive ballroom dancingwithin and outside the university.	10	Faculty Room 3,College of Human Kinetics, Up Diliman, Quezon City, 1101	updancesport@gmail.com	kathleen_morcilla@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
75	20101	1	UP Dance Sport (UP DSS)	UP DanceSport Society is a university-wide organization based on CHK that promotes competitive ballroom dancingwithin and outside the university.	10	Faculty Room 3,College of Human Kinetics, Up Diliman, Quezon City, 1101	updancesport@gmail.com	kathleen_morcilla@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
76	20091	1			9			zinzitet@yahoo.com	\N	f	\N	f	\N	\N	\N	f
76	20101	1			9			zinzitet@yahoo.com	\N	f	\N	f	\N	\N	\N	f
77	20091	2	UPDS	The official representative of UP Diliman in debate and publc speaking competitions	1	SE 101, UP School of Economics, UP Diliman Campus 1101	updsmembers@yahoogroups.com	annie.anns@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
77	20101	1	UPDS	The official representative of UP Diliman in debate and publc speaking competitions	1	SE 101, UP School of Economics, UP Diliman Campus 1101	updsmembers@yahoogroups.com	annie.anns@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
78	20091	2	UP DLS	The UP Delta Lambda Sigma Sorority aims for academic excellence, leadership and sisterhood. Our activities, e.g. Kids' Day, Anti-Sexual Harassment Campaign, Bar Operations, are all in line with these goals.  Through these actions, UP DLS manifests the power of the Filipina in uplifting the condition of our society.	8	35A Baluyot St, Krus na Ligas, Diliman, Quezon City	UPDLS@yahoogroups.com	timpguanzon@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
78	20101	1	UP DLS	The UP Delta Lambda Sigma Sorority aims for academic excellence, leadership and sisterhood. Our activities, e.g. Kids' Day, Anti-Sexual Harassment Campaign, Bar Operations, are all in line with these goals.  Through these actions, UP DLS manifests the power of the Filipina in uplifting the condition of our society.	8	35A Baluyot St, Krus na Ligas, Diliman, Quezon City	UPDLS@yahoogroups.com	timpguanzon@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
79	20091	1			9			ica_geronimo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
80	20091	3	DCF	Dormitories Christian Fellowship is a religious and dormitory association which believes in the Evangelical Christian teaching. It seeks to unite all Christians in the dorms, share the faith and help the UP community and dorms through outreaches and events.	7	Ipil Residence Hall, UP Diliman, Quezon City 1101	updcf_20@yahoo.com	fotomacder08@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
80	20101	1	DCF	Dormitories Christian Fellowship is a religious and dormitory association which believes in the Evangelical Christian teaching. It seeks to unite all Christians in the dorms, share the faith and help the UP community and dorms through outreaches and events.	7	Ipil Residence Hall, UP Diliman, Quezon City 1101	updcf_20@yahoo.com	fotomacder08@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
81	20091	3	UPDOSTSA	The UP DOST Scholars’ Association is a non-stock, non-profit organization of DOST Scholars in the University of the Philippines, Diliman.  Since 1979, the Association has been actively involved in different activities and programs forwarding its objectives such as to promote science consciousness among the Filipino people, to strive to improve science education in the Philippines, and to enhance the development of every member’s potentials.	1	Room 1, College of Science StudentComplex, Palma Hall, University ofthe Philippines, Diliman, 1101 QuezonCity	updostsa1979@yahoo.com	clostridiumhephaestus@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
81	20101	1	UPDOSTSA	The UP DOST Scholars’ Association is a non-stock, non-profit organization of DOST Scholars in the University of the Philippines, Diliman.  Since 1979, the Association has been actively involved in different activities and programs forwarding its objectives such as to promote science consciousness among the Filipino people, to strive to improve science education in the Philippines, and to enhance the development of every member’s potentials.	1	Room 1, College of Science StudentComplex, Palma Hall, University ofthe Philippines, Diliman, 1101 QuezonCity	updostsa1979@yahoo.com	clostridiumhephaestus@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
82	20091	1			9			akosiluis@yahoo.com	\N	f	\N	f	\N	\N	\N	f
82	20101	1			9			akosiluis@yahoo.com	\N	f	\N	f	\N	\N	\N	f
83	20091	3	DZUP RC	DZUP Radio Circle is a student organization committed to the responsible use of radio as a tool for the promotion of media education and awareness.	1	DZUP 1602 station, 2nd floor Media Center, College of Mass Communication, University of the Philippines, Diliman 1101	dzupradiocircle@yahoo.com	roxannepuy@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
83	20101	1	DZUP RC	DZUP Radio Circle is a student organization committed to the responsible use of radio as a tool for the promotion of media education and awareness.	1	DZUP 1602 station, 2nd floor Media Center, College of Mass Communication, University of the Philippines, Diliman 1101	dzupradiocircle@yahoo.com	roxannepuy@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
84	20091	3	UP ECOSOC, ECOSOC	UP Economics Society is a non-stock, non-profit, socio-civic organization anchored in the provision of free quality education to its six full scholars, cause oriented endeavors to the community and an array of diverse activities geared towards the holistic well-being of its members.	3	Room 121, School of Economics, University of the Philippines Diliman, Quezon City	up_economics_society@yahoogroups.com	ogie_enriquez@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
84	20101	1	UP ECOSOC, ECOSOC	UP Economics Society is a non-stock, non-profit, socio-civic organization anchored in the provision of free quality education to its six full scholars, cause oriented endeavors to the community and an array of diverse activities geared towards the holistic well-being of its members.	3	Room 121, School of Economics, University of the Philippines Diliman, Quezon City	up_economics_society@yahoogroups.com	ogie_enriquez@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
85	20091	3	UP ETC	Being the sole student formation within the University of the Philippines School of Economics carrying an academic-political orientation, the UP Economics Towards Consciousness (UP ETC) has come to serve as an antecedent for active student involvement on issues affecting the student body and the Filipino people at large. It has wielded economics as a tool for issue analysis, keeping a rational mindset rather than an impulsive and prejudiced one.Since 1979, it has been firm on its commitment to advance active politicization, set on the high-principled goal of social change.	1	Room 122, UP School of Economics, Diliman, Quezon City 1101  	up_etc@yahoo.com	gene.herly.delizo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
85	20101	1	UP ETC	Being the sole student formation within the University of the Philippines School of Economics carrying an academic-political orientation, the UP Economics Towards Consciousness (UP ETC) has come to serve as an antecedent for active student involvement on issues affecting the student body and the Filipino people at large. It has wielded economics as a tool for issue analysis, keeping a rational mindset rather than an impulsive and prejudiced one.Since 1979, it has been firm on its commitment to advance active politicization, set on the high-principled goal of social change.	1	Room 122, UP School of Economics, Diliman, Quezon City 1101  	up_etc@yahoo.com	gene.herly.delizo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
86	20091	1			9			mcristina_brandares@yahoo.com	\N	f	\N	f	\N	\N	\N	f
86	20101	1			9			mcristina_brandares@yahoo.com	\N	f	\N	f	\N	\N	\N	f
87	20091	3	UP EdCirc	UP Educators' Circle is an academic organization which is socio-civic in nature.Now, on its 22nd year, the organization continues to champion the interests of its constituents and to conduct service projects for the advancement of education in the country in line with the university's goals and aspirations.	1	1st Floor Left Wing, College of Education, University of the Philippines, Diliman, Quezon City,1101	UP_EdCirc@yahoogroups.com	ignovion_24@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
87	20101	1	UP EdCirc	UP Educators' Circle is an academic organization which is socio-civic in nature.Now, on its 22nd year, the organization continues to champion the interests of its constituents and to conduct service projects for the advancement of education in the country in line with the university's goals and aspirations.	1	1st Floor Left Wing, College of Education, University of the Philippines, Diliman, Quezon City,1101	UP_EdCirc@yahoogroups.com	ignovion_24@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
88	20091	1			9			karen@up-erg.org	\N	f	\N	f	\N	\N	\N	f
88	20101	1			9			karen@up-erg.org	\N	f	\N	f	\N	\N	\N	f
89	20091	1			9			mcdejesus3@gmail.com	\N	f	\N	f	\N	\N	\N	f
89	20101	1			9			mcdejesus3@gmail.com	\N	f	\N	f	\N	\N	\N	f
90	20091	1			9			jptnavarro@yahoo.com	\N	f	\N	f	\N	\N	\N	f
90	20101	1			9			jptnavarro@yahoo.com	\N	f	\N	f	\N	\N	\N	f
91	20091	1			9			searf05a@yahoo.com	\N	f	\N	f	\N	\N	\N	f
91	20101	1			9			searf05a@yahoo.com	\N	f	\N	f	\N	\N	\N	f
101	20101	1			9			leurej_1287@yahoo.com	\N	f	\N	f	\N	\N	\N	f
102	20091	1			9			derricknidar@gmail.com	\N	f	\N	f	\N	\N	\N	f
102	20101	1			9			derricknidar@gmail.com	\N	f	\N	f	\N	\N	\N	f
103	20091	1			9			ken.aracan@gmail.com	\N	f	\N	f	\N	\N	\N	f
103	20101	1			9			ken.aracan@gmail.com	\N	f	\N	f	\N	\N	\N	f
104	20091	1			9			bea_canto@yahoo.com	\N	f	\N	f	\N	\N	\N	f
92	20091	2	UP EURO	The UP Euro-Filipino Understanding and Relations Organization (UP EURO) is a duly recognized university-wide student organization based in the Department of European Languages of the College of Arts Letters of the University of the Philippines Diliman. It caters to the interests of Filipino students who envision a mutually beneficial common future between the Philippines and Europe.Since its establishment in 2002, it has constantly produced projects, events and activities both inside and outside the University which are in accordance with its vision, mission and objectives.	9	Department of European Languages, College of Arts and Letters, University of the Philippines Diliman, 1101 Quezon City	eurofilipino@gmail.com	kram_oed88@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
92	20101	1	UP EURO	The UP Euro-Filipino Understanding and Relations Organization (UP EURO) is a duly recognized university-wide student organization based in the Department of European Languages of the College of Arts Letters of the University of the Philippines Diliman. It caters to the interests of Filipino students who envision a mutually beneficial common future between the Philippines and Europe.Since its establishment in 2002, it has constantly produced projects, events and activities both inside and outside the University which are in accordance with its vision, mission and objectives.	9	Department of European Languages, College of Arts and Letters, University of the Philippines Diliman, 1101 Quezon City	eurofilipino@gmail.com	kram_oed88@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
93	20091	3	ENCM UP	ENCM UP is a Chrisitan leadership - development organization that exists to prepare students for L.I.F.E. Leadership. Integrity. Faith in Jesus. Excellence.	7	Vinzons Hill, Tambayan Complex, UP Diliman, Quezon City 1101	encm_updiliman@yahoo.com	jan.reynold.agustin@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
93	20101	1	ENCM UP	ENCM UP is a Chrisitan leadership - development organization that exists to prepare students for L.I.F.E. Leadership. Integrity. Faith in Jesus. Excellence.	7	Vinzons Hill, Tambayan Complex, UP Diliman, Quezon City 1101	encm_updiliman@yahoo.com	jan.reynold.agustin@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
94	20091	3	ExL UP	A university-wide organization of book-lovers dedicated to promoting literacy and the love of books.	9	c/o Ms. Catherine Lourdes DyDepartment of English and Comparative LiteratureCollege of Arts and LettersUniversity of the Philippines Diliman, Quezon City 1101	exlibrisup@gmail.com	gabriela.rood@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
94	20101	1	ExL UP	A university-wide organization of book-lovers dedicated to promoting literacy and the love of books.	9	c/o Ms. Catherine Lourdes DyDepartment of English and Comparative LiteratureCollege of Arts and LettersUniversity of the Philippines Diliman, Quezon City 1101	exlibrisup@gmail.com	gabriela.rood@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
95	20091	1			9			lorraine_014@yahoo.com	\N	f	\N	f	\N	\N	\N	f
95	20101	1			9			lorraine_014@yahoo.com	\N	f	\N	f	\N	\N	\N	f
96	20091	3	UPFC	The UP Fencing Club is a non-stock, non-profit sports and recreation organization whose objectives are to strive to create a broader awareness of fencing as a sport and to serve as a support group and training pool for the UP Fencing Team	10	11 Tasaday St., La Vista Subdivision Katipunan Q.C. 1105	upfencing@yahoo.com/ upfencingclub@yahoo.com	rina_gianelli@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
96	20101	1	UPFC	The UP Fencing Club is a non-stock, non-profit sports and recreation organization whose objectives are to strive to create a broader awareness of fencing as a sport and to serve as a support group and training pool for the UP Fencing Team	10	11 Tasaday St., La Vista Subdivision Katipunan Q.C. 1105	upfencing@yahoo.com/ upfencingclub@yahoo.com	rina_gianelli@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
97	20091	1			9			adj1202@yahoo.com	\N	f	\N	f	\N	\N	\N	f
97	20101	1			9			adj1202@yahoo.com	\N	f	\N	f	\N	\N	\N	f
98	20091	1	UP FC Sikad	FC Sikad is a Philippine-based soccer organization, currently recognized in the University of the Philippines.The Club aims to promote the game soccer/football and advocate the importance of good health, sportsmanship and camaraderie among its members and to the rest of the country, especially the youth. It also envisions to not only be a club which trains its members for tournaments, but be a haven for all soccer afficionados, and a second family concerned for the welfare of its members. \r\nMembers meet during Mondays, Wednesdays and Saturdays 4pm to 7pm at the UP Sunken Garden. Membership recruitment is on-going and open for all soccer enthusiasts, those who want to train as players or just be part of the club as non-training members. Males and Females, 15 years old and above, students and professionals are all welcome to join. You must be able to attend training (refer to schedule) and accomplish the application process set by the club to be eligible for membership.	10	No.18 Road 7 Pag-Asa, Quezon City (c/o Carl Somera)	fcsikad@yahoo.com	ken_russ07@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
98	20101	1	UP FC Sikad	FC Sikad is a Philippine-based soccer organization, currently recognized in the University of the Philippines.The Club aims to promote the game soccer/football and advocate the importance of good health, sportsmanship and camaraderie among its members and to the rest of the country, especially the youth. It also envisions to not only be a club which trains its members for tournaments, but be a haven for all soccer afficionados, and a second family concerned for the welfare of its members. \r\nMembers meet during Mondays, Wednesdays and Saturdays 4pm to 7pm at the UP Sunken Garden. Membership recruitment is on-going and open for all soccer enthusiasts, those who want to train as players or just be part of the club as non-training members. Males and Females, 15 years old and above, students and professionals are all welcome to join. You must be able to attend training (refer to schedule) and accomplish the application process set by the club to be eligible for membership.	10	No.18 Road 7 Pag-Asa, Quezon City (c/o Carl Somera)	fcsikad@yahoo.com	ken_russ07@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
99	20091	3	UP FLIPP	UPFLIPP is a socio-academic organization of the University of the Philippines-Diliman based at the School of Library and Information Studies. It strives to uphold its stake in the promotion and development of the library and information science profession as students of LIS in the Philippines.	1	3rd floor Gonzalez Hall, University of the Philippines, Diliman, Quezon City 1101	flippredoma@yahoo.com	kelvin.samson@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
99	20101	1	UP FLIPP	UPFLIPP is a socio-academic organization of the University of the Philippines-Diliman based at the School of Library and Information Studies. It strives to uphold its stake in the promotion and development of the library and information science profession as students of LIS in the Philippines.	1	3rd floor Gonzalez Hall, University of the Philippines, Diliman, Quezon City 1101	flippredoma@yahoo.com	kelvin.samson@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
100	20091	1	GAB-UPD	GAB-UPD is an organization that upholds women's rights and gender equality inside and outside the University.	9	Rm 104A Vinzons hall, Diliman, QC	gyupdiliman@yahoo.com	narcisse.salazar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
100	20101	1	GAB-UPD	GAB-UPD is an organization that upholds women's rights and gender equality inside and outside the University.	9	Rm 104A Vinzons hall, Diliman, QC	gyupdiliman@yahoo.com	narcisse.salazar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
106	20091	2	UPGL	\tThe UP Green League (UPGL) is a non-profit, non-sectarian, non-partisan organization composed of concerned young individuals who advocate environmentalism as a way of life. UPGL aims to protect, restore, and conserve the natural environment through information dissemination campaigns and by promoting a PRO-ACTIVE consciousness regarding the present state of both local and global environment.	3	UP Solid Waste Management Training Center, Balagtas St., UP Diliman, QC 1100	upgreenleagueinc@yahoo.com	marlourd@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
106	20101	1	UPGL	\tThe UP Green League (UPGL) is a non-profit, non-sectarian, non-partisan organization composed of concerned young individuals who advocate environmentalism as a way of life. UPGL aims to protect, restore, and conserve the natural environment through information dissemination campaigns and by promoting a PRO-ACTIVE consciousness regarding the present state of both local and global environment.	3	UP Solid Waste Management Training Center, Balagtas St., UP Diliman, QC 1100	upgreenleagueinc@yahoo.com	marlourd@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
107	20091	1			9			blueleedunk@yahoo.com	\N	f	\N	f	\N	\N	\N	f
107	20101	1			9			blueleedunk@yahoo.com	\N	f	\N	f	\N	\N	\N	f
108	20091	2	GRIP, GRIP UP	GRIP is the only sport climbing organization in the University of the Philippines. It aims to introduce the sport to students in the University.	10	31 Caroline St., Pleasant View Subd., Tandang Sora, Q.C. 1107	gripup@yahoo.com	jobayani@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
108	20101	1	GRIP, GRIP UP	GRIP is the only sport climbing organization in the University of the Philippines. It aims to introduce the sport to students in the University.	10	31 Caroline St., Pleasant View Subd., Tandang Sora, Q.C. 1107	gripup@yahoo.com	jobayani@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
109	20091	1			9			youaremyblackhole@yahoo.com	\N	f	\N	f	\N	\N	\N	f
109	20101	1			9			youaremyblackhole@yahoo.com	\N	f	\N	f	\N	\N	\N	f
110	20091	3	UPHI	UP Haring Ibon is an environmental organization based in the College of Science. Since its foundation, it has been the organization's objective to promote environmental awareness among the different members of the UP community through its activities such as birdwatching, university clean-up drives, environmental workshops, and many others.	3	CS Complex, AS Walk, Palma Hall, UP Diliman, Quezon City 1101	up_haringibon@yahoo.com	ella.lama@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
110	20101	1	UPHI	UP Haring Ibon is an environmental organization based in the College of Science. Since its foundation, it has been the organization's objective to promote environmental awareness among the different members of the UP community through its activities such as birdwatching, university clean-up drives, environmental workshops, and many others.	3	CS Complex, AS Walk, Palma Hall, UP Diliman, Quezon City 1101	up_haringibon@yahoo.com	ella.lama@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
111	20091	3	UP HARONG	UP Harong is a non-stock, non-profit provincial organization, which is social and civic in anture, composed of students coming from Camarines Sur and the cities of Naga and Iriga.	6	Unit 410, #1245, P.Tuazon, Cubao, Quezon City	upharong_inc@yahoo.com	drarcilla@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
111	20101	1	UP HARONG	UP Harong is a non-stock, non-profit provincial organization, which is social and civic in anture, composed of students coming from Camarines Sur and the cities of Naga and Iriga.	6	Unit 410, #1245, P.Tuazon, Cubao, Quezon City	upharong_inc@yahoo.com	drarcilla@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
112	20091	1			9			fren_vinerete@yahoo.com	\N	f	\N	f	\N	\N	\N	f
112	20101	1			9			fren_vinerete@yahoo.com	\N	f	\N	f	\N	\N	\N	f
113	20091	2	UP HGC	The UP Hobby Gamers' Circle is a special interest organization catering to hobby gamers of collectible card games, table top games and computer games alike.	9	IA-8 Francesca tower, Sct Boromeo, EDSA, Quezon city (1103)	upd.hgc@gmail.com	juabeinciong@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
113	20101	1	UP HGC	The UP Hobby Gamers' Circle is a special interest organization catering to hobby gamers of collectible card games, table top games and computer games alike.	9	IA-8 Francesca tower, Sct Boromeo, EDSA, Quezon city (1103)	upd.hgc@gmail.com	juabeinciong@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
114	20091	3	HIMA, Hubeag	UP HIMA is a duly recognized provincial organization based on the University of the Philippines, Diliman, aims to promote the consciousness of Aklanon heritage and ideals and to provide Aklanon students inside and outside the university a venue for their social and intellectual endeavors.	1	1101	up_hubeag@yahoo.com	cranberry442002@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
114	20101	1	HIMA, Hubeag	UP HIMA is a duly recognized provincial organization based on the University of the Philippines, Diliman, aims to promote the consciousness of Aklanon heritage and ideals and to provide Aklanon students inside and outside the university a venue for their social and intellectual endeavors.	1	1101	up_hubeag@yahoo.com	cranberry442002@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
115	20091	3	UP IBALON	The UP Ibalon is a socio-cultural organization of Bicolano students in the university.  It has been part of various campus wide activities in the UP community.  This is our way of harnessing the efforts of the Bicolanos studying in UP with the objective of making relevant and positive contributions to UP.	6	Lorena Barros Hall, Vinzons Hill, University of the Philippines, Diliman, Quezon City, 1101	up_ibalon@yahoo.com	felicitous_coralyn@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
115	20101	1	UP IBALON	The UP Ibalon is a socio-cultural organization of Bicolano students in the university.  It has been part of various campus wide activities in the UP community.  This is our way of harnessing the efforts of the Bicolanos studying in UP with the objective of making relevant and positive contributions to UP.	6	Lorena Barros Hall, Vinzons Hill, University of the Philippines, Diliman, Quezon City, 1101	up_ibalon@yahoo.com	felicitous_coralyn@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
116	20091	3	UP ICTUS	UP In-Christ Thrust for University Students (UP ICTUS) is a non-stock, non-profit, religious and socio-civic student organization. We provide weekly play therapy in Philippine Children's Medical Center (PCMC), daily tutorials and weekly Catechism classes at Balara Elementary School, and literacy programs at the Payatas Relocation site in Bagong Silangan. We also support seven scholars, six of whom are in tertiary levels and one in the High School level.	4	Parish of the Holy Sacrifice Compound,University of the PhilippinesDiliman, Quezon City 1101	upictus@yahoogroups.com	juliancanita@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
116	20101	1	UP ICTUS	UP In-Christ Thrust for University Students (UP ICTUS) is a non-stock, non-profit, religious and socio-civic student organization. We provide weekly play therapy in Philippine Children's Medical Center (PCMC), daily tutorials and weekly Catechism classes at Balara Elementary School, and literacy programs at the Payatas Relocation site in Bagong Silangan. We also support seven scholars, six of whom are in tertiary levels and one in the High School level.	4	Parish of the Holy Sacrifice Compound,University of the PhilippinesDiliman, Quezon City 1101	upictus@yahoogroups.com	juliancanita@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
222	20091	1			9			titus_ck@yahoo.com	\N	f	\N	f	\N	\N	\N	f
117	20091	2	ISA	ISA is an organization dedicated to focused leadership that is realistic, practical and ultimately, for the greater service of the students. Its vision is encapsulated by four pillars: volunteerism, development of oneself through self-expression, open-mindedness, and alternative activism	3	Plaridel Hall, College of Mass Communication, University of the Philippines Diliman, Quezon City 1101	isa.parasaisangcmc@gmail.com	majalya@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
117	20101	1	ISA	ISA is an organization dedicated to focused leadership that is realistic, practical and ultimately, for the greater service of the students. Its vision is encapsulated by four pillars: volunteerism, development of oneself through self-expression, open-mindedness, and alternative activism	3	Plaridel Hall, College of Mass Communication, University of the Philippines Diliman, Quezon City 1101	isa.parasaisangcmc@gmail.com	majalya@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
118	20091	1			9			dinroz_81088@yahoo.com	\N	f	\N	f	\N	\N	\N	f
118	20101	1			9			dinroz_81088@yahoo.com	\N	f	\N	f	\N	\N	\N	f
119	20091	1			9			giannabanson@gmail.com	\N	f	\N	f	\N	\N	\N	f
119	20101	1			9			giannabanson@gmail.com	\N	f	\N	f	\N	\N	\N	f
120	20091	1			9			getzschoo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
120	20101	1			9			getzschoo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
121	20091	1			9			drmalabanan@up.edu.ph	\N	f	\N	f	\N	\N	\N	f
121	20101	1			9			drmalabanan@up.edu.ph	\N	f	\N	f	\N	\N	\N	f
122	20091	2	ICUP	The International Club of UP is a duly recognized university-wide student organization composed of both Filipino and international students from the University of the Philippines, Diliman. Recognized since 1956, we have been dedicated in promoting intercultural awareness and exchange. As a group embedded in such nature, we continuously put an effort in bringing local and foreign students together to provide a venue for cultural interactions. 	9	Vinzons Hall, Room 210University of the PhilippinesDiliman, Quezon City 1101	theicup@yahoo.com	roann_b@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
122	20101	1	ICUP	The International Club of UP is a duly recognized university-wide student organization composed of both Filipino and international students from the University of the Philippines, Diliman. Recognized since 1956, we have been dedicated in promoting intercultural awareness and exchange. As a group embedded in such nature, we continuously put an effort in bringing local and foreign students together to provide a venue for cultural interactions. 	9	Vinzons Hall, Room 210University of the PhilippinesDiliman, Quezon City 1101	theicup@yahoo.com	roann_b@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
123	20091	3	UP IBA	UP IBA is a university wide organization based in the College of Business Administration.  In continuing its thrust, "Social Responsibility through Business Excellence," we advocate worthwhile and meaningful projects that strive to benefit  society as to inculcate a sense of social obligation in the business training of its members.	1	405-B College of Business Administration, UP Diliman, Quezon City 1101	upibainc@yahoo.com	claire.fajardo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
123	20101	1	UP IBA	UP IBA is a university wide organization based in the College of Business Administration.  In continuing its thrust, "Social Responsibility through Business Excellence," we advocate worthwhile and meaningful projects that strive to benefit  society as to inculcate a sense of social obligation in the business training of its members.	1	405-B College of Business Administration, UP Diliman, Quezon City 1101	upibainc@yahoo.com	claire.fajardo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
124	20091	1			9			fritzykinz99@yahoo.com	\N	f	\N	f	\N	\N	\N	f
124	20101	1			9			fritzykinz99@yahoo.com	\N	f	\N	f	\N	\N	\N	f
125	20091	1			9			ryan_soguilon@yahoo.com	\N	f	\N	f	\N	\N	\N	f
125	20101	1			9			ryan_soguilon@yahoo.com	\N	f	\N	f	\N	\N	\N	f
126	20091	1			9			wigsterdam_7000@yahoo.com	\N	f	\N	f	\N	\N	\N	f
126	20101	1			9			wigsterdam_7000@yahoo.com	\N	f	\N	f	\N	\N	\N	f
127	20091	1			9			janelle_navarra@yahoo.com	\N	f	\N	f	\N	\N	\N	f
127	20101	1			9			janelle_navarra@yahoo.com	\N	f	\N	f	\N	\N	\N	f
128	20091	3	UP Journalism Club, UPJC, UP Jou	The UP Journalism Club is an academic organization established in 1954 at College of Arts and Sciences. It has since been upholding its tradition of critical thought and action.	1	Plaridel Hall, Ylanan Road, UP Diliman, Quezon City, 1101	upjc0910@yahoogroups.com, upjc0910@yahoo.com	jmantiquerra@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
128	20101	1	UP Journalism Club, UPJC, UP Jou	The UP Journalism Club is an academic organization established in 1954 at College of Arts and Sciences. It has since been upholding its tradition of critical thought and action.	1	Plaridel Hall, Ylanan Road, UP Diliman, Quezon City, 1101	upjc0910@yahoogroups.com, upjc0910@yahoo.com	jmantiquerra@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
129	20091	2	UP JC	The University of the Philippines Judo Club (UP Judo Club)is composed of students on the various colleges of the university interested in practicing judo. It aims to promote judo as a sport, as a discipline, and as a gentle art of self-defense.	10	College of Human Kinetics, UP Diliman Campus, Diliman Quezon City 1101	upjudoclub@yahoo.com	drien_47ra@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
129	20101	1	UP JC	The University of the Philippines Judo Club (UP Judo Club)is composed of students on the various colleges of the university interested in practicing judo. It aims to promote judo as a sport, as a discipline, and as a gentle art of self-defense.	10	College of Human Kinetics, UP Diliman Campus, Diliman Quezon City 1101	upjudoclub@yahoo.com	drien_47ra@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
130	20091	1			9			peter_anime11@yahoo.com	\N	f	\N	f	\N	\N	\N	f
130	20101	1			9			peter_anime11@yahoo.com	\N	f	\N	f	\N	\N	\N	f
131	20091	1	UP JMA	UP JMA is proudly a two-time winner of the Gawad Chancellor Award for Most Outstanding Student Organization in UP Diliman in 1996 and 2003, the 2004, 2005 and 2006 Agora Youth Awardee for Best Student Marketing Organization, and the 2003 Philippine Ad Congress’ Metro-wide Ad Making Contest Champion.\r\nHistory\r\nFounded in 1958 by an informal group of 20 marketing majors, UP JMA has grown into an association of 200 members coming from various colleges and academic disciplines.\r\nUP JMA is a proud affiliate of the prestigious Philippine Marketing Association (PMA). UP JMA is also an active member and staunch supporter of the Philippine Junior Marketing Association (PJMA).\r\nThrusts\r\nACADEMICS To supplement the student’s classroom theoretical experience with exposure to actual business and professional experiences.\r\nSOCIALS To develop the student along lines acceptable and common to others.\r\nSERVICE To open the student’s mind to the dimension of community problems and provides the opportunity to find solutions to them.\r\nSPORTS To develop the student physically, so he or she will be more equipped to face the working world with a stronger mind and body.\r\n\r\nOBJECTIVES\r\nto promote the significance of marketing\r\nto provide training for future business activities\r\nto create venues for interaction between the faculty, the students, the alumni, and the public\r\nto contribute to the welfare and the development of the country\r\n	1	4th Floor, College of Business Administration, UP Diliman, Quezon City	upjmaexecom@yahoo.com	carlos_g_lazo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
131	20101	1	UP JMA	UP JMA is proudly a two-time winner of the Gawad Chancellor Award for Most Outstanding Student Organization in UP Diliman in 1996 and 2003, the 2004, 2005 and 2006 Agora Youth Awardee for Best Student Marketing Organization, and the 2003 Philippine Ad Congress’ Metro-wide Ad Making Contest Champion.\r\nHistory\r\nFounded in 1958 by an informal group of 20 marketing majors, UP JMA has grown into an association of 200 members coming from various colleges and academic disciplines.\r\nUP JMA is a proud affiliate of the prestigious Philippine Marketing Association (PMA). UP JMA is also an active member and staunch supporter of the Philippine Junior Marketing Association (PJMA).\r\nThrusts\r\nACADEMICS To supplement the student’s classroom theoretical experience with exposure to actual business and professional experiences.\r\nSOCIALS To develop the student along lines acceptable and common to others.\r\nSERVICE To open the student’s mind to the dimension of community problems and provides the opportunity to find solutions to them.\r\nSPORTS To develop the student physically, so he or she will be more equipped to face the working world with a stronger mind and body.\r\n\r\nOBJECTIVES\r\nto promote the significance of marketing\r\nto provide training for future business activities\r\nto create venues for interaction between the faculty, the students, the alumni, and the public\r\nto contribute to the welfare and the development of the country\r\n	1	4th Floor, College of Business Administration, UP Diliman, Quezon City	upjmaexecom@yahoo.com	carlos_g_lazo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
132	20091	1			9			cess_keil@yahoo.com	\N	f	\N	f	\N	\N	\N	f
132	20101	1			9			cess_keil@yahoo.com	\N	f	\N	f	\N	\N	\N	f
133	20091	3	JPIA	UP JPIA is an academic organization that aims to promote a high standard of competence among accountancy students, to develop civic consciousness and discipline among its members, and to foster a more cordial relationship and maintain better communication among students in and outside the university through initiation and operation of student projects.	1	Rm. 406 College of Business Administration, UP-Diliman, Diliman, Quezon City, 1101	up_jpia@yahoogroups.com	diana.a.fernandez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
133	20101	1	JPIA	UP JPIA is an academic organization that aims to promote a high standard of competence among accountancy students, to develop civic consciousness and discipline among its members, and to foster a more cordial relationship and maintain better communication among students in and outside the university through initiation and operation of student projects.	1	Rm. 406 College of Business Administration, UP-Diliman, Diliman, Quezon City, 1101	up_jpia@yahoogroups.com	diana.a.fernandez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
134	20091	1			9			jabby_anne@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
134	20101	1			9			jabby_anne@yahoo.com.ph	\N	f	\N	f	\N	\N	\N	f
135	20091	1	KKK	KKK is an organization of dynamic and passionate Filipino youth and students actively involved in th fight against poverty, the struggle for social justice and the advancement of democratic rights.	3	55-P, Kamias Road Brgy. Pinyahan, Quezon City	kabataankontrakahirapan@yahoo.com	andreycomia@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
135	20101	1	KKK	KKK is an organization of dynamic and passionate Filipino youth and students actively involved in th fight against poverty, the struggle for social justice and the advancement of democratic rights.	3	55-P, Kamias Road Brgy. Pinyahan, Quezon City	kabataankontrakahirapan@yahoo.com	andreycomia@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
136	20091	1			9			joshduldulao@yahoo.com	\N	f	\N	f	\N	\N	\N	f
136	20101	1			9			joshduldulao@yahoo.com	\N	f	\N	f	\N	\N	\N	f
137	20091	1	UPKB	A university-based provincial organization of students coming from the province of Bohol who are presently staying at UP Diliman. It seeks to promote the welfare and development of its members, the university, the province of Bohol and its culture, and the country.	6	A7 Vinzon's Hill Tambayan Complex University of the Philippines Diliman1101	upkbdiliman@yahoo.com	jvalid@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
137	20101	1	UPKB	A university-based provincial organization of students coming from the province of Bohol who are presently staying at UP Diliman. It seeks to promote the welfare and development of its members, the university, the province of Bohol and its culture, and the country.	6	A7 Vinzon's Hill Tambayan Complex University of the Philippines Diliman1101	upkbdiliman@yahoo.com	jvalid@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
138	20091	2	UPK	The University of the Philippines Kagayhaan is a university-wide, socio-civic student organization comprised of Kagay-anons currently studying in UP Diliman. 	6	Quezon City, 1101	upk_09_10@yahoogroups.com	lou.macabodbod@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
138	20101	1	UPK	The University of the Philippines Kagayhaan is a university-wide, socio-civic student organization comprised of Kagay-anons currently studying in UP Diliman. 	6	Quezon City, 1101	upk_09_10@yahoogroups.com	lou.macabodbod@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
139	20091	1	KAISA UPD	KAISA is a progressive political party and dynamic student formation that envisions itself as an agent of social change through competent student leadership, proactive political action and effective social involvement. Through campaigns, services and activities, KAISA aims to promote and protect the rights and welfare of the students, and to provide them fresh and relevant avenues for participation in the community.	2	33 Ma. Dizon St. Gloria Heights, Antipolo City 1870	upd.kaisa@gmail.com	ldclemente@upd.edu.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
139	20101	1	KAISA UPD	KAISA is a progressive political party and dynamic student formation that envisions itself as an agent of social change through competent student leadership, proactive political action and effective social involvement. Through campaigns, services and activities, KAISA aims to promote and protect the rights and welfare of the students, and to provide them fresh and relevant avenues for participation in the community.	2	33 Ma. Dizon St. Gloria Heights, Antipolo City 1870	upd.kaisa@gmail.com	ldclemente@upd.edu.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
140	20091	3	n/a	UP Kalilayan is a socio-cultural provincial organization composed of students hailing from the provinces of Quezon and Aurora. Now on its 34th year, it continues to promote projects to benefit the people of the two provinces while providing a venue for leadership and excellence to its members. It is also an active participant in projects inside the university. 	6	East Wing, Middle Kiosk, Palma Hall, UP Diliman, Diliman, Quezon City, 1101	upkalilayan@yahoo.com	butsoyr@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
140	20101	1	n/a	UP Kalilayan is a socio-cultural provincial organization composed of students hailing from the provinces of Quezon and Aurora. Now on its 34th year, it continues to promote projects to benefit the people of the two provinces while providing a venue for leadership and excellence to its members. It is also an active participant in projects inside the university. 	6	East Wing, Middle Kiosk, Palma Hall, UP Diliman, Diliman, Quezon City, 1101	upkalilayan@yahoo.com	butsoyr@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
151	20101	1	N/A	University-wide, provincial organization of UP Diliman students hailing from the province of Laguna.	6	104 P. Valenzuela st., Area 2, UP Campus, Diliman, Quezon City, 1101	up.lagunense@yahoo.coim	ellen_psych@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
141	20091	2	UP KAISA	UP KAISA is a socio-cultural organization that upholds and promotes the Isabelino culture and identity among UP students who are from Isabela or who have roots in Isabela and among the Isabelino youth. 	6	No.6, Purok II, Alibagu, Ilagan, Isabela. 3300	up-kaisa@yahoogroups.com	fernandobayad@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
141	20101	1	UP KAISA	UP KAISA is a socio-cultural organization that upholds and promotes the Isabelino culture and identity among UP students who are from Isabela or who have roots in Isabela and among the Isabelino youth. 	6	No.6, Purok II, Alibagu, Ilagan, Isabela. 3300	up-kaisa@yahoogroups.com	fernandobayad@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
142	20091	1			9			regine_joy.magabo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
142	20101	1			9			regine_joy.magabo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
143	20091	3	UPK 	A non-partisan regional organization with the thrust of promoting social awareness, academic excellence, civic-mindedness and camaraderie among UP students from Oriental and Occidental Mindoro.	6	B7 Tambayan Complex Vinzons Hall, UP Diliman, Quezon City 1101	upkfiles@yahoo.com	ralph_vince15@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
143	20101	1	UPK 	A non-partisan regional organization with the thrust of promoting social awareness, academic excellence, civic-mindedness and camaraderie among UP students from Oriental and Occidental Mindoro.	6	B7 Tambayan Complex Vinzons Hall, UP Diliman, Quezon City 1101	upkfiles@yahoo.com	ralph_vince15@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
144	20091	1			9			thorheaven@gmail.com	\N	f	\N	f	\N	\N	\N	f
144	20101	1			9			thorheaven@gmail.com	\N	f	\N	f	\N	\N	\N	f
145	20091	3	UPK	UP Kasimanwa is the only provincial organization of students from the province of Romblon which aims to unite all Romblomanon students in the university and promote the culture and identity of Romblon.	6	59 Mapagkawanggawa St. Teacher's Village, Diliman, Quezon City 1101	upkasimanwa_09@yahoogroups.com	kidz_work@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
145	20101	1	UPK	UP Kasimanwa is the only provincial organization of students from the province of Romblon which aims to unite all Romblomanon students in the university and promote the culture and identity of Romblon.	6	59 Mapagkawanggawa St. Teacher's Village, Diliman, Quezon City 1101	upkasimanwa_09@yahoogroups.com	kidz_work@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
146	20091	2	UPKAS	Ang UP Katipunan ng mga Mananalaysay ng Bayan o UP KASAYSAYAN ay isang pang-akademikong organisasyon na itinatag noong Pebrero 24, 2007. Itinatag ito ng mga mag-aaral ng Unibersidad ng Pilipinas Diliman mula sa iba’t ibang disiplina na may hindi matatawarang pagmamahal sa Kasaysayan. Nilalayon ng organisasyon na itaguyod ang Kasaysayan bilang isang mahalagang disiplina at agham panlipunan kaakibat ang iba’t ibang akademikong larangan. Kinikilala ng organisasyon ang lahat ng pag-aaral at ang kakanyahan ng lahat ng nag-aaral at nagmamahal sa Kasaysayan upang pagyamanin ang disiplina sa pamamagitan ng bukas at malayang diskurso. Naniniwala ang organisasyon na ang mga bukas at malalayang diskursong ilulunsad nito ay magsisilbing lunduyan ng palitan ng mga ideya, pananaw, konsepto at kaisipan na ang pangunahing layunin ay ang mapalalim at mapaunlad ang pag-unawa at pag-aaral ng Kasaysayan. Kaalinsabay nang pagiging bukas at malaya nito sa iba’t ibang kaisipan na naglalayong mapaunlad ang disiplina ng Kasaysayan, kailangan maisabuhay ang paggalang at pagrespeto sa indibidwal na pagsusuri at paniniwala ng bawat kasapi. Naniniwala rin ang organisasyon na hindi hadlang ang lahi, kulay, relihiyon o etnisidad sa pagpapalalim, pagpapalawak at pagpapaunlad ng pag-unawa at pag-aaral ng Kasaysayan ng bawat bansa, bayan, komunidad at sektor ng lipunan. Kinikilala rin ng UP KASAYSAYAN ang mahalagang papel ng Kasaysayan sa paghubog ng pambansang pagkakakilanlan at kamalayan.	1	ipil residence hall, UP Diliman, Quezon City c/o Frederick Macale, 1101	famacale_09@yahoo.com	yzaseph23@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
146	20101	1	UPKAS	Ang UP Katipunan ng mga Mananalaysay ng Bayan o UP KASAYSAYAN ay isang pang-akademikong organisasyon na itinatag noong Pebrero 24, 2007. Itinatag ito ng mga mag-aaral ng Unibersidad ng Pilipinas Diliman mula sa iba’t ibang disiplina na may hindi matatawarang pagmamahal sa Kasaysayan. Nilalayon ng organisasyon na itaguyod ang Kasaysayan bilang isang mahalagang disiplina at agham panlipunan kaakibat ang iba’t ibang akademikong larangan. Kinikilala ng organisasyon ang lahat ng pag-aaral at ang kakanyahan ng lahat ng nag-aaral at nagmamahal sa Kasaysayan upang pagyamanin ang disiplina sa pamamagitan ng bukas at malayang diskurso. Naniniwala ang organisasyon na ang mga bukas at malalayang diskursong ilulunsad nito ay magsisilbing lunduyan ng palitan ng mga ideya, pananaw, konsepto at kaisipan na ang pangunahing layunin ay ang mapalalim at mapaunlad ang pag-unawa at pag-aaral ng Kasaysayan. Kaalinsabay nang pagiging bukas at malaya nito sa iba’t ibang kaisipan na naglalayong mapaunlad ang disiplina ng Kasaysayan, kailangan maisabuhay ang paggalang at pagrespeto sa indibidwal na pagsusuri at paniniwala ng bawat kasapi. Naniniwala rin ang organisasyon na hindi hadlang ang lahi, kulay, relihiyon o etnisidad sa pagpapalalim, pagpapalawak at pagpapaunlad ng pag-unawa at pag-aaral ng Kasaysayan ng bawat bansa, bayan, komunidad at sektor ng lipunan. Kinikilala rin ng UP KASAYSAYAN ang mahalagang papel ng Kasaysayan sa paghubog ng pambansang pagkakakilanlan at kamalayan.	1	ipil residence hall, UP Diliman, Quezon City c/o Frederick Macale, 1101	famacale_09@yahoo.com	yzaseph23@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
147	20091	1			9			jongsuk_ham@yahoo.com	\N	f	\N	f	\N	\N	\N	f
147	20101	1			9			jongsuk_ham@yahoo.com	\N	f	\N	f	\N	\N	\N	f
148	20091	1			9			venice_rhea_0410@yahoo.com	\N	f	\N	f	\N	\N	\N	f
148	20101	1			9			venice_rhea_0410@yahoo.com	\N	f	\N	f	\N	\N	\N	f
149	20091	1			9			davidjonathangarcia@yahoo.com	\N	f	\N	f	\N	\N	\N	f
149	20101	1			9			davidjonathangarcia@yahoo.com	\N	f	\N	f	\N	\N	\N	f
150	20091	3	UP Kustura	The UP Kustura is a socio-cultural organization comprising of college students from the University of the Philippines, Diliman, residing in the City of Marikina.It was founded with the aims of binding, consolidating UP students, who are living in Marikina and of Marikeno lineage, promoting academic and leadership excellence, and advancing the social, cultural, economic and political consciousness of the people of Marikina.	6	179 Malaya St., Malanday, Marikina City 1805	up_kustura@yahoogroups.com	nerian.ostonal@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
150	20101	1	UP Kustura	The UP Kustura is a socio-cultural organization comprising of college students from the University of the Philippines, Diliman, residing in the City of Marikina.It was founded with the aims of binding, consolidating UP students, who are living in Marikina and of Marikeno lineage, promoting academic and leadership excellence, and advancing the social, cultural, economic and political consciousness of the people of Marikina.	6	179 Malaya St., Malanday, Marikina City 1805	up_kustura@yahoogroups.com	nerian.ostonal@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
151	20091	2	N/A	University-wide, provincial organization of UP Diliman students hailing from the province of Laguna.	6	104 P. Valenzuela st., Area 2, UP Campus, Diliman, Quezon City, 1101	up.lagunense@yahoo.coim	ellen_psych@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
222	20101	1			9			titus_ck@yahoo.com	\N	f	\N	f	\N	\N	\N	f
152	20091	2	UP Lakan	UP Lakan is a socio-civic, non- stock, non- profit, non- partisan organization of UP students who hail from Bulacan.	6	University of the Philippines, Diliman, Quezon City 1101	www.uplakan.co.cc	hhh_blueflame8@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
152	20101	1	UP Lakan	UP Lakan is a socio-civic, non- stock, non- profit, non- partisan organization of UP students who hail from Bulacan.	6	University of the Philippines, Diliman, Quezon City 1101	www.uplakan.co.cc	hhh_blueflame8@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
153	20091	1			9			mia_constantino@yahoo.com	\N	f	\N	f	\N	\N	\N	f
153	20101	1			9			mia_constantino@yahoo.com	\N	f	\N	f	\N	\N	\N	f
154	20091	3	UPLL	UP Laong Laan is a regional organization in the University of the Philippines-Diliman. It is composed of UP students who currently or used to live in the province of Rizal.	6	Block 17 Lot 17 August St. CEV Mambog, Binangonan, Rizal 1940	UP-laonglaan@yahoogroups.com	anfycabunilas@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
154	20101	1	UPLL	UP Laong Laan is a regional organization in the University of the Philippines-Diliman. It is composed of UP students who currently or used to live in the province of Rizal.	6	Block 17 Lot 17 August St. CEV Mambog, Binangonan, Rizal 1940	UP-laonglaan@yahoogroups.com	anfycabunilas@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
155	20091	1			9			daneloctober@yahoo.com	\N	f	\N	f	\N	\N	\N	f
155	20101	1			9			daneloctober@yahoo.com	\N	f	\N	f	\N	\N	\N	f
156	20091	3	UP LAWOD	UP Lawod is a provincial organization for Masbateno students based on UP Diliman. Its aims are to extend help to our fellow Masbatenos particularly the youth through different activities geared towards excellence.	6	UP LAWOD, Tambayan Complex, Vinzons Hill, UP Diliman, Quezon City, 1101	uplawod@gmail.com	ecsentillas@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
156	20101	1	UP LAWOD	UP Lawod is a provincial organization for Masbateno students based on UP Diliman. Its aims are to extend help to our fellow Masbatenos particularly the youth through different activities geared towards excellence.	6	UP LAWOD, Tambayan Complex, Vinzons Hill, UP Diliman, Quezon City, 1101	uplawod@gmail.com	ecsentillas@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
157	20091	2	Laya FC	Engaged in the promotion of a healthy and active lifestyle through football	10	Room 112 Faculty Center, University of the Philippines, Diliman, Quezon City 1101	uplayafc@gmail.com	viabonoan@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
157	20101	1	Laya FC	Engaged in the promotion of a healthy and active lifestyle through football	10	Room 112 Faculty Center, University of the Philippines, Diliman, Quezon City 1101	uplayafc@gmail.com	viabonoan@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
158	20091	1			9			wangkai_07@yahoo.com	\N	f	\N	f	\N	\N	\N	f
158	20101	1			9			wangkai_07@yahoo.com	\N	f	\N	f	\N	\N	\N	f
159	20091	1			9			carloluses@yahoo.com	\N	f	\N	f	\N	\N	\N	f
159	20101	1			9			carloluses@yahoo.com	\N	f	\N	f	\N	\N	\N	f
160	20091	1			9			lia_mai@yahoo.com	\N	f	\N	f	\N	\N	\N	f
160	20101	1			9			lia_mai@yahoo.com	\N	f	\N	f	\N	\N	\N	f
161	20091	1	UPLISSA	The UP Library and Information Science Students’ Association (UP LISSA) was established in 1962 as the ILIS Student Council and the sole institute-based student organization. In 2002, it was reorganized as an academic organization separate from the ILIS Student Council with the objectives of fostering camaraderie and unity among members, promoting scholastic and socio-cultural development of its members and providing opportunities for members to lead and serve the institute, university and nation. Since its early years, UP LISSA has produced among the country’s best librarians and information managers and specialists	1	UP School of Library and Information Studies 3rd floor Gonzales hall, UP Main Library, Diliman, Quezon City	execomm@uplissa.org	 xen_jean_17@yahoo.com 	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
161	20101	1	UPLISSA	The UP Library and Information Science Students’ Association (UP LISSA) was established in 1962 as the ILIS Student Council and the sole institute-based student organization. In 2002, it was reorganized as an academic organization separate from the ILIS Student Council with the objectives of fostering camaraderie and unity among members, promoting scholastic and socio-cultural development of its members and providing opportunities for members to lead and serve the institute, university and nation. Since its early years, UP LISSA has produced among the country’s best librarians and information managers and specialists	1	UP School of Library and Information Studies 3rd floor Gonzales hall, UP Main Library, Diliman, Quezon City	execomm@uplissa.org	 xen_jean_17@yahoo.com 	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
162	20091	2	UPLF, LF	UP Lingua Franca is a socio-academic organization based in the UP College of Arts and Letters. It is composed of students whose passion lies in the appreciation of the beauty and power of the English language as it is used in literary and non-literary compositions, especially by Filipinos.	1	#9 Tambayan Complex, Faculty Center, College of Arts and Letters, University of the Philippines, Diliman, Quezon City 1101	up_linguafranca@yahoo.com	kmreynaldo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
162	20101	1	UPLF, LF	UP Lingua Franca is a socio-academic organization based in the UP College of Arts and Letters. It is composed of students whose passion lies in the appreciation of the beauty and power of the English language as it is used in literary and non-literary compositions, especially by Filipinos.	1	#9 Tambayan Complex, Faculty Center, College of Arts and Letters, University of the Philippines, Diliman, Quezon City 1101	up_linguafranca@yahoo.com	kmreynaldo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
163	20091	3	UnPLUG	The University of the Philippines Linux Users’ Group (UnPLUG) is a duly recognized student organization dedicated in promoting the use of Free and Open Source Software (FOSS) and in advocating FOSS philosophy through seminars, trainings, and software development.	9	UP Computer Center, Magsaysay Avenue Corner, G. Apacible St., UP Diliman, Quezon City, 1101.	info@uplug.org	rystraum@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
163	20101	1	UnPLUG	The University of the Philippines Linux Users’ Group (UnPLUG) is a duly recognized student organization dedicated in promoting the use of Free and Open Source Software (FOSS) and in advocating FOSS philosophy through seminars, trainings, and software development.	9	UP Computer Center, Magsaysay Avenue Corner, G. Apacible St., UP Diliman, Quezon City, 1101.	info@uplug.org	rystraum@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
164	20091	3	UP LIKAS, LIKAS	Ang U.P. Lipunang Pangkasaysayan ay isang pang-akademikong organisasyon na muling itinatag noong 1988 na naglalayong mapagbuklod ang mga mag-aaral ng kasaysayan; mapalawak ang kaalaman; mapaunlad ang disiplina ng kasaysayan at mapaglingkuran ang mga mag-aaral at ng sambayanang Pilipino.	1	West Wing, Palma Hall, College of Social Sciences and Philosophy, U.P. Diliman, Quezon City 1101	up_lipunang_pangkasaysayan@yahoogroups.com	amallari02@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
221	20091	1	SANLAHI ALLIANCE	umbrella organiation of PRE (provincial, regional and ethno-linguistic) organizations in the university	2	7 J.P. Laurel St., Area 2, UPD 1101	up_sanlahi@yahoogroups.com	eingefire@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
262	20101	1			9			mrvs357@yahoo.com	\N	f	\N	f	\N	\N	\N	f
164	20101	1	UP LIKAS, LIKAS	Ang U.P. Lipunang Pangkasaysayan ay isang pang-akademikong organisasyon na muling itinatag noong 1988 na naglalayong mapagbuklod ang mga mag-aaral ng kasaysayan; mapalawak ang kaalaman; mapaunlad ang disiplina ng kasaysayan at mapaglingkuran ang mga mag-aaral at ng sambayanang Pilipino.	1	West Wing, Palma Hall, College of Social Sciences and Philosophy, U.P. Diliman, Quezon City 1101	up_lipunang_pangkasaysayan@yahoogroups.com	amallari02@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
165	20091	1			9			rstensuan@yahoo.com	\N	f	\N	f	\N	\N	\N	f
165	20101	1			9			rstensuan@yahoo.com	\N	f	\N	f	\N	\N	\N	f
166	20091	1			9			chingisch@yahoo.com	\N	f	\N	f	\N	\N	\N	f
166	20101	1			9			chingisch@yahoo.com	\N	f	\N	f	\N	\N	\N	f
167	20091	3	MBS	An organization which aims to uphold awareness of the marine environment through the sport of skin diving.	10	Owl's nest University of the Philippines, Diliman, Quezon City, 1100	mbs@yahoogroups.com	reangelina_18@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
167	20101	1	MBS	An organization which aims to uphold awareness of the marine environment through the sport of skin diving.	10	Owl's nest University of the Philippines, Diliman, Quezon City, 1100	mbs@yahoogroups.com	reangelina_18@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
168	20091	3	UP MCO	An organization committed to the responsible use of mass communication in promoting media awareness and education.	1	College of Mass Communication, University of the Philippines, Diliman, Quezon City	UP-MCO@yahoogroups.com	ivycay@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
168	20101	1	UP MCO	An organization committed to the responsible use of mass communication in promoting media awareness and education.	1	College of Mass Communication, University of the Philippines, Diliman, Quezon City	UP-MCO@yahoogroups.com	ivycay@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
169	20091	1			9			karina_obispo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
169	20101	1			9			karina_obispo@yahoo.com	\N	f	\N	f	\N	\N	\N	f
170	20091	3	MATH CLUB	The UP Mathematics Club, a non-profit organization, is the oldest academic student organization that is dedicated to promoting and sustaining the interest in mathematics of college and university students through competitive but friendly activities. 	1	Room 3, CS Tambayan Complex, Palma Hall, University of the Philippines, Diliman, Quezon City 1101	upmathematicsclub@yahoo.com	klumbao@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
170	20101	1	MATH CLUB	The UP Mathematics Club, a non-profit organization, is the oldest academic student organization that is dedicated to promoting and sustaining the interest in mathematics of college and university students through competitive but friendly activities. 	1	Room 3, CS Tambayan Complex, Palma Hall, University of the Philippines, Diliman, Quezon City 1101	upmathematicsclub@yahoo.com	klumbao@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
171	20091	3	UPMMC	UPMMC is a non-sectarian, non-partisan, academic organization, dedicated mainly to the scientific, intellectual and educational pursuits, particularly in the field of Mathematics.	1	Room 109 Mathematics Building Annex, University of the Philippines, Diliman, Quezon City 1101	upmathmajorscircle@yahoo.com	jcfeleo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
171	20101	1	UPMMC	UPMMC is a non-sectarian, non-partisan, academic organization, dedicated mainly to the scientific, intellectual and educational pursuits, particularly in the field of Mathematics.	1	Room 109 Mathematics Building Annex, University of the Philippines, Diliman, Quezon City 1101	upmathmajorscircle@yahoo.com	jcfeleo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
172	20091	1			9			neuromusicologik8_04@yahoo.com	\N	f	\N	f	\N	\N	\N	f
172	20101	1			9			neuromusicologik8_04@yahoo.com	\N	f	\N	f	\N	\N	\N	f
173	20091	1			9			chatzbalagtas@yahoo.com	\N	f	\N	f	\N	\N	\N	f
173	20101	1			9			chatzbalagtas@yahoo.com	\N	f	\N	f	\N	\N	\N	f
174	20091	1			9			benmarc@gmail.com	\N	f	\N	f	\N	\N	\N	f
174	20101	1			9			benmarc@gmail.com	\N	f	\N	f	\N	\N	\N	f
175	20091	3	U.P. MMA	In UP MMA, you'll learn Judo, Striking, Freestyle wrestling and grappling in a fun, safe, and ego-free environment. UP MMA also promotes values such as humility, discipline and hardwork,	10	120 Norway St. Loyola Grand Villas QC	upmma@yahoo.com	apa08E@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
175	20101	1	U.P. MMA	In UP MMA, you'll learn Judo, Striking, Freestyle wrestling and grappling in a fun, safe, and ego-free environment. UP MMA also promotes values such as humility, discipline and hardwork,	10	120 Norway St. Loyola Grand Villas QC	upmma@yahoo.com	apa08E@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
176	20091	1			9			topazgurl05@yahoo.com	\N	f	\N	f	\N	\N	\N	f
176	20101	1			9			topazgurl05@yahoo.com	\N	f	\N	f	\N	\N	\N	f
177	20091	3	UP Moriones	We are the students of the University of the Philippines hailing from Marinduque that aims to establish a strong organization which shall bridge and bind all of us to aid in the development of our knowledge and actions pertaining to our province’s culture and society, impart these to the Academe and relate this to the general Philippine setting.	6	372-C Dr. Sixto Antonio Ave., Caniogan, Pasig City 1606c/o Jayson M. Jogno	up_moriones@yahoo.com	jaysonmjogno@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
177	20101	1	UP Moriones	We are the students of the University of the Philippines hailing from Marinduque that aims to establish a strong organization which shall bridge and bind all of us to aid in the development of our knowledge and actions pertaining to our province’s culture and society, impart these to the Academe and relate this to the general Philippine setting.	6	372-C Dr. Sixto Antonio Ave., Caniogan, Pasig City 1606c/o Jayson M. Jogno	up_moriones@yahoo.com	jaysonmjogno@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
178	20091	2	UPM	The UP Mountaineers is an organization committed to teaching and applying responsible mountaineering and other outdoor activities, and also to caring and preserving the environment.  	10	3 Kabutihan St. Kawilihan Village, Pasig City 1600	bernz.varona@gmail.com	bernz.varona@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
178	20101	1	UPM	The UP Mountaineers is an organization committed to teaching and applying responsible mountaineering and other outdoor activities, and also to caring and preserving the environment.  	10	3 Kabutihan St. Kawilihan Village, Pasig City 1600	bernz.varona@gmail.com	bernz.varona@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
179	20091	2	UP MC	The UP Music Circle is an organization catering to musicians and anyone with an interest in music. It aims promote good musicianship enthusiasm for music bu broadening their appreciation of various forms. 	9	15 Maple St., West Fairview, Q.C., 1118	jdrferriols@yahoo.com	jdrferriols@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
179	20101	1	UP MC	The UP Music Circle is an organization catering to musicians and anyone with an interest in music. It aims promote good musicianship enthusiasm for music bu broadening their appreciation of various forms. 	9	15 Maple St., West Fairview, Q.C., 1118	jdrferriols@yahoo.com	jdrferriols@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
221	20101	1	SANLAHI ALLIANCE	umbrella organiation of PRE (provincial, regional and ethno-linguistic) organizations in the university	2	7 J.P. Laurel St., Area 2, UPD 1101	up_sanlahi@yahoogroups.com	eingefire@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
180	20091	1	UP MSA	Established in the 1960s and formally recognized in 1983, UP MSA has continued to engage in academic, religious, and socio-cultural activities advancing its objectives and promoting understanding between Muslims and non-Muslims.	7	Room 211, Vinsons Hall, University of the Philippines, 1101 Diliman, Quezon City		a.tanggol@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
180	20101	1	UP MSA	Established in the 1960s and formally recognized in 1983, UP MSA has continued to engage in academic, religious, and socio-cultural activities advancing its objectives and promoting understanding between Muslims and non-Muslims.	7	Room 211, Vinsons Hall, University of the Philippines, 1101 Diliman, Quezon City		a.tanggol@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
181	20091	1			9			charlie_prenicolas@yahoo.com	\N	f	\N	f	\N	\N	\N	f
181	20101	1			9			charlie_prenicolas@yahoo.com	\N	f	\N	f	\N	\N	\N	f
182	20091	2	UPD Navs	UP Navigators is a campus-based, non-denominational sub-group of the Philippine Navigators which aims to know Christ and to make him known.	7	CPO Box 2851 NIA Road, Diliman, Quezon City 1100	updnavs@yahoogroups.com	ma.capuno1@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
182	20101	1	UPD Navs	UP Navigators is a campus-based, non-denominational sub-group of the Philippine Navigators which aims to know Christ and to make him known.	7	CPO Box 2851 NIA Road, Diliman, Quezon City 1100	updnavs@yahoogroups.com	ma.capuno1@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
183	20091	1			9			secret-lover538@yahoo.com	\N	f	\N	f	\N	\N	\N	f
183	20101	1			9			secret-lover538@yahoo.com	\N	f	\N	f	\N	\N	\N	f
184	20091	3	UP OBEM	The UP Organization of Business Economics Majors is one of the most dynamic socio-academic organizations to date providing a venue and creating an environment that is responsible to the needs of its members and conducive to social responsibility, academic, professional, and personal development. After more than 20 years of existence, the organization has been triumphant in furthering its thrusts of unity, service, and excellence through its various projects.	1	Room 122, School of Economics, University of the Philippines,                                                                  Diliman, Quezon City 1101	up.obem@yahoo.com	jctorrenueva@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
184	20101	1	UP OBEM	The UP Organization of Business Economics Majors is one of the most dynamic socio-academic organizations to date providing a venue and creating an environment that is responsible to the needs of its members and conducive to social responsibility, academic, professional, and personal development. After more than 20 years of existence, the organization has been triumphant in furthering its thrusts of unity, service, and excellence through its various projects.	1	Room 122, School of Economics, University of the Philippines,                                                                  Diliman, Quezon City 1101	up.obem@yahoo.com	jctorrenueva@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
185	20091	3	UP ONE	An organization of Novo Ecijanos studying in UP Diliman who whose aims include sound leadership and academic excellence for the greater service of Novo Ecijanos and for the betterment of the province of Nueva Ecija.	6	Unit 5, Cluster A, Tambayan Complex,Vinzon’s Hill, University of the Philippines, Diliman, Quezon City 1101	upone.novoecijanos@gmail.com	charlesrbunag@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
185	20101	1	UP ONE	An organization of Novo Ecijanos studying in UP Diliman who whose aims include sound leadership and academic excellence for the greater service of Novo Ecijanos and for the betterment of the province of Nueva Ecija.	6	Unit 5, Cluster A, Tambayan Complex,Vinzon’s Hill, University of the Philippines, Diliman, Quezon City 1101	upone.novoecijanos@gmail.com	charlesrbunag@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
186	20091	1			9			up_ose@yahoo.com	\N	f	\N	f	\N	\N	\N	f
186	20101	1			9			up_ose@yahoo.com	\N	f	\N	f	\N	\N	\N	f
187	20091	2	UP ORG	UP ORG is duly recognized University based organization,which engages in various outdoor activities such as, but not limited to camping, skin diving and surfing.	10	C/O OSA\r\nUNIVERSITY OF THE PHILIPPINES\r\nDILIMAN	uporg88@yahoo.com	jglaruan@yahoo.com;ana11_cris@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
187	20101	1	UP ORG	UP ORG is duly recognized University based organization,which engages in various outdoor activities such as, but not limited to camping, skin diving and surfing.	10	C/O OSA\r\nUNIVERSITY OF THE PHILIPPINES\r\nDILIMAN	uporg88@yahoo.com	jglaruan@yahoo.com;ana11_cris@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
188	20091	1			9			jhen1019@hotmail.com	\N	f	\N	f	\N	\N	\N	f
188	20101	1			9			jhen1019@hotmail.com	\N	f	\N	f	\N	\N	\N	f
189	20091	2	PAGDU	UP PAGDUMALA is a soci-academic, political organization based in NCPAG. It continues to provide venues that equip students to become effective leaders and public servants	1	National College of Public Administration and Governance, University of the Philippines, Diliman, Q.C., 1101	pagdumala_ec08@yahoo.com	reginacrosales@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
189	20101	1	PAGDU	UP PAGDUMALA is a soci-academic, political organization based in NCPAG. It continues to provide venues that equip students to become effective leaders and public servants	1	National College of Public Administration and Governance, University of the Philippines, Diliman, Q.C., 1101	pagdumala_ec08@yahoo.com	reginacrosales@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
190	20091	3	UPP	UP Palaweños is a provincial organization in the University of the Philippines Diliman. The entire organization is composed of more than 20 students of various courses studying at the UP Diliman and is all from the Province of Palawan	6	131 J.P. Laurel St. Area 2, UP Campus, Diliman, Quezon City 1101	uppalawenyos@yahoogroups.com	backslash_n@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
190	20101	1	UPP	UP Palaweños is a provincial organization in the University of the Philippines Diliman. The entire organization is composed of more than 20 students of various courses studying at the UP Diliman and is all from the Province of Palawan	6	131 J.P. Laurel St. Area 2, UP Campus, Diliman, Quezon City 1101	uppalawenyos@yahoogroups.com	backslash_n@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
191	20091	3	PAN XENIA FRATERNITY 	Pan Xenia is an International Honorary Fraternity dedicated to the promotion of interests in foreign trade and the establishment of higher standards and ideals of business ethics.	5	\tRm 401 College of Business Administration, University of the Philippines Diliman, Quezon City, Philippines, 1101	panxenia@gmail.com	karlantoni_123@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
191	20101	1	PAN XENIA FRATERNITY 	Pan Xenia is an International Honorary Fraternity dedicated to the promotion of interests in foreign trade and the establishment of higher standards and ideals of business ethics.	5	\tRm 401 College of Business Administration, University of the Philippines Diliman, Quezon City, Philippines, 1101	panxenia@gmail.com	karlantoni_123@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
192	20091	3	UP PVO	PVO is an organization composed of law students who serve as paralegals. The organization acts a a service group and conducts training programs for basic sectors, community paralegals and paralegal trainers.	3	College of LawUniversity of the PhilippinesDiliman, Quezon City 1101	up_pvo_fb@yahoo.com	kathy.fabellon@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
192	20101	1	UP PVO	PVO is an organization composed of law students who serve as paralegals. The organization acts a a service group and conducts training programs for basic sectors, community paralegals and paralegal trainers.	3	College of LawUniversity of the PhilippinesDiliman, Quezon City 1101	up_pvo_fb@yahoo.com	kathy.fabellon@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
193	20091	1			9			cpievercaza@yahoo.com	\N	f	\N	f	\N	\N	\N	f
193	20101	1			9			cpievercaza@yahoo.com	\N	f	\N	f	\N	\N	\N	f
194	20091	1			9			analorenadelacruz@yahoo.com	\N	f	\N	f	\N	\N	\N	f
194	20101	1			9			analorenadelacruz@yahoo.com	\N	f	\N	f	\N	\N	\N	f
195	20091	1			9			kpacariem@yahoo.com	\N	f	\N	f	\N	\N	\N	f
195	20101	1			9			kpacariem@yahoo.com	\N	f	\N	f	\N	\N	\N	f
196	20091	1			9			ae_mman@yahoo.com	\N	f	\N	f	\N	\N	\N	f
196	20101	1			9			ae_mman@yahoo.com	\N	f	\N	f	\N	\N	\N	f
197	20091	1			9			arbiegarcia501@ymail.com	\N	f	\N	f	\N	\N	\N	f
197	20101	1			9			arbiegarcia501@ymail.com	\N	f	\N	f	\N	\N	\N	f
198	20091	1	UP PSYSC	UP PSYSC is an adhoc of PSYSC in UP Diliman.  It seeks to promote the Public Understanding of Science, Technology, and the Environment.	9	703 West Mansions Condominium, Nayong Kanluran, Quezon City 1104	psysc_inc@hotmail.com	rjcolobong@psysc.org	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
198	20101	1	UP PSYSC	UP PSYSC is an adhoc of PSYSC in UP Diliman.  It seeks to promote the Public Understanding of Science, Technology, and the Environment.	9	703 West Mansions Condominium, Nayong Kanluran, Quezon City 1104	psysc_inc@hotmail.com	rjcolobong@psysc.org	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
199	20091	3	UP OPTICS	UP OPTICS is a duly recognized university-wide organization of the University of the Philippines, committed to the promotion of photography as an art and the establishment of training grounds for the continuous development of its members' skills.	9	1 Lane 1 Valencia Street, Intercity Homes, Cupang, Muntinlupa City 1771	up_optics@yahoo.com	thereseangeli@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
199	20101	1	UP OPTICS	UP OPTICS is a duly recognized university-wide organization of the University of the Philippines, committed to the promotion of photography as an art and the establishment of training grounds for the continuous development of its members' skills.	9	1 Lane 1 Valencia Street, Intercity Homes, Cupang, Muntinlupa City 1771	up_optics@yahoo.com	thereseangeli@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
200	20091	3	UPPA	The UP Physics Association (UPPA) is an established academic and non-profit organization committed to the promotion and development of Physics inside and outside the University of the Philippines.  For more than twenty years now, the UPPA has continuously strived to organize projects that would advance the study, awareness and appreciation of Physics among students and the general public.	1	PH 3222, Quirino St., UP Diliman, Quezon City	upphysics@gmail.com	j0nn0c0n@gmail.com/president@upphysics.org	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
200	20101	1	UPPA	The UP Physics Association (UPPA) is an established academic and non-profit organization committed to the promotion and development of Physics inside and outside the University of the Philippines.  For more than twenty years now, the UPPA has continuously strived to organize projects that would advance the study, awareness and appreciation of Physics among students and the general public.	1	PH 3222, Quirino St., UP Diliman, Quezon City	upphysics@gmail.com	j0nn0c0n@gmail.com/president@upphysics.org	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
201	20091	1			9			jasperdoty@yahoo.com	\N	f	\N	f	\N	\N	\N	f
201	20101	1			9			jasperdoty@yahoo.com	\N	f	\N	f	\N	\N	\N	f
202	20091	3	PSD	The UP Pi Sigma Delta Sorority, a socio-civic and socio-political organization composed of UP Diliman students who are holding the principles, “Paglingkuran ang Sambayanan ng may Dangal” and “Paragon of Self-Development”.	8	#42 road 8, Pag-asa, Quezon City (1101)	PISigmaDelta1975@yahoo.com	ana_nymouz@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
202	20101	1	PSD	The UP Pi Sigma Delta Sorority, a socio-civic and socio-political organization composed of UP Diliman students who are holding the principles, “Paglingkuran ang Sambayanan ng may Dangal” and “Paragon of Self-Development”.	8	#42 road 8, Pag-asa, Quezon City (1101)	PISigmaDelta1975@yahoo.com	ana_nymouz@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
203	20091	1	Pi Sigma Fraternity	The Pi sigma Fraternity is a duly recognized organization in UP Diliman founded on August 15, 1972. Espousing the twin principles of "Paragon of Scholarship" & "Paglingkuran ang Sambayanan".	5			Josevicenteolivares@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
203	20101	1	Pi Sigma Fraternity	The Pi sigma Fraternity is a duly recognized organization in UP Diliman founded on August 15, 1972. Espousing the twin principles of "Paragon of Scholarship" & "Paglingkuran ang Sambayanan".	5			Josevicenteolivares@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
204	20091	1			9			camillekhristinea@yahoo.com	\N	f	\N	f	\N	\N	\N	f
204	20101	1			9			camillekhristinea@yahoo.com	\N	f	\N	f	\N	\N	\N	f
205	20091	3	UP PR+AdS	UP PRAdS is a student organization formed to cater to the PR and Advertising enthusiasts, a venue to exchange ideas and insights about one of the the world’s most successful industries.Students coming from different colleges transcended their differences to create an organization to not only bring together the PR and Advertising crowd in campus, but also to promote responsibility in the practice of those fields.	1	Plaridel Hall, College of Mass CommunicationUniversity of the Philippines-Diliman Quezon City 1101	UP_PRAdS@yahoogroups.com	blind_dose@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
205	20101	1	UP PR+AdS	UP PRAdS is a student organization formed to cater to the PR and Advertising enthusiasts, a venue to exchange ideas and insights about one of the the world’s most successful industries.Students coming from different colleges transcended their differences to create an organization to not only bring together the PR and Advertising crowd in campus, but also to promote responsibility in the practice of those fields.	1	Plaridel Hall, College of Mass CommunicationUniversity of the Philippines-Diliman Quezon City 1101	UP_PRAdS@yahoogroups.com	blind_dose@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
206	20091	3	UP PMHS	The UP PMHS is an academic and civic-oriented organization of exemplary pre-medical students dedicated to the pursuit of honor and excellence. 	1	Owl's NestQuirino StreetUniversity of the Philippines DilimanQuezon City, Philippines 1101	pmhs09@yahoogroups.com	nikolaigilreyes@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
206	20101	1	UP PMHS	The UP PMHS is an academic and civic-oriented organization of exemplary pre-medical students dedicated to the pursuit of honor and excellence. 	1	Owl's NestQuirino StreetUniversity of the Philippines DilimanQuezon City, Philippines 1101	pmhs09@yahoogroups.com	nikolaigilreyes@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
207	20091	3	UP PMS	UP Pre-Medical Society is a duly-recognized socio-academic organization from the College of Science. We are a group of young, hard working and dedicated individuals committed to projects for our fellow students and the rest of the Filipino community.	1	CS Coop Tambayan Complex, Palma Hall, University of the Philippines, Diliman, Quezon City	uppremedsoc@yahoo.com	ray.almonares@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
207	20101	1	UP PMS	UP Pre-Medical Society is a duly-recognized socio-academic organization from the College of Science. We are a group of young, hard working and dedicated individuals committed to projects for our fellow students and the rest of the Filipino community.	1	CS Coop Tambayan Complex, Palma Hall, University of the Philippines, Diliman, Quezon City	uppremedsoc@yahoo.com	ray.almonares@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
208	20091	1			9			ynamendiola@yahoo.com	\N	f	\N	f	\N	\N	\N	f
208	20101	1			9			ynamendiola@yahoo.com	\N	f	\N	f	\N	\N	\N	f
209	20091	1			9			angge_is@yahoo.com	\N	f	\N	f	\N	\N	\N	f
209	20101	1			9			angge_is@yahoo.com	\N	f	\N	f	\N	\N	\N	f
210	20091	1			9			ging_pagu@yahoo.com	\N	f	\N	f	\N	\N	\N	f
210	20101	1			9			ging_pagu@yahoo.com	\N	f	\N	f	\N	\N	\N	f
211	20091	3	UP Psychsoc	Founded in 1953, the UP Psychology Society is the oldest and most prestigious Psychology-oriented student organization in the university. With its 56 years of existence, UP PsychSoc has continually strived to maintain and exceed the highest standards of excellence through the implementation of its academic, as well as socio-civic activities, in fulfillment of its goals and objectives keeping in mind the ideals of the college, the university, and human society.	1	Kiosk #4, Palma Hall East Wing, University of the Philippines Diliman, 1101	psychologysociety@yahoogroups.com	regina.naval@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
211	20101	1	UP Psychsoc	Founded in 1953, the UP Psychology Society is the oldest and most prestigious Psychology-oriented student organization in the university. With its 56 years of existence, UP PsychSoc has continually strived to maintain and exceed the highest standards of excellence through the implementation of its academic, as well as socio-civic activities, in fulfillment of its goals and objectives keeping in mind the ideals of the college, the university, and human society.	1	Kiosk #4, Palma Hall East Wing, University of the Philippines Diliman, 1101	psychologysociety@yahoogroups.com	regina.naval@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
212	20091	3	UPRCY	The University of the Philippines - Diliman Red Cross Youth (UPRCY) is a non-stock, non-profit, student-led university-based organization duly affiliated with the Philippine National Red Cross Quezon City Chapter. The organization is geared towards promoting the spirit of humanity and voluntary service among the youth through different socio-civic activities such as bloodlettings, medical missions, community development programs and first aid services.	4	Red Table, Benton Hall, University of the Philippines, Diliman, Quezon City 1101	upredcrossyouth@yahoo.com	stevessantos@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
212	20101	1	UPRCY	The University of the Philippines - Diliman Red Cross Youth (UPRCY) is a non-stock, non-profit, student-led university-based organization duly affiliated with the Philippine National Red Cross Quezon City Chapter. The organization is geared towards promoting the spirit of humanity and voluntary service among the youth through different socio-civic activities such as bloodlettings, medical missions, community development programs and first aid services.	4	Red Table, Benton Hall, University of the Philippines, Diliman, Quezon City 1101	upredcrossyouth@yahoo.com	stevessantos@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
213	20091	2	the UP Rep	The University of the Philippines Repertory Company (UP Rep) is a University PerformingGroup (UPG) for theatre of the University of the Philippines Diliman. It is a non‐stock, non‐profitstudent theatre organization that has delivered performances to a variety of audiences. Thecompany aims to enlighten its audience on different current social issues and bring PhilippineTheatre closer to the masses.	9	104-B Vinzons Hall, UP Diliman, Quezon City	the_uprep@yahoogroups.com	esheigwapings@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
213	20101	1	the UP Rep	The University of the Philippines Repertory Company (UP Rep) is a University PerformingGroup (UPG) for theatre of the University of the Philippines Diliman. It is a non‐stock, non‐profitstudent theatre organization that has delivered performances to a variety of audiences. Thecompany aims to enlighten its audience on different current social issues and bring PhilippineTheatre closer to the masses.	9	104-B Vinzons Hall, UP Diliman, Quezon City	the_uprep@yahoogroups.com	esheigwapings@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
214	20091	1			9			jesuitfriar27@yahoo.com	\N	f	\N	f	\N	\N	\N	f
214	20101	1			9			jesuitfriar27@yahoo.com	\N	f	\N	f	\N	\N	\N	f
215	20091	2	UP RPT	Specializes in 10-m air rifle and air pistol UIT precision shooting	9	1346- A Musa St. Sampaloc, Manila 01008	up.riflepistolteam@yahoo.com.ph	rrraawr@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
215	20101	1	UP RPT	Specializes in 10-m air rifle and air pistol UIT precision shooting	9	1346- A Musa St. Sampaloc, Manila 01008	up.riflepistolteam@yahoo.com.ph	rrraawr@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
216	20091	1			9			eric@run4change.com	\N	f	\N	f	\N	\N	\N	f
216	20101	1			9			eric@run4change.com	\N	f	\N	f	\N	\N	\N	f
217	20091	1	UP SAMASKOM	Now on its 35th year, UP SAMASKOM seeks to provide the creative members with an adequate orientation of the different fields of media. The membership has grown steadily year after year, with over 900 alumni members who are presently in various occupational fields. 	1	B4 U109 Residencias de Manila, Jesus Ext., Pandacan, Manila	execom35upsamaskom@yahoogroups.com	baldeo_monica@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
217	20101	1	UP SAMASKOM	Now on its 35th year, UP SAMASKOM seeks to provide the creative members with an adequate orientation of the different fields of media. The membership has grown steadily year after year, with over 900 alumni members who are presently in various occupational fields. 	1	B4 U109 Residencias de Manila, Jesus Ext., Pandacan, Manila	execom35upsamaskom@yahoogroups.com	baldeo_monica@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
218	20091	3	UP STPA	UP STPA is a university-recognized socio - academic student organization based in the National College of Public Administration & Governance (NCPAG) of the University of the Philippines, Diliman founded on November 26, 1988.UP STPA is a two time Gawad Chancellor Awardee for Best Student Organization in 1996 and in 1997.	1	UP NCPAG Frienship garden, Jacinto Street UP Diiman, Quezon City 1104	up_stpa_0910@yahoo.com	jna.castillo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
218	20101	1	UP STPA	UP STPA is a university-recognized socio - academic student organization based in the National College of Public Administration & Governance (NCPAG) of the University of the Philippines, Diliman founded on November 26, 1988.UP STPA is a two time Gawad Chancellor Awardee for Best Student Organization in 1996 and in 1997.	1	UP NCPAG Frienship garden, Jacinto Street UP Diiman, Quezon City 1104	up_stpa_0910@yahoo.com	jna.castillo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
219	20091	1			9			maan360@yahoo.com	\N	f	\N	f	\N	\N	\N	f
219	20101	1			9			maan360@yahoo.com	\N	f	\N	f	\N	\N	\N	f
220	20091	3	none	UP Sandiwa is the official organization of UP Diliman Students from Tarlac.	6	none	sandiwa_updiliman@yahoo.com	gracelyntanedo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
220	20101	1	none	UP Sandiwa is the official organization of UP Diliman Students from Tarlac.	6	none	sandiwa_updiliman@yahoo.com	gracelyntanedo@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
223	20091	2	none	UP Saro is a socio-cultural organization composed of UP Diliman students who have roots from Camarines Norte. Saro is the Bicol term for "one", signifying the unity of UPD students from Camarines Norte.	6	Ilang-ilang Residence Hall, UP Campus, Diliman, Quezon City 1101	upsaro@yahoogroups.com	crisillevillaluna@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
223	20101	1	none	UP Saro is a socio-cultural organization composed of UP Diliman students who have roots from Camarines Norte. Saro is the Bicol term for "one", signifying the unity of UPD students from Camarines Norte.	6	Ilang-ilang Residence Hall, UP Campus, Diliman, Quezon City 1101	upsaro@yahoogroups.com	crisillevillaluna@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
224	20091	1	UP SMMART	A university-based academic organization that aims to pursue excellence in education especially the sciences. UP SMMART advocates responsible teaching above all others.	1	1st Floor, Left Wing, Benitez Hall, College of Education, UP Diliman, Quezon City, 1101	upsmmart@yahoo.com	ynamendez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
224	20101	1	UP SMMART	A university-based academic organization that aims to pursue excellence in education especially the sciences. UP SMMART advocates responsible teaching above all others.	1	1st Floor, Left Wing, Benitez Hall, College of Education, UP Diliman, Quezon City, 1101	upsmmart@yahoo.com	ynamendez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
225	20091	1			9			radelorino@gmail.com	\N	f	\N	f	\N	\N	\N	f
225	20101	1			9			radelorino@gmail.com	\N	f	\N	f	\N	\N	\N	f
226	20091	1	UP SONs	We are the Seeds of the Nations' Youth Ministry in Diliman (UPSONs), a recognized university-wide organization rooted by love, fellowship and service to God. Our aims are to disciple people and to help them develop deeper relationship with God.Our organization, an arm of Doulos for Christ World Harvest Harvest Ministry located in UN Kalaw, Manila, was founded on September 6, 2006 by students with deeper passion to serve the Lord.	7	#7 Pantihan 4 Naval St. Brgy. Flores, Malabon City	keneth_sedilla@yahoo.com	keneth_sedilla@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
226	20101	1	UP SONs	We are the Seeds of the Nations' Youth Ministry in Diliman (UPSONs), a recognized university-wide organization rooted by love, fellowship and service to God. Our aims are to disciple people and to help them develop deeper relationship with God.Our organization, an arm of Doulos for Christ World Harvest Harvest Ministry located in UN Kalaw, Manila, was founded on September 6, 2006 by students with deeper passion to serve the Lord.	7	#7 Pantihan 4 Naval St. Brgy. Flores, Malabon City	keneth_sedilla@yahoo.com	keneth_sedilla@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
227	20091	3	UP Sidlangan	The UP Sidlangan is a duly recognized organization of Biliranons, Leytenos, and Samareno students of the University of the Philippines Diliman. It is committed towards the promotion of the highest degree of competence and excellence among its members.	6	Southwing Main Library University of the Philippines Diliman Quezon City 1101	Sidlangan1976@yahoogroups.com	adcruzada@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
227	20101	1	UP Sidlangan	The UP Sidlangan is a duly recognized organization of Biliranons, Leytenos, and Samareno students of the University of the Philippines Diliman. It is committed towards the promotion of the highest degree of competence and excellence among its members.	6	Southwing Main Library University of the Philippines Diliman Quezon City 1101	Sidlangan1976@yahoogroups.com	adcruzada@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
228	20091	2	SAN	Sigma Alpha Nu (ΣAN) is a duly recognized socio-civic organization of women in the University of the Philippines with the primary cause of serving the Filipino people. Through the years, ΣAN has been in the forefront of advocating causes that concern women and the youth by initiating events such as symposia, film showings, theater productions, concerts, and outreach programs.	8	302 90A E. Abada St., Loyola Heights, Quezon City	paula.figuerres@yahoo.com	krista_paula.figuerres@up.edu.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
228	20101	1	SAN	Sigma Alpha Nu (ΣAN) is a duly recognized socio-civic organization of women in the University of the Philippines with the primary cause of serving the Filipino people. Through the years, ΣAN has been in the forefront of advocating causes that concern women and the youth by initiating events such as symposia, film showings, theater productions, concerts, and outreach programs.	8	302 90A E. Abada St., Loyola Heights, Quezon City	paula.figuerres@yahoo.com	krista_paula.figuerres@up.edu.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
229	20091	1	UP ΣA	UP Sigma Alpha Sorority is a protest sorority against physical initiation. The main objective of the sorority is to uphold the dignity of an individual.	1	AS Hill, College of Social Sciences and Philosophy, UP Diliman, Quezon City	upsigmaalphasororityresidents@yahoo.com	jo.narvaez@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
229	20101	1	UP ΣA	UP Sigma Alpha Sorority is a protest sorority against physical initiation. The main objective of the sorority is to uphold the dignity of an individual.	1	AS Hill, College of Social Sciences and Philosophy, UP Diliman, Quezon City	upsigmaalphasororityresidents@yahoo.com	jo.narvaez@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
230	20091	1			9			nina.acasio@upsigmabeta.com	\N	f	\N	f	\N	\N	\N	f
230	20101	1			9			nina.acasio@upsigmabeta.com	\N	f	\N	f	\N	\N	\N	f
231	20091	3	UP SDP	The U.P. Sigma Delta Phi Sorority was founded in February 24, 1931. In 1933, it was officially recognized by the University of the Philippines. It also has a chapter in UP Los Banos.	8	Room 132, Fonacier Hall, Alumni Center, UP Diliman, Quezon City 1101	fraulein.olavario05@upsigmadeltaphi.com	frauchies@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
231	20101	1	UP SDP	The U.P. Sigma Delta Phi Sorority was founded in February 24, 1931. In 1933, it was officially recognized by the University of the Philippines. It also has a chapter in UP Los Banos.	8	Room 132, Fonacier Hall, Alumni Center, UP Diliman, Quezon City 1101	fraulein.olavario05@upsigmadeltaphi.com	frauchies@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
232	20091	1	EDIT	The Sigma Delta Pi Sorority is a nationalist, service-oriented sorority founded at the University of the Philippines (UP) in Baguio City on August 8, 1974	8	A-2 Vinzon's Hill Tambayan, University of the Philippines, Diliman, Quezon City 1101	edit.diliman@gmail.com	blancachuch@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
232	20101	1	EDIT	The Sigma Delta Pi Sorority is a nationalist, service-oriented sorority founded at the University of the Philippines (UP) in Baguio City on August 8, 1974	8	A-2 Vinzon's Hill Tambayan, University of the Philippines, Diliman, Quezon City 1101	edit.diliman@gmail.com	blancachuch@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
233	20091	1			9			einidor@yahoo.com	\N	f	\N	f	\N	\N	\N	f
233	20101	1			9			einidor@yahoo.com	\N	f	\N	f	\N	\N	\N	f
234	20091	1	EP	The Sigma Rho is a fraternity of destiny. History has ordained it for leadership and has infused it by reason of its inseparable antecedents with ideological, cultural and political missions that will inevitably find cyclical fulfilment in time and space.	5	31 London Street, Capitol Homes, Quezon City, 1100	rhosig2009@gmail.com	rhosig2009@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
234	20101	1	EP	The Sigma Rho is a fraternity of destiny. History has ordained it for leadership and has infused it by reason of its inseparable antecedents with ideological, cultural and political missions that will inevitably find cyclical fulfilment in time and space.	5	31 London Street, Capitol Homes, Quezon City, 1100	rhosig2009@gmail.com	rhosig2009@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
235	20091	3	UP SILAK, UP SILAB	Non-stock non-profit organization of Ilonggo speakers in the University of The Philippines Diliman	6	Yakal Residence Hall, UP Diliman, Quezon City 1101	UPSILAKSILAB_residents@yahoogroups.com	rplindogan@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
235	20101	1	UP SILAK, UP SILAB	Non-stock non-profit organization of Ilonggo speakers in the University of The Philippines Diliman	6	Yakal Residence Hall, UP Diliman, Quezon City 1101	UPSILAKSILAB_residents@yahoogroups.com	rplindogan@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
236	20091	3	none	An organization of UP Students from La Union	6	96 Gaerlan st., Ili Norte, San Juan, La Union, 2514	upsillag@yahoo.com	kyravgs@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
236	20101	1	none	An organization of UP Students from La Union	6	96 Gaerlan st., Ili Norte, San Juan, La Union, 2514	upsillag@yahoo.com	kyravgs@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
237	20091	1	Sinagbayan	Organization of young artists and art enthusiasts united to serve their skills for the education and cultural development of people.	4	Brgy.Pansol QC 1101	sinagbayan@yahoo.com	fayeelicious_0603@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
237	20101	1	Sinagbayan	Organization of young artists and art enthusiasts united to serve their skills for the education and cultural development of people.	4	Brgy.Pansol QC 1101	sinagbayan@yahoo.com	fayeelicious_0603@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
238	20091	3	UP SHARP	UP SHARP, which is exclusively for HRIM majors, is a non-stock, non-profit organization duly recognized by the University of the Philippines, Diliman, being a socio-academic organization. It has committed itself to the development of leadership, excellence, and socio-civic consciousness among members. Throughout the years of SHARP’s existence, the organization has devoted its time in hosting activities to meet the objectives that have been set before them.	1	Alonso Hall, University of the Philippines, Diliman, Quezon City, Philippines 1101	upsharp@yahoogroups.com	periwinkle_periwinkle26@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
238	20101	1	UP SHARP	UP SHARP, which is exclusively for HRIM majors, is a non-stock, non-profit organization duly recognized by the University of the Philippines, Diliman, being a socio-academic organization. It has committed itself to the development of leadership, excellence, and socio-civic consciousness among members. Throughout the years of SHARP’s existence, the organization has devoted its time in hosting activities to meet the objectives that have been set before them.	1	Alonso Hall, University of the Philippines, Diliman, Quezon City, Philippines 1101	upsharp@yahoogroups.com	periwinkle_periwinkle26@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
239	20091	1			9			yaneen29@yahoo.com	\N	f	\N	f	\N	\N	\N	f
239	20101	1			9			yaneen29@yahoo.com	\N	f	\N	f	\N	\N	\N	f
240	20091	1	UP SEMEN	All male organization based at the college of business administration promoting camaraderie among its members and providing support for all their academic and extra-curricular activities	1	2 Molave Street, Forbes Park, Makati	josephmiguel.gutierrez@gmail.com	josephmiguel.gutierrez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
240	20101	1	UP SEMEN	All male organization based at the college of business administration promoting camaraderie among its members and providing support for all their academic and extra-curricular activities	1	2 Molave Street, Forbes Park, Makati	josephmiguel.gutierrez@gmail.com	josephmiguel.gutierrez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
241	20091	1			9			jdbernabe@gmail.com	\N	f	\N	f	\N	\N	\N	f
241	20101	1			9			jdbernabe@gmail.com	\N	f	\N	f	\N	\N	\N	f
242	20091	1			9			ryan.bonifacio@gmail.com	\N	f	\N	f	\N	\N	\N	f
242	20101	1			9			ryan.bonifacio@gmail.com	\N	f	\N	f	\N	\N	\N	f
243	20091	3	UP SOX	The UP SOCCSKSARGEN is the recently established official Region XII organization here in UP Diliman. Its membership exclusively consists of students from Region XII, which is the SOCCSKSARGEN area.	6	Yakal Recidence HallUP Diliman, Quezon City1101	upsoccsksargen@gmail.com	jdalbete@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
243	20101	1	UP SOX	The UP SOCCSKSARGEN is the recently established official Region XII organization here in UP Diliman. Its membership exclusively consists of students from Region XII, which is the SOCCSKSARGEN area.	6	Yakal Recidence HallUP Diliman, Quezon City1101	upsoccsksargen@gmail.com	jdalbete@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
244	20091	2	AS	First Latin named sorority...	1	altissima.upd@astrumscientis.com	astrumscientis@yahoo.com	altissima.upd@astrumscientis.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
244	20101	1	AS	First Latin named sorority...	1	altissima.upd@astrumscientis.com	astrumscientis@yahoo.com	altissima.upd@astrumscientis.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
245	20091	1			9			patria8908@yahoo.com	\N	f	\N	f	\N	\N	\N	f
245	20101	1			9			patria8908@yahoo.com	\N	f	\N	f	\N	\N	\N	f
246	20091	2	UPSEC	The organization aims to continue and renew the tradition of Service, Excellence and Commitment; bearing in mind the philosophies and objectives of Special Education.To carry out its principles and realize its goals, the association does serious as well as fun activities such as workshops, seminars, trainings and interaction with children with special needs. In addition, UPSEC participates in different SPED events in the college and national levels.	1	Left Wing, UP College of Education LobbyUP College of EducationUP DilimanQuezon City1100	upspeciaeducationcouncil@yahoo.com	bannylimbo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
246	20101	1	UPSEC	The organization aims to continue and renew the tradition of Service, Excellence and Commitment; bearing in mind the philosophies and objectives of Special Education.To carry out its principles and realize its goals, the association does serious as well as fun activities such as workshops, seminars, trainings and interaction with children with special needs. In addition, UPSEC participates in different SPED events in the college and national levels.	1	Left Wing, UP College of Education LobbyUP College of EducationUP DilimanQuezon City1100	upspeciaeducationcouncil@yahoo.com	bannylimbo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
247	20091	3	UP SPECA, SPECA	The UP Speech Communication Association is an organization exclusive for BA Speech Communication students. It is based in the College of Arts and Letters.	1	3rd flr., Bulwagang Rizal (Faculty Center), University of the Philippines-Diliman, Quezon City 1101	upspeca0910@gmail.com	michelle.lopez.alvarez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
247	20101	1	UP SPECA, SPECA	The UP Speech Communication Association is an organization exclusive for BA Speech Communication students. It is based in the College of Arts and Letters.	1	3rd flr., Bulwagang Rizal (Faculty Center), University of the Philippines-Diliman, Quezon City 1101	upspeca0910@gmail.com	michelle.lopez.alvarez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
248	20091	2	UP SOMA	UP SOMA was developed in 2001. We manage and organize sporting events. We also officiate different kinds of sports.	10	none	none	dhei_day@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
248	20101	1	UP SOMA	UP SOMA was developed in 2001. We manage and organize sporting events. We also officiate different kinds of sports.	10	none	none	dhei_day@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
249	20091	3	SVCF	We are a fellowship of Christian Students in UP Diliman dedicated to sharing the gospel, training servant-leaders for Christ, and being of service to our community through our various programs and activities.	7	IVCF BuildingDon Primitivo ExtentionDon Antonio HeightsDilimanQuezon City, 1101	exec0910@gmail.com	ramonrochaiv@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
249	20101	1	SVCF	We are a fellowship of Christian Students in UP Diliman dedicated to sharing the gospel, training servant-leaders for Christ, and being of service to our community through our various programs and activities.	7	IVCF BuildingDon Primitivo ExtentionDon Antonio HeightsDilimanQuezon City, 1101	exec0910@gmail.com	ramonrochaiv@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
250	20091	3	StatSoc	UP Statistical Society is an academic organization established on September 12, 1981. Being the pioneer organization in the UP School of Statistics, it has been determined to fulfill its primary goals, which are to promote awareness and enhance interest in Statistics.	1	School of Statistics Building, Magsaysay Avenue, Diliman Quezon City 1101	upstatsoc@yahoo.com	paulmichael.almeda@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
250	20101	1	StatSoc	UP Statistical Society is an academic organization established on September 12, 1981. Being the pioneer organization in the UP School of Statistics, it has been determined to fulfill its primary goals, which are to promote awareness and enhance interest in Statistics.	1	School of Statistics Building, Magsaysay Avenue, Diliman Quezon City 1101	upstatsoc@yahoo.com	paulmichael.almeda@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
251	20091	2	UP STRATSMART	UP StratSMART is a non-stock, non-profit, socio-civic training organization that aims to cultivate and hone the skills of the members with Filipino oriented values - social responsibility, nationalism, and critical thinking.	9	544 MacArthur Hi-way Poblacion, Guiguinto, Bulacan 3015	upstratsmart@gmail.com	bernardo.jansen@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
251	20101	1	UP STRATSMART	UP StratSMART is a non-stock, non-profit, socio-civic training organization that aims to cultivate and hone the skills of the members with Filipino oriented values - social responsibility, nationalism, and critical thinking.	9	544 MacArthur Hi-way Poblacion, Guiguinto, Bulacan 3015	upstratsmart@gmail.com	bernardo.jansen@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
252	20091	2	UPSDC	The UP Street Dance Club is a duly recognized university-wide student organization in the University of the Philippines, Diliman, formed in 1997. It serves to represent, inspire, and reinforce God-centered living through dance. It is considered a pioneer organization in the field of street dance in the country today. 	10	UP College of Human KineticsYlanan Hall, Don Mariano Marcos Avenue,Diliman, Quezon City 1101, Philippines	upsdc2008@yahoogroups.com 	jediknightmoonchild@yahoo.com 	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
252	20101	1	UPSDC	The UP Street Dance Club is a duly recognized university-wide student organization in the University of the Philippines, Diliman, formed in 1997. It serves to represent, inspire, and reinforce God-centered living through dance. It is considered a pioneer organization in the field of street dance in the country today. 	10	UP College of Human KineticsYlanan Hall, Don Mariano Marcos Avenue,Diliman, Quezon City 1101, Philippines	upsdc2008@yahoogroups.com 	jediknightmoonchild@yahoo.com 	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
253	20091	1			9			airah.cadiogan@yahoo.com	\N	f	\N	f	\N	\N	\N	f
253	20101	1			9			airah.cadiogan@yahoo.com	\N	f	\N	f	\N	\N	\N	f
254	20091	1			9			javince17@yahoo.com	\N	f	\N	f	\N	\N	\N	f
254	20101	1			9			javince17@yahoo.com	\N	f	\N	f	\N	\N	\N	f
255	20091	2	UPSCA	UPSCA is a non-profit, non-stock Catholic organization committed to forming a truly Filipino Christian community founded on the pillars of Truth, Freedom, Justice and Love.	7	Delaney Hall, Parish of the Holy Sacrifice, University of the Philippines, Diliman, Quezon City 1101	upsca.diliman@gmail.com	ninacerissa.soliman@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
255	20101	1	UPSCA	UPSCA is a non-profit, non-stock Catholic organization committed to forming a truly Filipino Christian community founded on the pillars of Truth, Freedom, Justice and Love.	7	Delaney Hall, Parish of the Holy Sacrifice, University of the Philippines, Diliman, Quezon City 1101	upsca.diliman@gmail.com	ninacerissa.soliman@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
256	20091	1	SOD		1	178 Maginhawa St., Brgy. Sikatuna Village, QC	leigonzaga@yahoo.com	leigonzaga@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
256	20101	1	SOD		1	178 Maginhawa St., Brgy. Sikatuna Village, QC	leigonzaga@yahoo.com	leigonzaga@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
257	20091	3	UP SEALS, SEALS	organization dedicated to breeding competent, moral, principled leaders for the future of our country	3	9 Teresa Ave., Christine Vil., dela Paz, Pasig City 1600	up.seals@gmail.com	r_n_castillo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
257	20101	1	UP SEALS, SEALS	organization dedicated to breeding competent, moral, principled leaders for the future of our country	3	9 Teresa Ave., Christine Vil., dela Paz, Pasig City 1600	up.seals@gmail.com	r_n_castillo@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
258	20091	2	UPS	A student organization targetted to promoting underwater activities	10	8 Chico St. Project 2 Quezon City	up.subaquatica@gmail.com	blanch_gutierrez@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
258	20101	1	UPS	A student organization targetted to promoting underwater activities	10	8 Chico St. Project 2 Quezon City	up.subaquatica@gmail.com	blanch_gutierrez@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
259	20091	3	UPSS	the UP Subol Society (UPSS) is a non-stock, non-profit university-based organization of Pangasinan students in the University of the Philippines.  our main thrust is to serve the people of our beloved province.	6	Yakal Dining Hall, UP Diliman Quezon City 1101	upsubolsociety_1975@yahoo.com	ana_hp15@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
259	20101	1	UPSS	the UP Subol Society (UPSS) is a non-stock, non-profit university-based organization of Pangasinan students in the University of the Philippines.  our main thrust is to serve the people of our beloved province.	6	Yakal Dining Hall, UP Diliman Quezon City 1101	upsubolsociety_1975@yahoo.com	ana_hp15@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
260	20091	1			9			thom_devilla@yahoo.com	\N	f	\N	f	\N	\N	\N	f
260	20101	1			9			thom_devilla@yahoo.com	\N	f	\N	f	\N	\N	\N	f
261	20091	1	UPTGPS	a male and female group gruided by long entreched ideals and traditions of brotherhood	5	173 Banlat Road, Tandang Sora, Quezon City	uptriskelions@gmail.com	ibacungan@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
261	20101	1	UPTGPS	a male and female group gruided by long entreched ideals and traditions of brotherhood	5	173 Banlat Road, Tandang Sora, Quezon City	uptriskelions@gmail.com	ibacungan@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
262	20091	1			9			mrvs357@yahoo.com	\N	f	\N	f	\N	\N	\N	f
263	20091	3	TUP, UP Tennis Society	Tennis UP is a socio-athletic organization that believes in the value of sports,specifically tennis, in developing the overall well-being of an individual. TennisUP is the first and only student tennis organization in UP Diliman.	10	N/A	up.tennis@yahoo.com	vianne7@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
263	20101	1	TUP, UP Tennis Society	Tennis UP is a socio-athletic organization that believes in the value of sports,specifically tennis, in developing the overall well-being of an individual. TennisUP is the first and only student tennis organization in UP Diliman.	10	N/A	up.tennis@yahoo.com	vianne7@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
264	20091	1	UPTC	An organization that aims to promote good ideals in theatre practices	1	Faculty Center UP Diliman 1101	UPTC@yahoo.com	malorerivera@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
264	20101	1	UPTC	An organization that aims to promote good ideals in theatre practices	1	Faculty Center UP Diliman 1101	UPTC@yahoo.com	malorerivera@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
265	20091	2	ThE	Theta Epsilon Sorority (ThE) is a non-political and non-partisan socio-civic group composed of women students principally from the University of the Philippines system	8	(temporary) Blk 4 Lot 6 Don Juan St. Villa Cecilia Subd. Brgy. Mambugan Antipolo City, Rizal 1820	UPThetaEpsilonSorority@yahoogroups.com	oaklygym@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
265	20101	1	ThE	Theta Epsilon Sorority (ThE) is a non-political and non-partisan socio-civic group composed of women students principally from the University of the Philippines system	8	(temporary) Blk 4 Lot 6 Don Juan St. Villa Cecilia Subd. Brgy. Mambugan Antipolo City, Rizal 1820	UPThetaEpsilonSorority@yahoogroups.com	oaklygym@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
266	20091	3	UP Tomo-Kai	The University of the Philippines Philippines-Japan Friendship Club or UP Tomo-Kai is a socio-cultural, non-profit student organization upholding its goals of bridging both the people and the cultures from both countries.	9	Benton Hall, University of the Philippines, Diliman, Quezon City, 1101	uptomokai@gmail.com	andrei_naive@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
266	20101	1	UP Tomo-Kai	The University of the Philippines Philippines-Japan Friendship Club or UP Tomo-Kai is a socio-cultural, non-profit student organization upholding its goals of bridging both the people and the cultures from both countries.	9	Benton Hall, University of the Philippines, Diliman, Quezon City, 1101	uptomokai@gmail.com	andrei_naive@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
267	20091	2	UP TRC	The first and only collegiate touch rugby club in the Philippines, the UP Touch Rugby Club is dedicated to playing and spreading the sport of touch rugby in the University and the country	10	N/A	uptouchrugby@gmail.com	piamedrano@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
267	20101	1	UP TRC	The first and only collegiate touch rugby club in the Philippines, the UP Touch Rugby Club is dedicated to playing and spreading the sport of touch rugby in the University and the country	10	N/A	uptouchrugby@gmail.com	piamedrano@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
268	20091	3	TMS	UP TMS is the only academic organization in Asian Institute of Tourism. It was established in 1997. It aims to develop future  managers of the tourism industry.	1	UP Asian Institute of TourismCommomwealth Avenue, Quezon City, 1101	uptms@yahoo.com	ursula_paula@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
268	20101	1	TMS	UP TMS is the only academic organization in Asian Institute of Tourism. It was established in 1997. It aims to develop future  managers of the tourism industry.	1	UP Asian Institute of TourismCommomwealth Avenue, Quezon City, 1101	uptms@yahoo.com	ursula_paula@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
269	20091	1			9			ean_aguila@yahoo.com	\N	f	\N	f	\N	\N	\N	f
269	20101	1			9			ean_aguila@yahoo.com	\N	f	\N	f	\N	\N	\N	f
270	20091	1			9			ace_0818@yahoo.com	\N	f	\N	f	\N	\N	\N	f
270	20101	1			9			ace_0818@yahoo.com	\N	f	\N	f	\N	\N	\N	f
271	20091	3	Uproj	We challenge our members to explore possibilities outside their comfort zones, to talk with individuals who have successfully defined their paths, to be inspired by these stories, and help them lead their lives.	1	498 Northwestern St., Greenhills East, Mandaluyong, NCR 1550	ask_uproject@yahoogroups.com	mcig.gonzalez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
271	20101	1	Uproj	We challenge our members to explore possibilities outside their comfort zones, to talk with individuals who have successfully defined their paths, to be inspired by these stories, and help them lead their lives.	1	498 Northwestern St., Greenhills East, Mandaluyong, NCR 1550	ask_uproject@yahoogroups.com	mcig.gonzalez@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
272	20091	1	UPSILON		5		upsilon.com	paolomapula@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
272	20101	1	UPSILON		5		upsilon.com	paolomapula@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
273	20091	3	UPV	UP Variates is a socio-academic organization in the School of Statistics. The main goal of the organization is to provide venues that will hone its members' talents and develop their personalities. 	1	UP Variates Tambayan, School of Statistics, R. Magsaysay St., University of the Philippines, Diliman, Quezon City 1101	up_variates@yahoo.com	czarinalei_ignacio@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
273	20101	1	UPV	UP Variates is a socio-academic organization in the School of Statistics. The main goal of the organization is to provide venues that will hone its members' talents and develop their personalities. 	1	UP Variates Tambayan, School of Statistics, R. Magsaysay St., University of the Philippines, Diliman, Quezon City 1101	up_variates@yahoo.com	czarinalei_ignacio@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
274	20091	3	UPVE	a group of students & young professionals unified by a love for Filipino chorale music and endeavouring to share this passion to the Filipino youth	1	Conducting and choral ensemble department, UP College of Music Annex, Diliman, Q.C.	up_vocal_ensemble@yahoo.com	sdcirujales@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
274	20101	1	UPVE	a group of students & young professionals unified by a love for Filipino chorale music and endeavouring to share this passion to the Filipino youth	1	Conducting and choral ensemble department, UP College of Music Annex, Diliman, Q.C.	up_vocal_ensemble@yahoo.com	sdcirujales@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
275	20091	3	UPVC	UPVC is the only sports organization endorsing volleyball as a sport and recreation.	10	College of Human Kinetics, UP Diliman 1101	UPVOLLEYBALLCLUB@yahoogroups.com	roberto_jejomar_alcaraz@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
275	20101	1	UPVC	UPVC is the only sports organization endorsing volleyball as a sport and recreation.	10	College of Human Kinetics, UP Diliman 1101	UPVOLLEYBALLCLUB@yahoogroups.com	roberto_jejomar_alcaraz@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
276	20091	3	WINLAW	WINLAW is a UP-College of Law, all-women organization, established in 1978 to promote civil consciousness, social responsibility and academic excellence among its members, and to produce well-rounded and competent women lawyers in the Philippines.	1	2/F West Wing, Malcolm Hall, College of LawUniversity of the PhilippinesDiliman, Quezon City 1101	upwinlaw@yahoo.com	miffygref@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
276	20101	1	WINLAW	WINLAW is a UP-College of Law, all-women organization, established in 1978 to promote civil consciousness, social responsibility and academic excellence among its members, and to produce well-rounded and competent women lawyers in the Philippines.	1	2/F West Wing, Malcolm Hall, College of LawUniversity of the PhilippinesDiliman, Quezon City 1101	upwinlaw@yahoo.com	miffygref@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
277	20091	1			9			wutapeys@gmail.com	\N	f	\N	f	\N	\N	\N	f
277	20101	1			9			wutapeys@gmail.com	\N	f	\N	f	\N	\N	\N	f
278	20091	1			9			jet_prestoza@yahoo.com	\N	f	\N	f	\N	\N	\N	f
278	20101	1			9			jet_prestoza@yahoo.com	\N	f	\N	f	\N	\N	\N	f
279	20091	2	UPYFC	YOUTH FOR CHRIST is a Catholic charismatic movement affiliated to the Couples for Christ Global Mission Foundation and the network of its corresponding family ministries within the Philippines and abroad, in both school and community based groups.	7	CFC Youth for Christ Tambayan, AS 101 Palma Hall, University of the Philippines, Diliman, Quezon City 1101	upyfc_diliman@yahoo.com	daryl_jumar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
279	20101	1	UPYFC	YOUTH FOR CHRIST is a Catholic charismatic movement affiliated to the Couples for Christ Global Mission Foundation and the network of its corresponding family ministries within the Philippines and abroad, in both school and community based groups.	7	CFC Youth for Christ Tambayan, AS 101 Palma Hall, University of the Philippines, Diliman, Quezon City 1101	upyfc_diliman@yahoo.com	daryl_jumar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
280	20091	3	UPZS, UP Zoosoc	The UP Zoological Society is an academic, socio-civic and environmental organization. Since its birth in 1952, the UP ZooSoc has always catered to the needs of the students and the communities outside the university. Last year was another fruitful year for the organization. UP ZooSoc held a successful ZS Week, celebrating the organizations anniversary with the theme: “Ang Kagilagilalas na Pakikipagsapalaran ni Pong” that focuses on the current conditions of the marine environment. The said celebration was packed with activities such as open tambayan, film showing and a seminar. A medical mission was held last year at Mater Ecclesiae School in San Pedro, Laguna that offered basic medical check-up for the communities around the school. \tThis year is also another busy year for the UP ZooSoc. ZS Week (Aug. 22-28) will focus on the negative effects of the biological advances on the society, entitled: “Fallout: The Negative Impacts of the Bioscientific Advances to the Modern World”. Annual events and activities of the society will keep the organization alive, such as, ACLE, medical missions and Special Project Conventions.	1	Botanical Gardens 2, Institute of Biology, University of the Philippines, Diliman, Quezon City	Botanical Gardens 2, Institute of Biology, University of the Philippines, Diliman, Quezon City	guray_alexispaul@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
280	20101	1	UPZS, UP Zoosoc	The UP Zoological Society is an academic, socio-civic and environmental organization. Since its birth in 1952, the UP ZooSoc has always catered to the needs of the students and the communities outside the university. Last year was another fruitful year for the organization. UP ZooSoc held a successful ZS Week, celebrating the organizations anniversary with the theme: “Ang Kagilagilalas na Pakikipagsapalaran ni Pong” that focuses on the current conditions of the marine environment. The said celebration was packed with activities such as open tambayan, film showing and a seminar. A medical mission was held last year at Mater Ecclesiae School in San Pedro, Laguna that offered basic medical check-up for the communities around the school. \tThis year is also another busy year for the UP ZooSoc. ZS Week (Aug. 22-28) will focus on the negative effects of the biological advances on the society, entitled: “Fallout: The Negative Impacts of the Bioscientific Advances to the Modern World”. Annual events and activities of the society will keep the organization alive, such as, ACLE, medical missions and Special Project Conventions.	1	Botanical Gardens 2, Institute of Biology, University of the Philippines, Diliman, Quezon City	Botanical Gardens 2, Institute of Biology, University of the Philippines, Diliman, Quezon City	guray_alexispaul@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
281	20091	3	Quiwarriors	This organization aims to broaden the appreciation for various forms and approaches to problem solving, enhance analytical skills, and use collaborative programming as a means for personal affirmation and social interaction.	9	130 13th Avenue, CubaoQuezon City1109	upprogrammingguild@gmail.com	syk0saje@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
281	20101	1	Quiwarriors	This organization aims to broaden the appreciation for various forms and approaches to problem solving, enhance analytical skills, and use collaborative programming as a means for personal affirmation and social interaction.	9	130 13th Avenue, CubaoQuezon City1109	upprogrammingguild@gmail.com	syk0saje@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
282	20091	1			1	90 Esteban Abada St., Brgy Loyola Heights, Quezon City	klubtala@gmail.com	synch_jinn@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
282	20101	1			1	90 Esteban Abada St., Brgy Loyola Heights, Quezon City	klubtala@gmail.com	synch_jinn@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
283	20091	1			9				\N	f	\N	f	\N	\N	\N	f
283	20101	1			9				\N	f	\N	f	\N	\N	\N	f
284	20091	1			9				\N	f	\N	f	\N	\N	\N	f
284	20101	1			9				\N	f	\N	f	\N	\N	\N	f
285	20091	1			9				\N	f	\N	f	\N	\N	\N	f
285	20101	1			9				\N	f	\N	f	\N	\N	\N	f
286	20091	1			9				\N	f	\N	f	\N	\N	\N	f
286	20101	1			9				\N	f	\N	f	\N	\N	\N	f
287	20091	3	UP SIGAW	UP SIGAW is a non-profit, cause-oriented organization that aims to promote love for the country through alternative means that will appeal to the Filipino youth.	3	B-7 L-18 Dao Street Greenfields 1, Novaliches, Quezon City (1123)	upsigaw@yahoo.com	jerico.germar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
287	20101	1	UP SIGAW	UP SIGAW is a non-profit, cause-oriented organization that aims to promote love for the country through alternative means that will appeal to the Filipino youth.	3	B-7 L-18 Dao Street Greenfields 1, Novaliches, Quezon City (1123)	upsigaw@yahoo.com	jerico.germar@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
288	20091	1	UP DUO	We are D' Ultimate Organization.	10	173 k1st st. Kamuning, Quezon City. 1103	upduo@yahoo.com	tenpaull@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
288	20101	1	UP DUO	We are D' Ultimate Organization.	10	173 k1st st. Kamuning, Quezon City. 1103	upduo@yahoo.com	tenpaull@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
289	20091	1			9				\N	f	\N	f	\N	\N	\N	f
289	20101	1			9				\N	f	\N	f	\N	\N	\N	f
290	20091	1			9				\N	f	\N	f	\N	\N	\N	f
290	20101	1			9				\N	f	\N	f	\N	\N	\N	f
291	20091	1	UP LENS		1		uplens@gmail.com	erguidoriagao@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
291	20101	1	UP LENS		1		uplens@gmail.com	erguidoriagao@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
292	20091	3	CD Circle	The organization, composed of students of Community Development (CD), is aimed to pursue academic excellence in service of the nation and global community through participatory, gender responsive, empowering and transformative integration of development theory and practice.	1	College of Social Work and Community Development. Magsaysay St. UP Diliman Q.C. 1101	up_cdcircle@yahoogroups.com	hyang_rivera@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
292	20101	1	CD Circle	The organization, composed of students of Community Development (CD), is aimed to pursue academic excellence in service of the nation and global community through participatory, gender responsive, empowering and transformative integration of development theory and practice.	1	College of Social Work and Community Development. Magsaysay St. UP Diliman Q.C. 1101	up_cdcircle@yahoogroups.com	hyang_rivera@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
293	20091	1	UP LENTE	UP LENTE (Legal Network for Truthful Elections) is a chapter of LENTE, Inc. which is the first nationwide network of lawyers, law students, paralegals and other trained volunteers set up by various non-partisan groups engaged in election monitoring work.	3	Blk 8 Lot 14 Soldiers Hills 3 SubdivisionNovaliches, Tala, Kalookan City1427	uplente@gmail.com	jm_rivera123@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
293	20101	1	UP LENTE	UP LENTE (Legal Network for Truthful Elections) is a chapter of LENTE, Inc. which is the first nationwide network of lawyers, law students, paralegals and other trained volunteers set up by various non-partisan groups engaged in election monitoring work.	3	Blk 8 Lot 14 Soldiers Hills 3 SubdivisionNovaliches, Tala, Kalookan City1427	uplente@gmail.com	jm_rivera123@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
294	20091	1	UP Heroes Core	Heroes Core is the first community recognized by the IamNinoy movement and the Benigno S. Aquino foundation. It seeks to bring change through heroic leadership on the 5 levers of change; education, health, livelihood, environment, and governance.	3	847 B Harvard St. Wack- Wack Village Mandaluyong City 1500	847 B Harvard St. Wack- Wack Village Mandaluyong City 1500	heroescore@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
294	20101	1	UP Heroes Core	Heroes Core is the first community recognized by the IamNinoy movement and the Benigno S. Aquino foundation. It seeks to bring change through heroic leadership on the 5 levers of change; education, health, livelihood, environment, and governance.	3	847 B Harvard St. Wack- Wack Village Mandaluyong City 1500	847 B Harvard St. Wack- Wack Village Mandaluyong City 1500	heroescore@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
295	20091	1	UPVFC	The University of the Philippines Volunteers for Children (UPVFC) is a university-based, student-led organization composed of undergraduate and graduate students and faculty members of the University united for the purpose of educating, advocating, and raising funds for the benefit of the Filipino children. We, volunteers, envision them to become happy and prepared individuals by providing opportunities to contribute to their physical, cognitive, socio-emotional, moral and spiritual growth and development. 	4	UP Child Development Center, University of the Philippines Diliman, Quezon City 1101	upvolunteersforchildren@yahoo.com	yanafeliciano@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
295	20101	1	UPVFC	The University of the Philippines Volunteers for Children (UPVFC) is a university-based, student-led organization composed of undergraduate and graduate students and faculty members of the University united for the purpose of educating, advocating, and raising funds for the benefit of the Filipino children. We, volunteers, envision them to become happy and prepared individuals by providing opportunities to contribute to their physical, cognitive, socio-emotional, moral and spiritual growth and development. 	4	UP Child Development Center, University of the Philippines Diliman, Quezon City 1101	upvolunteersforchildren@yahoo.com	yanafeliciano@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
296	20091	1			9				\N	f	\N	f	\N	\N	\N	f
296	20101	1			9				\N	f	\N	f	\N	\N	\N	f
297	20091	2	UP [B]LC	A socio-academic organization focusing on the promotion of the interdisciplinary nature of LIS within and outside the university and recognizing the various possible fields in the practice of the LIS academic program, whilst fulfilling our academic duties as "ISKOLARS NG BAYAN"	1	UP Bibliotech Tambayan, 4th floor Gonzalez Hall, UP Diliman, Quezon City, 1101	up.bibliotech@gmail.com	mondaymacy@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
297	20101	1	UP [B]LC	A socio-academic organization focusing on the promotion of the interdisciplinary nature of LIS within and outside the university and recognizing the various possible fields in the practice of the LIS academic program, whilst fulfilling our academic duties as "ISKOLARS NG BAYAN"	1	UP Bibliotech Tambayan, 4th floor Gonzalez Hall, UP Diliman, Quezon City, 1101	up.bibliotech@gmail.com	mondaymacy@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
298	20091	3	UP golf	UP Golf is for the weekend to competitive golfers and even for those who are just interested to learn/ play. It aims to build a strong foundation not only as a team but as an org as well.	10	847 B Harvard st. Wack Wack Village, Mandaluyong City, 1500	j.lim24@yahoo.com	j.lim24@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
298	20101	1	UP golf	UP Golf is for the weekend to competitive golfers and even for those who are just interested to learn/ play. It aims to build a strong foundation not only as a team but as an org as well.	10	847 B Harvard st. Wack Wack Village, Mandaluyong City, 1500	j.lim24@yahoo.com	j.lim24@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
299	20091	2	UPSC	UP Scrabble Club is an organization composed of students from UP who are addicted to playing scrabble.	10	College of Human Kinetics, UP Diliman, Quezon Cirt, 1101	upscrabbleclub@yahoo.com	emjeyct@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
299	20101	1	UPSC	UP Scrabble Club is an organization composed of students from UP who are addicted to playing scrabble.	10	College of Human Kinetics, UP Diliman, Quezon Cirt, 1101	upscrabbleclub@yahoo.com	emjeyct@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
300	20091	1			9				\N	f	\N	f	\N	\N	\N	f
300	20101	1			9				\N	f	\N	f	\N	\N	\N	f
301	20091	2	AΦB, APB	The Alpha Phi Beta Fraternity, based although not limited to the UP College of Law, is committed to scholarship, advocacy and relevance in UP and national affairs.	5	Unit 1602-A, 16th Floor, Westrade Building, 132 West Avenue, Quezon City	N/A	ry_118@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
301	20101	1	AΦB, APB	The Alpha Phi Beta Fraternity, based although not limited to the UP College of Law, is committed to scholarship, advocacy and relevance in UP and national affairs.	5	Unit 1602-A, 16th Floor, Westrade Building, 132 West Avenue, Quezon City	N/A	ry_118@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
302	20091	1	UP Powerlifting Club	We aim to promote powerlifting not only as a sport but as a discipline that has the capacity to improve one's physical well-being. We also aim to continue our tradition of bringing athletic glory to the university.	10	0256 Los Angeles Street, Brook Side, Cainta, Rizal 1900	uppowerlifting@yahoo.com	pong415@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
302	20101	1	UP Powerlifting Club	We aim to promote powerlifting not only as a sport but as a discipline that has the capacity to improve one's physical well-being. We also aim to continue our tradition of bringing athletic glory to the university.	10	0256 Los Angeles Street, Brook Side, Cainta, Rizal 1900	uppowerlifting@yahoo.com	pong415@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
303	20091	2	ACTS	UP ACTS is the official academic organization for BS Clothing Technology students that aims to help them in their chosen field of study and their future as professionals and leaders in the fashion and garment industry. 	1	Crafts and Interior Design Laboratory, UP Diliman, Quezon City (1101)	actsdiliman@gmail.com	nique_maws@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
303	20101	1	ACTS	UP ACTS is the official academic organization for BS Clothing Technology students that aims to help them in their chosen field of study and their future as professionals and leaders in the fashion and garment industry. 	1	Crafts and Interior Design Laboratory, UP Diliman, Quezon City (1101)	actsdiliman@gmail.com	nique_maws@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
304	20091	1			9				\N	f	\N	f	\N	\N	\N	f
304	20101	1			9				\N	f	\N	f	\N	\N	\N	f
305	20091	3	UP LAMBAK	Organization of UP students from region 2(Cagayan Valley)	6	Yakal Tambayan Complex, UP Diliman, QC 1101	uplambak@yahoo.com	jack_lamud@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
305	20101	1	UP LAMBAK	Organization of UP students from region 2(Cagayan Valley)	6	Yakal Tambayan Complex, UP Diliman, QC 1101	uplambak@yahoo.com	jack_lamud@yahoo.com.ph	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
306	20091	1			9				\N	f	\N	f	\N	\N	\N	f
306	20101	1			9				\N	f	\N	f	\N	\N	\N	f
307	20091	1			9				\N	f	\N	f	\N	\N	\N	f
307	20101	1			9				\N	f	\N	f	\N	\N	\N	f
308	20091	1			9				\N	f	\N	f	\N	\N	\N	f
308	20101	1			9				\N	f	\N	f	\N	\N	\N	f
309	20091	1			9				\N	f	\N	f	\N	\N	\N	f
309	20101	1			9				\N	f	\N	f	\N	\N	\N	f
310	20091	1	UP Jesus Zone	UP Jzone, which stands for Jesus Zone, is a group of Christian students who aim to draw young men and women to Christ. We hope to acheive this by hosting special events that make Jesus known, organizing small discipleship groups that meet regularly for Bible study and fellowship, and providing venues for these young people to serve God.	7	5F Jzone Office, St. Francis Square Bldg., Julia Vargas Ave. cor Bank Drive, Ortigas Center, 1554 Mandaluyong City	upjzone@yahoo.com	jholomoreno@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
310	20101	1	UP Jesus Zone	UP Jzone, which stands for Jesus Zone, is a group of Christian students who aim to draw young men and women to Christ. We hope to acheive this by hosting special events that make Jesus known, organizing small discipleship groups that meet regularly for Bible study and fellowship, and providing venues for these young people to serve God.	7	5F Jzone Office, St. Francis Square Bldg., Julia Vargas Ave. cor Bank Drive, Ortigas Center, 1554 Mandaluyong City	upjzone@yahoo.com	jholomoreno@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
311	20091	1	NNARA-Youth	NNARA-Youth is a mass organization of youth and students advocating for genuine land reform.	3	peasantadvocates@yahoogroups.com	peasantadvocates@yahoogroups.com	dejukamaro_21@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
311	20101	1	NNARA-Youth	NNARA-Youth is a mass organization of youth and students advocating for genuine land reform.	3	peasantadvocates@yahoogroups.com	peasantadvocates@yahoogroups.com	dejukamaro_21@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
312	20091	2	UP Travel Society, UP Travel Soc	Travel Society is a socio-civic, non-political, non-sectarian, non-profit student organization based in UP Asian Institute of Tourism.	9	Student's lounge, Asian Institute of Tourism, University of the Philippines, Diliman, Quezon City. 1101	travel_society@yahoogroups.com	karadenise_c@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
312	20101	1	UP Travel Society, UP Travel Soc	Travel Society is a socio-civic, non-political, non-sectarian, non-profit student organization based in UP Asian Institute of Tourism.	9	Student's lounge, Asian Institute of Tourism, University of the Philippines, Diliman, Quezon City. 1101	travel_society@yahoogroups.com	karadenise_c@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
313	20091	1			9				\N	f	\N	f	\N	\N	\N	f
313	20101	1			9				\N	f	\N	f	\N	\N	\N	f
314	20091	1			9				\N	f	\N	f	\N	\N	\N	f
314	20101	1			9				\N	f	\N	f	\N	\N	\N	f
315	20091	2	NUPL	The National Union of Peoples’ Lawyers (NUPL) is a nationwide voluntary association of human rights lawyers in the Philippines committed to the defense, protection, and promotion of human rights, especially of the poor and the oppressed. The UP chapter, composed of associate member-law students, serves as a mechanism for collaboration, coordination, and facilitation of legal services on the local level.	3	Malcolm Hall, UP College of LawQuezon City 1101	uppeopleslawyers@yahoogroups.com	krissy.conti@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
315	20101	1	NUPL	The National Union of Peoples’ Lawyers (NUPL) is a nationwide voluntary association of human rights lawyers in the Philippines committed to the defense, protection, and promotion of human rights, especially of the poor and the oppressed. The UP chapter, composed of associate member-law students, serves as a mechanism for collaboration, coordination, and facilitation of legal services on the local level.	3	Malcolm Hall, UP College of LawQuezon City 1101	uppeopleslawyers@yahoogroups.com	krissy.conti@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
316	20091	2	KKB-UP	A Christian youth movement with a mission, to inspire the youth to live for Christ and to offer the prime years of their life in service to God and country.	7	4/F Jaridilla Bldg. 532 Gastambide St., Sampaloc, Manila, Philippines 1008	kkbupd@yahoo.com	daphydoodleduds@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
316	20101	1	KKB-UP	A Christian youth movement with a mission, to inspire the youth to live for Christ and to offer the prime years of their life in service to God and country.	7	4/F Jaridilla Bldg. 532 Gastambide St., Sampaloc, Manila, Philippines 1008	kkbupd@yahoo.com	daphydoodleduds@gmail.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
317	20091	1			9				\N	f	\N	f	\N	\N	\N	f
317	20101	1			9				\N	f	\N	f	\N	\N	\N	f
318	20091	1			9				\N	f	\N	f	\N	\N	\N	f
318	20101	1			9				\N	f	\N	f	\N	\N	\N	f
319	20091	1			9				\N	f	\N	f	\N	\N	\N	f
319	20101	1			9				\N	f	\N	f	\N	\N	\N	f
320	20091	1	Anthorsoc	The UP Anthropology Society is a CSSP based academic organization that aims to empower the students to take part in the strengthening of the student body in order to seek a more holistic learning opportunity in the field of Anthropology in the university.	1	Department of Anthropology, University of the Philippines, Diliman Quezon City, 1101	anthro.org@gmil.com	iyabautista03@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
320	20101	1	Anthorsoc	The UP Anthropology Society is a CSSP based academic organization that aims to empower the students to take part in the strengthening of the student body in order to seek a more holistic learning opportunity in the field of Anthropology in the university.	1	Department of Anthropology, University of the Philippines, Diliman Quezon City, 1101	anthro.org@gmil.com	iyabautista03@yahoo.com	1970-01-01	f	1970-01-01	f	\N	\N	\N	f
321	20091	1			9				\N	f	\N	f	\N	\N	\N	f
321	20101	1			9				\N	f	\N	f	\N	\N	\N	f
\.


--
-- Data for Name: orgstatuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgstatuses (orgstatusid, description) FROM stdin;
1	Application Not Yet Submitted
2	Application Pending
3	Rejected
4	Renewed
\.


--
-- Data for Name: orgsubmittedrequirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orgsubmittedrequirements (organizationid, requirementid, submittedon, comments, insertedon, insertedby, updatedon, updatedby) FROM stdin;
\.


--
-- Data for Name: plannedevents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plannedevents (plannedeventid, organizationid, appsemid, eventname, eventcategoryid, description) FROM stdin;
\.


--
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requirements (requirementid, appsemid, name, description, insertedon, insertedby, updatedon, updatedby) FROM stdin;
\.


--
-- Data for Name: studentpictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY studentpictures (studentpictureid, studentid, appsemid, filepath) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY students (studentid, useraccountid, webmail) FROM stdin;
\.


--
-- Data for Name: variables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY variables (varname, value) FROM stdin;
current_aysem	20101
\.


--
-- Name: announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (announcementid);


--
-- Name: appsems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY appsems
    ADD CONSTRAINT appsems_pkey PRIMARY KEY (appsemid);


--
-- Name: awardclassifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY awardclassifications
    ADD CONSTRAINT awardclassifications_pkey PRIMARY KEY (awardclassificationid);


--
-- Name: email_queue_emailtypeid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_emailtypeid_key UNIQUE (emailtypeid, organizationid, facultyid, studentid, announcementid, orgclarificationid, sent);


--
-- Name: email_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_pkey PRIMARY KEY (emailqueueid);


--
-- Name: email_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY email_types
    ADD CONSTRAINT email_types_pkey PRIMARY KEY (emailtypeid);


--
-- Name: eventcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY eventcategories
    ADD CONSTRAINT eventcategories_pkey PRIMARY KEY (eventcategoryid);


--
-- Name: eventreports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY eventreports
    ADD CONSTRAINT eventreports_pkey PRIMARY KEY (eventreportid);


--
-- Name: faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (facultyid);


--
-- Name: facultyprofile_facultyid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY facultyprofile
    ADD CONSTRAINT facultyprofile_facultyid_key UNIQUE (facultyid);


--
-- Name: facultyprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY facultyprofile
    ADD CONSTRAINT facultyprofile_pkey PRIMARY KEY (facultyprofileid);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (groupid);


--
-- Name: linkaccounts_hashcode_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY linkaccounts
    ADD CONSTRAINT linkaccounts_hashcode_key UNIQUE (hashcode);


--
-- Name: linkaccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY linkaccounts
    ADD CONSTRAINT linkaccounts_pkey PRIMARY KEY (linkaccountid);


--
-- Name: loginaccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY loginaccounts
    ADD CONSTRAINT loginaccounts_pkey PRIMARY KEY (loginaccountid);


--
-- Name: loginaccounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY loginaccounts
    ADD CONSTRAINT loginaccounts_username_key UNIQUE (username);


--
-- Name: ogadvisers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgadvisers
    ADD CONSTRAINT ogadvisers_pk PRIMARY KEY (organizationid, facultyid, appsemid);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (organizationid);


--
-- Name: orgawards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgawards
    ADD CONSTRAINT orgawards_pkey PRIMARY KEY (orgawardid);


--
-- Name: orgcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgcategories
    ADD CONSTRAINT orgcategories_pkey PRIMARY KEY (orgcategoryid);


--
-- Name: orgclarifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgclarifications
    ADD CONSTRAINT orgclarifications_pkey PRIMARY KEY (orgclarificationid);


--
-- Name: orgcollections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgcollections
    ADD CONSTRAINT orgcollections_pkey PRIMARY KEY (orgcollectionid);


--
-- Name: orgdisbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgdisbursements
    ADD CONSTRAINT orgdisbursements_pkey PRIMARY KEY (orgdisbursementid);


--
-- Name: orgmemberships_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgmemberships
    ADD CONSTRAINT orgmemberships_pk PRIMARY KEY (organizationid, studentid, appsemid);


--
-- Name: orgprofiles_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgprofiles
    ADD CONSTRAINT orgprofiles_pk PRIMARY KEY (organizationid, appsemid);


--
-- Name: orgstatuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgstatuses
    ADD CONSTRAINT orgstatuses_pkey PRIMARY KEY (orgstatusid);


--
-- Name: orgsumittedrequirements_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgsubmittedrequirements
    ADD CONSTRAINT orgsumittedrequirements_pk PRIMARY KEY (organizationid, requirementid);


--
-- Name: plannedevents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plannedevents
    ADD CONSTRAINT plannedevents_pkey PRIMARY KEY (plannedeventid);


--
-- Name: requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (requirementid);


--
-- Name: requirements_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requirements
    ADD CONSTRAINT requirements_unique UNIQUE (appsemid, name);


--
-- Name: studentpictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY studentpictures
    ADD CONSTRAINT studentpictures_pkey PRIMARY KEY (studentpictureid);


--
-- Name: studentpictures_studentid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY studentpictures
    ADD CONSTRAINT studentpictures_studentid_key UNIQUE (studentid, appsemid);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (studentid);


--
-- Name: announcements_loginaccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY announcements
    ADD CONSTRAINT announcements_loginaccountid_fkey FOREIGN KEY (loginaccountid) REFERENCES loginaccounts(loginaccountid);


--
-- Name: appsems_insertedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appsems
    ADD CONSTRAINT appsems_insertedby_fkey FOREIGN KEY (insertedby) REFERENCES loginaccounts(loginaccountid);


--
-- Name: email_queue_announcementid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_announcementid_fkey FOREIGN KEY (announcementid) REFERENCES announcements(announcementid);


--
-- Name: email_queue_emailtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_emailtypeid_fkey FOREIGN KEY (emailtypeid) REFERENCES email_types(emailtypeid);


--
-- Name: email_queue_facultyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_facultyid_fkey FOREIGN KEY (facultyid) REFERENCES faculty(facultyid);


--
-- Name: email_queue_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: email_queue_orgclarificationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_orgclarificationid_fkey FOREIGN KEY (orgclarificationid) REFERENCES orgclarifications(orgclarificationid);


--
-- Name: email_queue_studentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_queue
    ADD CONSTRAINT email_queue_studentid_fkey FOREIGN KEY (studentid) REFERENCES students(studentid);


--
-- Name: eventreports_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventreports
    ADD CONSTRAINT eventreports_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: eventreports_eventcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventreports
    ADD CONSTRAINT eventreports_eventcategoryid_fkey FOREIGN KEY (eventcategoryid) REFERENCES eventcategories(eventcategoryid);


--
-- Name: eventreports_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY eventreports
    ADD CONSTRAINT eventreports_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: faculty_useraccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY faculty
    ADD CONSTRAINT faculty_useraccountid_fkey FOREIGN KEY (useraccountid) REFERENCES linkaccounts(linkaccountid);


--
-- Name: facultyprofile_facultyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facultyprofile
    ADD CONSTRAINT facultyprofile_facultyid_fkey FOREIGN KEY (facultyid) REFERENCES faculty(facultyid);


--
-- Name: linkaccounts_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY linkaccounts
    ADD CONSTRAINT linkaccounts_groupid_fkey FOREIGN KEY (groupid) REFERENCES groups(groupid);


--
-- Name: loginaccounts_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY loginaccounts
    ADD CONSTRAINT loginaccounts_groupid_fkey FOREIGN KEY (groupid) REFERENCES groups(groupid);


--
-- Name: orgadvisers_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgadvisers
    ADD CONSTRAINT orgadvisers_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: orgadvisers_facultyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgadvisers
    ADD CONSTRAINT orgadvisers_facultyid_fkey FOREIGN KEY (facultyid) REFERENCES faculty(facultyid);


--
-- Name: orgadvisers_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgadvisers
    ADD CONSTRAINT orgadvisers_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: organizations_loginaccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_loginaccountid_fkey FOREIGN KEY (loginaccountid) REFERENCES loginaccounts(loginaccountid);


--
-- Name: orgawards_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgawards
    ADD CONSTRAINT orgawards_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: orgawards_awardclassificationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgawards
    ADD CONSTRAINT orgawards_awardclassificationid_fkey FOREIGN KEY (awardclassificationid) REFERENCES awardclassifications(awardclassificationid);


--
-- Name: orgawards_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgawards
    ADD CONSTRAINT orgawards_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: orgclarifications_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgclarifications
    ADD CONSTRAINT orgclarifications_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: orgclarifications_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgclarifications
    ADD CONSTRAINT orgclarifications_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: orgcollections_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgcollections
    ADD CONSTRAINT orgcollections_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: orgcollections_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgcollections
    ADD CONSTRAINT orgcollections_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: orgdisbursements_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgdisbursements
    ADD CONSTRAINT orgdisbursements_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: orgdisbursements_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgdisbursements
    ADD CONSTRAINT orgdisbursements_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: orgmemberships_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgmemberships
    ADD CONSTRAINT orgmemberships_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: orgmemberships_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgmemberships
    ADD CONSTRAINT orgmemberships_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: orgmemberships_studentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgmemberships
    ADD CONSTRAINT orgmemberships_studentid_fkey FOREIGN KEY (studentid) REFERENCES students(studentid);


--
-- Name: orgprofiles_approvedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgprofiles
    ADD CONSTRAINT orgprofiles_approvedby_fkey FOREIGN KEY (approvedby) REFERENCES linkaccounts(linkaccountid);


--
-- Name: orgprofiles_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgprofiles
    ADD CONSTRAINT orgprofiles_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: orgprofiles_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgprofiles
    ADD CONSTRAINT orgprofiles_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: orgprofiles_orgcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgprofiles
    ADD CONSTRAINT orgprofiles_orgcategoryid_fkey FOREIGN KEY (orgcategoryid) REFERENCES orgcategories(orgcategoryid);


--
-- Name: orgprofiles_orgstatusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgprofiles
    ADD CONSTRAINT orgprofiles_orgstatusid_fkey FOREIGN KEY (orgstatusid) REFERENCES orgstatuses(orgstatusid);


--
-- Name: orgsubmittedrequirements_insertedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgsubmittedrequirements
    ADD CONSTRAINT orgsubmittedrequirements_insertedby_fkey FOREIGN KEY (insertedby) REFERENCES loginaccounts(loginaccountid);


--
-- Name: orgsubmittedrequirements_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgsubmittedrequirements
    ADD CONSTRAINT orgsubmittedrequirements_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: orgsubmittedrequirements_requirementid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgsubmittedrequirements
    ADD CONSTRAINT orgsubmittedrequirements_requirementid_fkey FOREIGN KEY (requirementid) REFERENCES requirements(requirementid);


--
-- Name: orgsubmittedrequirements_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgsubmittedrequirements
    ADD CONSTRAINT orgsubmittedrequirements_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES loginaccounts(loginaccountid);


--
-- Name: plannedevents_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plannedevents
    ADD CONSTRAINT plannedevents_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: plannedevents_eventcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plannedevents
    ADD CONSTRAINT plannedevents_eventcategoryid_fkey FOREIGN KEY (eventcategoryid) REFERENCES eventcategories(eventcategoryid);


--
-- Name: plannedevents_organizationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plannedevents
    ADD CONSTRAINT plannedevents_organizationid_fkey FOREIGN KEY (organizationid) REFERENCES organizations(organizationid);


--
-- Name: requirements_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requirements
    ADD CONSTRAINT requirements_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: requirements_insertedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requirements
    ADD CONSTRAINT requirements_insertedby_fkey FOREIGN KEY (insertedby) REFERENCES loginaccounts(loginaccountid);


--
-- Name: requirements_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requirements
    ADD CONSTRAINT requirements_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES loginaccounts(loginaccountid);


--
-- Name: studentpictures_appsemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentpictures
    ADD CONSTRAINT studentpictures_appsemid_fkey FOREIGN KEY (appsemid) REFERENCES appsems(appsemid);


--
-- Name: studentpictures_studentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentpictures
    ADD CONSTRAINT studentpictures_studentid_fkey FOREIGN KEY (studentid) REFERENCES students(studentid);


--
-- Name: students_useraccountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_useraccountid_fkey FOREIGN KEY (useraccountid) REFERENCES linkaccounts(linkaccountid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

