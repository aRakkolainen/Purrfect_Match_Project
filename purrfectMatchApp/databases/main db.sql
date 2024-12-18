toc.dat                                                                                             0000600 0004000 0002000 00000106762 14725554065 0014470 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   5    ,        	        |            main db    17.0    17.0 g    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false         �           1262    33279    main db    DATABASE     ~   CREATE DATABASE "main db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';
    DROP DATABASE "main db";
                     postgres    false         �            1259    33325    animals    TABLE     G  CREATE TABLE public.animals (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
)
PARTITION BY RANGE (animal_id);
    DROP TABLE public.animals;
       public         p       postgres    false         �            1259    33344    Etelasuomen laanin animals    TABLE     =  CREATE TABLE public."Etelasuomen laanin animals" (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);
 0   DROP TABLE public."Etelasuomen laanin animals";
       public         heap r       postgres    false    221         �            1259    33374    contact_persons    TABLE       CREATE TABLE public.contact_persons (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
)
PARTITION BY RANGE (contact_person_id);
 #   DROP TABLE public.contact_persons;
       public         p       postgres    false         �            1259    33393 "   Etelasuomen laanin contact persons    TABLE       CREATE TABLE public."Etelasuomen laanin contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);
 8   DROP TABLE public."Etelasuomen laanin contact persons";
       public         heap r       postgres    false    225         �            1259    33425 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
)
PARTITION BY RANGE (customer_id);
    DROP TABLE public.customers;
       public         p       postgres    false         �            1259    33430    Etelasuomen laanin customers    TABLE     �   CREATE TABLE public."Etelasuomen laanin customers" (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);
 2   DROP TABLE public."Etelasuomen laanin customers";
       public         heap r       postgres    false    230         �            1259    33445 	   donations    TABLE     �   CREATE TABLE public.donations (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
)
PARTITION BY RANGE (donation_id);
    DROP TABLE public.donations;
       public         p       postgres    false         �            1259    33478    Etelasuomen laanin donations    TABLE     �   CREATE TABLE public."Etelasuomen laanin donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);
 2   DROP TABLE public."Etelasuomen laanin donations";
       public         heap r       postgres    false    234         �            1259    33280    rescue_centers    TABLE     �   CREATE TABLE public.rescue_centers (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
)
PARTITION BY RANGE (rescue_center_id);
 "   DROP TABLE public.rescue_centers;
       public         p       postgres    false         �            1259    33285 !   Etelasuomen laanin rescue centers    TABLE     �   CREATE TABLE public."Etelasuomen laanin rescue centers" (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);
 7   DROP TABLE public."Etelasuomen laanin rescue centers";
       public         heap r       postgres    false    217         �            1259    33354    Itasuomen laanin animals    TABLE     ;  CREATE TABLE public."Itasuomen laanin animals" (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);
 .   DROP TABLE public."Itasuomen laanin animals";
       public         heap r       postgres    false    221         �            1259    33401     Itasuomen laanin contact persons    TABLE       CREATE TABLE public."Itasuomen laanin contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);
 6   DROP TABLE public."Itasuomen laanin contact persons";
       public         heap r       postgres    false    225         �            1259    33435    Itasuomen laanin customers    TABLE     �   CREATE TABLE public."Itasuomen laanin customers" (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);
 0   DROP TABLE public."Itasuomen laanin customers";
       public         heap r       postgres    false    230         �            1259    33489    Itasuomen laanin donations    TABLE     �   CREATE TABLE public."Itasuomen laanin donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);
 0   DROP TABLE public."Itasuomen laanin donations";
       public         heap r       postgres    false    234         �            1259    33292    Itasuomen laanin rescue centers    TABLE     �   CREATE TABLE public."Itasuomen laanin rescue centers" (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);
 5   DROP TABLE public."Itasuomen laanin rescue centers";
       public         heap r       postgres    false    217         �            1259    33417     Kaikkien laanien contact persons    TABLE       CREATE TABLE public."Kaikkien laanien contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);
 6   DROP TABLE public."Kaikkien laanien contact persons";
       public         heap r       postgres    false    225         �            1259    33511    Kaikkien laanien donations    TABLE     �   CREATE TABLE public."Kaikkien laanien donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);
 0   DROP TABLE public."Kaikkien laanien donations";
       public         heap r       postgres    false    234         �            1259    33364    Oulun laanin animals    TABLE     7  CREATE TABLE public."Oulun laanin animals" (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);
 *   DROP TABLE public."Oulun laanin animals";
       public         heap r       postgres    false    221         �            1259    33409    Oulun laanin contact persons    TABLE     �   CREATE TABLE public."Oulun laanin contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);
 2   DROP TABLE public."Oulun laanin contact persons";
       public         heap r       postgres    false    225         �            1259    33440    Oulun laanin customers    TABLE     �   CREATE TABLE public."Oulun laanin customers" (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);
 ,   DROP TABLE public."Oulun laanin customers";
       public         heap r       postgres    false    230         �            1259    33500    Oulun laanin donations    TABLE     �   CREATE TABLE public."Oulun laanin donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);
 ,   DROP TABLE public."Oulun laanin donations";
       public         heap r       postgres    false    234         �            1259    33299    Oulun laanin rescue centers    TABLE     �   CREATE TABLE public."Oulun laanin rescue centers" (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);
 1   DROP TABLE public."Oulun laanin rescue centers";
       public         heap r       postgres    false    217         �           0    0    Etelasuomen laanin animals    TABLE ATTACH     �   ALTER TABLE ONLY public.animals ATTACH PARTITION public."Etelasuomen laanin animals" FOR VALUES FROM ('E_ANI_01') TO ('E_ANI_30');
          public               postgres    false    222    221         �           0    0 "   Etelasuomen laanin contact persons    TABLE ATTACH     �   ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Etelasuomen laanin contact persons" FOR VALUES FROM ('E_CON_01') TO ('E_CON_30');
          public               postgres    false    226    225         �           0    0    Etelasuomen laanin customers    TABLE ATTACH     �   ALTER TABLE ONLY public.customers ATTACH PARTITION public."Etelasuomen laanin customers" FOR VALUES FROM ('E_CUS_01') TO ('E_CUS_35');
          public               postgres    false    231    230         �           0    0    Etelasuomen laanin donations    TABLE ATTACH     �   ALTER TABLE ONLY public.donations ATTACH PARTITION public."Etelasuomen laanin donations" FOR VALUES FROM ('E_DON_01') TO ('E_DON_35');
          public               postgres    false    235    234         �           0    0 !   Etelasuomen laanin rescue centers    TABLE ATTACH     �   ALTER TABLE ONLY public.rescue_centers ATTACH PARTITION public."Etelasuomen laanin rescue centers" FOR VALUES FROM ('E_RES_01') TO ('E_RES_25');
          public               postgres    false    218    217         �           0    0    Itasuomen laanin animals    TABLE ATTACH     �   ALTER TABLE ONLY public.animals ATTACH PARTITION public."Itasuomen laanin animals" FOR VALUES FROM ('I_ANI_01') TO ('I_ANI_30');
          public               postgres    false    223    221         �           0    0     Itasuomen laanin contact persons    TABLE ATTACH     �   ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Itasuomen laanin contact persons" FOR VALUES FROM ('I_CON_01') TO ('I_CON_30');
          public               postgres    false    227    225         �           0    0    Itasuomen laanin customers    TABLE ATTACH     �   ALTER TABLE ONLY public.customers ATTACH PARTITION public."Itasuomen laanin customers" FOR VALUES FROM ('I_CUS_01') TO ('I_CUS_35');
          public               postgres    false    232    230         �           0    0    Itasuomen laanin donations    TABLE ATTACH     �   ALTER TABLE ONLY public.donations ATTACH PARTITION public."Itasuomen laanin donations" FOR VALUES FROM ('I_DON_01') TO ('I_DON_35');
          public               postgres    false    236    234         �           0    0    Itasuomen laanin rescue centers    TABLE ATTACH     �   ALTER TABLE ONLY public.rescue_centers ATTACH PARTITION public."Itasuomen laanin rescue centers" FOR VALUES FROM ('I_RES_01') TO ('I_RES_25');
          public               postgres    false    219    217         �           0    0     Kaikkien laanien contact persons    TABLE ATTACH     l   ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Kaikkien laanien contact persons" DEFAULT;
          public               postgres    false    229    225         �           0    0    Kaikkien laanien donations    TABLE ATTACH     `   ALTER TABLE ONLY public.donations ATTACH PARTITION public."Kaikkien laanien donations" DEFAULT;
          public               postgres    false    238    234         �           0    0    Oulun laanin animals    TABLE ATTACH     }   ALTER TABLE ONLY public.animals ATTACH PARTITION public."Oulun laanin animals" FOR VALUES FROM ('O_ANI_01') TO ('O_ANI_30');
          public               postgres    false    224    221         �           0    0    Oulun laanin contact persons    TABLE ATTACH     �   ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Oulun laanin contact persons" FOR VALUES FROM ('O_CON_01') TO ('O_CON_30');
          public               postgres    false    228    225         �           0    0    Oulun laanin customers    TABLE ATTACH     �   ALTER TABLE ONLY public.customers ATTACH PARTITION public."Oulun laanin customers" FOR VALUES FROM ('O_CUS_01') TO ('O_CUS_35');
          public               postgres    false    233    230         �           0    0    Oulun laanin donations    TABLE ATTACH     �   ALTER TABLE ONLY public.donations ATTACH PARTITION public."Oulun laanin donations" FOR VALUES FROM ('O_DON_01') TO ('O_DON_35');
          public               postgres    false    237    234         �           0    0    Oulun laanin rescue centers    TABLE ATTACH     �   ALTER TABLE ONLY public.rescue_centers ATTACH PARTITION public."Oulun laanin rescue centers" FOR VALUES FROM ('O_RES_01') TO ('O_RES_25');
          public               postgres    false    220    217         �          0    33344    Etelasuomen laanin animals 
   TABLE DATA           �   COPY public."Etelasuomen laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
    public               postgres    false    222       5008.dat �          0    33393 "   Etelasuomen laanin contact persons 
   TABLE DATA           �   COPY public."Etelasuomen laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
    public               postgres    false    226       5011.dat �          0    33430    Etelasuomen laanin customers 
   TABLE DATA           b   COPY public."Etelasuomen laanin customers" (customer_id, customer_name, email, phone) FROM stdin;
    public               postgres    false    231       5015.dat �          0    33478    Etelasuomen laanin donations 
   TABLE DATA           l   COPY public."Etelasuomen laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
    public               postgres    false    235       5018.dat �          0    33285 !   Etelasuomen laanin rescue centers 
   TABLE DATA           t   COPY public."Etelasuomen laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM stdin;
    public               postgres    false    218       5005.dat �          0    33354    Itasuomen laanin animals 
   TABLE DATA           �   COPY public."Itasuomen laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
    public               postgres    false    223       5009.dat �          0    33401     Itasuomen laanin contact persons 
   TABLE DATA              COPY public."Itasuomen laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
    public               postgres    false    227       5012.dat �          0    33435    Itasuomen laanin customers 
   TABLE DATA           `   COPY public."Itasuomen laanin customers" (customer_id, customer_name, email, phone) FROM stdin;
    public               postgres    false    232       5016.dat �          0    33489    Itasuomen laanin donations 
   TABLE DATA           j   COPY public."Itasuomen laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
    public               postgres    false    236       5019.dat �          0    33292    Itasuomen laanin rescue centers 
   TABLE DATA           r   COPY public."Itasuomen laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM stdin;
    public               postgres    false    219       5006.dat �          0    33417     Kaikkien laanien contact persons 
   TABLE DATA              COPY public."Kaikkien laanien contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
    public               postgres    false    229       5014.dat �          0    33511    Kaikkien laanien donations 
   TABLE DATA           j   COPY public."Kaikkien laanien donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
    public               postgres    false    238       5021.dat �          0    33364    Oulun laanin animals 
   TABLE DATA           �   COPY public."Oulun laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
    public               postgres    false    224       5010.dat �          0    33409    Oulun laanin contact persons 
   TABLE DATA           {   COPY public."Oulun laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
    public               postgres    false    228       5013.dat �          0    33440    Oulun laanin customers 
   TABLE DATA           \   COPY public."Oulun laanin customers" (customer_id, customer_name, email, phone) FROM stdin;
    public               postgres    false    233       5017.dat �          0    33500    Oulun laanin donations 
   TABLE DATA           f   COPY public."Oulun laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
    public               postgres    false    237       5020.dat �          0    33299    Oulun laanin rescue centers 
   TABLE DATA           n   COPY public."Oulun laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM stdin;
    public               postgres    false    220       5007.dat �           2606    33329    animals animals_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public                 postgres    false    221         �           2606    33348 9   Etelasuomen laanin animals Etelasuomen laani elaimet_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Etelasuomen laanin animals"
    ADD CONSTRAINT "Etelasuomen laani elaimet_pkey" PRIMARY KEY (animal_id);
 g   ALTER TABLE ONLY public."Etelasuomen laanin animals" DROP CONSTRAINT "Etelasuomen laani elaimet_pkey";
       public                 postgres    false    4804    222    222         �           2606    33284 "   rescue_centers rescue_centers_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.rescue_centers
    ADD CONSTRAINT rescue_centers_pkey PRIMARY KEY (rescue_center_id);
 L   ALTER TABLE ONLY public.rescue_centers DROP CONSTRAINT rescue_centers_pkey;
       public                 postgres    false    217         �           2606    33289 8   Etelasuomen laanin rescue centers Etelasuomen laani_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Etelasuomen laanin rescue centers"
    ADD CONSTRAINT "Etelasuomen laani_pkey" PRIMARY KEY (rescue_center_id);
 f   ALTER TABLE ONLY public."Etelasuomen laanin rescue centers" DROP CONSTRAINT "Etelasuomen laani_pkey";
       public                 postgres    false    4796    218    218         �           2606    33378 $   contact_persons contact_persons_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT contact_persons_pkey PRIMARY KEY (contact_person_id);
 N   ALTER TABLE ONLY public.contact_persons DROP CONSTRAINT contact_persons_pkey;
       public                 postgres    false    225         �           2606    33397 J   Etelasuomen laanin contact persons Etelasuomen laanin contact persons_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Etelasuomen laanin contact persons"
    ADD CONSTRAINT "Etelasuomen laanin contact persons_pkey" PRIMARY KEY (contact_person_id);
 x   ALTER TABLE ONLY public."Etelasuomen laanin contact persons" DROP CONSTRAINT "Etelasuomen laanin contact persons_pkey";
       public                 postgres    false    226    226    4812         �           2606    33429    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    230         �           2606    33434 >   Etelasuomen laanin customers Etelasuomen laanin customers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Etelasuomen laanin customers"
    ADD CONSTRAINT "Etelasuomen laanin customers_pkey" PRIMARY KEY (customer_id);
 l   ALTER TABLE ONLY public."Etelasuomen laanin customers" DROP CONSTRAINT "Etelasuomen laanin customers_pkey";
       public                 postgres    false    231    4822    231         �           2606    33449    donations donations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donation_id);
 B   ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_pkey;
       public                 postgres    false    234         �           2606    33482 >   Etelasuomen laanin donations Etelasuomen laanin donations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Etelasuomen laanin donations"
    ADD CONSTRAINT "Etelasuomen laanin donations_pkey" PRIMARY KEY (donation_id);
 l   ALTER TABLE ONLY public."Etelasuomen laanin donations" DROP CONSTRAINT "Etelasuomen laanin donations_pkey";
       public                 postgres    false    235    4830    235         �           2606    33358 5   Itasuomen laanin animals Itasuomen laani elaimet_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Itasuomen laanin animals"
    ADD CONSTRAINT "Itasuomen laani elaimet_pkey" PRIMARY KEY (animal_id);
 c   ALTER TABLE ONLY public."Itasuomen laanin animals" DROP CONSTRAINT "Itasuomen laani elaimet_pkey";
       public                 postgres    false    223    223    4804         �           2606    33296 4   Itasuomen laanin rescue centers Itasuomen laani_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Itasuomen laanin rescue centers"
    ADD CONSTRAINT "Itasuomen laani_pkey" PRIMARY KEY (rescue_center_id);
 b   ALTER TABLE ONLY public."Itasuomen laanin rescue centers" DROP CONSTRAINT "Itasuomen laani_pkey";
       public                 postgres    false    219    219    4796         �           2606    33405 F   Itasuomen laanin contact persons Itasuomen laanin contact persons_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Itasuomen laanin contact persons"
    ADD CONSTRAINT "Itasuomen laanin contact persons_pkey" PRIMARY KEY (contact_person_id);
 t   ALTER TABLE ONLY public."Itasuomen laanin contact persons" DROP CONSTRAINT "Itasuomen laanin contact persons_pkey";
       public                 postgres    false    4812    227    227         �           2606    33439 :   Itasuomen laanin customers Itasuomen laanin customers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Itasuomen laanin customers"
    ADD CONSTRAINT "Itasuomen laanin customers_pkey" PRIMARY KEY (customer_id);
 h   ALTER TABLE ONLY public."Itasuomen laanin customers" DROP CONSTRAINT "Itasuomen laanin customers_pkey";
       public                 postgres    false    4822    232    232         �           2606    33493 :   Itasuomen laanin donations Itasuomen laanin donations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Itasuomen laanin donations"
    ADD CONSTRAINT "Itasuomen laanin donations_pkey" PRIMARY KEY (donation_id);
 h   ALTER TABLE ONLY public."Itasuomen laanin donations" DROP CONSTRAINT "Itasuomen laanin donations_pkey";
       public                 postgres    false    236    4830    236         �           2606    33421 3   Kaikkien laanien contact persons Kaikki laanit_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Kaikkien laanien contact persons"
    ADD CONSTRAINT "Kaikki laanit_pkey" PRIMARY KEY (contact_person_id);
 a   ALTER TABLE ONLY public."Kaikkien laanien contact persons" DROP CONSTRAINT "Kaikki laanit_pkey";
       public                 postgres    false    229    229    4812         �           2606    33368 -   Oulun laanin animals Oulun laani elaimet_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."Oulun laanin animals"
    ADD CONSTRAINT "Oulun laani elaimet_pkey" PRIMARY KEY (animal_id);
 [   ALTER TABLE ONLY public."Oulun laanin animals" DROP CONSTRAINT "Oulun laani elaimet_pkey";
       public                 postgres    false    224    224    4804         �           2606    33303 ,   Oulun laanin rescue centers Oulun laani_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."Oulun laanin rescue centers"
    ADD CONSTRAINT "Oulun laani_pkey" PRIMARY KEY (rescue_center_id);
 Z   ALTER TABLE ONLY public."Oulun laanin rescue centers" DROP CONSTRAINT "Oulun laani_pkey";
       public                 postgres    false    220    220    4796         �           2606    33413 >   Oulun laanin contact persons Oulun laanin contact persons_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Oulun laanin contact persons"
    ADD CONSTRAINT "Oulun laanin contact persons_pkey" PRIMARY KEY (contact_person_id);
 l   ALTER TABLE ONLY public."Oulun laanin contact persons" DROP CONSTRAINT "Oulun laanin contact persons_pkey";
       public                 postgres    false    228    4812    228         �           2606    33444 2   Oulun laanin customers Oulun laanin customers_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."Oulun laanin customers"
    ADD CONSTRAINT "Oulun laanin customers_pkey" PRIMARY KEY (customer_id);
 `   ALTER TABLE ONLY public."Oulun laanin customers" DROP CONSTRAINT "Oulun laanin customers_pkey";
       public                 postgres    false    4822    233    233         �           2606    33504 2   Oulun laanin donations Oulun laanin donations_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."Oulun laanin donations"
    ADD CONSTRAINT "Oulun laanin donations_pkey" PRIMARY KEY (donation_id);
 `   ALTER TABLE ONLY public."Oulun laanin donations" DROP CONSTRAINT "Oulun laanin donations_pkey";
       public                 postgres    false    4830    237    237         �           2606    33515 -   Kaikkien laanien donations kaikki laanit_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Kaikkien laanien donations"
    ADD CONSTRAINT "kaikki laanit_pkey" PRIMARY KEY (donation_id);
 [   ALTER TABLE ONLY public."Kaikkien laanien donations" DROP CONSTRAINT "kaikki laanit_pkey";
       public                 postgres    false    238    238    4830         �           0    0    Etelasuomen laani elaimet_pkey    INDEX ATTACH     Z   ALTER INDEX public.animals_pkey ATTACH PARTITION public."Etelasuomen laani elaimet_pkey";
          public               postgres    false    4806    4804    222    4804    222    221         �           0    0    Etelasuomen laani_pkey    INDEX ATTACH     Y   ALTER INDEX public.rescue_centers_pkey ATTACH PARTITION public."Etelasuomen laani_pkey";
          public               postgres    false    4796    4798    218    4796    218    217         �           0    0 '   Etelasuomen laanin contact persons_pkey    INDEX ATTACH     k   ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Etelasuomen laanin contact persons_pkey";
          public               postgres    false    226    4814    4812    4812    226    225         �           0    0 !   Etelasuomen laanin customers_pkey    INDEX ATTACH     _   ALTER INDEX public.customers_pkey ATTACH PARTITION public."Etelasuomen laanin customers_pkey";
          public               postgres    false    4824    4822    231    4822    231    230         �           0    0 !   Etelasuomen laanin donations_pkey    INDEX ATTACH     _   ALTER INDEX public.donations_pkey ATTACH PARTITION public."Etelasuomen laanin donations_pkey";
          public               postgres    false    235    4832    4830    4830    235    234         �           0    0    Itasuomen laani elaimet_pkey    INDEX ATTACH     X   ALTER INDEX public.animals_pkey ATTACH PARTITION public."Itasuomen laani elaimet_pkey";
          public               postgres    false    223    4804    4808    4804    223    221         �           0    0    Itasuomen laani_pkey    INDEX ATTACH     W   ALTER INDEX public.rescue_centers_pkey ATTACH PARTITION public."Itasuomen laani_pkey";
          public               postgres    false    219    4800    4796    4796    219    217         �           0    0 %   Itasuomen laanin contact persons_pkey    INDEX ATTACH     i   ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Itasuomen laanin contact persons_pkey";
          public               postgres    false    4812    227    4816    4812    227    225         �           0    0    Itasuomen laanin customers_pkey    INDEX ATTACH     ]   ALTER INDEX public.customers_pkey ATTACH PARTITION public."Itasuomen laanin customers_pkey";
          public               postgres    false    232    4822    4826    4822    232    230         �           0    0    Itasuomen laanin donations_pkey    INDEX ATTACH     ]   ALTER INDEX public.donations_pkey ATTACH PARTITION public."Itasuomen laanin donations_pkey";
          public               postgres    false    236    4830    4834    4830    236    234         �           0    0    Kaikki laanit_pkey    INDEX ATTACH     V   ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Kaikki laanit_pkey";
          public               postgres    false    229    4812    4820    4812    229    225         �           0    0    Oulun laani elaimet_pkey    INDEX ATTACH     T   ALTER INDEX public.animals_pkey ATTACH PARTITION public."Oulun laani elaimet_pkey";
          public               postgres    false    4810    224    4804    4804    224    221         �           0    0    Oulun laani_pkey    INDEX ATTACH     S   ALTER INDEX public.rescue_centers_pkey ATTACH PARTITION public."Oulun laani_pkey";
          public               postgres    false    220    4802    4796    4796    220    217         �           0    0 !   Oulun laanin contact persons_pkey    INDEX ATTACH     e   ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Oulun laanin contact persons_pkey";
          public               postgres    false    4818    4812    228    4812    228    225         �           0    0    Oulun laanin customers_pkey    INDEX ATTACH     Y   ALTER INDEX public.customers_pkey ATTACH PARTITION public."Oulun laanin customers_pkey";
          public               postgres    false    4828    4822    233    4822    233    230         �           0    0    Oulun laanin donations_pkey    INDEX ATTACH     Y   ALTER INDEX public.donations_pkey ATTACH PARTITION public."Oulun laanin donations_pkey";
          public               postgres    false    4830    4836    237    4830    237    234         �           0    0    kaikki laanit_pkey    INDEX ATTACH     P   ALTER INDEX public.donations_pkey ATTACH PARTITION public."kaikki laanit_pkey";
          public               postgres    false    238    4830    4838    4830    238    234         �           2606    33450    donations fk_customer    FK CONSTRAINT     �   ALTER TABLE public.donations
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 :   ALTER TABLE public.donations DROP CONSTRAINT fk_customer;
       public               postgres    false    4849    4850    4851    230    4822    234         �           2606    33330    animals fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE public.animals
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 =   ALTER TABLE public.animals DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    4839    4840    4841    4796    217    221         �           2606    33379     contact_persons fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE public.contact_persons
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 E   ALTER TABLE public.contact_persons DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    4839    4840    4841    225    217    4796         �           2606    33464    donations fk_rescue_center    FK CONSTRAINT     �   ALTER TABLE public.donations
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);
 ?   ALTER TABLE public.donations DROP CONSTRAINT fk_rescue_center;
       public               postgres    false    4839    4840    4841    4796    217    234                      5008.dat                                                                                            0000600 0004000 0002000 00000007260 14725554065 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_ANI_01	cat	Aba	Aba is a young, playful kitten who loves to explore her surroundings.	1	Aba would thrive in a quiet home with plenty of toys. Ideal for a household without other cats.	E_RES_02
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


                                                                                                                                                                                                                                                                                                                                                5011.dat                                                                                            0000600 0004000 0002000 00000002563 14725554065 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_CON_01	Jouko Lääperi	joukoHel@gmail.com	0505548879     	E_RES_01
