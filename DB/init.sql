--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

-- Started on 2025-07-01 11:21:10 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16397)
-- Name: categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16396)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO admin;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 226 (class 1259 OID 16439)
-- Name: lists; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lists (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    public_id character varying(16),
    category_id integer NOT NULL
);


ALTER TABLE public.lists OWNER TO admin;

--
-- TOC entry 225 (class 1259 OID 16438)
-- Name: lists_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lists_id_seq OWNER TO admin;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 225
-- Name: lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.lists_id_seq OWNED BY public.lists.id;


--
-- TOC entry 229 (class 1259 OID 16482)
-- Name: lists_people; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lists_people (
    list_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.lists_people OWNER TO admin;

--
-- TOC entry 228 (class 1259 OID 16467)
-- Name: lists_policies; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.lists_policies (
    list_id integer NOT NULL,
    policy_id integer NOT NULL
);


ALTER TABLE public.lists_policies OWNER TO admin;

--
-- TOC entry 224 (class 1259 OID 16430)
-- Name: people; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.people (
    id integer NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    middle_name character varying(100),
    birth_date date NOT NULL,
    public_id character varying(16)
);


ALTER TABLE public.people OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16429)
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_id_seq OWNER TO admin;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 223
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- TOC entry 222 (class 1259 OID 16423)
-- Name: policies; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.policies (
    id integer NOT NULL,
    days_before_notification integer NOT NULL,
    notification_time time without time zone NOT NULL
);


ALTER TABLE public.policies OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16422)
-- Name: policies_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.policies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.policies_id_seq OWNER TO admin;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 221
-- Name: policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.policies_id_seq OWNED BY public.policies.id;


--
-- TOC entry 220 (class 1259 OID 16406)
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(100) NOT NULL,
    passwd_hash character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telegram_id character varying(100),
    public_id character varying(16)
);


ALTER TABLE public.users OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16405)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO admin;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 227 (class 1259 OID 16452)
-- Name: users_lists; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users_lists (
    user_id integer NOT NULL,
    list_id integer NOT NULL
);


ALTER TABLE public.users_lists OWNER TO admin;

--
-- TOC entry 3242 (class 2604 OID 16400)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16442)
-- Name: lists id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists ALTER COLUMN id SET DEFAULT nextval('public.lists_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16433)
-- Name: people id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16426)
-- Name: policies id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policies ALTER COLUMN id SET DEFAULT nextval('public.policies_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16409)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3434 (class 0 OID 16397)
-- Dependencies: 218
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3442 (class 0 OID 16439)
-- Dependencies: 226
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3445 (class 0 OID 16482)
-- Dependencies: 229
-- Data for Name: lists_people; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3444 (class 0 OID 16467)
-- Dependencies: 228
-- Data for Name: lists_policies; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3440 (class 0 OID 16430)
-- Dependencies: 224
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3438 (class 0 OID 16423)
-- Dependencies: 222
-- Data for Name: policies; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3436 (class 0 OID 16406)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3443 (class 0 OID 16452)
-- Dependencies: 227
-- Data for Name: users_lists; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 225
-- Name: lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.lists_id_seq', 1, false);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 223
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.people_id_seq', 1, false);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 221
-- Name: policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.policies_id_seq', 1, false);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3248 (class 2606 OID 16404)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 3250 (class 2606 OID 16402)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 16486)
-- Name: lists_people lists_people_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists_people
    ADD CONSTRAINT lists_people_pkey PRIMARY KEY (list_id, person_id);


--
-- TOC entry 3272 (class 2606 OID 16444)
-- Name: lists lists_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16471)
-- Name: lists_policies lists_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists_policies
    ADD CONSTRAINT lists_policies_pkey PRIMARY KEY (list_id, policy_id);


--
-- TOC entry 3274 (class 2606 OID 16446)
-- Name: lists lists_public_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_public_id_key UNIQUE (public_id);


--
-- TOC entry 3266 (class 2606 OID 16435)
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 16437)
-- Name: people people_public_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_public_id_key UNIQUE (public_id);


--
-- TOC entry 3263 (class 2606 OID 16428)
-- Name: policies policies_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policies
    ADD CONSTRAINT policies_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16417)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3276 (class 2606 OID 16456)
-- Name: users_lists users_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users_lists
    ADD CONSTRAINT users_lists_pkey PRIMARY KEY (user_id, list_id);


--
-- TOC entry 3255 (class 2606 OID 16415)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 3257 (class 2606 OID 16413)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 16421)
-- Name: users users_public_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_public_id_key UNIQUE (public_id);


--
-- TOC entry 3261 (class 2606 OID 16419)
-- Name: users users_telegram_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_telegram_id_key UNIQUE (telegram_id);


--
-- TOC entry 3269 (class 1259 OID 16497)
-- Name: idx_lists_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_lists_category_id ON public.lists USING btree (category_id);


--
-- TOC entry 3270 (class 1259 OID 16499)
-- Name: idx_lists_public_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_lists_public_id ON public.lists USING btree (public_id);


--
-- TOC entry 3264 (class 1259 OID 16500)
-- Name: idx_people_public_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_people_public_id ON public.people USING btree (public_id);


--
-- TOC entry 3251 (class 1259 OID 16498)
-- Name: idx_users_public_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_users_public_id ON public.users USING btree (public_id);


--
-- TOC entry 3281 (class 2606 OID 16447)
-- Name: lists fk_category; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE RESTRICT;


--
-- TOC entry 3282 (class 2606 OID 16462)
-- Name: users_lists fk_list; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users_lists
    ADD CONSTRAINT fk_list FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;


--
-- TOC entry 3284 (class 2606 OID 16472)
-- Name: lists_policies fk_list; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists_policies
    ADD CONSTRAINT fk_list FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;


--
-- TOC entry 3286 (class 2606 OID 16487)
-- Name: lists_people fk_list; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists_people
    ADD CONSTRAINT fk_list FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;


--
-- TOC entry 3287 (class 2606 OID 16492)
-- Name: lists_people fk_person; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists_people
    ADD CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES public.people(id) ON DELETE CASCADE;


--
-- TOC entry 3285 (class 2606 OID 16477)
-- Name: lists_policies fk_policy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.lists_policies
    ADD CONSTRAINT fk_policy FOREIGN KEY (policy_id) REFERENCES public.policies(id) ON DELETE CASCADE;


--
-- TOC entry 3283 (class 2606 OID 16457)
-- Name: users_lists fk_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users_lists
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-07-01 11:21:10 UTC

--
-- PostgreSQL database dump complete
--

