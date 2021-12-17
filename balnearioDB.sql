PGDMP     !                    y        
   roquerioDB    13.3    13.3 {    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            F           1262    81920 
   roquerioDB    DATABASE     h   CREATE DATABASE "roquerioDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE "roquerioDB";
                postgres    false            �            1259    82012    adicionales    TABLE     ^   CREATE TABLE public.adicionales (
    idadicional integer NOT NULL,
    tipo text NOT NULL
);
    DROP TABLE public.adicionales;
       public         heap    postgres    false            �            1259    82010    adicionales_idadicional_seq    SEQUENCE     �   CREATE SEQUENCE public.adicionales_idadicional_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.adicionales_idadicional_seq;
       public          postgres    false    214            G           0    0    adicionales_idadicional_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.adicionales_idadicional_seq OWNED BY public.adicionales.idadicional;
          public          postgres    false    213            �            1259    81923    cliente    TABLE     �   CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    correo text NOT NULL,
    pass text NOT NULL,
    fono integer NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    81921    cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    201            H           0    0    cliente_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.idcliente;
          public          postgres    false    200            �            1259    81987    dia    TABLE     x   CREATE TABLE public.dia (
    idreserva integer NOT NULL,
    idcliente integer NOT NULL,
    fechadia date NOT NULL
);
    DROP TABLE public.dia;
       public         heap    postgres    false            �            1259    81985    dia_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.dia_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.dia_idcliente_seq;
       public          postgres    false    210            I           0    0    dia_idcliente_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.dia_idcliente_seq OWNED BY public.dia.idcliente;
          public          postgres    false    209            �            1259    81983    dia_idreserva_seq    SEQUENCE     �   CREATE SEQUENCE public.dia_idreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.dia_idreserva_seq;
       public          postgres    false    210            J           0    0    dia_idreserva_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.dia_idreserva_seq OWNED BY public.dia.idreserva;
          public          postgres    false    208            �            1259    82023    estacionamientos    TABLE     Q   CREATE TABLE public.estacionamientos (
    idestacionamiento integer NOT NULL
);
 $   DROP TABLE public.estacionamientos;
       public         heap    postgres    false            �            1259    82021 &   estacionamientos_idestacionamiento_seq    SEQUENCE     �   CREATE SEQUENCE public.estacionamientos_idestacionamiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.estacionamientos_idestacionamiento_seq;
       public          postgres    false    216            K           0    0 &   estacionamientos_idestacionamiento_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.estacionamientos_idestacionamiento_seq OWNED BY public.estacionamientos.idestacionamiento;
          public          postgres    false    215            �            1259    81952    reserva    TABLE     x   CREATE TABLE public.reserva (
    idreserva integer NOT NULL,
    idcliente integer NOT NULL,
    tipo text NOT NULL
);
    DROP TABLE public.reserva;
       public         heap    postgres    false            �            1259    81950    reserva_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.reserva_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reserva_idcliente_seq;
       public          postgres    false    204            L           0    0    reserva_idcliente_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reserva_idcliente_seq OWNED BY public.reserva.idcliente;
          public          postgres    false    203            �            1259    81948    reserva_idreserva_seq    SEQUENCE     �   CREATE SEQUENCE public.reserva_idreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reserva_idreserva_seq;
       public          postgres    false    204            M           0    0    reserva_idreserva_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reserva_idreserva_seq OWNED BY public.reserva.idreserva;
          public          postgres    false    202            �            1259    82182    reservaadicionales    TABLE     �   CREATE TABLE public.reservaadicionales (
    idreserva integer NOT NULL,
    idcliente integer NOT NULL,
    idsomglo integer NOT NULL,
    idadicional integer NOT NULL
);
 &   DROP TABLE public.reservaadicionales;
       public         heap    postgres    false            �            1259    82180 "   reservaadicionales_idadicional_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaadicionales_idadicional_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.reservaadicionales_idadicional_seq;
       public          postgres    false    225            N           0    0 "   reservaadicionales_idadicional_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.reservaadicionales_idadicional_seq OWNED BY public.reservaadicionales.idadicional;
          public          postgres    false    224            �            1259    82176     reservaadicionales_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaadicionales_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.reservaadicionales_idcliente_seq;
       public          postgres    false    225            O           0    0     reservaadicionales_idcliente_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.reservaadicionales_idcliente_seq OWNED BY public.reservaadicionales.idcliente;
          public          postgres    false    222            �            1259    82174     reservaadicionales_idreserva_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaadicionales_idreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.reservaadicionales_idreserva_seq;
       public          postgres    false    225            P           0    0     reservaadicionales_idreserva_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.reservaadicionales_idreserva_seq OWNED BY public.reservaadicionales.idreserva;
          public          postgres    false    221            �            1259    82178    reservaadicionales_idsomglo_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaadicionales_idsomglo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.reservaadicionales_idsomglo_seq;
       public          postgres    false    225            Q           0    0    reservaadicionales_idsomglo_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.reservaadicionales_idsomglo_seq OWNED BY public.reservaadicionales.idsomglo;
          public          postgres    false    223            �            1259    82207    reservaestacionamiento    TABLE     �   CREATE TABLE public.reservaestacionamiento (
    idreserva integer NOT NULL,
    idcliente integer NOT NULL,
    idestacionamiento integer NOT NULL
);
 *   DROP TABLE public.reservaestacionamiento;
       public         heap    postgres    false            �            1259    82203 $   reservaestacionamiento_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaestacionamiento_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.reservaestacionamiento_idcliente_seq;
       public          postgres    false    229            R           0    0 $   reservaestacionamiento_idcliente_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.reservaestacionamiento_idcliente_seq OWNED BY public.reservaestacionamiento.idcliente;
          public          postgres    false    227            �            1259    82205 ,   reservaestacionamiento_idestacionamiento_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaestacionamiento_idestacionamiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.reservaestacionamiento_idestacionamiento_seq;
       public          postgres    false    229            S           0    0 ,   reservaestacionamiento_idestacionamiento_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.reservaestacionamiento_idestacionamiento_seq OWNED BY public.reservaestacionamiento.idestacionamiento;
          public          postgres    false    228            �            1259    82201 $   reservaestacionamiento_idreserva_seq    SEQUENCE     �   CREATE SEQUENCE public.reservaestacionamiento_idreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.reservaestacionamiento_idreserva_seq;
       public          postgres    false    229            T           0    0 $   reservaestacionamiento_idreserva_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.reservaestacionamiento_idreserva_seq OWNED BY public.reservaestacionamiento.idreserva;
          public          postgres    false    226            �            1259    82156    reservasomglo    TABLE     �   CREATE TABLE public.reservasomglo (
    idreserva integer NOT NULL,
    idcliente integer NOT NULL,
    idsomglo integer NOT NULL
);
 !   DROP TABLE public.reservasomglo;
       public         heap    postgres    false            �            1259    82152    reservasomglo_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.reservasomglo_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.reservasomglo_idcliente_seq;
       public          postgres    false    220            U           0    0    reservasomglo_idcliente_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.reservasomglo_idcliente_seq OWNED BY public.reservasomglo.idcliente;
          public          postgres    false    218            �            1259    82150    reservasomglo_idreserva_seq    SEQUENCE     �   CREATE SEQUENCE public.reservasomglo_idreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.reservasomglo_idreserva_seq;
       public          postgres    false    220            V           0    0    reservasomglo_idreserva_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.reservasomglo_idreserva_seq OWNED BY public.reservasomglo.idreserva;
          public          postgres    false    217            �            1259    82154    reservasomglo_idsomglo_seq    SEQUENCE     �   CREATE SEQUENCE public.reservasomglo_idsomglo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.reservasomglo_idsomglo_seq;
       public          postgres    false    220            W           0    0    reservasomglo_idsomglo_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.reservasomglo_idsomglo_seq OWNED BY public.reservasomglo.idsomglo;
          public          postgres    false    219            �            1259    81971    semana    TABLE     �   CREATE TABLE public.semana (
    idreserva integer NOT NULL,
    idcliente integer NOT NULL,
    fechainicio date NOT NULL,
    fechatermino date NOT NULL
);
    DROP TABLE public.semana;
       public         heap    postgres    false            �            1259    81969    semana_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.semana_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.semana_idcliente_seq;
       public          postgres    false    207            X           0    0    semana_idcliente_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.semana_idcliente_seq OWNED BY public.semana.idcliente;
          public          postgres    false    206            �            1259    81967    semana_idreserva_seq    SEQUENCE     �   CREATE SEQUENCE public.semana_idreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.semana_idreserva_seq;
       public          postgres    false    207            Y           0    0    semana_idreserva_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.semana_idreserva_seq OWNED BY public.semana.idreserva;
          public          postgres    false    205            �            1259    82001    sombrillaglorieta    TABLE     a   CREATE TABLE public.sombrillaglorieta (
    idsomglo integer NOT NULL,
    tipo text NOT NULL
);
 %   DROP TABLE public.sombrillaglorieta;
       public         heap    postgres    false            �            1259    81999    sombrillaglorieta_idsomglo_seq    SEQUENCE     �   CREATE SEQUENCE public.sombrillaglorieta_idsomglo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.sombrillaglorieta_idsomglo_seq;
       public          postgres    false    212            Z           0    0    sombrillaglorieta_idsomglo_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.sombrillaglorieta_idsomglo_seq OWNED BY public.sombrillaglorieta.idsomglo;
          public          postgres    false    211            x           2604    82015    adicionales idadicional    DEFAULT     �   ALTER TABLE ONLY public.adicionales ALTER COLUMN idadicional SET DEFAULT nextval('public.adicionales_idadicional_seq'::regclass);
 F   ALTER TABLE public.adicionales ALTER COLUMN idadicional DROP DEFAULT;
       public          postgres    false    214    213    214            p           2604    81926    cliente idcliente    DEFAULT     o   ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 @   ALTER TABLE public.cliente ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    201    200    201            u           2604    81990    dia idreserva    DEFAULT     n   ALTER TABLE ONLY public.dia ALTER COLUMN idreserva SET DEFAULT nextval('public.dia_idreserva_seq'::regclass);
 <   ALTER TABLE public.dia ALTER COLUMN idreserva DROP DEFAULT;
       public          postgres    false    208    210    210            v           2604    81991    dia idcliente    DEFAULT     n   ALTER TABLE ONLY public.dia ALTER COLUMN idcliente SET DEFAULT nextval('public.dia_idcliente_seq'::regclass);
 <   ALTER TABLE public.dia ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    209    210    210            y           2604    82026 "   estacionamientos idestacionamiento    DEFAULT     �   ALTER TABLE ONLY public.estacionamientos ALTER COLUMN idestacionamiento SET DEFAULT nextval('public.estacionamientos_idestacionamiento_seq'::regclass);
 Q   ALTER TABLE public.estacionamientos ALTER COLUMN idestacionamiento DROP DEFAULT;
       public          postgres    false    215    216    216            q           2604    81955    reserva idreserva    DEFAULT     v   ALTER TABLE ONLY public.reserva ALTER COLUMN idreserva SET DEFAULT nextval('public.reserva_idreserva_seq'::regclass);
 @   ALTER TABLE public.reserva ALTER COLUMN idreserva DROP DEFAULT;
       public          postgres    false    204    202    204            r           2604    81956    reserva idcliente    DEFAULT     v   ALTER TABLE ONLY public.reserva ALTER COLUMN idcliente SET DEFAULT nextval('public.reserva_idcliente_seq'::regclass);
 @   ALTER TABLE public.reserva ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    203    204    204            }           2604    82185    reservaadicionales idreserva    DEFAULT     �   ALTER TABLE ONLY public.reservaadicionales ALTER COLUMN idreserva SET DEFAULT nextval('public.reservaadicionales_idreserva_seq'::regclass);
 K   ALTER TABLE public.reservaadicionales ALTER COLUMN idreserva DROP DEFAULT;
       public          postgres    false    221    225    225            ~           2604    82186    reservaadicionales idcliente    DEFAULT     �   ALTER TABLE ONLY public.reservaadicionales ALTER COLUMN idcliente SET DEFAULT nextval('public.reservaadicionales_idcliente_seq'::regclass);
 K   ALTER TABLE public.reservaadicionales ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    225    222    225                       2604    82187    reservaadicionales idsomglo    DEFAULT     �   ALTER TABLE ONLY public.reservaadicionales ALTER COLUMN idsomglo SET DEFAULT nextval('public.reservaadicionales_idsomglo_seq'::regclass);
 J   ALTER TABLE public.reservaadicionales ALTER COLUMN idsomglo DROP DEFAULT;
       public          postgres    false    225    223    225            �           2604    82188    reservaadicionales idadicional    DEFAULT     �   ALTER TABLE ONLY public.reservaadicionales ALTER COLUMN idadicional SET DEFAULT nextval('public.reservaadicionales_idadicional_seq'::regclass);
 M   ALTER TABLE public.reservaadicionales ALTER COLUMN idadicional DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    82210     reservaestacionamiento idreserva    DEFAULT     �   ALTER TABLE ONLY public.reservaestacionamiento ALTER COLUMN idreserva SET DEFAULT nextval('public.reservaestacionamiento_idreserva_seq'::regclass);
 O   ALTER TABLE public.reservaestacionamiento ALTER COLUMN idreserva DROP DEFAULT;
       public          postgres    false    226    229    229            �           2604    82211     reservaestacionamiento idcliente    DEFAULT     �   ALTER TABLE ONLY public.reservaestacionamiento ALTER COLUMN idcliente SET DEFAULT nextval('public.reservaestacionamiento_idcliente_seq'::regclass);
 O   ALTER TABLE public.reservaestacionamiento ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    229    227    229            �           2604    82212 (   reservaestacionamiento idestacionamiento    DEFAULT     �   ALTER TABLE ONLY public.reservaestacionamiento ALTER COLUMN idestacionamiento SET DEFAULT nextval('public.reservaestacionamiento_idestacionamiento_seq'::regclass);
 W   ALTER TABLE public.reservaestacionamiento ALTER COLUMN idestacionamiento DROP DEFAULT;
       public          postgres    false    229    228    229            z           2604    82159    reservasomglo idreserva    DEFAULT     �   ALTER TABLE ONLY public.reservasomglo ALTER COLUMN idreserva SET DEFAULT nextval('public.reservasomglo_idreserva_seq'::regclass);
 F   ALTER TABLE public.reservasomglo ALTER COLUMN idreserva DROP DEFAULT;
       public          postgres    false    217    220    220            {           2604    82160    reservasomglo idcliente    DEFAULT     �   ALTER TABLE ONLY public.reservasomglo ALTER COLUMN idcliente SET DEFAULT nextval('public.reservasomglo_idcliente_seq'::regclass);
 F   ALTER TABLE public.reservasomglo ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    220    218    220            |           2604    82161    reservasomglo idsomglo    DEFAULT     �   ALTER TABLE ONLY public.reservasomglo ALTER COLUMN idsomglo SET DEFAULT nextval('public.reservasomglo_idsomglo_seq'::regclass);
 E   ALTER TABLE public.reservasomglo ALTER COLUMN idsomglo DROP DEFAULT;
       public          postgres    false    220    219    220            s           2604    81974    semana idreserva    DEFAULT     t   ALTER TABLE ONLY public.semana ALTER COLUMN idreserva SET DEFAULT nextval('public.semana_idreserva_seq'::regclass);
 ?   ALTER TABLE public.semana ALTER COLUMN idreserva DROP DEFAULT;
       public          postgres    false    207    205    207            t           2604    81975    semana idcliente    DEFAULT     t   ALTER TABLE ONLY public.semana ALTER COLUMN idcliente SET DEFAULT nextval('public.semana_idcliente_seq'::regclass);
 ?   ALTER TABLE public.semana ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    207    206    207            w           2604    82004    sombrillaglorieta idsomglo    DEFAULT     �   ALTER TABLE ONLY public.sombrillaglorieta ALTER COLUMN idsomglo SET DEFAULT nextval('public.sombrillaglorieta_idsomglo_seq'::regclass);
 I   ALTER TABLE public.sombrillaglorieta ALTER COLUMN idsomglo DROP DEFAULT;
       public          postgres    false    211    212    212            1          0    82012    adicionales 
   TABLE DATA           8   COPY public.adicionales (idadicional, tipo) FROM stdin;
    public          postgres    false    214   ��       $          0    81923    cliente 
   TABLE DATA           R   COPY public.cliente (idcliente, nombre, apellido, correo, pass, fono) FROM stdin;
    public          postgres    false    201   ƕ       -          0    81987    dia 
   TABLE DATA           =   COPY public.dia (idreserva, idcliente, fechadia) FROM stdin;
    public          postgres    false    210   d�       3          0    82023    estacionamientos 
   TABLE DATA           =   COPY public.estacionamientos (idestacionamiento) FROM stdin;
    public          postgres    false    216   ��       '          0    81952    reserva 
   TABLE DATA           =   COPY public.reserva (idreserva, idcliente, tipo) FROM stdin;
    public          postgres    false    204   ��       <          0    82182    reservaadicionales 
   TABLE DATA           Y   COPY public.reservaadicionales (idreserva, idcliente, idsomglo, idadicional) FROM stdin;
    public          postgres    false    225   ��       @          0    82207    reservaestacionamiento 
   TABLE DATA           Y   COPY public.reservaestacionamiento (idreserva, idcliente, idestacionamiento) FROM stdin;
    public          postgres    false    229   ؖ       7          0    82156    reservasomglo 
   TABLE DATA           G   COPY public.reservasomglo (idreserva, idcliente, idsomglo) FROM stdin;
    public          postgres    false    220   ��       *          0    81971    semana 
   TABLE DATA           Q   COPY public.semana (idreserva, idcliente, fechainicio, fechatermino) FROM stdin;
    public          postgres    false    207   �       /          0    82001    sombrillaglorieta 
   TABLE DATA           ;   COPY public.sombrillaglorieta (idsomglo, tipo) FROM stdin;
    public          postgres    false    212   /�       [           0    0    adicionales_idadicional_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.adicionales_idadicional_seq', 1, false);
          public          postgres    false    213            \           0    0    cliente_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cliente_id_seq', 3, true);
          public          postgres    false    200            ]           0    0    dia_idcliente_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.dia_idcliente_seq', 1, false);
          public          postgres    false    209            ^           0    0    dia_idreserva_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.dia_idreserva_seq', 1, false);
          public          postgres    false    208            _           0    0 &   estacionamientos_idestacionamiento_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.estacionamientos_idestacionamiento_seq', 1, false);
          public          postgres    false    215            `           0    0    reserva_idcliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reserva_idcliente_seq', 1, false);
          public          postgres    false    203            a           0    0    reserva_idreserva_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reserva_idreserva_seq', 1, false);
          public          postgres    false    202            b           0    0 "   reservaadicionales_idadicional_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.reservaadicionales_idadicional_seq', 1, false);
          public          postgres    false    224            c           0    0     reservaadicionales_idcliente_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.reservaadicionales_idcliente_seq', 1, false);
          public          postgres    false    222            d           0    0     reservaadicionales_idreserva_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.reservaadicionales_idreserva_seq', 1, false);
          public          postgres    false    221            e           0    0    reservaadicionales_idsomglo_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.reservaadicionales_idsomglo_seq', 1, false);
          public          postgres    false    223            f           0    0 $   reservaestacionamiento_idcliente_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.reservaestacionamiento_idcliente_seq', 1, false);
          public          postgres    false    227            g           0    0 ,   reservaestacionamiento_idestacionamiento_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.reservaestacionamiento_idestacionamiento_seq', 1, false);
          public          postgres    false    228            h           0    0 $   reservaestacionamiento_idreserva_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.reservaestacionamiento_idreserva_seq', 1, false);
          public          postgres    false    226            i           0    0    reservasomglo_idcliente_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.reservasomglo_idcliente_seq', 1, false);
          public          postgres    false    218            j           0    0    reservasomglo_idreserva_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.reservasomglo_idreserva_seq', 1, false);
          public          postgres    false    217            k           0    0    reservasomglo_idsomglo_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.reservasomglo_idsomglo_seq', 1, false);
          public          postgres    false    219            l           0    0    semana_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.semana_idcliente_seq', 1, false);
          public          postgres    false    206            m           0    0    semana_idreserva_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.semana_idreserva_seq', 1, false);
          public          postgres    false    205            n           0    0    sombrillaglorieta_idsomglo_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.sombrillaglorieta_idsomglo_seq', 1, false);
          public          postgres    false    211            �           2606    82020    adicionales adicionales_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.adicionales
    ADD CONSTRAINT adicionales_pkey PRIMARY KEY (idadicional);
 F   ALTER TABLE ONLY public.adicionales DROP CONSTRAINT adicionales_pkey;
       public            postgres    false    214            �           2606    81931    cliente cliente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    201            �           2606    81993    dia dia_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.dia
    ADD CONSTRAINT dia_pkey PRIMARY KEY (idreserva, idcliente);
 6   ALTER TABLE ONLY public.dia DROP CONSTRAINT dia_pkey;
       public            postgres    false    210    210            �           2606    82028 &   estacionamientos estacionamientos_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.estacionamientos
    ADD CONSTRAINT estacionamientos_pkey PRIMARY KEY (idestacionamiento);
 P   ALTER TABLE ONLY public.estacionamientos DROP CONSTRAINT estacionamientos_pkey;
       public            postgres    false    216            �           2606    81961    reserva reserva_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (idreserva, idcliente);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public            postgres    false    204    204            �           2606    82190 *   reservaadicionales reservaadicionales_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.reservaadicionales
    ADD CONSTRAINT reservaadicionales_pkey PRIMARY KEY (idreserva, idcliente, idsomglo, idadicional);
 T   ALTER TABLE ONLY public.reservaadicionales DROP CONSTRAINT reservaadicionales_pkey;
       public            postgres    false    225    225    225    225            �           2606    82214 2   reservaestacionamiento reservaestacionamiento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.reservaestacionamiento
    ADD CONSTRAINT reservaestacionamiento_pkey PRIMARY KEY (idreserva, idcliente, idestacionamiento);
 \   ALTER TABLE ONLY public.reservaestacionamiento DROP CONSTRAINT reservaestacionamiento_pkey;
       public            postgres    false    229    229    229            �           2606    82163     reservasomglo reservasomglo_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.reservasomglo
    ADD CONSTRAINT reservasomglo_pkey PRIMARY KEY (idreserva, idcliente, idsomglo);
 J   ALTER TABLE ONLY public.reservasomglo DROP CONSTRAINT reservasomglo_pkey;
       public            postgres    false    220    220    220            �           2606    81977    semana semana_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.semana
    ADD CONSTRAINT semana_pkey PRIMARY KEY (idreserva, idcliente);
 <   ALTER TABLE ONLY public.semana DROP CONSTRAINT semana_pkey;
       public            postgres    false    207    207            �           2606    82009 (   sombrillaglorieta sombrillaglorieta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sombrillaglorieta
    ADD CONSTRAINT sombrillaglorieta_pkey PRIMARY KEY (idsomglo);
 R   ALTER TABLE ONLY public.sombrillaglorieta DROP CONSTRAINT sombrillaglorieta_pkey;
       public            postgres    false    212            �           2606    81994     dia dia_idreserva_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dia
    ADD CONSTRAINT dia_idreserva_idcliente_fkey FOREIGN KEY (idreserva, idcliente) REFERENCES public.reserva(idreserva, idcliente);
 J   ALTER TABLE ONLY public.dia DROP CONSTRAINT dia_idreserva_idcliente_fkey;
       public          postgres    false    204    204    210    210    2951            �           2606    81962    reserva reserva_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 H   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_idcliente_fkey;
       public          postgres    false    201    204    2949            �           2606    82196 6   reservaadicionales reservaadicionales_idadicional_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservaadicionales
    ADD CONSTRAINT reservaadicionales_idadicional_fkey FOREIGN KEY (idadicional) REFERENCES public.adicionales(idadicional);
 `   ALTER TABLE ONLY public.reservaadicionales DROP CONSTRAINT reservaadicionales_idadicional_fkey;
       public          postgres    false    2959    225    214            �           2606    82191 G   reservaadicionales reservaadicionales_idreserva_idcliente_idsomglo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservaadicionales
    ADD CONSTRAINT reservaadicionales_idreserva_idcliente_idsomglo_fkey FOREIGN KEY (idreserva, idcliente, idsomglo) REFERENCES public.reservasomglo(idreserva, idcliente, idsomglo);
 q   ALTER TABLE ONLY public.reservaadicionales DROP CONSTRAINT reservaadicionales_idreserva_idcliente_idsomglo_fkey;
       public          postgres    false    225    225    225    220    220    220    2963            �           2606    82220 D   reservaestacionamiento reservaestacionamiento_idestacionamiento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservaestacionamiento
    ADD CONSTRAINT reservaestacionamiento_idestacionamiento_fkey FOREIGN KEY (idestacionamiento) REFERENCES public.estacionamientos(idestacionamiento);
 n   ALTER TABLE ONLY public.reservaestacionamiento DROP CONSTRAINT reservaestacionamiento_idestacionamiento_fkey;
       public          postgres    false    229    216    2961            �           2606    82215 F   reservaestacionamiento reservaestacionamiento_idreserva_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservaestacionamiento
    ADD CONSTRAINT reservaestacionamiento_idreserva_idcliente_fkey FOREIGN KEY (idreserva, idcliente) REFERENCES public.reserva(idreserva, idcliente);
 p   ALTER TABLE ONLY public.reservaestacionamiento DROP CONSTRAINT reservaestacionamiento_idreserva_idcliente_fkey;
       public          postgres    false    229    204    2951    204    229            �           2606    82164 4   reservasomglo reservasomglo_idreserva_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasomglo
    ADD CONSTRAINT reservasomglo_idreserva_idcliente_fkey FOREIGN KEY (idreserva, idcliente) REFERENCES public.reserva(idreserva, idcliente);
 ^   ALTER TABLE ONLY public.reservasomglo DROP CONSTRAINT reservasomglo_idreserva_idcliente_fkey;
       public          postgres    false    204    220    204    2951    220            �           2606    82169 )   reservasomglo reservasomglo_idsomglo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasomglo
    ADD CONSTRAINT reservasomglo_idsomglo_fkey FOREIGN KEY (idsomglo) REFERENCES public.sombrillaglorieta(idsomglo);
 S   ALTER TABLE ONLY public.reservasomglo DROP CONSTRAINT reservasomglo_idsomglo_fkey;
       public          postgres    false    2957    212    220            �           2606    81978 &   semana semana_idreserva_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.semana
    ADD CONSTRAINT semana_idreserva_idcliente_fkey FOREIGN KEY (idreserva, idcliente) REFERENCES public.reserva(idreserva, idcliente);
 P   ALTER TABLE ONLY public.semana DROP CONSTRAINT semana_idreserva_idcliente_fkey;
       public          postgres    false    2951    204    204    207    207            1      x������ � �      $   �   x�M���0@�ۏ!��k#nI0..�4x�5���6�s�s$���n���}=�K���$�:��2&�tY�FJ-L>y�������s���4�kF�40tmW��5��0ZF��H�g��T��ySWF+)���2=      -      x������ � �      3      x������ � �      '      x������ � �      <      x������ � �      @      x������ � �      7      x������ � �      *      x������ � �      /      x������ � �     