E_CON_02	Mikael Peltola	mikaelLem@gmail.com	0456658543     	E_RES_02
E_CON_03	Jyrki Seinä	jyrkiMan@gmail.com	0407852014     	E_RES_03
E_CON_04	Hanna Saari	hannaKer@gmail.com	0504898987     	E_RES_04
E_CON_05	Tarja Storm	tarjaKark@gmail.com	0406544560     	E_RES_05
E_CON_06	Vesa Sutinen	vesaLoh@gmail.com	0507989874     	E_RES_06
E_CON_07	Annikki Lehti	annikkiIit@gmail.com	0407630364     	E_RES_07
E_CON_08	Kaarina Hurme	kaarinaHol@gmail.com	0504712054     	E_RES_08
E_CON_09	Emilia Reitti	emiliaLah@gmail.com	0459865267     	E_RES_09
E_CON_10	Ilona Vaaka	ilonaEs@gmail.com	0456369563     	E_RES_10
E_CON_11	Inka Pasma	jinkaHei@gmail.com	0507895874     	E_RES_11
E_CON_12	Pinja Jaara	pinjaOri@gmail.com	0409635410     	E_RES_12
E_CON_13	Eeva Hakala	eevaHam@gmail.com	0504561287     	E_RES_13
E_CON_14	Mari Saimaa	mariHyv@gmail.com	0450254681     	E_RES_14
E_CON_15	Lotta Valjus	lottaPer@gmail.com	04565438520    	E_RES_15
E_CON_16	Amalia Läätilä	amaliaMyrs@gmail.com	0457841064     	E_RES_16
E_CON_17	Helena Odd	helenaRuo@gmail.com	0500302154     	E_RES_17
E_CON_18	Elmer Matero	elmerPyh@gmail.com	0451542364     	E_RES_18
E_CON_19	Amanda Klasi	amandaTam@gmail.com	05078920546    	E_RES_19
E_CON_20	Anton Lumi	antonSip@gmail.com	04545210574    	E_RES_20
E_CON_21	Aune Akku	aunePad@gmail.com	0454510257     	E_RES_21
\.


                                                                                                                                             5015.dat                                                                                            0000600 0004000 0002000 00000002125 14725554065 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_CUS_01	Juho Inkinen	juho@gmail.com	0506849753
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


                                                                                                                                                                                                                                                                                                                                                                                                                                           5018.dat                                                                                            0000600 0004000 0002000 00000001235 14725554065 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_DON_01	E_CUS_16	E_RES_16	100
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


                                                                                                                                                                                                                                                                                                                                                                   5005.dat                                                                                            0000600 0004000 0002000 00000002563 14725554065 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        E_RES_01	Helsingin eläinsuojelu ry	Käpyläntie 11, 00600 Helsinki
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


                                                                                                                                             5009.dat                                                                                            0000600 0004000 0002000 00000005067 14725554065 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_ANI_01	Cat	Mirri	A playful and affectionate cat who loves human company.	4	Requires daily playtime and a cozy sleeping spot.	I_RES_11
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                         5012.dat                                                                                            0000600 0004000 0002000 00000002771 14725554065 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_CON_01	Lennart Ruotsalainen	ruotsalainen.kalla@email.com	0404892770     	I_RES_01
I_CON_02	Roope HarmaaJärvi	harmaajarvi.Pakka@email.com	0400557892     	I_RES_02
I_CON_03	Hanna Mäkelä	makela.kiuruvesi@email.com	0502286673     	I_RES_03
I_CON_04	Marika Turunen	turunen.joensuu.email.com	0500421996     	I_RES_04
I_CON_05	Elena Aaltonen	aaltonen.ESY@email.com	0409893761     	I_RES_05
I_CON_06	Marko Laaksonen	laaksonen.sepsis@email.com	0509342780     	I_RES_06
I_CON_07	Jaana Jokinen	jokinen.vehka@email.com	0400767891     	I_RES_07
I_CON_08	Oliver Vanhanen	vanhanen.mikkeli@email.com	0508003120     	I_RES_08
I_CON_09	Tatu Ruoho	ruoho.varkaus@email.com	0509928921     	I_RES_09
I_CON_10	Liina Martikainen	martikainen.pieksemaki@email.com	0500789123     	I_RES_10
I_CON_11	Mari Tähtinen	tahtinen.Lieksa@email.com	0400989091     	I_RES_11
I_CON_12	Saana Nurmi	nurmi.outokumpu@email.com	0409753108     	I_RES_12
I_CON_13	Olavi Rautio	rautio.liperi@email.com	0500933661     	I_RES_13
I_CON_14	Ilmari Pekkanen	pekkanen.miukula@email.com	0503451234     	I_RES_14
I_CON_15	Sonja Laine	laine.savonlinna@email.com	0400658923     	I_RES_15
I_CON_16	Hilla Karjalainen	karjalainen.Iloset@email.com	0504512548     	I_RES_16
I_CON_17	Valto Salminen	salminen.kekale@email.com	0408522341     	I_RES_17
I_CON_18	Hellä Hämäläinen	hamalainen.tassula@email.com	0400989444     	I_RES_18
I_CON_19	Topi Lehtinen	lehtinen.kontionlahti@email.com	0504530902     	I_RES_19
I_CON_20	Inka Nikula	nikula.juva@email.com	0405379001     	I_RES_20
\.


       5016.dat                                                                                            0000600 0004000 0002000 00000002027 14725554065 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_CUS_01	Benjamin Mäkelä	makela@email.com	0403872901
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         5019.dat                                                                                            0000600 0004000 0002000 00000001143 14725554065 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_DON_01	I_CUS_06	I_RES_01	100
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


                                                                                                                                                                                                                                                                                                                                                                                                                             5006.dat                                                                                            0000600 0004000 0002000 00000002425 14725554065 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        I_RES_01	Kallan eläinsuojelu Ry	Savilahdentie 10, 70150 Kuopio
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


                                                                                                                                                                                                                                           5014.dat                                                                                            0000600 0004000 0002000 00000000005 14725554065 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5021.dat                                                                                            0000600 0004000 0002000 00000000005 14725554065 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5010.dat                                                                                            0000600 0004000 0002000 00000006551 14725554065 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_ANI_01	dog	June	June is a puppy who is social and active	1	Prefers home where are already other pets to play with or active owners who have time to play and walk with them	O_RES_01
