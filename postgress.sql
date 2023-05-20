PGDMP                         {            Proyecto    15.2    15.2 +    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    16481    Proyecto    DATABASE     �   CREATE DATABASE "Proyecto" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Proyecto";
                postgres    false            �            1259    16483    administrador    TABLE     �   CREATE TABLE public.administrador (
    id integer NOT NULL,
    nickname character varying(255),
    email character varying(255),
    "contraseña" character varying(255)
);
 !   DROP TABLE public.administrador;
       public         heap    postgres    false            �            1259    16482    administrador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.administrador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.administrador_id_seq;
       public          postgres    false    215            +           0    0    administrador_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.administrador_id_seq OWNED BY public.administrador.id;
          public          postgres    false    214            �            1259    16494    colegio    TABLE     �   CREATE TABLE public.colegio (
    id_colegio integer NOT NULL,
    nombre character varying(255),
    email character varying(255),
    "contraseña" character varying(255),
    "dirección" character varying(255)
);
    DROP TABLE public.colegio;
       public         heap    postgres    false            �            1259    16493    colegio_id_colegio_seq    SEQUENCE     �   CREATE SEQUENCE public.colegio_id_colegio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.colegio_id_colegio_seq;
       public          postgres    false    217            ,           0    0    colegio_id_colegio_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.colegio_id_colegio_seq OWNED BY public.colegio.id_colegio;
          public          postgres    false    216            �            1259    16503    estudiantes    TABLE     �   CREATE TABLE public.estudiantes (
    id_estudiante integer NOT NULL,
    nombres character varying(255),
    apellidos character varying(255),
    id_colegio integer,
    grado character varying(50)
);
    DROP TABLE public.estudiantes;
       public         heap    postgres    false            �            1259    16502    estudiantes_id_estudiante_seq    SEQUENCE     �   CREATE SEQUENCE public.estudiantes_id_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.estudiantes_id_estudiante_seq;
       public          postgres    false    219            -           0    0    estudiantes_id_estudiante_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNED BY public.estudiantes.id_estudiante;
          public          postgres    false    218            �            1259    16531    materias    TABLE     �   CREATE TABLE public.materias (
    id_materia integer NOT NULL,
    nombre_materia character varying(255),
    "descripción" text,
    id_colegio integer
);
    DROP TABLE public.materias;
       public         heap    postgres    false            �            1259    16530    materias_id_materia_seq    SEQUENCE     �   CREATE SEQUENCE public.materias_id_materia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.materias_id_materia_seq;
       public          postgres    false    223            .           0    0    materias_id_materia_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.materias_id_materia_seq OWNED BY public.materias.id_materia;
          public          postgres    false    222            �            1259    16517 
   profesores    TABLE     �   CREATE TABLE public.profesores (
    id_profesor integer NOT NULL,
    nombres character varying(255),
    apellidos character varying(255),
    id_colegio integer,
    "Área" character varying(255)
);
    DROP TABLE public.profesores;
       public         heap    postgres    false            �            1259    16516    profesores_id_profesor_seq    SEQUENCE     �   CREATE SEQUENCE public.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.profesores_id_profesor_seq;
       public          postgres    false    221            /           0    0    profesores_id_profesor_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.profesores_id_profesor_seq OWNED BY public.profesores.id_profesor;
          public          postgres    false    220            y           2604    16486    administrador id    DEFAULT     t   ALTER TABLE ONLY public.administrador ALTER COLUMN id SET DEFAULT nextval('public.administrador_id_seq'::regclass);
 ?   ALTER TABLE public.administrador ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            z           2604    16497    colegio id_colegio    DEFAULT     x   ALTER TABLE ONLY public.colegio ALTER COLUMN id_colegio SET DEFAULT nextval('public.colegio_id_colegio_seq'::regclass);
 A   ALTER TABLE public.colegio ALTER COLUMN id_colegio DROP DEFAULT;
       public          postgres    false    217    216    217            {           2604    16506    estudiantes id_estudiante    DEFAULT     �   ALTER TABLE ONLY public.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('public.estudiantes_id_estudiante_seq'::regclass);
 H   ALTER TABLE public.estudiantes ALTER COLUMN id_estudiante DROP DEFAULT;
       public          postgres    false    218    219    219            }           2604    16534    materias id_materia    DEFAULT     z   ALTER TABLE ONLY public.materias ALTER COLUMN id_materia SET DEFAULT nextval('public.materias_id_materia_seq'::regclass);
 B   ALTER TABLE public.materias ALTER COLUMN id_materia DROP DEFAULT;
       public          postgres    false    222    223    223            |           2604    16520    profesores id_profesor    DEFAULT     �   ALTER TABLE ONLY public.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesores_id_profesor_seq'::regclass);
 E   ALTER TABLE public.profesores ALTER COLUMN id_profesor DROP DEFAULT;
       public          postgres    false    221    220    221                      0    16483    administrador 
   TABLE DATA           K   COPY public.administrador (id, nickname, email, "contraseña") FROM stdin;
    public          postgres    false    215   <2                 0    16494    colegio 
   TABLE DATA           Y   COPY public.colegio (id_colegio, nombre, email, "contraseña", "dirección") FROM stdin;
    public          postgres    false    217   Y2                  0    16503    estudiantes 
   TABLE DATA           [   COPY public.estudiantes (id_estudiante, nombres, apellidos, id_colegio, grado) FROM stdin;
    public          postgres    false    219   �2       $          0    16531    materias 
   TABLE DATA           Z   COPY public.materias (id_materia, nombre_materia, "descripción", id_colegio) FROM stdin;
    public          postgres    false    223   3       "          0    16517 
   profesores 
   TABLE DATA           Z   COPY public.profesores (id_profesor, nombres, apellidos, id_colegio, "Área") FROM stdin;
    public          postgres    false    221   {3       0           0    0    administrador_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.administrador_id_seq', 1, false);
          public          postgres    false    214            1           0    0    colegio_id_colegio_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.colegio_id_colegio_seq', 2, true);
          public          postgres    false    216            2           0    0    estudiantes_id_estudiante_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.estudiantes_id_estudiante_seq', 9, true);
          public          postgres    false    218            3           0    0    materias_id_materia_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.materias_id_materia_seq', 6, true);
          public          postgres    false    222            4           0    0    profesores_id_profesor_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 8, true);
          public          postgres    false    220                       2606    16492 (   administrador administrador_nickname_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_nickname_key UNIQUE (nickname);
 R   ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_nickname_key;
       public            postgres    false    215            �           2606    16490     administrador administrador_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_pkey;
       public            postgres    false    215            �           2606    16501    colegio colegio_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.colegio
    ADD CONSTRAINT colegio_pkey PRIMARY KEY (id_colegio);
 >   ALTER TABLE ONLY public.colegio DROP CONSTRAINT colegio_pkey;
       public            postgres    false    217            �           2606    16510    estudiantes estudiantes_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id_estudiante);
 F   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pkey;
       public            postgres    false    219            �           2606    16538    materias materias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id_materia);
 @   ALTER TABLE ONLY public.materias DROP CONSTRAINT materias_pkey;
       public            postgres    false    223            �           2606    16524    profesores profesores_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);
 D   ALTER TABLE ONLY public.profesores DROP CONSTRAINT profesores_pkey;
       public            postgres    false    221            �           2606    16511 '   estudiantes estudiantes_id_colegio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_id_colegio_fkey FOREIGN KEY (id_colegio) REFERENCES public.colegio(id_colegio);
 Q   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_id_colegio_fkey;
       public          postgres    false    217    3203    219            �           2606    16539 !   materias materias_id_colegio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_id_colegio_fkey FOREIGN KEY (id_colegio) REFERENCES public.colegio(id_colegio);
 K   ALTER TABLE ONLY public.materias DROP CONSTRAINT materias_id_colegio_fkey;
       public          postgres    false    223    3203    217            �           2606    16525 %   profesores profesores_id_colegio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_id_colegio_fkey FOREIGN KEY (id_colegio) REFERENCES public.colegio(id_colegio);
 O   ALTER TABLE ONLY public.profesores DROP CONSTRAINT profesores_id_colegio_fkey;
       public          postgres    false    217    221    3203                  x������ � �         C   x�3�MIu�L.�K�tH�M���K����*M���/N5�t�8�6�ˈ�3/��3H`U������ /��          W   x�3���L����N����4�44�2��*M����L-K�ˇ�Y���$s:'���%�͹�8Ks9��S�2�KS�@��b���� r�E      $   X   x��1
�0�9=EO T<�.
�\]bJ��C������t")W1������7T<�2�h���#��GE)�2��Z`lQM��&���#      "   �   x�-�=
�@F�S���`������#�@2�����x�\�E�}����t*6�Q����IM8�+���D���2�J�\D�er���ݼ{kuF���xG� K�D�Kf-���u�|���Q�ֳ*,�)���t��Zyn����7�     