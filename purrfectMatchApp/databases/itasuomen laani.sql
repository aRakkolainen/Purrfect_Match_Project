toc.dat                                                                                             0000600 0004000 0002000 00000016275 14720031126 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           	        
    |            Itasuomen laani    17.0    17.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false         �           1262    16388    Itasuomen laani    DATABASE     �   CREATE DATABASE "Itasuomen laani" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';
 !   DROP DATABASE "Itasuomen laani";
                     postgres    false         �            1259    16401    animals    TABLE     (  CREATE TABLE public.animals (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);
    DROP TABLE public.animals;
       public         heap r       postgres    false         �            1259    16428    contact_persons    TABLE       CREATE TABLE public.contact_persons (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100) NOT NULL,
    phone character varying(15),
    rescue_center_id character varying(10)
);
 #   DROP TABLE public.contact_persons;
       public         heap r       postgres    false         �            1259    16389 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);
    DROP TABLE public.customers;
       public         heap r       postgres    false         �            1259    16413 	   donations    TABLE     �   CREATE TABLE public.donations (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);
    DROP TABLE public.donations;
       public         heap r       postgres    false         �            1259    16394    rescue_centers    TABLE     �   CREATE TABLE public.rescue_centers (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);
 "   DROP TABLE public.rescue_centers;
       public         heap r       postgres    false         �          0    16401    animals 
   TABLE DATA           �   COPY public.animals (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
    public               postgres    false    219       4817.dat �          0    16428    contact_persons 
   TABLE DATA           l   COPY public.contact_persons (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
    public               postgres    false    221       4819.dat �          0    16389 	   customers 
   TABLE DATA           M   COPY public.customers (customer_id, customer_name, email, phone) FROM stdin;
    public               postgres    false    217       4815.dat �          0    16413 	   donations 
   TABLE DATA           W   COPY public.donations (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
    public               postgres    false    220       4818.dat �          0    16394    rescue_centers 
   TABLE DATA           _   COPY public.rescue_centers (rescue_center_id, rescue_center_name, center_location) FROM stdin;
    public               postgres    false    218       4816.dat 5           2606    16407    animals animals_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public                 postgres    false    219         9           2606    16432 $   contact_persons contact_persons_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT contact_persons_pkey PRIMARY KEY (contact_person_id, email);
 N   ALTER TABLE ONLY public.contact_persons DROP CONSTRAINT contact_persons_pkey;
       public                 postgres    false    221    221         1           2606    16393    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    217         7           2606    16417    donations donations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donation_id);
 B   ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_pkey;
       public                 postgres    false    220         3           2606    16400 "   rescue_centers rescue_centers_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.rescue_centers
    ADD CONSTRAINT rescue_centers_pkey PRIMARY KEY (rescue_center_id);
 L   ALTER TABLE ONLY public.rescue_centers DROP CONSTRAINT rescue_centers_pkey;
       public                 postgres    false    218         ;           2606    16418    donations fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 ?   ALTER TABLE ONLY public.donations DROP CONSTRAINT fk_customer;
       public               postgres    false    4657    220    217         :           2606    16408    animals fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 B   ALTER TABLE ONLY public.animals DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    218    219    4659         <           2606    16423    donations fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 D   ALTER TABLE ONLY public.donations DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    220    4659    218         =           2606    16433     contact_persons fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 J   ALTER TABLE ONLY public.contact_persons DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    221    218    4659                                                                                                                                                                                                                                                                                                                                           4817.dat                                                                                            0000600 0004000 0002000 00000005067 14720031126 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_ANI_01	Cat	Mirri	A playful and affectionate cat who loves human company.	4	Requires daily playtime and a cozy sleeping spot.	I_RES_11
I_ANI_02	Dog	Stella	A loyal, gentle dog with a calm personality.	10	Needs a quiet home with minimal stairs due to age.	I_RES_20
I_ANI_03	Guinea pig	Täplä	A curious guinea pig with a love for fresh veggies.	1	Requires a spacious cage and daily vegetable snacks.	I_RES_03
I_ANI_04	Cat	Sir Uljas	A dignified senior cat with a soft spot for his sister.	10	Will be handed over together with his sister Lady Nätti.	I_RES_05
I_ANI_05	Cat	Lady Nätti	A gentle, loving cat who adores her brother.	10	Will be handed over together with her brother Sir Uljas.	I_RES_05
I_ANI_06	Bunny	Luppa	A gentle bunny with soft, floppy ears.	2	Needs regular grooming and a safe indoor space.	I_RES_10
I_ANI_07	Dog	Musti	An active and friendly dog who loves outdoor adventures.	4	Requires daily exercise and mental stimulation.	I_RES_11
I_ANI_08	Cat	Noki	A shy young cat with a sleek black coat.	1	Needs a calm environment and gentle socialization.	I_RES_13
I_ANI_09	Cat	Salpa	A curious and playful kitten with lots of energy.	0	Would benefit from a home with another young cat.	I_RES_20
I_ANI_10	Dog	Sisu	A loyal dog who is always up for an adventure.	6	Best suited for an active family with outdoor space.	I_RES_05
I_ANI_11	Dog	Rauno	A friendly, playful dog who loves to meet new people.	3	Prefers a home where he is not left alone for long periods.	I_RES_09
I_ANI_12	Cat	Nokkonen	A tiny kitten with boundless energy and curiosity.	0	Requires frequent feeding and socialization.	I_RES_17
I_ANI_13	Bunny	Rumpali	A lively bunny who enjoys hopping around.	4	Needs a secure area to roam and hop.	I_RES_19
I_ANI_14	Hamster	Pörrö	A fluffy, small hamster who loves to burrow.	1	Requires a cage with hiding spots and a wheel.	I_RES_10
I_ANI_15	Cat	Lumi	A wise, calm senior cat who enjoys quiet time.	15	Would thrive in a quiet home with minimal changes.	I_RES_04
I_ANI_16	Cat	Töpö	A friendly, sociable cat who enjoys being around people.	7	Requires daily playtime and a stable environment.	I_RES_10
I_ANI_17	Dog	Muru	A sweet-natured young dog who loves attention.	2	Best suited to a family with time for training.	I_RES_15
I_ANI_18	Dog	Sopu	A gentle and cuddly dog who enjoys belly rubs.	1	Needs a loving home that can continue basic training.	I_RES_12
I_ANI_19	Cat	Ukko	A calm, older cat who enjoys naps in sunny spots.	9	Would benefit from a quiet, low-stress home.	I_RES_11
I_ANI_20	Bunny	Apila	A curious bunny with a love for fresh greens.	2	Needs a varied diet and time to hop freely.	I_RES_10
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4819.dat                                                                                            0000600 0004000 0002000 00000002625 14720031126 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_CON_01	Lennart Ruotsalainen	ruotsalainen.kalla@email.com	0404892770	I_RES_01
I_CON_02	Roope HarmaaJärvi	harmaajarvi.Pakka@email.com	0400557892	I_RES_02
I_CON_03	Hanna Mäkelä	makela.kiuruvesi@email.com	0502286673	I_RES_03
I_CON_04	Marika Turunen	turunen.joensuu.email.com	0500421996	I_RES_04
I_CON_05	Elena Aaltonen	aaltonen.ESY@email.com	0409893761	I_RES_05
I_CON_06	Marko Laaksonen	laaksonen.sepsis@email.com	0509342780	I_RES_06
I_CON_07	Jaana Jokinen	jokinen.vehka@email.com	0400767891	I_RES_07
I_CON_08	Oliver Vanhanen	vanhanen.mikkeli@email.com	0508003120	I_RES_08
I_CON_09	Tatu Ruoho	ruoho.varkaus@email.com	0509928921	I_RES_09
I_CON_10	Liina Martikainen	martikainen.pieksemaki@email.com	0500789123	I_RES_10
I_CON_11	Mari Tähtinen	tahtinen.Lieksa@email.com	0400989091	I_RES_11
I_CON_12	Saana Nurmi	nurmi.outokumpu@email.com	0409753108	I_RES_12
I_CON_13	Olavi Rautio	rautio.liperi@email.com	0500933661	I_RES_13
I_CON_14	Ilmari Pekkanen	pekkanen.miukula@email.com	0503451234	I_RES_14
I_CON_15	Sonja Laine	laine.savonlinna@email.com	0400658923	I_RES_15
I_CON_16	Hilla Karjalainen	karjalainen.Iloset@email.com	0504512548	I_RES_16
I_CON_17	Valto Salminen	salminen.kekale@email.com	0408522341	I_RES_17
I_CON_18	Hellä Hämäläinen	hamalainen.tassula@email.com	0400989444	I_RES_18
I_CON_19	Topi Lehtinen	lehtinen.kontionlahti@email.com	0504530902	I_RES_19
I_CON_20	Inka Nikula	nikula.juva@email.com	0405379001	I_RES_20
\.


                                                                                                           4815.dat                                                                                            0000600 0004000 0002000 00000002027 14720031126 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_CUS_01	Benjamin Mäkelä	makela@email.com	0403872901
I_CUS_02	Elina Salo	salo@email.com	0500387988
I_CUS_03	Erkki Laine	laine@email.com	0403844301
I_CUS_04	Markus Toivonen	toivonen@email.com	0503871115
I_CUS_05	Luukas Linna	linna@email.com	0400339784
I_CUS_06	Airi Pentti	pentti@email.com	0502289460
I_CUS_07	Soini Järvi	jarvi@email.com	0403872222
I_CUS_08	Virva Harmaajärvi	harmaajarvi@email.com	0403874591
I_CUS_09	Tyyne Lehtonen	lehtonen@email.com	0502282229
I_CUS_10	Anna-Liisa Vanhanen	vanhanen@email.com	0402477006
I_CUS_11	Patrik Rinne	rinne@email.com	0500887933
I_CUS_12	Erkki Ranta	ranta@email.com	0500884433
I_CUS_13	Lasse Aaltonen	aaltonen@email.com	0404439901
I_CUS_14	Alisa Koskinen	koskinen@email.com	0503874501
I_CUS_15	Hellä Lahtinen	lahtinen@email.com	0505875905
I_CUS_16	Kirsi Jokinen	jokinen@email.com	0406778910
I_CUS_17	Aada Seppä	seppa@email.com	0401272345
I_CUS_18	Erik Mäkinen	makinen@email.com	0509345412
I_CUS_19	Santeri Peura	peura@email.com	0509455434
I_CUS_20	Otto Karppinen	karppinen@email.com	0503898701
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4818.dat                                                                                            0000600 0004000 0002000 00000001143 14720031126 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_DON_01	I_CUS_06	I_RES_01	100
I_DON_02	I_CUS_10	I_RES_20	50
I_DON_03	I_CUS_01	I_RES_05	150
I_DON_04	I_CUS_05	I_RES_09	10
I_DON_05	I_CUS_08	I_RES_11	20
I_DON_06	I_CUS_04	I_RES_05	60
I_DON_07	I_CUS_10	I_RES_04	100
I_DON_08	I_CUS_12	I_RES_01	100
I_DON_09	I_CUS_14	I_RES_19	120
I_DON_10	I_CUS_17	I_RES_15	50
I_DON_11	I_CUS_02	I_RES_20	20
I_DON_12	I_CUS_20	I_RES_03	10
I_DON_13	I_CUS_01	I_RES_05	10
I_DON_14	I_CUS_03	I_RES_08	20
I_DON_15	I_CUS_06	I_RES_07	40
I_DON_16	I_CUS_19	I_RES_17	50
I_DON_17	I_CUS_06	I_RES_14	100
I_DON_18	I_CUS_13	I_RES_10	40
I_DON_19	I_CUS_18	I_RES_19	20
I_DON_20	I_CUS_12	I_RES_11	10
\.


                                                                                                                                                                                                                                                                                                                                                                                                                             4816.dat                                                                                            0000600 0004000 0002000 00000002425 14720031126 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_RES_01	Kallan eläinsuojelu Ry	Savilahdentie 10, 70150 Kuopio
I_RES_02	Pakan tila	Länsi-Säviäntie 611, 72810 Jylhänkylä
I_RES_03	Kiuruveden löytölä	Lahdentie 70, 74680 Myllyniemi
I_RES_04	Joensuun eläinsuojeluyhdistys ry	PL 110, 80101 Joensuu
I_RES_05	ESY Elämänlanka ry	Nojanmaantie 15, 57210 Savonlinna
I_RES_06	Löytöeläintalo Sepsis	Pirttiseläntie 442, Kolkontaipale
I_RES_07	Vehkan Lemmikkihoitola	Alakuonantie 564, Kerimäki
I_RES_08	Mikkelin eläinsuojeluyhdistys	Porrassalmenkatu 69 B 50100 Mikkeli
I_RES_09	Varkauden seudun eläinsuojeluyhdistys	Kivipurontie 8, 78500 Varkaus
I_RES_10	Pieksemäen Eläinsuojeluyhdistys	Rummukantie 86, 77570 Pieksämäki
I_RES_11	Löytötalo Lieksa	Teeritie 1, 81700 Lieksa
I_RES_12	Outokummun löytöeläintalo	Yrjönkatu 2c, 83500 Outokumpu
I_RES_13	Liperin löydetyt	Meijeritie 1c, 83100 Liperi
I_RES_14	Miukulan eläintalo	Raussintie 3, 79700 Heinävesi
I_RES_15	Savonlinnan eläinsuojelu Ry	Savontie 6, 57170 Savonlinna
I_RES_16	Iloiset löytöeläintalo	Särkäntie 3, 82900 Ilomantsi
I_RES_17	Löytöeläintalo Kekäle	Kivisärkäntie 6, 82500 Kitee
I_RES_18	Tassulan löytötalo	Syrjäläntie 2, 83900 Juuka
I_RES_19	Kontionlahden eläinsuojelu Ry	Keskuskatu 18, 81100 Kontiolahti
I_RES_20	Juvan löytötalo	Oikotie 4, 51900 Juva
\.


                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000015116 14720031126 0015364 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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

DROP DATABASE "Itasuomen laani";
--
-- Name: Itasuomen laani; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Itasuomen laani" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';


ALTER DATABASE "Itasuomen laani" OWNER TO postgres;

\connect -reuse-previous=on "dbname='Itasuomen laani'"

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
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);


ALTER TABLE public.animals OWNER TO postgres;

--
-- Name: contact_persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_persons (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100) NOT NULL,
    phone character varying(15),
    rescue_center_id character varying(10)
);


