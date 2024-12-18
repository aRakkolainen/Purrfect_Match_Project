toc.dat                                                                                             0000600 0004000 0002000 00000016255 14721044354 0014454 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   ,    4            
    |            Oulun laani    17.0    17.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                    1262    32919    Oulun laani    DATABASE     �   CREATE DATABASE "Oulun laani" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';
    DROP DATABASE "Oulun laani";
                     postgres    false         �            1259    32933    animals    TABLE     (  CREATE TABLE public.animals (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);
    DROP TABLE public.animals;
       public         heap r       postgres    false         �            1259    32960    contact_persons    TABLE       CREATE TABLE public.contact_persons (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100) NOT NULL,
    phone character varying(15),
    rescue_center_id character varying(10)
);
 #   DROP TABLE public.contact_persons;
       public         heap r       postgres    false         �            1259    32921 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);
    DROP TABLE public.customers;
       public         heap r       postgres    false         �            1259    32945 	   donations    TABLE     �   CREATE TABLE public.donations (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);
    DROP TABLE public.donations;
       public         heap r       postgres    false         �            1259    32926    rescue_centers    TABLE     �   CREATE TABLE public.rescue_centers (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);
 "   DROP TABLE public.rescue_centers;
       public         heap r       postgres    false                   0    32933    animals 
   TABLE DATA           �   COPY public.animals (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
    public               postgres    false    219       4871.dat 	          0    32960    contact_persons 
   TABLE DATA           l   COPY public.contact_persons (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
    public               postgres    false    221       4873.dat           0    32921 	   customers 
   TABLE DATA           M   COPY public.customers (customer_id, customer_name, email, phone) FROM stdin;
    public               postgres    false    217       4869.dat           0    32945 	   donations 
   TABLE DATA           W   COPY public.donations (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
    public               postgres    false    220       4872.dat           0    32926    rescue_centers 
   TABLE DATA           _   COPY public.rescue_centers (rescue_center_id, rescue_center_name, center_location) FROM stdin;
    public               postgres    false    218       4870.dat k           2606    32939    animals animals_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public                 postgres    false    219         o           2606    32964 $   contact_persons contact_persons_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT contact_persons_pkey PRIMARY KEY (contact_person_id, email);
 N   ALTER TABLE ONLY public.contact_persons DROP CONSTRAINT contact_persons_pkey;
       public                 postgres    false    221    221         g           2606    32925    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    217         m           2606    32949    donations donations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donation_id);
 B   ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_pkey;
       public                 postgres    false    220         i           2606    32932 "   rescue_centers rescue_centers_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.rescue_centers
    ADD CONSTRAINT rescue_centers_pkey PRIMARY KEY (rescue_center_id);
 L   ALTER TABLE ONLY public.rescue_centers DROP CONSTRAINT rescue_centers_pkey;
       public                 postgres    false    218         q           2606    32950    donations fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 ?   ALTER TABLE ONLY public.donations DROP CONSTRAINT fk_customer;
       public               postgres    false    4711    220    217         p           2606    32940    animals fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 B   ALTER TABLE ONLY public.animals DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    218    219    4713         r           2606    32955    donations fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 D   ALTER TABLE ONLY public.donations DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    220    4713    218         s           2606    32965     contact_persons fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 J   ALTER TABLE ONLY public.contact_persons DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    221    218    4713                                                                                                                                                                                                                                                                                                                                                           4871.dat                                                                                            0000600 0004000 0002000 00000006551 14721044354 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_ANI_01	dog	June	June is a puppy who is social and active	1	Prefers home where are already other pets to play with or active owners who have time to play and walk with them	O_RES_01
O_ANI_02	cat	Milo	Milo is a bit shy cat who prefers alone time and having places to hide	5	Prefers a quiet environment with no other pets or young chilren	O_RES_12
O_ANI_03	cat	Penny	Penny is older cat lady who enjoys quiet home but enjoys sometimes cuddles too	7	A quiet home with no other pets	O_RES_11
O_ANI_04	cat	Sulo	Sulo is a senior cat who enjoys both alone time and being social with humans and other cats	8	Quiet home with other cat friends for Sulo because Sulo likes having company	O_RES_02
O_ANI_05	cat	Delia	Delia is older cat lady who might be at first bit shy and likes to smell the fresh air	5	Home should have at least balcony where Delia can safely visit to look at outdoors	O_RES_02
O_ANI_06	bunny	Risto Reipas	Risto Reipas is really friendly bunny who enjoys cuddles and playing together	5	Home where owner has a lot of time to cuddle, play and give treats	O_RES_01
O_ANI_07	dog	Rocky	Rocky is active dog who enjoy playing with toys and long walks	2	Home where the owner has a lot of time for playing and long walks	O_RES_04
O_ANI_08	bunny	Heinä	Heinä is active bunny who likes to explore	5	Only pet, big fenced area and a lot of fresh vegetables	O_RES_17
O_ANI_10	dog	April	April is an energetic puppy who likes playing with anybody	2	Active household, a lot of toys, preferably dog friends	O_RES_05
O_ANI_11	dog	Ruby	April is a friendly dog who likes playing, long walks and a lot of cuddles	2	Active household with a lot of time for walks	O_RES_06
O_ANI_09	dog	Yoda	Yoda is active and energetic puppy who likes playing with anybody	2	Active household, a lot of toys, preferably dog friends	O_RES_03
O_ANI_12	bunny	Pete	A friendly bunny who likes cuddles and fresh vegetables	3	Not much special requirements, just always fresh vegetables available	O_RES_07
O_ANI_13	cat	Caesar	Caesar is older cat sir who likes alone time and looking at birds outside	8	Home with no other pets	O_RES_08
O_ANI_14	dog	Hugo	Hugo is older dog who still enjoys walks and cuddles but not that much playing	8	Forever home with no other pets because Hugo likes silence	O_RES_08
O_ANI_15	dog	Nemo	Nemo is a blind dog but still active and likes exploring places	3	Calm household and place where it is easy to navigate places, person with previous experience of having blind pets	O_RES_09
O_ANI_16	cat	Toto	Toto likes exploring places alone	4	Home with a lot of places to explore	O_RES_10
O_ANI_17	cat	Ellie	Ellie likes hanging out with other pets and is really social	4	Home with a few other cats/pets	O_RES_13
O_ANI_18	cat	Nellie	Nellie likes hanging out with other pets and is really social	4	Home with other pets	O_RES_14
O_ANI_19	dog	Waldo	Likes playing with toys and likes also hide	1	Places to hide and explore	O_RES_15
O_ANI_20	dog	Olivia	Likes playing with toys and long walks	5	Active and outdoor type owner	O_RES_16
O_ANI_22	bunny	Belle	Likes playing with toys and other bunnies and getting a lot of treats	3	Home with other bunny friends but no children	O_RES_19
O_ANI_23	cat	Greta	A bit older cat lady who prefers cuddles but also alone time	9	Calm home	O_RES_20
O_ANI_21	bunny	Kosmo	Likes playing with toys and getting a lot of treats	2	Owner who has time to play and cuddle with Kosmo or other bunny friends but no children	O_RES_18
\.


                                                                                                                                                       4873.dat                                                                                            0000600 0004000 0002000 00000003123 14721044354 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_CON_01	Laimi Koivu	laimi.koivu@oulunseudunelainyhdistys.com	0402912331	O_RES_01
O_CON_02	Brian Kottarainen	brian.kottarainen@yhdistys_popopet.com	0402393418	O_RES_02
O_CON_03	Julius Tammi	julius.tammi@oulaistenelainyhdistys.com	0509318481	O_RES_03
O_CON_04	Leo Inha	leo.inha@kalajoenelainyhdistys.com	0403912942	O_RES_04
O_CON_05	Aura Laakso	aura.laakso@kalajoenloytoelainkoti.com	0549295729	O_RES_05
O_CON_06	Selja Pihlaja	selja.pihlaja@raahenloytoelainkoti.com	0582293324	O_RES_06
O_CON_07	Olga Kaila	olga.kaila@ylivieskanelainyhdistys.com	0410021983	O_RES_07
O_CON_08	Julia Järvi	julia.jarvi@kennelmehta-apu.com	0304012834	O_RES_08
O_CON_09	Taru Kottarainen	taru.kottarainen@oulunelainkoti.com	0501923734	O_RES_09
O_CON_10	Vilhemi Virta	vilhelmi.virta@raahenelainyhdistys.com	0453012340	O_RES_10
O_CON_11	Into Helminen	into.helminen@ylivieskanelainsuojelu.com	0409827323	O_RES_11
O_CON_12	Ralf Kotilainen	ralf.kotilainen@iinloytoelainkoti.com	0414327423	O_RES_12
O_CON_13	Tiitus Soro	tiitus.soro@juho-juhekinloytoelainkoti.com	0509828333	O_RES_13
O_CON_14	Hillevi Määttä	hillevi.maatta@kalajoenloytoelaintarha.com	0413747393	O_RES_14
O_CON_15	Ilma Toivanen	ilma.toivanen@lemmikki.vierashuone.com	0459628399	O_RES_15
O_CON_16	Aina Tuomioja	aina.tuomioja@kempleenelainyhdistys.com	0491827323	O_RES_16
O_CON_19	Lyydi Varis	lyydi.varis@suotella.com	0409429324	O_RES_19
O_CON_20	Lotta Lehti	lotta.lehti@kuivaniemenkoirahoitola.com	0406829351	O_RES_20
O_CON_17	Minja Inha	minja.inha@loytoelainkotimiau.com	0409022391	O_RES_17
O_CON_18	Milla Mattson	milla.mattson@pudasjarvenloytoelaimet.com	0402993729	O_RES_18
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                             4869.dat                                                                                            0000600 0004000 0002000 00000002062 14721044354 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_CUS_01	Olivia Smith	olivia.smith@gmail.com	0410239489
O_CUS_02	Josefina Laurenz	josefina.laurenz@email.com	0304192948
O_CUS_03	Alex Doe	alex.doe@email.com	0414292943
O_CUS_04	Julia Doe	julia.doe@email.com	0414254834
O_CUS_05	Laura Luumu	laura.luumu@email.com	0483244821
O_CUS_06	Pekka Puu	pekka.puu@gmail.com	0514394948
O_CUS_07	Antti Adoptoija	antti.adoptoija@gmail.com	0454272240
O_CUS_08	John Smith	john.smith@mail.com	0554329422
O_CUS_09	Pasi Doe	pasi.doe@email.com	0404291248
O_CUS_10	Patrik Poe	patrik.poe@email.com	0416234811
O_CUS_11	Alex Smith	alex.smith@email.com	0571192938
O_CUS_12	Nora Norms	nora.norms@email.com	0519294312
O_CUS_13	Robert Norms	robert.norms@gmail.com	0307792981
O_CUS_14	Joe Doe	joe.doe@email.com	0541343839
O_CUS_15	Jonna Dolz	jonna.dolz@email.com	0839488226
O_CUS_16	Sofia Solz	sofia.solz@email.com	0904392348
O_CUS_17	Jessica Rolz	jessica.rolz@email.com	0502132982
O_CUS_18	Monica Monzie	monica.monzie@email.com	0403322211
O_CUS_19	Oliver Plum	oliver.plum@email.com	0400092978
O_CUS_20	Tomas Tomson	Tomas.tomson@email.com	0643299821
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                              4872.dat                                                                                            0000600 0004000 0002000 00000001141 14721044354 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_DON_01	O_CUS_02	O_RES_01	5
O_DON_07	O_CUS_10	O_RES_10	10
O_DON_08	O_CUS_11	O_RES_09	5
O_DON_10	O_CUS_03	O_RES_03	10
O_DON_12	O_CUS_08	O_RES_16	20
O_DON_13	O_CUS_13	O_RES_13	30
O_DON_15	O_CUS_12	O_RES_17	10
O_DON_17	O_CUS_16	O_RES_19	10
O_DON_02	O_CUS_01	O_RES_02	150
O_DON_03	O_CUS_02	O_RES_03	50
O_DON_04	O_CUS_05	O_RES_04	100
O_DON_05	O_CUS_06	O_RES_05	200
O_DON_06	O_CUS_04	O_RES_08	80
O_DON_09	O_CUS_18	O_RES_06	20
O_DON_11	O_CUS_09	O_RES_14	50
O_DON_14	O_CUS_20	O_RES_03	50
O_DON_16	O_CUS_07	O_RES_07	100
O_DON_18	O_CUS_12	O_RES_05	150
O_DON_19	O_CUS_03	O_RES_15	100
O_DON_20	O_CUS_20	O_RES_19	30
\.


                                                                                                                                                                                                                                                                                                                                                                                                                               4870.dat                                                                                            0000600 0004000 0002000 00000002461 14721044354 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_RES_01	Oulun seudun eläinsuojeluyhdistys ry	Louhimontie 10, 90620 Oulu
O_RES_02	Popopet ry	Merimiehentie 13, 90520 Oulu
O_RES_03	Oulaisten seudun eläinsuojeluyhdistys ry	Kuntotie 9, 86300 Oulainen
O_RES_04	Kalajoen eläinyhdistys ry	Nuorapolku 13, 85100 Kalajoki
O_RES_05	Kalajoen löytöeläinkoti	Katajatie 3, 85100 Kalajoki
O_RES_06	Raahen löytöeläinkoti	Ouluntie 11, 92100 Raahe
O_RES_07	Ylivieskan seudun Eläinsuojeluyhdistys	Löytyntie 90, 84880 Ylivieska
O_RES_08	Kennel Mehtäapu	Honkarannantie 765, 86300 Oulainen
O_RES_09	Oulun Eläinkoti	Nikulantie 101, 90660 Oulu
O_RES_10	Raahenseudun Eläinsuojeluyhdistys	Merimiehenkatu 57, 92100 Raahe
O_RES_11	Ylivieskan Lemmikkieläinhoitola	Löytyntie 8, 84880 Ylivieska
O_RES_12	Iin Löytöeläinkoti	Liesharjuntie 8, 91100 Ii
O_RES_13	Kennel Juno-Juhekinin löytöeläinkoti	Puuperäntie 6, 90830 Haukipudas
O_RES_14	Jokiniemen kissahoitola	Leppiojantie 49, 91800 Tyrnävä
O_RES_15	Lemmikihoitola Vierashuone	Kurikkatie 11, 90440 Kempele
O_RES_16	Kempeleen Eläinsuojeluyhdistys	Jannenkuja 2, 90440 Kempele
O_RES_17	Löytöeläinkoti Miau	Kotiharjuntie 9, 90900 Oulu
O_RES_18	Pudasjärven Löytöeläimet ry	Rimmintie 19, 93100 Pudasjärvi
O_RES_19	Kennel Suotella	Orsikuja 7, 858800 Haapajärvi
O_RES_20	Kuivaniemen koirahoitola	Kuusistontie 15, 95100 Huttula
\.


                                                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000015072 14721044354 0015375 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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

DROP DATABASE "Oulun laani";
--
-- Name: Oulun laani; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Oulun laani" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';


ALTER DATABASE "Oulun laani" OWNER TO postgres;

\connect -reuse-previous=on "dbname='Oulun laani'"

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
COPY public.animals (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM '$$PATH$$/4871.dat';

--
-- Data for Name: contact_persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_persons (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
\.
COPY public.contact_persons (contact_person_id, contact_person, email, phone, rescue_center_id) FROM '$$PATH$$/4873.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, email, phone) FROM stdin;
\.
COPY public.customers (customer_id, customer_name, email, phone) FROM '$$PATH$$/4869.dat';

--
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
\.
COPY public.donations (donation_id, customer_id, rescue_center_id, amount) FROM '$$PATH$$/4872.dat';

--
-- Data for Name: rescue_centers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rescue_centers (rescue_center_id, rescue_center_name, center_location) FROM stdin;
\.
COPY public.rescue_centers (rescue_center_id, rescue_center_name, center_location) FROM '$$PATH$$/4870.dat';

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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      