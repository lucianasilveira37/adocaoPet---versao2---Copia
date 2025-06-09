--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.6

-- Started on 2025-06-09 16:13:42

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
-- TOC entry 215 (class 1259 OID 16856)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expiration timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16860)
-- Name: password_resets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.password_resets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.password_resets_id_seq OWNER TO postgres;

--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 216
-- Name: password_resets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.password_resets_id_seq OWNED BY public.password_resets.id;


--
-- TOC entry 217 (class 1259 OID 16861)
-- Name: pet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pet (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    specie character varying(20) NOT NULL,
    sex character varying(10) NOT NULL,
    age character varying(10) NOT NULL,
    size character varying(10) NOT NULL,
    state_id character varying(2) NOT NULL,
    city_id character varying(100) NOT NULL,
    description text,
    avatar character varying(255),
    castrated boolean DEFAULT false,
    vaccinated boolean DEFAULT false,
    vermifugate boolean DEFAULT false,
    need_special_care boolean DEFAULT false,
    docile boolean DEFAULT false,
    aggressive boolean DEFAULT false,
    calm boolean DEFAULT false,
    playful boolean DEFAULT false,
    sociable boolean DEFAULT false,
    aloof boolean DEFAULT false,
    independent boolean DEFAULT false,
    needy boolean DEFAULT false,
    friendly_with_house_with_backyard boolean DEFAULT false,
    friendly_with_apartment boolean DEFAULT false,
    sociability_cats boolean DEFAULT false,
    sociability_dogs boolean DEFAULT false,
    sociability_children boolean DEFAULT false,
    sociability_unknown boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    adotado boolean DEFAULT false,
    tutor_id character varying(20)
);


ALTER TABLE public.pet OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16885)
-- Name: pet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pet_id_seq OWNER TO postgres;

--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 218
-- Name: pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pet_id_seq OWNED BY public.pet.id;


--
-- TOC entry 219 (class 1259 OID 16886)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    whatsapp character varying(20),
    password text NOT NULL,
    entrou_com_facebook boolean DEFAULT false,
    entrou_com_google boolean DEFAULT false,
    quer_divulgar boolean DEFAULT false,
    quer_adotar boolean DEFAULT false,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    reset_token character varying(255),
    reset_token_expires timestamp without time zone,
    role character varying(50) DEFAULT 'user'::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16896)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 221 (class 1259 OID 16897)