O_ANI_02	cat	Milo	Milo is a bit shy cat who prefers alone time and having places to hide	5	Prefers a quiet environment with no other pets or young chilren	O_RES_12
O_ANI_03	cat	Penny	Penny is older cat lady who enjoys quiet home but enjoys sometimes cuddles too	7	A quiet home with no other pets	O_RES_11
O_ANI_04	cat	Sulo	Sulo is a senior cat who enjoys both alone time and being social with humans and other cats	8	Quiet home with other cat friends for Sulo because Sulo likes having company	O_RES_02
O_ANI_05	cat	Delia	Delia is older cat lady who might be at first bit shy and likes to smell the fresh air	5	Home should have at least balcony where Delia can safely visit to look at outdoors	O_RES_02
O_ANI_06	bunny	Risto Reipas	Risto Reipas is really friendly bunny who enjoys cuddles and playing together	5	Home where owner has a lot of time to cuddle, play and give treats	O_RES_01
O_ANI_07	dog	Rocky	Rocky is active dog who enjoy playing with toys and long walks	2	Home where the owner has a lot of time for playing and long walks	O_RES_04
O_ANI_08	bunny	Heinä	Heinä is active bunny who likes to explore	5	Only pet, big fenced area and a lot of fresh vegetables	O_RES_17
O_ANI_09	dog	Yoda	Yoda is active and energetic puppy who likes playing with anybody	2	Active household, a lot of toys, preferably dog friends	O_RES_03
O_ANI_10	dog	April	April is an energetic puppy who likes playing with anybody	2	Active household, a lot of toys, preferably dog friends	O_RES_05
O_ANI_11	dog	Ruby	April is a friendly dog who likes playing, long walks and a lot of cuddles	2	Active household with a lot of time for walks	O_RES_06
O_ANI_12	bunny	Pete	A friendly bunny who likes cuddles and fresh vegetables	3	Not much special requirements, just always fresh vegetables available	O_RES_07
O_ANI_13	cat	Caesar	Caesar is older cat sir who likes alone time and looking at birds outside	8	Home with no other pets	O_RES_08
O_ANI_14	dog	Hugo	Hugo is older dog who still enjoys walks and cuddles but not that much playing	8	Forever home with no other pets because Hugo likes silence	O_RES_08
O_ANI_15	dog	Nemo	Nemo is a blind dog but still active and likes exploring places	3	Calm household and place where it is easy to navigate places, person with previous experience of having blind pets	O_RES_09
O_ANI_16	cat	Toto	Toto likes exploring places alone	4	Home with a lot of places to explore	O_RES_10
O_ANI_17	cat	Ellie	Ellie likes hanging out with other pets and is really social	4	Home with a few other cats/pets	O_RES_13
O_ANI_18	cat	Nellie	Nellie likes hanging out with other pets and is really social	4	Home with other pets	O_RES_14
O_ANI_19	dog	Waldo	Likes playing with toys and likes also hide	1	Places to hide and explore	O_RES_15
O_ANI_20	dog	Olivia	Likes playing with toys and long walks	5	Active and outdoor type owner	O_RES_16
O_ANI_21	bunny	Kosmo	Likes playing with toys and getting a lot of treats	2	Owner who has time to play and cuddle with Kosmo or other bunny friends but no children	O_RES_18
O_ANI_22	bunny	Belle	Likes playing with toys and other bunnies and getting a lot of treats	3	Home with other bunny friends but no children	O_RES_19
O_ANI_23	cat	Greta	A bit older cat lady who prefers cuddles but also alone time	9	Calm home	O_RES_20
\.


                                                                                                                                                       5013.dat                                                                                            0000600 0004000 0002000 00000003267 14725554065 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_CON_01	Laimi Koivu	laimi.koivu@oulunseudunelainyhdistys.com	0402912331     	O_RES_01
