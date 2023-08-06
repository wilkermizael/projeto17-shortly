--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

-- Started on 2023-08-06 14:20:44 -03

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
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: wilkermizael
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16528)
-- Name: register; Type: TABLE; Schema: public; Owner: wilkermizael
--

CREATE TABLE public.register (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.register OWNER TO wilkermizael;

--
-- TOC entry 209 (class 1259 OID 16527)
-- Name: register_id_seq; Type: SEQUENCE; Schema: public; Owner: wilkermizael
--

CREATE SEQUENCE public.register_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.register_id_seq OWNER TO wilkermizael;

--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 209
-- Name: register_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wilkermizael
--

ALTER SEQUENCE public.register_id_seq OWNED BY public.register.id;


--
-- TOC entry 214 (class 1259 OID 16764)
-- Name: urlshort; Type: TABLE; Schema: public; Owner: wilkermizael
--

CREATE TABLE public.urlshort (
    id integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "visitCount" integer DEFAULT 0,
    activ boolean DEFAULT true
);


ALTER TABLE public.urlshort OWNER TO wilkermizael;

--
-- TOC entry 213 (class 1259 OID 16763)
-- Name: urlshort_id_seq; Type: SEQUENCE; Schema: public; Owner: wilkermizael
--

CREATE SEQUENCE public.urlshort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urlshort_id_seq OWNER TO wilkermizael;

--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 213
-- Name: urlshort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wilkermizael
--

ALTER SEQUENCE public.urlshort_id_seq OWNED BY public.urlshort.id;


--
-- TOC entry 212 (class 1259 OID 16584)
-- Name: users; Type: TABLE; Schema: public; Owner: wilkermizael
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    token text NOT NULL
);


ALTER TABLE public.users OWNER TO wilkermizael;

--
-- TOC entry 211 (class 1259 OID 16583)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: wilkermizael
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO wilkermizael;

--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wilkermizael
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3462 (class 2604 OID 16531)
-- Name: register id; Type: DEFAULT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.register ALTER COLUMN id SET DEFAULT nextval('public.register_id_seq'::regclass);


--
-- TOC entry 3464 (class 2604 OID 16767)
-- Name: urlshort id; Type: DEFAULT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.urlshort ALTER COLUMN id SET DEFAULT nextval('public.urlshort_id_seq'::regclass);


--
-- TOC entry 3463 (class 2604 OID 16587)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3621 (class 0 OID 16528)
-- Dependencies: 210
-- Data for Name: register; Type: TABLE DATA; Schema: public; Owner: wilkermizael
--

COPY public.register (id, name, email, password) FROM stdin;
1	Joao	joao@driven.com.br	$2b$04$gPcmI7tdbCjbaCfoefHEA.JQgzDErfFoX5ARwLRgl7Q7kzY0Xf8Cq
2	Wilker	wilker@driven.com.br	$2b$04$Xy4O3eYQ43O5ZBtWjHrDkOz9KBbBagiHTqvWrjZzGreKms3mz7GdW
3	Pedro	pedro@driven.com.br	$2b$04$4oEurTWFRQ3H.tzC4zFowuaghjrx.XEKbESEIhKckQ9yBo28zkTp6
4	Gean	Gean@driven.com.br	$2b$04$oaaSr.hmhlSx85V0oA8oje4FN8EXkht/e2z1QVfSakbOsP02/yWia
\.


--
-- TOC entry 3625 (class 0 OID 16764)
-- Dependencies: 214
-- Data for Name: urlshort; Type: TABLE DATA; Schema: public; Owner: wilkermizael
--

COPY public.urlshort (id, "shortUrl", url, "userId", "createdAt", "visitCount", activ) FROM stdin;
2	hAI5lc065mMUFgP2133OC	https://galeria.ufsc.br/d/80593-2/imagens-imagens-paisagens-naturais-408533.jpg	4	2023-08-04 21:56:44.963035	0	t
3	F1mdC2PkgGTI7NjfhzXHH	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReI-2F_aW3L-2oaLc1jAl4bQeig5E_x_qDgg&usqp=CAU	4	2023-08-04 21:56:56.21881	0	t
5	NSptRLVQpRqJtMXbMR7a4	https://meunegocio.uol.com.br/blog/wp-content/uploads/2020/04/banco-imagens.jpg	1	2023-08-04 21:57:45.534201	0	t
6	neaodiJuuYu3utk8FtYRD	https://staticr1.blastingcdn.com/media/photogallery/2017/10/10/660x290/b_600x290x82/tripofobia-o-transtorno-de-quem-tem-medo-de-buracos_1623679.jpg	1	2023-08-04 21:58:02.556712	0	t
7	FyXiU21U8-qqo4MtOSuck	https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2022/07/http___cdn.cnn_.com_cnnnext_dam_assets_220714095015-joel-sartore-7.jpg?w=876&h=484&crop=1	2	2023-08-04 21:59:01.233071	0	t
8	c0se-Ouj-WSzIW2kBR7hG	https://www.designerd.com.br/wp-content/uploads/2019/04/imagens-blogs-chamar-atencao-publico-fb.jpg	2	2023-08-04 21:59:13.108352	0	t
\.


--
-- TOC entry 3623 (class 0 OID 16584)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: wilkermizael
--

COPY public.users (id, email, token) FROM stdin;
1	joao@driven.com.br	ca7a81ae-c201-45f4-8683-57b50384a249
2	wilker@driven.com.br	eb6ee99c-a4df-47da-9ce0-524008f5b749
4	pedro@driven.com.br	5f25286f-1f66-4c4e-a89a-8232998ac945
5	Gean@driven.com.br	4b5f3ddb-bf42-4ca5-a722-48cf6eea594e
\.


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 209
-- Name: register_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wilkermizael
--

SELECT pg_catalog.setval('public.register_id_seq', 4, true);


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 213
-- Name: urlshort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wilkermizael
--

SELECT pg_catalog.setval('public.urlshort_id_seq', 8, true);


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wilkermizael
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 3469 (class 2606 OID 16537)
-- Name: register register_email_key; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.register
    ADD CONSTRAINT register_email_key UNIQUE (email);


--
-- TOC entry 3471 (class 2606 OID 16535)
-- Name: register register_pkey; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.register
    ADD CONSTRAINT register_pkey PRIMARY KEY (id);


--
-- TOC entry 3477 (class 2606 OID 16774)
-- Name: urlshort urlshort_pkey; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.urlshort
    ADD CONSTRAINT urlshort_pkey PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 16776)
-- Name: urlshort urlshort_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.urlshort
    ADD CONSTRAINT "urlshort_shortUrl_key" UNIQUE ("shortUrl");


--
-- TOC entry 3473 (class 2606 OID 16591)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3475 (class 2606 OID 16593)
-- Name: users users_token_key; Type: CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_token_key UNIQUE (token);


--
-- TOC entry 3480 (class 2606 OID 16777)
-- Name: urlshort urlshort_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wilkermizael
--

ALTER TABLE ONLY public.urlshort
    ADD CONSTRAINT "urlshort_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


-- Completed on 2023-08-06 14:20:45 -03

--
-- PostgreSQL database dump complete
--

