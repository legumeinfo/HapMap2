--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


--
-- Name: update_line_timestamps(); Type: FUNCTION; Schema: public; Owner: hapmap
--

CREATE FUNCTION public.update_line_timestamps() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  NEW.modification_date = now();
  return NEW;
END;
$$;


ALTER FUNCTION public.update_line_timestamps() OWNER TO hapmap;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hapmap_line; Type: TABLE; Schema: public; Owner: hapmap
--

CREATE TABLE public.hapmap_line (
    hapmap_id character(7) DEFAULT ''::bpchar NOT NULL,
    ncgr_id integer,
    line character varying(12) DEFAULT NULL::character varying,
    category character varying(24) DEFAULT NULL::character varying,
    population_of_origin character varying(24) DEFAULT NULL::character varying,
    country_of_origin character varying(24) DEFAULT NULL::character varying,
    seeds_from character varying(24) DEFAULT NULL::character varying,
    seeds_available integer DEFAULT 1,
    request_email character varying(64) NOT NULL,
    location_latitude numeric(5,3) DEFAULT NULL::numeric,
    location_longitude numeric(5,3) DEFAULT NULL::numeric,
    status character varying(16) DEFAULT NULL::character varying,
    modification_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.hapmap_line OWNER TO hapmap;

--
-- Data for Name: hapmap_line; Type: TABLE DATA; Schema: public; Owner: hapmap
--

COPY public.hapmap_line (hapmap_id, ncgr_id, line, category, population_of_origin, country_of_origin, seeds_from, seeds_available, request_email, location_latitude, location_longitude, status, modification_date) FROM stdin;
HM001  	5489	L000163	CC8	SA22322	Syria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.017	37.100	Processed	2014-09-16 20:11:35
HM002  	5490	L000174	CC8	SA28064	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.783	33.167	Processed	2014-09-16 20:11:35
HM003  	5491	L000544	CC8	ESP105-L	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.076	-3.816	Processed	2014-09-16 20:11:35
HM004  	5492	L000736	CC8	DZA045-6	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.923	7.736	Processed	2014-09-16 20:11:35
HM005  	5493	L000734	CC8	DZA315-16	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.716	0.158	Processed	2014-09-16 20:11:35
HM006  	113210	L000530	CC8	F83005-5	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.571	6.224	Processed	2014-09-16 20:11:35
HM007  	5494	L000651	CC8	Salses71B	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.820	2.945	Processed	2014-09-16 20:11:35
HM008  	5495	L000368	CC8	DZA012-J	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.549	3.183	Processed	2014-09-16 20:11:35
HM009  	113211	L000555	CC16	GRC020-B	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.122	21.543	Processed	2014-09-16 20:11:35
HM010  	113220	L000154	CC16	SA24714	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.533	14.517	Processed	2014-09-16 20:11:35
HM011  	5496	L000543	CC16	DZA327-7	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.252	-0.703	Processed	2014-09-16 20:11:35
HM012  	113203	L000239	CC16	SA26063	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.167	-8.833	Processed	2014-09-16 20:11:35
HM013  	113209	L000648	CC16	Salses42B	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.820	2.945	Processed	2014-09-16 20:11:35
HM014  	5497	L000542	CC16	DZA233-4	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.847	4.951	Processed	2014-09-16 20:11:35
HM015  	5498	L000550	CC16	F11013-3	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.139	2.893	Processed	2014-09-16 20:11:35
HM016  	5499	L000049	CC16	SA09707	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.000	8.000	Processed	2014-09-16 20:11:35
HM017  	113301	\N	RIL Parent	A10	\N	ENSAT-Toulouse	1	gentz@ensat.fr	\N	\N	Processed	2012-04-23 21:00:30
HM018  	113215	\N	RIL Parent	A20	\N	ENSAT-Toulouse	1	denny004@umn.edu	\N	\N	Processed	2012-03-22 16:47:23
HM019  	113204	L000527	RIL Parent	Borung	\N	INRA-Montpellier	1	gentz@ensat.fr	\N	\N	Processed	2012-04-23 20:59:30
HM020  	113302	TN1.11	RIL Parent	TN1.11	\N	ENSAT-Toulouse	1	gentz@ensat.fr	\N	\N	Processed	2012-03-22 16:46:19
HM021  	113214	TN1.21	RIL Parent	TN1.21	\N	ENSAT-Toulouse	1	gentz@ensat.fr	\N	\N	Processed	2012-03-22 16:46:19
HM022  	113303	TN3.23	RIL Parent	TN3.23	\N	ENSAT-Toulouse	1	gentz@ensat.fr	\N	\N	Processed	2012-03-22 16:46:19
HM023  	113216	TN6.18	RIL Parent	TN6.18	\N	ENSAT-Toulouse	1	gentz@ensat.fr	\N	\N	Processed	2012-03-22 16:46:19
HM024  	113219	TN8.3	RIL Parent	TN8.3	\N	ENSAT-Toulouse	1	gentz@ensat.fr	\N	\N	Processed	2012-03-22 16:46:19
HM025  	113218	TN9.22	RIL Parent	TN9.22	\N	ENSAT-Toulouse	1	gentz@ensat.fr	\N	\N	Processed	2012-03-22 16:46:19
HM026  	113205	L000450	RIL Parent/CC96	F11008-C	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.550	-2.560	Processed	2014-09-16 20:11:35
HM027  	113206	L000531	RIL Parent/CC144	F83005-9	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.330	-6.140	Processed	2014-09-16 20:11:35
HM028  	113207	L000342	RIL Parent/CC144	DZA241-2	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.487	-6.478	Processed	2014-09-16 20:11:35
HM029  	113208	L000729	M. tricycla	R108-C3	\N	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	\N	\N	Processed	2014-09-16 20:11:35
HM030  	113213	L000518	M. littoralis	F11013-27	\N	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	\N	\N	Processed	2014-09-16 20:11:35
HM031  	113223	L000545	CC32	ESP158-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.529	-5.023	Processed	2014-09-16 20:11:35
HM032  	113323	L000549	CC32	F11005-E	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.123	3.076	Processed	2014-09-16 20:11:35
HM033  	113317	L000552	CC32	F20047-A	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.582	9.059	Processed	2014-09-16 20:11:35
HM034  	113320	L000554	CC32	F20089-B	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.972	9.367	Processed	2014-09-16 20:11:35
HM035  	113316	L000679	CC32	F66017	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.608	2.751	Processed	2014-09-16 20:11:35
HM036  	113240	L000337	CC32	GRC042-1	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.641	23.142	Processed	2014-09-16 20:11:35
HM037  	113312	L000557	CC32	GRC064-B	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	39.987	23.932	Processed	2014-09-16 20:11:35
HM038  	113224	L000369	CC32	PRT180-A	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.193	-8.887	Processed	2014-09-16 20:11:35
HM039  	113234	L000263	CC32	SA03116	Israel	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.000	35.000	Processed	2014-09-16 20:11:35
HM040  	113225	L000321	CC32	SA03780	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.100	15.650	Processed	2014-09-16 20:11:35
HM041  	113226	L000198	CC32	SA09048	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.200	20.550	Processed	2014-09-16 20:11:35
HM042  	113306	L000290	CC32	SA09119	Turkey	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	41.033	28.950	Processed	2014-09-16 20:11:35
HM043  	113318	L000310	CC32	SA09944	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.567	8.670	Processed	2014-09-16 20:11:35
HM044  	113239	L000245	CC32	SA14161	Jordan	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.317	35.750	Processed	2014-09-16 20:11:35
HM045  	113237	L000144	CC32	SA14163	Jordan	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.000	35.000	Processed	2014-09-16 20:11:35
HM046  	113325	L000213	CC32	SA27882	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	33.083	-6.670	Processed	2014-09-16 20:11:35
HM047  	113319	L000654	CC64	DZA014	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.475	3.311	Processed	2014-09-16 20:11:35
HM048  	113321	L000475	CC64	DZA016-F	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.279	3.567	Processed	2014-09-16 20:11:35
HM049  	113315	L000360	CC64	DZA058-5	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.140	7.944	Processed	2014-09-16 20:11:35
HM050  	113324	L000477	CC64	DZA058-J	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.140	7.944	Processed	2014-09-16 20:11:35
HM051  	113322	L000357	CC64	DZA202-4	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.221	0.121	Processed	2014-09-16 20:11:35
HM052  	113326	L000639	CC64	DZA210-3	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.857	2.039	Processed	2014-09-16 20:11:35
HM053  	113327	L000601	CC64	DZA246-6	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.302	7.150	Processed	2014-09-16 20:11:35
HM054  	113328	L000395	CC64	DZA309-A	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.803	-1.674	Processed	2014-09-16 20:11:35
HM055  	116481	L000675	CC64	DZA326	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.216	-0.984	Processed	2014-09-16 20:11:35
HM056  	113527	L000416	CC64	ESP074-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	41.121	0.988	Processed	2014-09-16 20:11:35
HM057  	113329	L000512	CC64	ESP155-D	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.534	-5.964	Processed	2014-09-16 20:11:35
HM058  	113227	L000513	CC64	ESP163-E	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.989	-4.285	Processed	2014-09-16 20:11:35
HM059  	113330	L000449	CC64	F11012-A	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.007	2.723	Processed	2014-09-16 20:11:35
HM060  	113331	L000520	CC64	F20015-10	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.084	9.369	Processed	2014-09-16 20:11:35
HM061  	113332	L000645	CC64	GRC033-B2	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.915	22.500	Processed	2014-09-16 20:11:35
HM062  	113238	L000379	CC64	GRC063-D	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	40.159	23.732	Processed	2014-09-16 20:11:35
HM063  	113228	L000525	CC64	PRT176-F	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.153	-7.726	Processed	2014-09-16 20:11:35
HM064  	113229	L000371	CC64	PRT178-D	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.206	-8.488	Processed	2014-09-16 20:11:35
HM065  	113235	L000370	CC64	PRT179-J	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.075	-8.800	Processed	2014-09-16 20:11:35
HM066  	116467	L000204	CC64	SA01489	Israel	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.683	35.400	Processed	2014-09-16 20:11:35
HM067  	116482	L000265	CC64	SA01526	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.000	3.000	Processed	2014-09-16 20:11:35
HM068  	113307	L000274	CC64	SA03648	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.150	-7.550	Processed	2014-09-16 20:11:35
HM069  	116468	L000276	CC64	SA07749	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.217	10.280	Processed	2014-09-16 20:11:35
HM070  	113333	L000307	CC64	SA08625	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	33.000	-6.000	Processed	2014-09-16 20:11:35
HM071  	113236	L000297	CC64	SA08626	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	29.717	-9.600	Processed	2014-09-16 20:11:35
HM072  	113308	L000061	CC64	SA09357	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.650	7.420	Processed	2014-09-16 20:11:35
HM073  	113313	L000052	CC64	SA09710	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.750	8.520	Processed	2014-09-16 20:11:35
HM074  	116469	L000314	CC64	SA09866	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.650	7.420	Processed	2014-09-16 20:11:35
HM075  	113230	L000130	CC64	SA12451	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	39.117	8.930	Processed	2014-09-16 20:11:35
HM076  	113314	L000234	CC64	SA23859	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.417	9.250	Processed	2014-09-16 20:11:35
HM077  	113309	L000232	CC64	SA27062	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.083	22.570	Processed	2014-09-16 20:11:35
HM078  	113231	L000228	CC64	SA27063	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.083	22.570	Processed	2014-09-16 20:11:35
HM079  	113334	L000362	CC96	DZA045-4c	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.923	7.736	Processed	2014-09-16 20:11:35
HM080  	113335	L000637	CC96	DZA061-B3d	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.500	7.404	Processed	2014-09-16 20:11:35
HM081  	113448	L000356	CC96	DZA202-5	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.221	0.121	Processed	2014-09-16 20:11:35
HM082  	113450	L000355	CC96	DZA210-2	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.857	2.039	Processed	2014-09-16 20:11:35
HM083  	113451	L000354	CC96	DZA210-5	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.857	2.039	Processed	2014-09-16 20:11:35
HM084  	116483	L000394	CC96	DZA243-6	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.809	7.367	Processed	2014-09-16 20:11:35
HM085  	113452	L000673	CC96	DZA319	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.288	-0.571	Processed	2014-09-16 20:11:35
HM086  	113453	L000674	CC96	DZA322--	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.387	-0.841	Processed	2014-09-16 20:11:35
HM087  	113454	L000397	CC96	DZA323-1	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.633	-0.874	Processed	2014-09-16 20:11:35
HM088  	113344	L000497	CC96	DZA323-D	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.633	-0.874	Processed	2014-09-16 20:11:35
HM089  	116470	L000431	CC96	ESP155-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.534	-5.964	Processed	2014-09-16 20:11:35
HM090  	\N	L000437	CC96	ESP163-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.989	-4.285	Processed	2014-09-16 20:11:35
HM091  	116471	L000548	CC96	ESP171-F	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.388	-6.113	Processed	2014-09-16 20:11:35
HM092  	113336	L000443	CC96	ESP174-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.333	-6.761	Processed	2014-09-16 20:11:35
HM093  	113444	L000444	CC96	ESP173-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.391	-6.233	Processed	2014-09-16 20:11:35
HM094  	\N	L000574	CC96	F13006-1	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.377	5.187	Processed	2014-09-16 20:11:35
HM095  	116484	L000458	CC96	F20025-4	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.756	9.451	Processed	2014-09-16 20:11:35
HM096  	116485	L000460	CC96	F20026-F	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.924	9.357	Processed	2014-09-16 20:11:35
HM097  	116486	L000522	CC96	F83005-G	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.571	6.224	Processed	2014-09-16 20:11:35
HM098  	116487	L000523	CC96	PRT176-12	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.153	-7.726	Processed	2014-09-16 20:11:35
HM099  	116488	L000202	CC96	SA02840	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.000	33.000	Processed	2014-09-16 20:11:35
HM101  	\N	\N	\N	A17_Varma	\N	Doug Cook, UC Davis	1	denny004@umn.edu	\N	\N	Processed	2012-03-22 16:49:01
HM102  	113212	\N	alfalfa	CADL	\N	Charlie Brummer, UGA	0	denny004@umn.edu	\N	\N	Processed	2012-12-07 18:24:50
HM103  	\N	L000302	CC96	SA04087	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.950	10.217	Processed	2014-09-16 20:11:35
HM104  	\N	L000303	CC96	SA08604	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.250	2.800	Processed	2014-09-16 20:11:35
HM105  	113310	L000293	CC96	SA09137	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.833	-0.167	Processed	2014-09-16 20:11:35
HM106  	113455	L000060	CC96	SA09434	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.833	9.200	Processed	2014-09-16 20:11:35
HM107  	113456	L000047	CC96	SA09670	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.833	-1.350	Processed	2014-09-16 20:11:35
HM108  	113340	L000317	CC96	SA09715	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.750	8.517	Processed	2014-09-16 20:11:35
HM109  	113457	L000126	CC96	SA11959	Israel	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	33.000	35.000	Processed	2014-09-16 20:11:35
HM110  	\N	L000225	CC96	SA21560	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	31.417	15.483	Processed	2014-09-16 20:11:35
HM111  	113311	L000219	CC96	SA27192	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	41.300	17.783	Processed	2014-09-16 20:11:35
HM112  	113341	L000178	CC96	SA28097	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.000	33.000	Processed	2014-09-16 20:11:35
HM113  	\N	L000537	CC144	CRE007-J	Greece, Crete	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.066	25.364	Processed	2014-09-16 20:11:35
HM114  	126182	L000338	CC144	CRE009-A	Greece, Crete	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.035	25.935	Processed	2014-09-16 20:11:35
HM115  	116489	L000529	CC144	Cyprus_C	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.100	33.400	Processed	2014-09-16 20:11:35
HM116  	\N	L000659	CC144	DZA211	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.536	1.676	Processed	2014-09-16 20:11:35
HM117  	113471	L000401	CC144	ESP031-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.500	-1.991	Processed	2014-09-16 20:11:35
HM118  	113472	L000410	CC144	ESP043-B	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.420	-5.125	Processed	2014-09-16 20:11:35
HM119  	113473	L000414	CC144	ESP050-B	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.060	-5.808	Processed	2014-09-16 20:11:35
HM120  	116472	L000482	CC144	ESP095-C	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.986	-2.914	Processed	2014-09-16 20:11:35
HM121  	116473	L000430	CC144	ESP104-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.946	-4.525	Processed	2014-09-16 20:11:35
HM122  	116474	L000546	CC144	Esp159-11	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.424	-4.755	Processed	2014-09-16 20:11:35
HM123  	\N	L000440	CC144	ESP163-B	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.989	-4.285	Processed	2014-09-16 20:11:35
HM124  	116490	L000547	CC144	Esp165-D	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.685	-4.793	Processed	2014-09-16 20:11:35
HM125  	113490	L000445	CC144	ESP175-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.284	-7.122	Processed	2014-09-16 20:11:35
HM126  	113474	L000456	CC144	F20015-L	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.084	9.369	Processed	2014-09-16 20:11:35
HM127  	113475	L000455	CC144	F20025-F	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.756	9.451	Processed	2014-09-16 20:11:35
HM128  	113476	L000620	CC144	F20058-6	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	41.405	9.127	Processed	2014-09-16 20:11:35
HM129  	113477	L000468	CC144	F20069-A	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.592	8.908	Processed	2014-09-16 20:11:35
HM130  	113478	L000467	CC144	F20069-C	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.592	8.908	Processed	2014-09-16 20:11:35
HM131  	113479	L000551	CC144	F34042-D	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.676	3.767	Processed	2014-09-16 20:11:35
HM132  	\N	L000376	CC144	GRC093-C	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.347	22.536	Processed	2014-09-16 20:11:35
HM133  	113480	L000375	CC144	GRC098-A	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.203	22.138	Processed	2014-09-16 20:11:35
HM134  	113481	L000267	CC144	SA02084	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.550	25.133	Processed	2014-09-16 20:11:35
HM135  	113482	L000332	CC144	SA02748	Israel	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.800	35.533	Processed	2014-09-16 20:11:35
HM136  	\N	L000270	CC144	SA02820	Turkey	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.967	30.800	Processed	2014-09-16 20:11:35
HM137  	\N	L000322	CC144	SA03749	Israel	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.000	35.000	Processed	2014-09-16 20:11:35
HM138  	113483	L000283	CC144	SA08454	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.500	20.833	Processed	2014-09-16 20:11:35
HM139  	116491	L000306	CC144	SA08623	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	33.067	-7.000	Processed	2014-09-16 20:11:35
HM140  	\N	L000286	CC144	SA09049	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.483	20.833	Processed	2014-09-16 20:11:35
HM141  	113459	L000044	CC144	SA09456	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.750	10.717	Processed	2014-09-16 20:11:35
HM142  	\N	L000315	CC144	SA09820	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.000	20.000	Processed	2014-09-16 20:11:35
HM143  	113460	L000132	CC144	SA10481	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.833	10.217	Processed	2014-09-16 20:11:35
HM144  	\N	L000241	CC144	SA15951	Portugal, Madeira	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.667	-16.917	Processed	2014-09-16 20:11:35
HM145  	113461	L000146	CC144	SA19964	Turkey	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.883	28.500	Processed	2014-09-16 20:11:35
HM146  	113489	L000237	CC144	SA21302	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.667	14.250	Processed	2014-09-16 20:11:35
HM147  	113462	L000161	CC144	SA21362	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	31.417	15.250	Processed	2014-09-16 20:11:35
HM148  	113463	L000162	CC144	SA21590	Libya	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	31.250	16.033	Processed	2014-09-16 20:11:35
HM149  	113464	L000148	CC144	SA21819	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.700	33.050	Processed	2014-09-16 20:11:35
HM150  	113488	L000238	CC144	SA22323	Syria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.017	37.083	Processed	2014-09-16 20:11:35
HM151  	113465	L000165	CC144	SA25226	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.133	14.917	Processed	2014-09-16 20:11:35
HM152  	113466	L000166	CC144	SA25654	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	33.883	-5.617	Processed	2014-09-16 20:11:35
HM153  	113467	L000168	CC144	SA25898	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	39.133	9.533	Processed	2014-09-16 20:11:35
HM154  	113468	L000173	CC144	SA27778	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	32.550	-7.683	Processed	2014-09-16 20:11:35
HM155  	113469	L000216	CC144	SA27961	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	31.833	-6.933	Processed	2014-09-16 20:11:35
HM156  	113487	L000217	CC144	SA28089	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.900	33.617	Processed	2014-09-16 20:11:35
HM157  	113470	L000215	CC144	SA28099	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.000	33.000	Processed	2014-09-16 20:11:35
HM158  	\N	L000649	CC144	Salse46B	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.820	2.945	Processed	2014-09-16 20:11:35
HM159  	113486	L000680	CC192	arboretu	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.147	2.985	Processed	2014-09-16 20:11:35
HM160  	113485	L000340	CC192	CRE005-A	Greece, Crete	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.115	24.689	Processed	2014-09-16 20:11:35
HM161  	126181	L000365	CC192	DZA033-2	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.509	5.394	Processed	2014-09-16 20:11:35
HM162  	113491	L000538	CC192	DZA055-H	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.005	8.112	Processed	2014-09-16 20:11:35
HM163  	113514	L000358	CC192	DZA061-11	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.500	7.404	Processed	2014-09-16 20:11:35
HM164  	113512	L000350	CC192	DZA215-5	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.916	1.527	Processed	2014-09-16 20:11:35
HM165  	113515	L000344	CC192	DZA231-1	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.108	4.944	Processed	2014-09-16 20:11:35
HM166  	113495	L000343	CC192	DZA236-2	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.014	6.567	Processed	2014-09-16 20:11:35
HM167  	113496	L000341	CC192	DZA242-A	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.509	6.892	Processed	2014-09-16 20:11:35
HM168  	113497	L000400	CC192	DZA323-3	Algeria	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.633	-0.874	Processed	2014-09-16 20:11:35
HM169  	113499	L000404	CC192	ESP039-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.950	-4.122	Processed	2014-09-16 20:11:35
HM170  	113498	L000407	CC192	ESP042-B	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.577	-4.843	Processed	2014-09-16 20:11:35
HM171  	\N	L000409	CC192	ESP045-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.449	-5.442	Processed	2014-09-16 20:11:35
HM172  	113501	L000412	CC192	ESP048-E	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.429	-5.703	Processed	2014-09-16 20:11:35
HM173  	113500	L000411	CC192	ESP048-F	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.429	-5.703	Processed	2014-09-16 20:11:35
HM174  	\N	L000610	CC192	ESP095-9	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.986	-2.914	Processed	2014-09-16 20:11:35
HM175  	113502	L000510	CC192	ESP098-B	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.104	-4.232	Processed	2014-09-16 20:11:35
HM176  	113503	L000421	CC192	ESP098-C	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.104	-4.232	Processed	2014-09-16 20:11:35
HM177  	113504	L000425	CC192	ESP100-G	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.060	-4.626	Processed	2014-09-16 20:11:35
HM178  	113505	L000427	CC192	ESP103-B	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.728	-4.854	Processed	2014-09-16 20:11:35
HM179  	113506	L000438	CC192	ESP162-A	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.245	-4.315	Processed	2014-09-16 20:11:35
HM180  	113493	L000514	CC192	ESP163-C	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.989	-4.285	Processed	2014-09-16 20:11:35
HM181  	113492	L000448	CC192	ESP175-D	Spain	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.284	-7.122	Processed	2014-09-16 20:11:35
HM182  	114354	L000451	CC192	F11013-A	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	43.139	2.893	Processed	2014-09-16 20:11:35
HM183  	113507	L000517	CC192	F20015-8	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.084	9.369	Processed	2014-09-16 20:11:35
HM184  	113508	L000463	CC192	F20058-B	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	41.405	9.127	Processed	2014-09-16 20:11:35
HM185  	113509	L000470	CC192	F20081-A	France, Corsica	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.401	9.504	Processed	2014-09-16 20:11:35
HM186  	113510	L000387	CC192	GRC024-H	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.723	21.543	Processed	2014-09-16 20:11:35
HM187  	113511	L000386	CC192	GRC033-C	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.915	22.500	Processed	2014-09-16 20:11:35
HM188  	113513	L000383	CC192	GRC040-1	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.596	23.011	Processed	2014-09-16 20:11:35
HM189  	113494	L000372	CC192	PRT177-C	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.190	-8.081	Processed	2014-09-16 20:11:35
HM190  	113516	L000330	CC192	SA02806	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.867	-7.283	Processed	2014-09-16 20:11:35
HM191  	113517	L000277	CC192	SA03653	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.733	-9.133	Processed	2014-09-16 20:11:35
HM192  	113518	L000280	CC192	SA07763	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.217	10.283	Processed	2014-09-16 20:11:35
HM193  	113519	L000309	CC192	SA08638	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	33.167	-5.633	Processed	2014-09-16 20:11:35
HM194  	113520	L000057	CC192	SA09700	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	36.350	9.617	Processed	2014-09-16 20:11:35
HM195  	113521	L000313	CC192	SA09728	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.750	10.717	Processed	2014-09-16 20:11:35
HM196  	113522	L000207	CC192	SA09970	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.083	8.667	Processed	2014-09-16 20:11:35
HM197  	113523	L000246	CC192	SA12455	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	39.000	8.000	Processed	2014-09-16 20:11:35
HM198  	113524	L000244	CC192	SA18543	Tunisia	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	35.567	8.667	Processed	2014-09-16 20:11:35
HM199  	113525	L000147	CC192	SA19983	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.667	33.083	Processed	2014-09-16 20:11:35
HM200  	113526	L000134	CC192	SA19998	Cyprus	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.733	33.167	Processed	2014-09-16 20:11:35
HM201  	113528	L000233	CC192	SA24576	Morocco	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	34.083	-5.000	Processed	2014-09-16 20:11:35
HM202  	113529	L000226	CC192	SA25941	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	39.000	9.000	Processed	2014-09-16 20:11:35
HM203  	113533	L000167	CC192	SA27176	Greece	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	38.483	22.500	Processed	2014-09-16 20:11:35
HM204  	\N	L000172	CC192	SA27185	Italy	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	41.300	17.783	Processed	2014-09-16 20:11:35
HM205  	113532	L000212	CC192	SA28375	Portugal	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	37.067	-8.800	Processed	2014-09-16 20:11:35
HM206  	113530	L000650	CC192	Salse57A	France	INRA-Montpellier	1	jean-marie.prosperi@supagro.inra.fr	42.820	2.945	Processed	2014-09-16 20:11:35
HM207  	113232	\N	\N	Caliph	\N	\N	1	denny004@umn.edu	\N	\N	Processed	2012-03-22 16:49:01
HM208  	113233	\N	\N	Paraggio	\N	\N	1	denny004@umn.edu	\N	\N	Processed	2012-03-22 16:49:01
HM209  	113241	\N	\N	Sephi	\N	\N	1	denny004@umn.edu	\N	\N	Processed	2012-03-22 16:49:01
HM210  	\N	\N	Tunisian lines	TN1.1	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM211  	\N	\N	Tunisian lines	TN1.17	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM212  	\N	\N	Tunisian lines	TN1.3	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM213  	\N	\N	Tunisian lines	TN7.11	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM214  	\N	\N	Tunisian lines	TN7.13	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM215  	\N	\N	Tunisian lines	TN7.17	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM216  	\N	\N	Tunisian lines	TN7.18	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM217  	\N	\N	Tunisian lines	TN7.19	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM218  	\N	\N	Tunisian lines	TN7.2	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM219  	\N	\N	Tunisian lines	TN7.20	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM220  	\N	\N	Tunisian lines	TN7.22	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM221  	\N	\N	Tunisian lines	TN7.23	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM222  	\N	\N	Tunisian lines	TN7.4	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM248  	114332	\N	\N	Lanautique family 3	France	Katy Heath, UIUC	1	denny004@umn.edu	\N	\N	Processed	2012-04-23 20:57:04
HM247  	113458	\N	\N	Chateauneu family 4	France	Katy Heath, UIUC	1	denny004@umn.edu	\N	\N	Processed	2012-04-23 20:57:04
HM246  	114331	\N	\N	Chateauneu family 1	France	Katy Heath, UIUC	1	denny004@umn.edu	\N	\N	Processed	2012-04-23 20:57:04
HM245  	\N	\N	Tunisian lines	TN9.4	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM244  	\N	\N	Tunisian lines	TN9.3	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM243  	\N	\N	Tunisian lines	TN1.18	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM242  	\N	\N	Tunisian lines	TN1.16	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM241  	\N	\N	Tunisian lines	TN1.15	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM240  	\N	\N	Tunisian lines	TN1.13	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM239  	\N	\N	Tunisian lines	TN1.5	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM238  	\N	\N	Tunisian lines	TN9.5	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM237  	\N	\N	Tunisian lines	TN9.24	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM236  	\N	\N	Tunisian lines	TN9.21	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM235  	\N	\N	Tunisian lines	TN9.20	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM234  	\N	\N	Tunisian lines	TN9.17	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM233  	\N	\N	Tunisian lines	TN9.15	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM232  	\N	\N	Tunisian lines	TN9.12	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM228  	\N	\N	Tunisian lines	TN8.25	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM229  	\N	\N	Tunisian lines	TN8.28	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM230  	\N	\N	Tunisian lines	TN8.4	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM231  	\N	\N	Tunisian lines	TN8.5	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM224  	\N	\N	Tunisian lines	TN8.21	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM225  	\N	\N	Tunisian lines	TN8.22	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM226  	\N	\N	Tunisian lines	TN8.23	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM227  	\N	\N	Tunisian lines	TN8.24	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM223  	\N	\N	Tunisian lines	TN8.15	Tunisia	Sergey Noujdine, USC	0	mounawer_badri@yahoo.fr	\N	\N	Processed	2012-11-30 21:15:28
HM249  	113534	Core01	M. truncatula	PI660363 SSD	Portugal	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM250  	113535	Core02	M. murex	PI660423 SSD	Spain	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM251  	113536	Core04	M. truncatula	PI660386 SSD	Cyprus	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM252  	113537	Core05	M. turbinata	PI660406 SSD	Germany	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM253  	113538	Core06	M. truncatula	PI660496 SSD	France	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM254  	114333	Core07	M. truncatula	PI319051 SSD	Spain	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM255  	114307	Core08	M. murex	PI505437 SSD	Spain	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM256  	114308	Core09	M. truncatula	PI442895 SSD	Australia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM257  	114315	Core10	M. truncatula	PI464815 SSD	Turkey	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM258  	114327	Core11	M. littoralis	PI384655 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM259  	114316	Core12	M. truncatula	PI577599 SSD	Greece	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM260  	114318	Core13	M. truncatula	PI516934 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM261  	114317	Core14	M. truncatula	PI535618 SSD	Tunisia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM262  	114319	Core15	M. truncatula	PI564941 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM263  	114334	Core16	M. murex	PI566889 SSD	Turkey	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Failed QA	2012-12-10 20:12:06
HM264  	114309	Core17	M. truncatula	PI660409 SSD	Italy	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM265  	114335	Core18	M. truncatula	PI660366 SSD	Italy	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Failed QA	2012-12-10 20:12:06
HM266  	114320	Core19	M. truncatula	PI660450 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM267  	114336	Core20	M. truncatula	PI660437 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM268  	114321	Core21	M. truncatula	PI660438 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM269  	114322	Core22	M. truncatula	PI660470 SSD	\N	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM270  	114310	Core23	M. truncatula	PI493297 SSD	Portugal	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM271  	114311	Core24	M. truncatula	PI384664 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM272  	114337	Core25	M. murex	PI660468 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Failed QA	2012-12-10 20:12:06
HM273  	114338	Core26	M. truncatula	PI535614 SSD	Tunisia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM274  	114312	Core27	M. murex	PI577626 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM275  	114328	Core28	M. truncatula	PI516949 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM276  	114323	Core29	M. truncatula	PI577627 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM277  	114313	Core30	M. truncatula	PI577621 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM278  	114339	Core31	M. truncatula	PI577635 SSD	France	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:12:06
HM279  	114314	Core32	M. truncatula	PI660460 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2013-01-14 18:27:11
HM280  	114341	Damas lines	Damas lines	D1.2.3	France	ENSAT-Toulouse	0	gentz@ensat.fr	\N	\N	Processed	2012-12-07 17:39:40
HM281  	114340	Damas lines	Damas lines	D2.2.2	France	ENSAT-Toulouse	0	gentz@ensat.fr	\N	\N	Failed QA	2012-12-07 17:39:40
HM282  	114342	Damas lines	Damas lines	D3.3.3	France	ENSAT-Toulouse	0	gentz@ensat.fr	\N	\N	Processed	2012-12-07 17:39:40
HM283  	114343	Damas lines	Damas lines	D4.2.1	France	ENSAT-Toulouse	0	gentz@ensat.fr	\N	\N	Processed	2012-12-07 17:39:40
HM284  	114344	Damas lines	Damas lines	D5.3.1	France	ENSAT-Toulouse	0	gentz@ensat.fr	\N	\N	Processed	2012-12-07 17:39:40
HM285  	114345	Damas lines	Damas lines	D6.2.1	France	ENSAT-Toulouse	0	gentz@ensat.fr	\N	\N	Processed	2012-12-07 17:39:40
HM286  	114346	Damas lines	Damas lines	D7.1.3	France	ENSAT-Toulouse	0	gentz@ensat.fr	\N	\N	Processed	2012-12-07 17:39:40
HM287  	114347	Core34	M. truncatula	PI577607 SSD	Lebanon	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM288  	114348	Core35	M. truncatula	PI577611 SSD	Germany	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM289  	114349	Core36	M. truncatula	PI577617 SSD	Greece	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM290  	114350	Core37	M. truncatula	PI577640 SSD	U.S.	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM291  	114351	Core38	M. truncatula	PI577648 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM292  	116475	Core39	M. truncatula	PI660360 SSD	France	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM293  	114352	Core40	M. truncatula	PI660411 SSD	Italy	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM294  	\N	Core41	M. truncatula	PI660433 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM295  	114355	Core42	M. truncatula	PI660442 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM296  	114356	Core43	M. truncatula	PI660444 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM297  	114366	Core44	M. truncatula	PI660447 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM298  	114357	Core45	M. truncatula	PI660448 SSD	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM299  	114370	Core46	M. truncatula	PI660456 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM300  	116476	Core47	M. truncatula	PI660488 SSD	Italy	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM301  	114371	Core48	M. truncatula	PI660494 SSD	Italy	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM302  	116477	Core49	M. truncatula	PI283662 SSD	Italy	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM303  	114372	Core50	M. truncatula	PI384636 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM309  	114378	Core56	M. truncatula	PI516939 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM310  	114379	Core57	M. truncatula	PI535651 SSD	Tunisia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM304  	114373	Core51	M. truncatula	PI384660 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM305  	114374	Core52	M. truncatula	PI384662 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM306  	114375	Core53	M. truncatula	PI493295 SSD	Poland	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM307  	114376	Core54	M. truncatula	PI516927 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM308  	114377	Core55	M. truncatula	PI516933 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM311  	114380	Core58	M. truncatula	PI535752 SSD	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM312  	114381	Core59	M. truncatula	PI577609 SSD	Sweden	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM313  	114382	Core60	M. truncatula	PI660408 SSD	Canada	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM314  	114383	Core61	M. truncatula	PI660361 SSD	Greece	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM315  	114384	Core62	M. truncatula	PI660387 SSD	France	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM316  	114385	Core63	M. truncatula	PI660421 SSD	Australia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:13:21
HM317  	114386	Core64	M. truncatula	PI535615 SSD	Tunisia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-10 20:15:09
HM318  	114387	\N	M. arabica	PI495200	France, Corsica	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:06
HM319  	114358	\N	M. arborea	PI504540	Greece, Aegan island	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM320  	114359	\N	M. cancellata	PI440491	Russia, Stavropol	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM321  	114360	\N	M. constricta	PI534177	Bulgaria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM322  	114388	\N	M. coronata	PI498790	Greece	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM323  	114361	\N	M. doliata	PI495278	Lebanon	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM324  	114389	\N	M. italica	PI385014	Tunisia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM325  	116478	\N	M. laciniata	PI498902	Morocco	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM326  	116479	\N	M. lupulina	PI251834	Italy	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM327  	116480	\N	M. minima	PI499080	Turkey	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM328  	114362	\N	M. murex	PI495379	France, Corsica	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM329  	114367	\N	M. noeana	PI495414	Turkey, Icel	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM330  	114363	\N	M. polymorpha	PI566877	Italy, Sicily	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM331  	114368	\N	M. rigidula	PI495517	Greece	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM332  	114369	\N	M. rididuloides	PI534250	Turkey, Ankara	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM333  	114364	\N	M. rotata	PI495581	Turkey, Icel	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM334  	114365	\N	M. turbinata	PI535555	Tunisia	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM335  	114402	\N	M. ruthenica	PI568100	China, Nei Monggol	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM336  	114401	\N	M. sativa ssp. caerulea	PI314275	Uzbekistan	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM337  	114400	\N	M. praecox	PI495434	France, Corsica	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM338  	114399	\N	M. soleirolii	PI537240	Algeria	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:47
HM339  	114398	\N	M.\\nprostrata	PI577445	Italy, Abruzzi	USDA-ARS, Washington	1	orders@ars-grin.gov	\N	\N	Processed	2012-12-07 19:54:06
\.


--
-- Name: hapmap_line hapmap_line_pkey; Type: CONSTRAINT; Schema: public; Owner: hapmap
--

ALTER TABLE ONLY public.hapmap_line
    ADD CONSTRAINT hapmap_line_pkey PRIMARY KEY (hapmap_id);


--
-- Name: hapmap_line update_hapmap_line_timestamp; Type: TRIGGER; Schema: public; Owner: hapmap
--

CREATE TRIGGER update_hapmap_line_timestamp BEFORE UPDATE ON public.hapmap_line FOR EACH ROW EXECUTE PROCEDURE public.update_line_timestamps();


--
-- PostgreSQL database dump complete
--