O_CON_02	Brian Kottarainen	brian.kottarainen@yhdistys_popopet.com	0402393418     	O_RES_02
O_CON_03	Julius Tammi	julius.tammi@oulaistenelainyhdistys.com	0509318481     	O_RES_03
O_CON_04	Leo Inha	leo.inha@kalajoenelainyhdistys.com	0403912942     	O_RES_04
O_CON_05	Aura Laakso	aura.laakso@kalajoenloytoelainkoti.com	0549295729     	O_RES_05
O_CON_06	Selja Pihlaja	selja.pihlaja@raahenloytoelainkoti.com	0582293324     	O_RES_06
O_CON_07	Olga Kaila	olga.kaila@ylivieskanelainyhdistys.com	0410021983     	O_RES_07
O_CON_08	Julia Järvi	julia.jarvi@kennelmehta-apu.com	0304012834     	O_RES_08
O_CON_09	Taru Kottarainen	taru.kottarainen@oulunelainkoti.com	0501923734     	O_RES_09
O_CON_10	Vilhemi Virta	vilhelmi.virta@raahenelainyhdistys.com	0453012340     	O_RES_10
O_CON_11	Into Helminen	into.helminen@ylivieskanelainsuojelu.com	0409827323     	O_RES_11
O_CON_12	Ralf Kotilainen	ralf.kotilainen@iinloytoelainkoti.com	0414327423     	O_RES_12
O_CON_13	Tiitus Soro	tiitus.soro@juho-juhekinloytoelainkoti.com	0509828333     	O_RES_13
O_CON_14	Hillevi Määttä	hillevi.maatta@kalajoenloytoelaintarha.com	0413747393     	O_RES_14
O_CON_15	Ilma Toivanen	ilma.toivanen@lemmikki.vierashuone.com	0459628399     	O_RES_15
O_CON_16	Aina Tuomioja	aina.tuomioja@kempleenelainyhdistys.com	0491827323     	O_RES_16
O_CON_17	Minja Inha	minja.inha@loytoelainkotimiau.com	0409022391     	O_RES_17
O_CON_18	Milla Mattson	milla.mattson@pudasjarvenloytoelaimet.com	0402993729     	O_RES_18
O_CON_19	Lyydi Varis	lyydi.varis@suotella.com	0409429324     	O_RES_19
O_CON_20	Lotta Lehti	lotta.lehti@kuivaniemenkoirahoitola.com	0406829351     	O_RES_20
\.


                                                                                                                                                                                                                                                                                                                                         5017.dat                                                                                            0000600 0004000 0002000 00000002062 14725554065 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_CUS_01	Olivia Smith	olivia.smith@gmail.com	0410239489
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                              5020.dat                                                                                            0000600 0004000 0002000 00000001141 14725554065 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_DON_01	O_CUS_02	O_RES_01	5
O_DON_02	O_CUS_01	O_RES_02	150
O_DON_03	O_CUS_02	O_RES_03	50
O_DON_04	O_CUS_05	O_RES_04	100
O_DON_05	O_CUS_06	O_RES_05	200
O_DON_06	O_CUS_04	O_RES_08	80
O_DON_07	O_CUS_10	O_RES_10	10
O_DON_08	O_CUS_11	O_RES_09	5
O_DON_09	O_CUS_18	O_RES_06	20
O_DON_10	O_CUS_03	O_RES_03	10
O_DON_11	O_CUS_09	O_RES_14	50
O_DON_12	O_CUS_08	O_RES_16	20
O_DON_13	O_CUS_13	O_RES_13	30
O_DON_14	O_CUS_20	O_RES_03	50
O_DON_15	O_CUS_12	O_RES_17	10
O_DON_16	O_CUS_07	O_RES_07	100
O_DON_17	O_CUS_16	O_RES_19	10
O_DON_18	O_CUS_12	O_RES_05	150
O_DON_19	O_CUS_03	O_RES_15	100
O_DON_20	O_CUS_20	O_RES_19	30
\.


                                                                                                                                                                                                                                                                                                                                                                                                                               5007.dat                                                                                            0000600 0004000 0002000 00000002461 14725554065 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        O_RES_01	Oulun seudun eläinsuojeluyhdistys ry	Louhimontie 10, 90620 Oulu
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


                                                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000072054 14725554065 0015411 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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

