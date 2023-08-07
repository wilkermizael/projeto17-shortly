--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: conturl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conturl (
    id integer NOT NULL,
    urls text NOT NULL,
    "shortId" integer NOT NULL,
    cont integer DEFAULT 1 NOT NULL
);


--
-- Name: conturl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conturl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conturl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conturl_id_seq OWNED BY public.conturl.id;


--
-- Name: register; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.register (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: register_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.register_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: register_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.register_id_seq OWNED BY public.register.id;


--
-- Name: urlshort; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: urlshort_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urlshort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urlshort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urlshort_id_seq OWNED BY public.urlshort.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: conturl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conturl ALTER COLUMN id SET DEFAULT nextval('public.conturl_id_seq'::regclass);


--
-- Name: register id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.register ALTER COLUMN id SET DEFAULT nextval('public.register_id_seq'::regclass);


--
-- Name: urlshort id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urlshort ALTER COLUMN id SET DEFAULT nextval('public.urlshort_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: conturl; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.conturl VALUES (1, 'OwDqfbEiQyrxdJJtdQFbg', 3, 2);
INSERT INTO public.conturl VALUES (2, 'sY_g3j9qbbmaDyM8xjZZJ', 3, 3);
INSERT INTO public.conturl VALUES (3, 'CuqkQWMw8nmVyWT3_IIxH', 3, 4);
INSERT INTO public.conturl VALUES (4, '_JIwSLiEhdM94txIsjQFB', 2, 6);
INSERT INTO public.conturl VALUES (5, 'nCmKJrkOZGnAsRreNs0Kw', 2, 1);


--
-- Data for Name: register; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.register VALUES (1, 'Gean', 'gean@driven.com.br', '$2b$04$tQL8TAzNblvHEB2G.PuV7ewrQ5VS.gOSAqXrgivJ10wsLU8lN7EXS', '2023-08-06 16:58:21.118423');
INSERT INTO public.register VALUES (2, 'Wilker', 'wilker@driven.com.br', '$2b$04$8Usv6GeLji7VUmYDKZp6luBw0x6Z/L3rOZwO1oCk.YRMERlQXuUlW', '2023-08-06 16:58:47.821306');
INSERT INTO public.register VALUES (3, 'Thais', 'thais@driven.com.br', '$2b$04$MezCSbMtsFlgNz0/VDFz7unLNB.BmGFLw.lJ36pOLrz5d2DIHeyv6', '2023-08-06 16:59:05.071946');


--
-- Data for Name: urlshort; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urlshort VALUES (2, '4rHjMXDV9votVxgMykKZ3', 'https://i.pinimg.com/236x/06/a9/fd/06a9fdb95004685bea8418b364912414.jpg', 3, '2023-08-06 18:11:16.527507', 0, true);
INSERT INTO public.urlshort VALUES (3, 'CuqkQWMw8nmVyWT3_IIxH', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThfPNAsmE7xfxpnwJw_kAADFgHPEVqMGcbfQ&usqp=CAU', 3, '2023-08-06 18:11:36.243072', 0, true);
INSERT INTO public.urlshort VALUES (5, '_JIwSLiEhdM94txIsjQFB', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi33rsjvQDjenpxdgHFgLoas-_OIAeEvYEt82r-JfKICjH4APy13WSkY9Uj9aNpORM4GE&usqp=CAU', 2, '2023-08-06 18:14:20.3047', 0, true);
INSERT INTO public.urlshort VALUES (7, 'VRbcHTobUiAx8CnqzEGa2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRDzmS4yJU0ztGx4tkmBRQSX4V2JWlVCD_sg&usqp=CAU', 2, '2023-08-06 18:14:48.293628', 0, true);
INSERT INTO public.urlshort VALUES (8, 'UiRBFtKahl6BPfC89tHQO', 'https://storage.googleapis.com/dpw/app/uploads/2009/12/como-otimizar-imagens-web-internet1.jpg', 2, '2023-08-06 18:30:01.205794', 0, true);
INSERT INTO public.urlshort VALUES (9, 'oGWnOSV3ZRA0tWIvZRKUh', 'https://imagens.mdig.com.br/thbs/45184mn.jpg', 1, '2023-08-06 18:30:54.491021', 0, true);
INSERT INTO public.urlshort VALUES (10, 'pTw-gAZfkV9Aj8iWG_ts_', 'https://terramagna.com.br/wp-content/uploads/2022/09/aparelho-imagens-de-satelite-espaco-terra.jpg', 1, '2023-08-06 18:31:06.107309', 0, true);
INSERT INTO public.urlshort VALUES (11, 'sfNBXj8ZQutCaIv-WhrJp', 'https://terramagna.com.br/wp-content/uploads/2022/09/aparelho-imagens-de-satelite-espaco-terra.jpg', 1, '2023-08-06 22:49:37.596069', 0, true);
INSERT INTO public.urlshort VALUES (12, 'qGX9385r8rPevDmj9iZhm', 'https://terramagna.com.br/wp-content/uploads/2022/09/aparelho-imagens-de-satelite-espaco-terra.jpg', 1, '2023-08-06 22:49:40.289541', 0, true);
INSERT INTO public.urlshort VALUES (6, 'nCmKJrkOZGnAsRreNs0Kw', 'https://images.unsplash.com/reserve/Af0sF2OS5S5gatqrKzVP_Silhoutte.jpg?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80', 2, '2023-08-06 18:14:37.784072', 3, true);
INSERT INTO public.urlshort VALUES (1, 'OwDqfbEiQyrxdJJtdQFbg', 'https://www.designerd.com.br/wp-content/uploads/2019/04/imagens-blogs-chamar-atencao-publico-fb.jpg', 3, '2023-08-06 17:04:23.357445', 1, true);
INSERT INTO public.urlshort VALUES (4, 'sY_g3j9qbbmaDyM8xjZZJ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRANjsso0tJ_L5AYy-Xw3wIoNGmsVjEAEy2Rw&usqp=CAU', 3, '2023-08-06 18:11:49.039086', 15, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'gean@driven.com.br', 'a65898c1-f6a6-418b-a4d8-a58dae391a6c', '2023-08-06 16:58:33.854271');
INSERT INTO public.users VALUES (2, 'wilker@driven.com.br', 'e8b1c2f0-332b-49b1-91dd-faf6243111f3', '2023-08-06 16:58:54.439321');
INSERT INTO public.users VALUES (3, 'thais@driven.com.br', '00d0e68a-d0cb-4df0-b299-acca00ee2e9b', '2023-08-06 16:59:11.018909');


--
-- Name: conturl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conturl_id_seq', 5, true);


--
-- Name: register_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.register_id_seq', 3, true);


--
-- Name: urlshort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urlshort_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: conturl conturl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conturl
    ADD CONSTRAINT conturl_pkey PRIMARY KEY (id);


--
-- Name: register register_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.register
    ADD CONSTRAINT register_email_key UNIQUE (email);


--
-- Name: register register_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.register
    ADD CONSTRAINT register_pkey PRIMARY KEY (id);


--
-- Name: urlshort urlshort_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urlshort
    ADD CONSTRAINT urlshort_pkey PRIMARY KEY (id);


--
-- Name: urlshort urlshort_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urlshort
    ADD CONSTRAINT "urlshort_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_token_key UNIQUE (token);


--
-- Name: urlshort urlshort_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urlshort
    ADD CONSTRAINT "urlshort_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

