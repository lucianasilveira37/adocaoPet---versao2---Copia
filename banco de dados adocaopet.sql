PGDMP      /        
        }         	   adocaopet    16.6    16.6     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16501 	   adocaopet    DATABASE     �   CREATE DATABASE adocaopet WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE adocaopet;
                postgres    false            �            1259    16540    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    whatsapp character varying(20),
    password text NOT NULL,
    entrou_com_facebook boolean DEFAULT false,
    entrou_com_google boolean DEFAULT false,
    quer_divulgar boolean DEFAULT false,
    quer_adotar boolean DEFAULT false,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16539    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215                       2604    16543    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16540    users 
   TABLE DATA           �   COPY public.users (id, nome, email, whatsapp, password, entrou_com_facebook, entrou_com_google, quer_divulgar, quer_adotar, criado_em) FROM stdin;
    public          postgres    false    216   
       �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          postgres    false    215            !           2606    16554    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            #           2606    16552    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �   �  x���Kw�0��u�]�m$\bp5�b������M��(	:��׏x��C���}A@���)o�PNa�}�J�� �v��hR~�H��\������
�0~A�D"I��J$Į�h�3��{K�DODBR�)�N�-��C1"a�[���VJ��{���7��5�T�u�f�%�xT���V�f�F�ʏKa���~;��X�i�X�zŷ4r�H�G�p[����x3�h���*L����!{j+@�uAAܽ{�s�i�Ľ�"X��,5��n�bo���Q�F�1#�t�Yp|���.�Q�P�5{iu?�ru��l�|Q��[�	V�J$d�ۨ4�4���^�<K+�Aw�'z���{�l��ɼ�Z�r[�6��qg��_�+Zg�V��y��Ln�g��ӟ% ��<u���]t��02o��
�b*�	2$yN{n����ݮm�^R�������?�d�[     