DROP DATABASE "main db";
--
-- Name: main db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "main db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';


ALTER DATABASE "main db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='main db'"

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
)
PARTITION BY RANGE (animal_id);


ALTER TABLE public.animals OWNER TO postgres;

SET default_table_access_method = heap;

--
-- Name: Etelasuomen laanin animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Etelasuomen laanin animals" (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);


ALTER TABLE public."Etelasuomen laanin animals" OWNER TO postgres;

--
-- Name: contact_persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_persons (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
)
PARTITION BY RANGE (contact_person_id);


ALTER TABLE public.contact_persons OWNER TO postgres;

--
-- Name: Etelasuomen laanin contact persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Etelasuomen laanin contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);


ALTER TABLE public."Etelasuomen laanin contact persons" OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
)
PARTITION BY RANGE (customer_id);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: Etelasuomen laanin customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Etelasuomen laanin customers" (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);


ALTER TABLE public."Etelasuomen laanin customers" OWNER TO postgres;

--
-- Name: donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
)
PARTITION BY RANGE (donation_id);


ALTER TABLE public.donations OWNER TO postgres;

--
-- Name: Etelasuomen laanin donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Etelasuomen laanin donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);


ALTER TABLE public."Etelasuomen laanin donations" OWNER TO postgres;

