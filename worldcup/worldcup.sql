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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (121, 2018, 'Final', 612, 613, 4, 2);
INSERT INTO public.games VALUES (122, 2018, 'Third Place', 614, 615, 2, 0);
INSERT INTO public.games VALUES (123, 2018, 'Semi-Final', 613, 615, 2, 1);
INSERT INTO public.games VALUES (124, 2018, 'Semi-Final', 612, 614, 1, 0);
INSERT INTO public.games VALUES (125, 2018, 'Quarter-Final', 613, 616, 3, 2);
INSERT INTO public.games VALUES (126, 2018, 'Quarter-Final', 615, 617, 2, 0);
INSERT INTO public.games VALUES (127, 2018, 'Quarter-Final', 614, 618, 2, 1);
INSERT INTO public.games VALUES (128, 2018, 'Quarter-Final', 612, 619, 2, 0);
INSERT INTO public.games VALUES (129, 2018, 'Eighth-Final', 615, 620, 2, 1);
INSERT INTO public.games VALUES (130, 2018, 'Eighth-Final', 617, 621, 1, 0);
INSERT INTO public.games VALUES (131, 2018, 'Eighth-Final', 614, 622, 3, 2);
INSERT INTO public.games VALUES (132, 2018, 'Eighth-Final', 618, 623, 2, 0);
INSERT INTO public.games VALUES (133, 2018, 'Eighth-Final', 613, 624, 2, 1);
INSERT INTO public.games VALUES (134, 2018, 'Eighth-Final', 616, 625, 2, 1);
INSERT INTO public.games VALUES (135, 2018, 'Eighth-Final', 619, 626, 2, 1);
INSERT INTO public.games VALUES (136, 2018, 'Eighth-Final', 612, 627, 4, 3);
INSERT INTO public.games VALUES (137, 2014, 'Final', 628, 627, 1, 0);
INSERT INTO public.games VALUES (138, 2014, 'Third Place', 629, 618, 3, 0);
INSERT INTO public.games VALUES (139, 2014, 'Semi-Final', 627, 629, 1, 0);
INSERT INTO public.games VALUES (140, 2014, 'Semi-Final', 628, 618, 7, 1);
INSERT INTO public.games VALUES (141, 2014, 'Quarter-Final', 629, 630, 1, 0);
INSERT INTO public.games VALUES (142, 2014, 'Quarter-Final', 627, 614, 1, 0);
INSERT INTO public.games VALUES (143, 2014, 'Quarter-Final', 618, 620, 2, 1);
INSERT INTO public.games VALUES (144, 2014, 'Quarter-Final', 628, 612, 1, 0);
INSERT INTO public.games VALUES (145, 2014, 'Eighth-Final', 618, 631, 2, 1);
INSERT INTO public.games VALUES (146, 2014, 'Eighth-Final', 620, 619, 2, 0);
INSERT INTO public.games VALUES (147, 2014, 'Eighth-Final', 612, 632, 2, 0);
INSERT INTO public.games VALUES (148, 2014, 'Eighth-Final', 628, 633, 2, 1);
INSERT INTO public.games VALUES (149, 2014, 'Eighth-Final', 629, 623, 2, 1);
INSERT INTO public.games VALUES (150, 2014, 'Eighth-Final', 630, 634, 2, 1);
INSERT INTO public.games VALUES (151, 2014, 'Eighth-Final', 627, 621, 1, 0);
INSERT INTO public.games VALUES (152, 2014, 'Eighth-Final', 614, 635, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (612, 'France');
INSERT INTO public.teams VALUES (613, 'Croatia');
INSERT INTO public.teams VALUES (614, 'Belgium');
INSERT INTO public.teams VALUES (615, 'England');
INSERT INTO public.teams VALUES (616, 'Russia');
INSERT INTO public.teams VALUES (617, 'Sweden');
INSERT INTO public.teams VALUES (618, 'Brazil');
INSERT INTO public.teams VALUES (619, 'Uruguay');
INSERT INTO public.teams VALUES (620, 'Colombia');
INSERT INTO public.teams VALUES (621, 'Switzerland');
INSERT INTO public.teams VALUES (622, 'Japan');
INSERT INTO public.teams VALUES (623, 'Mexico');
INSERT INTO public.teams VALUES (624, 'Denmark');
INSERT INTO public.teams VALUES (625, 'Spain');
INSERT INTO public.teams VALUES (626, 'Portugal');
INSERT INTO public.teams VALUES (627, 'Argentina');
INSERT INTO public.teams VALUES (628, 'Germany');
INSERT INTO public.teams VALUES (629, 'Netherlands');
INSERT INTO public.teams VALUES (630, 'Costa Rica');
INSERT INTO public.teams VALUES (631, 'Chile');
INSERT INTO public.teams VALUES (632, 'Nigeria');
INSERT INTO public.teams VALUES (633, 'Algeria');
INSERT INTO public.teams VALUES (634, 'Greece');
INSERT INTO public.teams VALUES (635, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 152, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 635, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