ALTER TABLE public.contact_persons OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);


ALTER TABLE public.donations OWNER TO postgres;

--
-- Name: rescue_centers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rescue_centers (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);


ALTER TABLE public.rescue_centers OWNER TO postgres;

--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animals (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
\.
COPY public.animals (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM '$$PATH$$/4817.dat';

--
-- Data for Name: contact_persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_persons (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
\.
COPY public.contact_persons (contact_person_id, contact_person, email, phone, rescue_center_id) FROM '$$PATH$$/4819.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, email, phone) FROM stdin;
\.
COPY public.customers (customer_id, customer_name, email, phone) FROM '$$PATH$$/4815.dat';

--
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
\.
COPY public.donations (donation_id, customer_id, rescue_center_id, amount) FROM '$$PATH$$/4818.dat';

--
-- Data for Name: rescue_centers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rescue_centers (rescue_center_id, rescue_center_name, center_location) FROM stdin;
\.
COPY public.rescue_centers (rescue_center_id, rescue_center_name, center_location) FROM '$$PATH$$/4816.dat';

--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);


--
-- Name: contact_persons contact_persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT contact_persons_pkey PRIMARY KEY (contact_person_id, email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: donations donations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donation_id);


--
-- Name: rescue_centers rescue_centers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rescue_centers
    ADD CONSTRAINT rescue_centers_pkey PRIMARY KEY (rescue_center_id);


--
-- Name: donations fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: animals fk_rescue_center; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);


--
-- Name: donations fk_rescue_center; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);


--
-- Name: contact_persons fk_rescue_center; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  