--
-- Name: rescue_centers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rescue_centers (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
)
PARTITION BY RANGE (rescue_center_id);


ALTER TABLE public.rescue_centers OWNER TO postgres;

--
-- Name: Etelasuomen laanin rescue centers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Etelasuomen laanin rescue centers" (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);


ALTER TABLE public."Etelasuomen laanin rescue centers" OWNER TO postgres;

--
-- Name: Itasuomen laanin animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Itasuomen laanin animals" (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);


ALTER TABLE public."Itasuomen laanin animals" OWNER TO postgres;

--
-- Name: Itasuomen laanin contact persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Itasuomen laanin contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);


ALTER TABLE public."Itasuomen laanin contact persons" OWNER TO postgres;

--
-- Name: Itasuomen laanin customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Itasuomen laanin customers" (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);


ALTER TABLE public."Itasuomen laanin customers" OWNER TO postgres;

--
-- Name: Itasuomen laanin donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Itasuomen laanin donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);


ALTER TABLE public."Itasuomen laanin donations" OWNER TO postgres;

--
-- Name: Itasuomen laanin rescue centers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Itasuomen laanin rescue centers" (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);


ALTER TABLE public."Itasuomen laanin rescue centers" OWNER TO postgres;

--
-- Name: Kaikkien laanien contact persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kaikkien laanien contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);


ALTER TABLE public."Kaikkien laanien contact persons" OWNER TO postgres;

--
-- Name: Kaikkien laanien donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kaikkien laanien donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);


ALTER TABLE public."Kaikkien laanien donations" OWNER TO postgres;

--
-- Name: Oulun laanin animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oulun laanin animals" (
    animal_id character varying(10) NOT NULL,
    species character varying(100),
    animal_name character varying(100),
    animal_description character varying(255),
    age integer,
    requirement_description text,
    rescue_center_id character varying(10)
);


