toc.dat                                                                                             0000600 0004000 0002000 00000016305 14717366035 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                   
    |            Etelasuomen laani    17.0    17.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false         �           1262    16567    Etelasuomen laani    DATABASE     �   CREATE DATABASE "Etelasuomen laani" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';
 #   DROP DATABASE "Etelasuomen laani";
                     postgres    false         �            1259    16658    animals    TABLE     (  CREATE TABLE public.animals (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);
    DROP TABLE public.animals;
       public         heap r       postgres    false         �            1259    16685    contact_persons    TABLE       CREATE TABLE public.contact_persons (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100) NOT NULL,
    phone character varying(15),
    rescue_center_id character varying(10)
);
 #   DROP TABLE public.contact_persons;
       public         heap r       postgres    false         �            1259    16646 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);
    DROP TABLE public.customers;
       public         heap r       postgres    false         �            1259    16670 	   donations    TABLE     �   CREATE TABLE public.donations (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);
    DROP TABLE public.donations;
       public         heap r       postgres    false         �            1259    16651    rescue_centers    TABLE     �   CREATE TABLE public.rescue_centers (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);
 "   DROP TABLE public.rescue_centers;
       public         heap r       postgres    false         �          0    16658    animals 
   TABLE DATA           �   COPY public.animals (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
    public               postgres    false    219       4817.dat �          0    16685    contact_persons 
   TABLE DATA           l   COPY public.contact_persons (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
    public               postgres    false    221       4819.dat �          0    16646 	   customers 
   TABLE DATA           M   COPY public.customers (customer_id, customer_name, email, phone) FROM stdin;
    public               postgres    false    217       4815.dat �          0    16670 	   donations 
   TABLE DATA           W   COPY public.donations (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
    public               postgres    false    220       4818.dat �          0    16651    rescue_centers 
   TABLE DATA           _   COPY public.rescue_centers (rescue_center_id, rescue_center_name, center_location) FROM stdin;
    public               postgres    false    218       4816.dat 5           2606    16664    animals animals_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public                 postgres    false    219         9           2606    16689 $   contact_persons contact_persons_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT contact_persons_pkey PRIMARY KEY (contact_person_id, email);
 N   ALTER TABLE ONLY public.contact_persons DROP CONSTRAINT contact_persons_pkey;
       public                 postgres    false    221    221         1           2606    16650    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    217         7           2606    16674    donations donations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donation_id);
 B   ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_pkey;
       public                 postgres    false    220         3           2606    16657 "   rescue_centers rescue_centers_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.rescue_centers
    ADD CONSTRAINT rescue_centers_pkey PRIMARY KEY (rescue_center_id);
 L   ALTER TABLE ONLY public.rescue_centers DROP CONSTRAINT rescue_centers_pkey;
       public                 postgres    false    218         ;           2606    16675    donations fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 ?   ALTER TABLE ONLY public.donations DROP CONSTRAINT fk_customer;
       public               postgres    false    217    220    4657         :           2606    16665    animals fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 B   ALTER TABLE ONLY public.animals DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    219    218    4659         <           2606    16680    donations fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 D   ALTER TABLE ONLY public.donations DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    220    4659    218         =           2606    16690     contact_persons fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 J   ALTER TABLE ONLY public.contact_persons DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    4659    218    221                                                                                                                                                                                                                                                                                                                                   4817.dat                                                                                            0000600 0004000 0002000 00000007260 14717366035 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_ANI_01	cat	Aba	Aba is a young, playful kitten who loves to explore her surroundings.	1	Aba would thrive in a quiet home with plenty of toys. Ideal for a household without other cats.	E_RES_02
E_ANI_02	dog	Adele	Adele is a loyal, friendly dog with a playful spirit. She loves outdoor adventures.	4	Adele needs an active household with adults or older children. Requires a fenced yard.	E_RES_19
E_ANI_03	bunny	Aamu	A gentle and curious bynny, Aamu loves munching on fresh greens.	6	Aamu would do well in a calm environment, with plenty of safe, indoor space to explore.	E_RES_07
E_ANI_04	cat	Haiti	A sleek and affectionate cat, Haiti enjoys lounging in the sun and napping.	2	Haiti prefers a quiet home and would love a sunny spot to relax. Suitable for all ages.	E_RES_14
E_ANI_05	dog	Hali	Hali is a big, affectionate dog who enjoys being around people and other pets.	7	Hali needs a large yard and prefers a home with other pets or a companion.	E_RES_16
E_ANI_06	cat	Haba	A playful and curious cat, Haba loves to chase toys and explore new spaces.	3	Haba would thrive in a lively household with other cats or plenty of toys.	E_RES_01
E_ANI_07	dog	Hannu	Hannu is a loyal and calm dog who loves belly rubs and quiet walks.	2	Hannu would be best suited to a home without young children; ideal for a calm household.	E_RES_12
E_ANI_08	bunny	Ihaa	Ihaa is a gentle bynny who loves hopping around and exploring new hiding spots.	6	Ihaa would do well in a child-free home with a quiet atmosphere.	E_RES_10
E_ANI_09	cat	Iisa	Iisa is an independent and observant cat who enjoys alone time but loves treats.	5	Iisa would suit a home with experienced cat owners; enjoys being the only pet.	E_RES_08
E_ANI_10	dog	Iivan	Iivan is a friendly, older dog who loves being close to his family and taking naps.	8	Ideal for a calm household; Iivan enjoys short walks and quiet spaces.	E_RES_21
E_ANI_11	bunny	Iiris	A playful and energetic bynny, Iiris enjoys toys and fresh veggies.	4	Iiris needs a home with plenty of indoor space to hop and play.	E_RES_03
E_ANI_12	cat	Immo	Immo is a relaxed and easygoing cat who enjoys lounging and observing.	3	Immo would prefer a quiet home with older adults or a family with teens.	E_RES_05
E_ANI_13	cat	Jaija	Jaija is a curious kitten who loves exploring and playing with others.	2	Jaija would love a lively home with other pets or young children to play with.	E_RES_17
E_ANI_14	dog	Jakke	Jakke is a young, energetic dog who loves fetch and exploring the outdoors.	1	Jakke needs an active household with access to outdoor spaces. Great for families.	E_RES_14
E_ANI_15	cat	Jalo	Jalo is a calm and affectionate cat who loves curling up on laps.	6	Jalo would suit a quiet home where he can relax with his family.	E_RES_20
E_ANI_16	dog	Janne	Janne is a gentle, friendly dog who loves long walks and family time.	5	Would thrive in a family setting with children or other pets.	E_RES_15
E_ANI_17	bunny	Kalle	Kalle is a calm and lovable bynny who enjoys gentle interactions.	5	Kalle would do well in a family without young children. Indoor housing preferred.	E_RES_13
E_ANI_18	dog	Kari	Kari is a friendly, playful dog who enjoys being the center of attention.	4	Kari would be best in an active household with time for long walks.	E_RES_11
E_ANI_19	bunny	Karo	Karo is a curious bunny who loves nibbling on veggies and exploring.	3	Karo prefers a calm environment with no young children.	E_RES_09
E_ANI_20	cat	Mali	Mali is a playful kitten who loves to explore and hide in small spaces.	2	Mali would suit a busy household with lots of playtime and toys.	E_RES_06
E_ANI_21	cat	Mantra	Mantra is a young, independent kitten with a playful personality.	1	Mantra would do well in a home with other cats or children to keep her entertained.	E_RES_04
\.


                                                                                                                                                                                                                                                                                                                                                4819.dat                                                                                            0000600 0004000 0002000 00000002415 14717366035 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_CON_01	Jouko Lääperi	joukoHel@gmail.com	0505548879	E_RES_01
E_CON_02	Mikael Peltola	mikaelLem@gmail.com	0456658543	E_RES_02
E_CON_03	Jyrki Seinä	jyrkiMan@gmail.com	0407852014	E_RES_03
E_CON_04	Hanna Saari	hannaKer@gmail.com	0504898987	E_RES_04
E_CON_05	Tarja Storm	tarjaKark@gmail.com	0406544560	E_RES_05
E_CON_06	Vesa Sutinen	vesaLoh@gmail.com	0507989874	E_RES_06
E_CON_07	Annikki Lehti	annikkiIit@gmail.com	0407630364	E_RES_07
E_CON_08	Kaarina Hurme	kaarinaHol@gmail.com	0504712054	E_RES_08
E_CON_09	Emilia Reitti	emiliaLah@gmail.com	0459865267	E_RES_09
E_CON_10	Ilona Vaaka	ilonaEs@gmail.com	0456369563	E_RES_10
E_CON_11	Inka Pasma	jinkaHei@gmail.com	0507895874	E_RES_11
E_CON_12	Pinja Jaara	pinjaOri@gmail.com	0409635410	E_RES_12
E_CON_13	Eeva Hakala	eevaHam@gmail.com	0504561287	E_RES_13
E_CON_14	Mari Saimaa	mariHyv@gmail.com	0450254681	E_RES_14
E_CON_15	Lotta Valjus	lottaPer@gmail.com	04565438520	E_RES_15
E_CON_16	Amalia Läätilä	amaliaMyrs@gmail.com	0457841064	E_RES_16
E_CON_17	Helena Odd	helenaRuo@gmail.com	0500302154	E_RES_17
E_CON_18	Elmer Matero	elmerPyh@gmail.com	0451542364	E_RES_18
E_CON_19	Amanda Klasi	amandaTam@gmail.com	05078920546	E_RES_19
E_CON_20	Anton Lumi	antonSip@gmail.com	04545210574	E_RES_20
E_CON_21	Aune Akku	aunePad@gmail.com	0454510257	E_RES_21
\.


                                                                                                                                                                                                                                                   4815.dat                                                                                            0000600 0004000 0002000 00000002125 14717366035 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_CUS_01	Juho Inkinen	juho@gmail.com	0506849753
E_CUS_02	Mira Hiltunen	hiltunen@gmail.com	0456897364
E_CUS_03	Ari Nieminen	ari@gmail.com	0403667124
E_CUS_04	Joosua Nissilä	joosua@gmail.com	0509974682
E_CUS_05	Seija Rekilä	seija@gmail.com	0400124128
E_CUS_06	Toni Svahn	svahn@gmail.com	05024654843
E_CUS_07	Esko Talonen	esko@gmail.com	04078474761
E_CUS_08	Maija Kovonen	maija@gmail.com	0503461846
E_CUS_09	Pirjo Khan	khan@gmail.com	0457479874
E_CUS_10	Oskari Paananen	oskari@gmail.com	0453650715
E_CUS_11	Jukka Ylitalo	jukka@gmail.com	0504577842
E_CUS_12	Roosa Pöytä	roosa@gmail.com	040321354974
E_CUS_13	Juhani Tuominen	tuominen@gmail.com	0501122846
E_CUS_14	Samuli Laurila	samuli@gmail.com	0453151547
E_CUS_15	Noora Paulus	paulus@gmail.com	0458897981
E_CUS_16	Siiri Ahven	ahven@gmail.com	0456686889
E_CUS_17	Anita Hyväri	anita@gmail.com	05034575120
E_CUS_18	Ilona Muhli	muhli@gmail.com	0453846975
E_CUS_19	Tuomas Tuukkanen	tuomas@gmail.com	0503636532
E_CUS_20	Sisko Saitas	sisko@gmail.com	0459898636
E_CUS_21	Henri Henkinen	henkinen@gmail.com	0457410245
E_CUS_22	Kirsi Oja	oja@gmail.com	0450369754
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                           4818.dat                                                                                            0000600 0004000 0002000 00000001235 14717366035 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_DON_01	E_CUS_16	E_RES_16	100
E_DON_02	E_CUS_17	E_RES_12	50
E_DON_03	E_CUS_17	E_RES_02	5
E_DON_04	E_CUS_04	E_RES_01	25
E_DON_05	E_CUS_04	E_RES_16	150
E_DON_06	E_CUS_03	E_RES_01	200
E_DON_07	E_CUS_21	E_RES_02	175
E_DON_08	E_CUS_21	E_RES_05	300
E_DON_09	E_CUS_17	E_RES_11	25
E_DON_10	E_CUS_21	E_RES_16	75
E_DON_11	E_CUS_18	E_RES_12	5
E_DON_12	E_CUS_03	E_RES_11	10
E_DON_13	E_CUS_16	E_RES_16	40
E_DON_14	E_CUS_04	E_RES_01	150
E_DON_15	E_CUS_17	E_RES_14	10
E_DON_16	E_CUS_16	E_RES_21	25
E_DON_17	E_CUS_03	E_RES_21	20
E_DON_18	E_CUS_18	E_RES_21	5
E_DON_19	E_CUS_21	E_RES_05	80
E_DON_20	E_CUS_18	E_RES_14	45
E_DON_21	E_CUS_12	E_RES_19	150
E_DON_22	E_CUS_01	E_RES_15	20
\.


                                                                                                                                                                                                                                                                                                                                                                   4816.dat                                                                                            0000600 0004000 0002000 00000002563 14717366035 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_RES_01	Helsingin eläinsuojelu ry	Käpyläntie 11, 00600 Helsinki
E_RES_02	Lemin eläinyhdistys ry	Uutelantie 6, 54710 Lemi
E_RES_03	Mäntsälän eläinsuojelu ry	Haapajunttilantie 13, 04600 Mäntsälä
E_RES_04	Keravan eläinsuojelu ry	Laurintie 10, 04200 Kerava
E_RES_05	Karkkilan eläinsuojelu ry	Suorakatu 3, 03600 Karkkila
E_RES_06	Lohjan eläinsuojelu ry	Rajalammentie 95, 09430 Lohja
E_RES_07	Iitin eläinyhdistys ry	Tiukutie 2, 47400 Iitti
E_RES_08	Hollolan eläinyhdistys ry	Terveystie 3, 15870 Hollola
E_RES_09	Lahden eläinsuojelu ry	Alvontie 10, 15540 Lahti
E_RES_10	Espoon eläinsuojelu ry	Naurismäki 6, 02340 Espoo
E_RES_11	Heinolan eläinyhdistys ry	Läpiänkatu 7, 18100 Heinola
E_RES_12	Orimattilan eläinsuojelu ry	Suppulanpolku 2, 16300 Orimattila
E_RES_13	Haminan eläinsuojelu ry	Vesikatu 12, 49400 Hamina
E_RES_14	Hyvinkään eläinsuojelu ry	Kaunisnummentie 49, 05840 Hyvinkää
E_RES_15	Pernajan eläinyhdistys ry	Pernajantie 232, 07930 Pernaja
E_RES_16	Myrskylän eläinsuojelu ry	Karpalokuja 5, 07600 Myrskylä
E_RES_17	Ruokolahden eläinyhdistys ry	Veikkojenpolku 16, 56100 Ruokolahti
E_RES_18	Pyhtään eläinsuojelu ry	Pyhtääntie 22, 49270 Pyhtään kirkonkylä
E_RES_19	Tammelan eläinsuojelu ry	Tammelantie 47, 31300 Tammela
E_RES_20	Sipoon eläinsuojelu ry	Tärskogintie 98, 01190 Sipoo
E_RES_21	Padasjoen eläinyhdistys ry	Vuokkotie 1, 17500 Padasjoki
\.


                                                                                                                                             restore.sql                                                                                         0000600 0004000 0002000 00000015130 14717366035 0015400 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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

DROP DATABASE "Etelasuomen laani";
--
-- Name: Etelasuomen laani; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Etelasuomen laani" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';


ALTER DATABASE "Etelasuomen laani" OWNER TO postgres;

\connect -reuse-previous=on "dbname='Etelasuomen laani'"

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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        