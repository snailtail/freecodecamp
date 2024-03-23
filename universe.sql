--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    description text NOT NULL,
    age integer,
    dark_matter_visible boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbit_distance_parsecs numeric(5,2),
    planet_id integer,
    visited_by_humans boolean
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
-- Name: moon_visit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_visit (
    moon_visit_id integer NOT NULL,
    name character varying(20) NOT NULL,
    year_visited integer NOT NULL,
    moon_id integer
);


ALTER TABLE public.moon_visit OWNER TO freecodecamp;

--
-- Name: moon_visits_moon_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_visits_moon_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_visits_moon_visit_id_seq OWNER TO freecodecamp;

--
-- Name: moon_visits_moon_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_visits_moon_visit_id_seq OWNED BY public.moon_visit.moon_visit_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    habitable boolean NOT NULL,
    star_id integer NOT NULL,
    population_billions integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    brightness integer,
    has_starmap boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_visit moon_visit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_visit ALTER COLUMN moon_visit_id SET DEFAULT nextval('public.moon_visits_moon_visit_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The home galaxy where species like humans originate', 7628836, false);
INSERT INTO public.galaxy VALUES (3, 'Peekaboo Galaxy', 'Galaxy, relatively nearby, is considered one of the most metal-poor ', 76288382, false);
INSERT INTO public.galaxy VALUES (4, 'Tadpole Galaxy', 'he name comes from the resemblance of the galaxy to a tadpole.', 48838, false);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'Also known as Messier 101 or M101 ', 648838, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Also known as Messier Object 104 or M104', 648838, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now', 716512844, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.10, 1, true);
INSERT INTO public.moon VALUES (2, 'Slargh', 0.40, 3, false);
INSERT INTO public.moon VALUES (3, 'Dasio', 0.30, 4, false);
INSERT INTO public.moon VALUES (4, 'Morion', 0.20, 4, true);
INSERT INTO public.moon VALUES (5, 'Selrat', 0.20, 5, false);
INSERT INTO public.moon VALUES (6, 'Gruna', 0.20, 6, false);
INSERT INTO public.moon VALUES (7, 'Peliox', 0.20, 7, true);
INSERT INTO public.moon VALUES (8, 'Alhabade', 0.30, 7, false);
INSERT INTO public.moon VALUES (9, 'Snu', 0.30, 7, false);
INSERT INTO public.moon VALUES (10, 'Snu-Snu', 0.20, 7, false);
INSERT INTO public.moon VALUES (11, 'Daniue', 0.40, 8, false);
INSERT INTO public.moon VALUES (12, 'Iue', 0.20, 8, false);
INSERT INTO public.moon VALUES (13, 'Ouye', 0.20, 9, false);
INSERT INTO public.moon VALUES (14, 'Vuxu', 0.30, 10, false);
INSERT INTO public.moon VALUES (15, 'Bxuhux', 0.30, 10, true);
INSERT INTO public.moon VALUES (16, 'Bxuhyx', 2.10, 10, false);
INSERT INTO public.moon VALUES (17, 'Vyxy', 3.10, 10, false);
INSERT INTO public.moon VALUES (18, 'Seni', 4.10, 11, false);
INSERT INTO public.moon VALUES (19, 'Senu', 4.10, 11, false);
INSERT INTO public.moon VALUES (20, 'Mange', 5.10, 12, false);
INSERT INTO public.moon VALUES (21, 'Har', 1.10, 12, false);
INSERT INTO public.moon VALUES (22, 'Fest', 2.90, 12, false);
INSERT INTO public.moon VALUES (23, 'Me', 3.10, 13, false);
INSERT INTO public.moon VALUES (24, 'Datab', 3.70, 13, false);
INSERT INTO public.moon VALUES (25, 'Asen', 3.60, 13, false);
INSERT INTO public.moon VALUES (26, 'Kul', 3.10, 14, false);
INSERT INTO public.moon VALUES (27, 'Som', 1.50, 14, true);
INSERT INTO public.moon VALUES (28, 'Bara', 2.80, 14, false);
INSERT INTO public.moon VALUES (29, 'Den', 3.00, 14, false);
INSERT INTO public.moon VALUES (30, 'Ska', 4.30, 14, false);
INSERT INTO public.moon VALUES (31, 'Ni', 4.00, 14, false);
INSERT INTO public.moon VALUES (32, 'Veta', 5.00, 14, true);
INSERT INTO public.moon VALUES (33, 'Om', 5.10, 14, false);