ALTER TABLE public."Oulun laanin animals" OWNER TO postgres;

--
-- Name: Oulun laanin contact persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oulun laanin contact persons" (
    contact_person_id character varying(10) NOT NULL,
    contact_person character varying(255),
    email character varying(100),
    phone character(15),
    rescue_center_id character varying(10)
);


ALTER TABLE public."Oulun laanin contact persons" OWNER TO postgres;

--
-- Name: Oulun laanin customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oulun laanin customers" (
    customer_id character varying(10) NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    phone character varying(15)
);


ALTER TABLE public."Oulun laanin customers" OWNER TO postgres;

--
-- Name: Oulun laanin donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oulun laanin donations" (
    donation_id character varying(10) NOT NULL,
    customer_id character varying(10),
    rescue_center_id character varying(10),
    amount integer
);


ALTER TABLE public."Oulun laanin donations" OWNER TO postgres;

--
-- Name: Oulun laanin rescue centers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oulun laanin rescue centers" (
    rescue_center_id character varying(10) NOT NULL,
    rescue_center_name character varying(255),
    center_location character varying(255)
);


ALTER TABLE public."Oulun laanin rescue centers" OWNER TO postgres;

--
-- Name: Etelasuomen laanin animals; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals ATTACH PARTITION public."Etelasuomen laanin animals" FOR VALUES FROM ('E_ANI_01') TO ('E_ANI_30');


--
-- Name: Etelasuomen laanin contact persons; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Etelasuomen laanin contact persons" FOR VALUES FROM ('E_CON_01') TO ('E_CON_30');


--
-- Name: Etelasuomen laanin customers; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ATTACH PARTITION public."Etelasuomen laanin customers" FOR VALUES FROM ('E_CUS_01') TO ('E_CUS_35');


--
-- Name: Etelasuomen laanin donations; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations ATTACH PARTITION public."Etelasuomen laanin donations" FOR VALUES FROM ('E_DON_01') TO ('E_DON_35');


--
-- Name: Etelasuomen laanin rescue centers; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rescue_centers ATTACH PARTITION public."Etelasuomen laanin rescue centers" FOR VALUES FROM ('E_RES_01') TO ('E_RES_25');


--
-- Name: Itasuomen laanin animals; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals ATTACH PARTITION public."Itasuomen laanin animals" FOR VALUES FROM ('I_ANI_01') TO ('I_ANI_30');


--
-- Name: Itasuomen laanin contact persons; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Itasuomen laanin contact persons" FOR VALUES FROM ('I_CON_01') TO ('I_CON_30');


--
-- Name: Itasuomen laanin customers; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ATTACH PARTITION public."Itasuomen laanin customers" FOR VALUES FROM ('I_CUS_01') TO ('I_CUS_35');


--
-- Name: Itasuomen laanin donations; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations ATTACH PARTITION public."Itasuomen laanin donations" FOR VALUES FROM ('I_DON_01') TO ('I_DON_35');


--
-- Name: Itasuomen laanin rescue centers; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rescue_centers ATTACH PARTITION public."Itasuomen laanin rescue centers" FOR VALUES FROM ('I_RES_01') TO ('I_RES_25');


--
-- Name: Kaikkien laanien contact persons; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Kaikkien laanien contact persons" DEFAULT;


--
-- Name: Kaikkien laanien donations; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations ATTACH PARTITION public."Kaikkien laanien donations" DEFAULT;


--
-- Name: Oulun laanin animals; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals ATTACH PARTITION public."Oulun laanin animals" FOR VALUES FROM ('O_ANI_01') TO ('O_ANI_30');


--
-- Name: Oulun laanin contact persons; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_persons ATTACH PARTITION public."Oulun laanin contact persons" FOR VALUES FROM ('O_CON_01') TO ('O_CON_30');


--
-- Name: Oulun laanin customers; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ATTACH PARTITION public."Oulun laanin customers" FOR VALUES FROM ('O_CUS_01') TO ('O_CUS_35');


--
-- Name: Oulun laanin donations; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations ATTACH PARTITION public."Oulun laanin donations" FOR VALUES FROM ('O_DON_01') TO ('O_DON_35');


--
-- Name: Oulun laanin rescue centers; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rescue_centers ATTACH PARTITION public."Oulun laanin rescue centers" FOR VALUES FROM ('O_RES_01') TO ('O_RES_25');


--
-- Data for Name: Etelasuomen laanin animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Etelasuomen laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
\.
COPY public."Etelasuomen laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM '$$PATH$$/5008.dat';

--
-- Data for Name: Etelasuomen laanin contact persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Etelasuomen laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
\.
COPY public."Etelasuomen laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM '$$PATH$$/5011.dat';

--
-- Data for Name: Etelasuomen laanin customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Etelasuomen laanin customers" (customer_id, customer_name, email, phone) FROM stdin;
\.
COPY public."Etelasuomen laanin customers" (customer_id, customer_name, email, phone) FROM '$$PATH$$/5015.dat';

--
-- Data for Name: Etelasuomen laanin donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Etelasuomen laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
\.
COPY public."Etelasuomen laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM '$$PATH$$/5018.dat';

--
-- Data for Name: Etelasuomen laanin rescue centers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Etelasuomen laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM stdin;
\.
COPY public."Etelasuomen laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM '$$PATH$$/5005.dat';

--
-- Data for Name: Itasuomen laanin animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Itasuomen laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
\.
COPY public."Itasuomen laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM '$$PATH$$/5009.dat';

--
-- Data for Name: Itasuomen laanin contact persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Itasuomen laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
\.
COPY public."Itasuomen laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM '$$PATH$$/5012.dat';

--
-- Data for Name: Itasuomen laanin customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Itasuomen laanin customers" (customer_id, customer_name, email, phone) FROM stdin;
\.
COPY public."Itasuomen laanin customers" (customer_id, customer_name, email, phone) FROM '$$PATH$$/5016.dat';

--
-- Data for Name: Itasuomen laanin donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Itasuomen laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
\.
COPY public."Itasuomen laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM '$$PATH$$/5019.dat';

--
-- Data for Name: Itasuomen laanin rescue centers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Itasuomen laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM stdin;
\.
COPY public."Itasuomen laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM '$$PATH$$/5006.dat';

--
-- Data for Name: Kaikkien laanien contact persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kaikkien laanien contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
\.
COPY public."Kaikkien laanien contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM '$$PATH$$/5014.dat';

--
-- Data for Name: Kaikkien laanien donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kaikkien laanien donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
\.
COPY public."Kaikkien laanien donations" (donation_id, customer_id, rescue_center_id, amount) FROM '$$PATH$$/5021.dat';

--
-- Data for Name: Oulun laanin animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oulun laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM stdin;
\.
COPY public."Oulun laanin animals" (animal_id, species, animal_name, animal_description, age, requirement_description, rescue_center_id) FROM '$$PATH$$/5010.dat';

--
-- Data for Name: Oulun laanin contact persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oulun laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM stdin;
\.
COPY public."Oulun laanin contact persons" (contact_person_id, contact_person, email, phone, rescue_center_id) FROM '$$PATH$$/5013.dat';

--
-- Data for Name: Oulun laanin customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oulun laanin customers" (customer_id, customer_name, email, phone) FROM stdin;
\.
COPY public."Oulun laanin customers" (customer_id, customer_name, email, phone) FROM '$$PATH$$/5017.dat';

