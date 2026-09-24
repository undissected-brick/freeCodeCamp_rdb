--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    observable boolean,
    smbh boolean,
    stars integer,
    radius numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moo (
    moo_id integer NOT NULL,
    name character varying(30) NOT NULL,
    null1 boolean,
    null2 boolean,
    "int" integer,
    text text
);


ALTER TABLE public.moo OWNER TO freecodecamp;

--
-- Name: moo_moo_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moo_moo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moo_moo_id_seq OWNER TO freecodecamp;

--
-- Name: moo_moo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moo_moo_id_seq OWNED BY public.moo.moo_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    null1 boolean,
    null2 boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    null1 boolean,
    null2 boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    null1 boolean,
    null2 boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moo moo_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moo ALTER COLUMN moo_id SET DEFAULT nextval('public.moo_moo_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'a', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'b', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'c', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'd', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'e', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'f', NULL, NULL, NULL, NULL);


--
-- Data for Name: moo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moo VALUES (1, 'a', NULL, NULL, NULL, NULL);
INSERT INTO public.moo VALUES (2, 'b', NULL, NULL, NULL, NULL);
INSERT INTO public.moo VALUES (3, 'c', NULL, NULL, NULL, NULL);
INSERT INTO public.moo VALUES (4, 'd', NULL, NULL, NULL, NULL);
INSERT INTO public.moo VALUES (5, 'e', NULL, NULL, NULL, NULL);
INSERT INTO public.moo VALUES (6, 'f', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'a', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'b', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'c', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'd', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'e', 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'f', 4, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'g', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'h', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'i', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'j', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'k', 3, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'l', 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'm', 1, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'n', 2, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'o', 9, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'p', 1, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'q', 2, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'r', 8, NULL, NULL);
INSERT INTO public.moon VALUES (19, 's', 8, NULL, NULL);
INSERT INTO public.moon VALUES (20, 't', 8, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'b', 2, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'c', 3, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'd', 5, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'e', 4, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'f', 4, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'g', 5, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'h', 5, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'i', 6, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'j', 6, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'k', 3, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'l', 2, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'm', 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'b', 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'c', 3, NULL, NULL);
INSERT INTO public.star VALUES (4, 'd', 5, NULL, NULL);
INSERT INTO public.star VALUES (5, 'e', 4, NULL, NULL);
INSERT INTO public.star VALUES (6, 'f', 4, NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moo_moo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moo_moo_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moo moo_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moo
    ADD CONSTRAINT moo_name_key UNIQUE (name);


--
-- Name: moo moo_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moo
    ADD CONSTRAINT moo_pkey PRIMARY KEY (moo_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

