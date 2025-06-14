PGDMP  	                    }         	   adocaopet    16.6    16.6     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16501 	   adocaopet    DATABASE     �   CREATE DATABASE adocaopet WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE adocaopet;
                postgres    false            �            1259    16585    pet    TABLE     �  CREATE TABLE public.pet (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    specie character varying(20) NOT NULL,
    sex character varying(10) NOT NULL,
    age character varying(10) NOT NULL,
    size character varying(10) NOT NULL,
    state_id character varying(2) NOT NULL,
    city_id character varying(100) NOT NULL,
    description text,
    avatar character varying(255),
    castrated boolean DEFAULT false,
    vaccinated boolean DEFAULT false,
    vermifugate boolean DEFAULT false,
    need_special_care boolean DEFAULT false,
    docile boolean DEFAULT false,
    aggressive boolean DEFAULT false,
    calm boolean DEFAULT false,
    playful boolean DEFAULT false,
    sociable boolean DEFAULT false,
    aloof boolean DEFAULT false,
    independent boolean DEFAULT false,
    needy boolean DEFAULT false,
    friendly_with_house_with_backyard boolean DEFAULT false,
    friendly_with_apartment boolean DEFAULT false,
    sociability_cats boolean DEFAULT false,
    sociability_dogs boolean DEFAULT false,
    sociability_children boolean DEFAULT false,
    sociability_unknown boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.pet;
       public         heap    postgres    false            �            1259    16584 
   pet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.pet_id_seq;
       public          postgres    false    218            �           0    0 
   pet_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.pet_id_seq OWNED BY public.pet.id;
          public          postgres    false    217            �            1259    16540    users    TABLE     �  CREATE TABLE public.users (
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
          public          postgres    false    215            %           2604    16588    pet id    DEFAULT     `   ALTER TABLE ONLY public.pet ALTER COLUMN id SET DEFAULT nextval('public.pet_id_seq'::regclass);
 5   ALTER TABLE public.pet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                       2604    16543    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16585    pet 
   TABLE DATA           }  COPY public.pet (id, name, specie, sex, age, size, state_id, city_id, description, avatar, castrated, vaccinated, vermifugate, need_special_care, docile, aggressive, calm, playful, sociable, aloof, independent, needy, friendly_with_house_with_backyard, friendly_with_apartment, sociability_cats, sociability_dogs, sociability_children, sociability_unknown, created_at) FROM stdin;
    public          postgres    false    218   c       �          0    16540    users 
   TABLE DATA           �   COPY public.users (id, nome, email, whatsapp, password, entrou_com_facebook, entrou_com_google, quer_divulgar, quer_adotar, criado_em) FROM stdin;
    public          postgres    false    216   �       �           0    0 
   pet_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.pet_id_seq', 17, true);
          public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 46, true);
          public          postgres    false    215            >           2606    16611    pet pet_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pet DROP CONSTRAINT pet_pkey;
       public            postgres    false    218            :           2606    16554    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            <           2606    16552    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �   H  x�Ք͎�0�ϓ����y�Fۨ�R�r�Tq0`�����P�����n6e���q4���cb��&3(�H�n�����1k�i�BشBK+jDc��?��Xl��❵Ԣ�V,K+nV����o��F*+Q�PC�d!*�ü�@w#���d��~�o�v�7�w㸖�-F�¶�D$�#�)��T�PL1P�3%Bγm����"S�&5j�6��y��i�l�DN4�d>�8ӱ�y��)��g%�4�A) c.i�0�:�Pj�
�n�c���ێ�to�|�4ܫ�9M��f�I>l�ae�y�+Cdh��y�
%�+*<�86PEUB���G-I��z\
��0%��p��Cubq]鉗r�2���lX���u�,t���>_�p��;�A�Eu�)���|<6e�e�6�CN�]��?�=c�Vd����Ⱦ=~�b/��}lN�no`D�۬aY�I�
R�I�S������]|t��k�U�W�p��;Z�+F���>�(�$�W�Oڋp.��>���;�M���� �}OD�P1�3�biw���6M�A.���o5��L      �   �  x����֚H���Yd��b�U A*���ɦ@P�A��͟����p����\1!G_6E{C�8����R�!_ܰ�s��$H,Ě�	1'�o8�g�@rBr4��w�w�/tj(�y���P섀��yW����)��¾�W�uVE15�Bad�c,O;�-�:+y���cp�t�ͽ2R����T��,x���9��j_`��AW�2_#o�o�`u��vƗT�5�O�C.���5���޲iLBu�0�.�r�<w�m��@ay�^7	0s�0S����R��n�2�Ʒ4g_�e0����������dċǔ���,���!��%�A),	���,�
����Ka�%�@߿Wh+��}J<.�:���܉�v��6�m{r�z�o���,]��De&GL�Qg����[g9,�(qc����,f�6�o�d�F�1� im���xgs����V��x̯��C<��'�ŅڧV�곅[:m�C�2)#gI���D;/�^zW�c!j�}lO�ṟB�֒�	7��f�hݹ�5��7�C��f���m�(��:	,m�hh����c��s�������=K��u%d�H�u�F�^}�_���Л)"}���+R0��Y ��������T�r?:��˟���?��_V��X����e����b��i&��biF��<��p���,�]�ye?�q��R�� �Qz	���w��y��@ph�W6J�V��|J�)���Bӝ�ݝ�q���&�3���\Nm@L��zK��OF1�M 8�A�>��+ ���O�~��	�L�h�ˇ}c@��2,�=h\�B��/�Ғ��J%l���'��� ����D$z�a9+����,k�,����|؅���wIvo��=�t�W�+�^��	��dGphD䣇��U �� EƼ�/�ĩ� ��
����J���q[�x�R%=�fB���q7"p�]��x�x��}�]�d�60���@m#��o���6�bJÕ�=jgEخڲ�^8N�:�9bD�!꿪�W/�r���s�L��cT���2c��V�x�Y�&g�x�̘�y|��Aw�
?�4`xvD������v<�ۛ�t���==���;Q�PWC�b������n]�Ik�U+�rK���)~ )f4�V�6�=�kv��r�M�����J���j\+B ո��q����=�t�מz=d{�9 Ǐ�����$���iA;u�9��a���ީ��f�C�.ҽ�=��[mė{���`�jc1?E5z��Ixl)����U��ȸK�5o���#�ϗ�[�6���q8�tɐV%�Oj}��F#h��􈤱���>z��~ذո=���̬�\�J��π6K�3i��ȗJ����=�i�x���Â��8�١ӈ���(�Q�V���¨�Lc�<5�K��T��eM�)��&����t���M!�Z�%��:�&�2�\��tO�lC_����˔8�ݝP�e����`4���O�     