--
-- Data for Name: Oulun laanin donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oulun laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM stdin;
\.
COPY public."Oulun laanin donations" (donation_id, customer_id, rescue_center_id, amount) FROM '$$PATH$$/5020.dat';

--
-- Data for Name: Oulun laanin rescue centers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oulun laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM stdin;
\.
COPY public."Oulun laanin rescue centers" (rescue_center_id, rescue_center_name, center_location) FROM '$$PATH$$/5007.dat';

--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);


--
-- Name: Etelasuomen laanin animals Etelasuomen laani elaimet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Etelasuomen laanin animals"
    ADD CONSTRAINT "Etelasuomen laani elaimet_pkey" PRIMARY KEY (animal_id);


--
-- Name: rescue_centers rescue_centers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rescue_centers
    ADD CONSTRAINT rescue_centers_pkey PRIMARY KEY (rescue_center_id);


--
-- Name: Etelasuomen laanin rescue centers Etelasuomen laani_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Etelasuomen laanin rescue centers"
    ADD CONSTRAINT "Etelasuomen laani_pkey" PRIMARY KEY (rescue_center_id);


--
-- Name: contact_persons contact_persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_persons
    ADD CONSTRAINT contact_persons_pkey PRIMARY KEY (contact_person_id);


--
-- Name: Etelasuomen laanin contact persons Etelasuomen laanin contact persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Etelasuomen laanin contact persons"
    ADD CONSTRAINT "Etelasuomen laanin contact persons_pkey" PRIMARY KEY (contact_person_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: Etelasuomen laanin customers Etelasuomen laanin customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Etelasuomen laanin customers"
    ADD CONSTRAINT "Etelasuomen laanin customers_pkey" PRIMARY KEY (customer_id);


--
-- Name: donations donations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (donation_id);


--
-- Name: Etelasuomen laanin donations Etelasuomen laanin donations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Etelasuomen laanin donations"
    ADD CONSTRAINT "Etelasuomen laanin donations_pkey" PRIMARY KEY (donation_id);


--
-- Name: Itasuomen laanin animals Itasuomen laani elaimet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Itasuomen laanin animals"
    ADD CONSTRAINT "Itasuomen laani elaimet_pkey" PRIMARY KEY (animal_id);


--
-- Name: Itasuomen laanin rescue centers Itasuomen laani_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Itasuomen laanin rescue centers"
    ADD CONSTRAINT "Itasuomen laani_pkey" PRIMARY KEY (rescue_center_id);


--
-- Name: Itasuomen laanin contact persons Itasuomen laanin contact persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Itasuomen laanin contact persons"
    ADD CONSTRAINT "Itasuomen laanin contact persons_pkey" PRIMARY KEY (contact_person_id);


--
-- Name: Itasuomen laanin customers Itasuomen laanin customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Itasuomen laanin customers"
    ADD CONSTRAINT "Itasuomen laanin customers_pkey" PRIMARY KEY (customer_id);


--
-- Name: Itasuomen laanin donations Itasuomen laanin donations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Itasuomen laanin donations"
    ADD CONSTRAINT "Itasuomen laanin donations_pkey" PRIMARY KEY (donation_id);


--
-- Name: Kaikkien laanien contact persons Kaikki laanit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kaikkien laanien contact persons"
    ADD CONSTRAINT "Kaikki laanit_pkey" PRIMARY KEY (contact_person_id);


--
-- Name: Oulun laanin animals Oulun laani elaimet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oulun laanin animals"
    ADD CONSTRAINT "Oulun laani elaimet_pkey" PRIMARY KEY (animal_id);


--
-- Name: Oulun laanin rescue centers Oulun laani_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oulun laanin rescue centers"
    ADD CONSTRAINT "Oulun laani_pkey" PRIMARY KEY (rescue_center_id);


--
-- Name: Oulun laanin contact persons Oulun laanin contact persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oulun laanin contact persons"
    ADD CONSTRAINT "Oulun laanin contact persons_pkey" PRIMARY KEY (contact_person_id);


--
-- Name: Oulun laanin customers Oulun laanin customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oulun laanin customers"
    ADD CONSTRAINT "Oulun laanin customers_pkey" PRIMARY KEY (customer_id);


--
-- Name: Oulun laanin donations Oulun laanin donations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oulun laanin donations"
    ADD CONSTRAINT "Oulun laanin donations_pkey" PRIMARY KEY (donation_id);


--
-- Name: Kaikkien laanien donations kaikki laanit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kaikkien laanien donations"
    ADD CONSTRAINT "kaikki laanit_pkey" PRIMARY KEY (donation_id);


--
-- Name: Etelasuomen laani elaimet_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.animals_pkey ATTACH PARTITION public."Etelasuomen laani elaimet_pkey";


--
-- Name: Etelasuomen laani_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.rescue_centers_pkey ATTACH PARTITION public."Etelasuomen laani_pkey";


--
-- Name: Etelasuomen laanin contact persons_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Etelasuomen laanin contact persons_pkey";


--
-- Name: Etelasuomen laanin customers_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.customers_pkey ATTACH PARTITION public."Etelasuomen laanin customers_pkey";


--
-- Name: Etelasuomen laanin donations_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.donations_pkey ATTACH PARTITION public."Etelasuomen laanin donations_pkey";


--
-- Name: Itasuomen laani elaimet_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.animals_pkey ATTACH PARTITION public."Itasuomen laani elaimet_pkey";


--
-- Name: Itasuomen laani_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.rescue_centers_pkey ATTACH PARTITION public."Itasuomen laani_pkey";


--
-- Name: Itasuomen laanin contact persons_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Itasuomen laanin contact persons_pkey";


--
-- Name: Itasuomen laanin customers_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.customers_pkey ATTACH PARTITION public."Itasuomen laanin customers_pkey";


--
-- Name: Itasuomen laanin donations_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.donations_pkey ATTACH PARTITION public."Itasuomen laanin donations_pkey";


--
-- Name: Kaikki laanit_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Kaikki laanit_pkey";


--
-- Name: Oulun laani elaimet_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.animals_pkey ATTACH PARTITION public."Oulun laani elaimet_pkey";


--
-- Name: Oulun laani_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.rescue_centers_pkey ATTACH PARTITION public."Oulun laani_pkey";


--
-- Name: Oulun laanin contact persons_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.contact_persons_pkey ATTACH PARTITION public."Oulun laanin contact persons_pkey";


--
-- Name: Oulun laanin customers_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.customers_pkey ATTACH PARTITION public."Oulun laanin customers_pkey";


--
-- Name: Oulun laanin donations_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.donations_pkey ATTACH PARTITION public."Oulun laanin donations_pkey";


--
-- Name: kaikki laanit_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.donations_pkey ATTACH PARTITION public."kaikki laanit_pkey";


--
-- Name: donations fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.donations
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: animals fk_rescue_center; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.animals
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);


--
-- Name: contact_persons fk_rescue_center; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.contact_persons
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);


--
-- Name: donations fk_rescue_center; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.donations
    ADD CONSTRAINT fk_rescue_center FOREIGN KEY (rescue_center_id) REFERENCES public.rescue_centers(rescue_center_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    