--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: course; Type: TABLE; Schema: public; Owner: thomaav
--

CREATE TABLE course (
    course_id character varying(32) NOT NULL,
    course_name text
);


ALTER TABLE course OWNER TO thomaav;

--
-- Name: oving; Type: TABLE; Schema: public; Owner: thomaav
--

CREATE TABLE oving (
    oving_id integer NOT NULL,
    course_id character varying(32),
    info text,
    due_date timestamp without time zone NOT NULL,
    finished boolean DEFAULT false NOT NULL
);


ALTER TABLE oving OWNER TO thomaav;

--
-- Name: oving_oving_id_seq; Type: SEQUENCE; Schema: public; Owner: thomaav
--

CREATE SEQUENCE oving_oving_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oving_oving_id_seq OWNER TO thomaav;

--
-- Name: oving_oving_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thomaav
--

ALTER SEQUENCE oving_oving_id_seq OWNED BY oving.oving_id;


--
-- Name: oving oving_id; Type: DEFAULT; Schema: public; Owner: thomaav
--

ALTER TABLE ONLY oving ALTER COLUMN oving_id SET DEFAULT nextval('oving_oving_id_seq'::regclass);


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: thomaav
--

COPY course (course_id, course_name) FROM stdin;
TMA4135	Matematikk 4D
TDT4258	Maskinnær programmering
TDT4165	Programmeringsspråk
TDT4136	Introduksjon til kunstig intelligens
\.


--
-- Data for Name: oving; Type: TABLE DATA; Schema: public; Owner: thomaav
--

COPY oving (oving_id, course_id, info, due_date, finished) FROM stdin;
5	TDT4136	Assignment 1	2017-09-11 23:00:00	f
3	TDT4165	Problem set 1	2017-09-01 20:00:00	f
6	TDT4258	Exercise 1	2017-10-12 00:00:00	f
7	TDT4258	Exercise 2	2017-11-09 00:00:00	f
8	TDT4258	Exercise 3	2017-12-14 00:00:00	f
9	TMA4135	Øving 2	2017-09-27 00:00:00	f
2	TMA4135	Øving 1	2017-09-04 16:00:00	f
4	TDT4165	Problem set 2	2017-09-15 16:00:00	f
\.


--
-- Name: oving_oving_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thomaav
--

SELECT pg_catalog.setval('oving_oving_id_seq', 9, true);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: thomaav
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- Name: oving oving_pkey; Type: CONSTRAINT; Schema: public; Owner: thomaav
--

ALTER TABLE ONLY oving
    ADD CONSTRAINT oving_pkey PRIMARY KEY (oving_id);


--
-- Name: oving oving_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thomaav
--

ALTER TABLE ONLY oving
    ADD CONSTRAINT oving_course_id_fkey FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