-- Name: volunteers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.volunteers OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16903)
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.volunteers_id_seq OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 222
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- TOC entry 4645 (class 2604 OID 16904)
-- Name: password_resets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_resets ALTER COLUMN id SET DEFAULT nextval('public.password_resets_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 16905)
-- Name: pet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pet ALTER COLUMN id SET DEFAULT nextval('public.pet_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 16906)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 16907)
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- TOC entry 4835 (class 0 OID 16856)
-- Dependencies: 215
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (id, user_id, token, expiration, created_at) FROM stdin;
\.


--
-- TOC entry 4837 (class 0 OID 16861)
-- Dependencies: 217
-- Data for Name: pet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pet (id, name, specie, sex, age, size, state_id, city_id, description, avatar, castrated, vaccinated, vermifugate, need_special_care, docile, aggressive, calm, playful, sociable, aloof, independent, needy, friendly_with_house_with_backyard, friendly_with_apartment, sociability_cats, sociability_dogs, sociability_children, sociability_unknown, created_at, adotado, tutor_id) FROM stdin;
74	auau	C	M	4	M	CE	Jaguaruana	lindo, amigo, adora passear	C:\\fakepath\\451ffa424acb151273e8608d7347515a.jpg	f	t	f	f	t	f	f	t	f	f	f	f	t	f	f	t	t	f	2025-06-08 10:42:11.768	f	+5588993070295
69	mia	G	M	3	P	CE	Jaguaruana	amigavel, adora brincar e dormir, 	C:\\fakepath\\360_F_419278829_kFxrz623SUENhMLdNQChg2ng02QLhILH.jpg	t	t	t	f	t	f	t	t	t	f	f	t	t	t	t	t	t	f	2025-06-08 10:32:44.347	t	+5588993070295
72	mia	G	F	1	P	CE	Jaguaruana	amigo, muito carente, adora  esta perto	C:\\fakepath\\free-photo-of-gatos-para-adocao-em-abrigo-de-animais-no-brasil.jpeg	t	t	t	f	t	f	f	t	t	f	f	t	t	t	t	t	t	f	2025-06-08 10:39:37.927	t	+5588993070295
71	amiguinho	C	M	4	P	CE	Jaguaruana	amigo, docil, brinalhao	C:\\fakepath\\451ffa424acb151273e8608d7347515a.jpg	t	t	t	f	t	f	f	t	t	f	f	f	t	f	t	t	t	f	2025-06-08 10:37:17.213	t	+5588993070295
68	lili	C	F	2	M	CE	Jaguaruana	lindinha, brincalhona, adora correr, gosta de crianças 	C:\\fakepath\\OIP (2).jpg	t	t	t	f	t	f	f	t	t	f	f	f	t	f	t	t	t	f	2025-06-08 10:30:46.265	t	+5588993070295
76	toto	C	M	2	M	CE	Jaguaruana	lindo, brincalhao	C:\\fakepath\\OIP (4).jpg	t	t	f	f	t	f	f	f	f	f	f	f	t	t	t	t	t	f	2025-06-08 10:49:01.988	f	+5588993070295
77	mia	G	F	1	M	CE	Jaguaruana	lindo e docil	C:\\fakepath\\84d29931141006554baddd89c8ef11a4.jpg	t	t	f	f	t	f	f	f	f	f	f	f	t	f	f	t	t	f	2025-06-08 13:28:11.039	f	+5588993070295
78	lua	C	F	2	M	CE	Jaguaruana	bonitinha, brincalhona	C:\\fakepath\\fg5pwmtj.jpeg	t	t	f	f	t	f	f	f	t	f	f	f	t	f	t	t	t	f	2025-06-08 13:42:03.029	f	+5588993070295
79	lili	G	F	2	M	CE	Jaguaruana	lindinha	C:\\fakepath\\gato-preto-1666974144631_v2_3x4-767x1024.jpg	f	f	f	f	t	f	f	t	f	f	f	f	t	t	t	f	t	f	2025-06-08 13:57:05.007	f	+5588993070295
81	Fido	C	Macho	3	M	SP	São Paulo	Cachorro brincalhão	fido.jpg	t	t	f	f	t	f	t	t	t	f	f	f	t	t	t	t	t	\N	2025-06-08 14:40:25.464	f	+5588993070295
80	dudu	C	M	1	P	CE	Jaguaruana	lindo	C:\\fakepath\\OIP (3).jpg	f	t	t	f	t	f	f	t	f	f	f	f	t	f	f	t	t	f	2025-06-08 14:00:46.463	t	+5588993070295
70	chimbinho	G	M	3	M	CE	Jaguaruana	lindo, docil muito carente	C:\\fakepath\\84d29931141006554baddd89c8ef11a4.jpg	f	t	t	f	t	f	f	t	f	f	f	t	t	t	t	f	t	f	2025-06-08 10:35:23.628	f	+5585992141909
82	julia	C	F	2	M	CE	Jaguaruana	lindinha, amorosa amiga	C:\\fakepath\\pet-696x435.png	t	t	t	f	t	f	f	t	f	f	f	t	t	f	t	t	t	f	2025-06-08 21:06:56.651	f	88993070295
\.


--
-- TOC entry 4839 (class 0 OID 16886)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nome, email, whatsapp, password, entrou_com_facebook, entrou_com_google, quer_divulgar, quer_adotar, criado_em, reset_token, reset_token_expires, role) FROM stdin;
102	Ana	ana@gmail.com	+5588993070295	$2b$10$TVgiQ9qrukqZ9F2sVVVH8OxGZUeAvlAddjUJQDMEZXZZESHZDauCa	f	f	f	t	2025-06-08 13:00:39.573	\N	\N	user
103	Joao	joao@gmail.com	+5588993070295	$2b$10$iwRRtFVAL72TIkWeUxqYReR9T1Bhcxq3NIduQ0/oBa40nqv3FEcJS	f	f	f	t	2025-06-08 13:01:02.451	\N	\N	user
104	marcos	marcos@gmail.com	+5588993070295	$2b$10$2CdEIy.DWMUDLe6w0CmDJOJK5OjWDPkwAdAGg490sNkgF2HEWnq/.	f	f	f	t	2025-06-08 13:01:20.075	\N	\N	user
105	maria	maria@gmail.com	+5588993070295	$2b$10$u5yNiXPfeRfkHgcUFEMWue7rMWYuS1OXQLp9tEo08chaNkMsYfWeO	f	f	f	t	2025-06-08 13:01:35.267	\N	\N	user
106	ranyelle	rany@gmail.com	+5588993070295	$2b$10$zKjWQugS52MGEvMqq1c0luBUhSDRVvHIUWY96w2d0eNXTStT4.ODa	f	f	f	t	2025-06-08 13:01:57.003	\N	\N	user
107	adrian	adrian@gmail.com	+5588993070295	$2b$10$B2j/Fnh/s3Kr63ou90TJmukt6KBZD5XiGl/zdr2HeR5.LBy48YrFy	f	f	f	t	2025-06-08 13:02:11.371	\N	\N	user
108	juliana	juliana@gmail.com	+5588993070295	$2b$10$MWrQYuK//G2MGvnRVZf.p.U2YDYZPGxacXiipyHX76FWU/z2lrTya	f	f	t	f	2025-06-08 13:02:34.948	\N	\N	user
109	carol	carol@gmail.com	+5588993070295	$2b$10$wtGUqpRZYCs5cax6m5r7Te08/9UgunzpVonR6s4zoMBIxhsik70.e	f	f	t	f	2025-06-08 13:02:51.908	\N	\N	user
110	carlos	carlos@gmail.com	+5588993070295	$2b$10$25bw2ADtQ2WxDN44De6IYuyyn.Ree7KxMghZfasdZTsir8u3uQBim	f	f	t	f	2025-06-08 13:03:18.708	\N	\N	user
111	jose	jose@gmail.com	+5588993070295	$2b$10$tu.cgksFnAcihQjtU0r1ZuGZR/bh.9d6fCUBYc1hJfRy8e8Zje3b6	f	f	t	f	2025-06-08 13:03:33.516	\N	\N	user
112	Luciana Silveira	amigopet37@gmail.com	+5588993070295	$2b$10$b/Yg9k665HoP87QkiOlYzOBhie44SPjusMBgnaxC7dg8v/vchxVcy	f	f	t	f	2025-06-08 13:04:00.764	\N	\N	admin
113	ana paula	anapaula@gmail.com	+5588993070295	$2b$10$QSPtG2O9ytu4aluCG8VYP.ySriho.FXiVF8.d60GTi9iAcng.lxaO	f	f	t	f	2025-06-09 00:04:30.537	\N	\N	user
\.


--
-- TOC entry 4841 (class 0 OID 16897)
-- Dependencies: 221
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteers (id, name, email, role, created_at) FROM stdin;
2	ANNA RANYELLY MOREIRA CELEDONIO	ana@gmail.com	veterinario	2025-06-04 16:07:33.011109
5	chimbinho	f@gmail.com	voluntario	2025-06-04 20:29:02.027542
3	marcelo	luciana.silveira37@aluno.ifce.edu.br	veterinario	2025-06-04 20:28:18.779215
\.


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 216
-- Name: password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.password_resets_id_seq', 2, true);


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 218
-- Name: pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pet_id_seq', 82, true);


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 114, true);


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 222
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 5, true);


--
-- TOC entry 4678 (class 2606 OID 16909)
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);


--
-- TOC entry 4680 (class 2606 OID 16911)
-- Name: password_resets password_resets_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_token_key UNIQUE (token);


--
-- TOC entry 4682 (class 2606 OID 16913)
-- Name: pet pet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);


--
-- TOC entry 4684 (class 2606 OID 16915)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4686 (class 2606 OID 16917)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 2606 OID 16919)
-- Name: volunteers volunteers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_email_key UNIQUE (email);


--
-- TOC entry 4690 (class 2606 OID 16921)
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 16922)
-- Name: password_resets password_resets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-06-09 16:13:42

--
-- PostgreSQL database dump complete
--

