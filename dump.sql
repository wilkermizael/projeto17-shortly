--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

-- Started on 2023-08-02 17:45:07 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE shortlydb;
--
-- TOC entry 3608 (class 1262 OID 16491)
-- Name: shortlydb; Type: DATABASE; Schema: -; Owner: wilkermizael
--

CREATE DATABASE shortlydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE shortlydb OWNER TO wilkermizael;

\connect shortlydb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: wilkermizael
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO wilkermizael;

--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: wilkermizael
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16492)
-- Name: register; Type: TABLE; Schema: public; Owner: wilkermizael
--

CREATE TABLE public.register (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    confirmpassword text NOT NULL
);


ALTER TABLE public.register OWNER TO wilkermizael;

--
-- TOC entry 210 (class 1259 OID 16501)
-- Name: users; Type: TABLE; Schema: public; Owner: wilkermizael
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    password text NOT NULL,
    activ boolean DEFAULT true
);


ALTER TABLE public.users OWNER TO wilkermizael;

--
-- TOC entry 3601 (class 0 OID 16492)
-- Dependencies: 209
-- Data for Name: register; Type: TABLE DATA; Schema: public; Owner: wilkermizael
--

COPY public.register (id, name, email, password, confirmpassword) FROM stdin;
\.


--
-- TOC entry 3602 (class 0 OID 16501)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: wilkermizael
--

COPY public.users (id, name, password, activ) FROM stdin;
\.


--
-- TOC entry 3457 (class 2606 OID 16500)
-- Name: register register_email_key; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.register
    ADD CONSTRAINT register_email_key UNIQUE (email);


--
-- TOC entry 3459 (class 2606 OID 16498)
-- Name: register register_pkey; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.register
    ADD CONSTRAINT register_pkey PRIMARY KEY (id);


--
-- TOC entry 3461 (class 2606 OID 16508)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2023-08-02 17:45:07 -03

--
-- PostgreSQL database dump complete
--