--
-- Data for Name: moon_visit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_visit VALUES (1, 'Apollo 11', 1969, 1);
INSERT INTO public.moon_visit VALUES (2, 'Apollo 15', 1971, 1);
INSERT INTO public.moon_visit VALUES (3, 'Morion mission 2', 2322, 4);
INSERT INTO public.moon_visit VALUES (4, 'Dump Trump', 2024, 7);
INSERT INTO public.moon_visit VALUES (5, 'Bhax for humans', 2414, 15);
INSERT INTO public.moon_visit VALUES (6, 'Search for survival', 2094, 27);
INSERT INTO public.moon_visit VALUES (7, 'Vingresor VIP 3', 2221, 32);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 8);
INSERT INTO public.planet VALUES (2, 'Venus', false, 1, 0);
INSERT INTO public.planet VALUES (3, 'Azkabania', false, 2, 0);
INSERT INTO public.planet VALUES (6, 'Gasdisaster IV', false, 5, 0);
INSERT INTO public.planet VALUES (7, 'Darkblob', false, 6, 0);
INSERT INTO public.planet VALUES (9, 'BurnsLikeNightMare', false, 8, 0);
INSERT INTO public.planet VALUES (12, 'Richies planet', false, 10, 0);
INSERT INTO public.planet VALUES (13, 'Bon Jovi Arenaplanet', false, 11, 0);
INSERT INTO public.planet VALUES (4, 'Yavin', true, 3, 2);
INSERT INTO public.planet VALUES (5, 'Dathomir', true, 4, 12);
INSERT INTO public.planet VALUES (8, 'Dabobah', true, 7, 1);
INSERT INTO public.planet VALUES (10, 'Earth II', true, 9, 8);
INSERT INTO public.planet VALUES (11, 'Earth III', true, 9, 2);
INSERT INTO public.planet VALUES (14, 'Tattooine', true, 12, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, -26, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, -2, true);
INSERT INTO public.star VALUES (3, 'Chonky hubbler', 2, -44, true);
INSERT INTO public.star VALUES (4, 'Grainy dot', 2, -654, true);
INSERT INTO public.star VALUES (5, 'Los papa', 3, -64, false);
INSERT INTO public.star VALUES (6, 'Johnnies star', 3, -60, false);
INSERT INTO public.star VALUES (8, 'Semi bright object #3', 5, -22, false);
INSERT INTO public.star VALUES (10, 'Big barbie', 5, -8, false);
INSERT INTO public.star VALUES (11, 'Dathomiria', 6, -19, false);
INSERT INTO public.star VALUES (12, 'Hogwarthius Hippopotamius', 6, -293, false);
INSERT INTO public.star VALUES (7, 'Wolfsbane', 4, -22, false);
INSERT INTO public.star VALUES (9, 'Semi bright object #2', 4, -22, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 33, true);


--
-- Name: moon_visits_moon_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_visits_moon_visit_id_seq', 7, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: moon_visit moon_visits_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_visit
    ADD CONSTRAINT moon_visits_name_key UNIQUE (name);


--
-- Name: moon_visit moon_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_visit
    ADD CONSTRAINT moon_visits_pkey PRIMARY KEY (moon_visit_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: moon_visit moon_visits_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_visit
    ADD CONSTRAINT moon_visits_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

