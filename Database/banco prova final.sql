PGDMP      #        
        }         	   adocaopet    16.6    16.6 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16501 	   adocaopet    DATABASE     �   CREATE DATABASE adocaopet WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE adocaopet;
                postgres    false            �            1259    16856    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expiration timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false            �            1259    16860    password_resets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.password_resets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.password_resets_id_seq;
       public          postgres    false    215            �           0    0    password_resets_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.password_resets_id_seq OWNED BY public.password_resets.id;
          public          postgres    false    216            �            1259    16861    pet    TABLE     �  CREATE TABLE public.pet (
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
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    adotado boolean DEFAULT false,
    tutor character varying(20)
);
    DROP TABLE public.pet;
       public         heap    postgres    false            �            1259    16885 
   pet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.pet_id_seq;
       public          postgres    false    217            �           0    0 
   pet_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.pet_id_seq OWNED BY public.pet.id;
          public          postgres    false    218            �            1259    16886    users    TABLE     \  CREATE TABLE public.users (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    whatsapp character varying(20),
    password text NOT NULL,
    entrou_com_facebook boolean DEFAULT false,
    entrou_com_google boolean DEFAULT false,
    quer_divulgar boolean DEFAULT false,
    quer_adotar boolean DEFAULT false,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    reset_token character varying(255),
    reset_token_expires timestamp without time zone,
    role character varying(50) DEFAULT 'user'::character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16896    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    219            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    220            �            1259    16897 
   volunteers    TABLE     �   CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.volunteers;
       public         heap    postgres    false            �            1259    16903    volunteers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.volunteers_id_seq;
       public          postgres    false    221            �           0    0    volunteers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;
          public          postgres    false    222            )           2604    16904    password_resets id    DEFAULT     x   ALTER TABLE ONLY public.password_resets ALTER COLUMN id SET DEFAULT nextval('public.password_resets_id_seq'::regclass);
 A   ALTER TABLE public.password_resets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            +           2604    16905    pet id    DEFAULT     `   ALTER TABLE ONLY public.pet ALTER COLUMN id SET DEFAULT nextval('public.pet_id_seq'::regclass);
 5   ALTER TABLE public.pet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            @           2604    16906    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            G           2604    16907    volunteers id    DEFAULT     n   ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);
 <   ALTER TABLE public.volunteers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �          0    16856    password_resets 
   TABLE DATA           U   COPY public.password_resets (id, user_id, token, expiration, created_at) FROM stdin;
    public          postgres    false    215   �.       �          0    16861    pet 
   TABLE DATA           �  COPY public.pet (id, name, specie, sex, age, size, state_id, city_id, description, avatar, castrated, vaccinated, vermifugate, need_special_care, docile, aggressive, calm, playful, sociable, aloof, independent, needy, friendly_with_house_with_backyard, friendly_with_apartment, sociability_cats, sociability_dogs, sociability_children, sociability_unknown, created_at, adotado, tutor) FROM stdin;
    public          postgres    false    217   /       �          0    16886    users 
   TABLE DATA           �   COPY public.users (id, nome, email, whatsapp, password, entrou_com_facebook, entrou_com_google, quer_divulgar, quer_adotar, criado_em, reset_token, reset_token_expires, role) FROM stdin;
    public          postgres    false    219   r2       �          0    16897 
   volunteers 
   TABLE DATA           G   COPY public.volunteers (id, name, email, role, created_at) FROM stdin;
    public          postgres    false    221   6       �           0    0    password_resets_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.password_resets_id_seq', 2, true);
          public          postgres    false    216            �           0    0 
   pet_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.pet_id_seq', 83, true);
          public          postgres    false    218            �           0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_id_seq', 117, true);
          public          postgres    false    220            �           0    0    volunteers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.volunteers_id_seq', 5, true);
          public          postgres    false    222            J           2606    16909 $   password_resets password_resets_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_pkey;
       public            postgres    false    215            L           2606    16911 )   password_resets password_resets_token_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_token_key UNIQUE (token);
 S   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_token_key;
       public            postgres    false    215            N           2606    16913    pet pet_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pet DROP CONSTRAINT pet_pkey;
       public            postgres    false    217            P           2606    16915    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    219            R           2606    16917    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            T           2606    16919    volunteers volunteers_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.volunteers DROP CONSTRAINT volunteers_email_key;
       public            postgres    false    221            V           2606    16921    volunteers volunteers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.volunteers DROP CONSTRAINT volunteers_pkey;
       public            postgres    false    221            W           2606    16922 ,   password_resets password_resets_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_user_id_fkey;
       public          postgres    false    215    4690    219            �      x������ � �      �   ^  x���ߎ�8Ư�S��N"�w�[T����S��	�2��;���b�/�NL[�"���}��3�#h�ES�	qMߡ�P�дP�Tuno"�Ve��m��{�f�y_��z>�p�a�$�P�L*q�+ƕ ��]�
��5����'�T�X�8��8�I�L��_B���+L��H���[����#��fs�^6U��&2�_n��&�3��'��4�z�e��|��=���~��.��<]��.1�|��p������@��^�C=�f�'�&~o�Gу�"A=�۶r6�BL��Q[d�η�4ΎD�1�nm��m���>�A�q66�|eJ�&���B��k/�W/�5��QgL%����W�V��F�RX��u}����~k����v��UFTB	�D�#��6���!4�7�I۬m��l�?r����h�TP����)���C��Sz��P)���Y�R�0�=�_T���'��{��D\xXg�$:xX���R����0"JyN���	�R��<�S�JMA�_���e4��3@��o�J�����E��n,��߭{:���W�e]b�x� �~�۟爧˃x�'RJ�8�\2��J��J�g�)?D��vö\�2,��%nJЬ��i��O����6z�v�w�ϛƾ��o�¿s��S����~@�3�3*.y����_������0����Ls���g����t�����v�����vū�)����X$L﮶Շ��(K$=�YhM�Oh�')EO���f�SF��6v����T��Ϝ�dW_�`qV׀O(ɰ̄L� ~g�gևʹ��0ܸ�^�dZ�.rN���ʐA<�Ɲ��\w\T�(Ld�G\�d2���_      �   �  x���K��: �5�+f1�['��vuUG( ��DAP
���3s�)�J�;˯�:�DL?����������OEUy(C���ڽq�mcGt���:9y���mO�E�{��~��J3F���F뉧�z����T�H��_Py���=^��3���[��x� �Ls�3�[��ЋiVc��!��{��9�&1�7�����߃z�|�����x�O��8\" ��#G`����;u��0��@sK� ��t1�����-�K?�둠�r�Dc49ى�I(��$�n��+v�j����2$f�L"���&ra8n�����Q�F9T���tC�,��x I~IL����)�|t���������}t6N'·i=��f��ɻ帪tA$��f]m�Оv�e �.�ܪ�}�N� ��q�%?+$>�U��ꤒfO�TO�kP�	1E�1h�-��3�q����0�:�Y��܉2�b��3��o�:g���,�j����o)=���,�����ش������
�#Je|\��W�]*�:M����� �@�U��ήG;�L���1xo�&2�9H�
A�S���J��M�]P_�V�i�� hDzw�̀I�<k�(�B\ަ��R��j@�H|�S����݆QI>C'���%�8��4^�+�W���b�R8������l�x{����"'=r�Q���y]��Lhq��GR�r'pǺ��H�8ɗ��J�"u��AL� ����4Q���Dʙ=�qc��3�p�@��o 4�	��.y=�:��*��N�j��t�P۪pZu�v��]4��xK��	��Ҿ�E m��_��z�+7��?�)Ndү��͝��5B�XVa�k�N�%��%�����%�cs��"Q9ܰ�Y���qwB=$ Az�����P$      �   �   x�u�A
�0@�ur�^�a2��fe�.��Bw��SH���;<�|U�VY_�Ǻi�١��}_eۺ�w]���:Z��(���O6q�T,p��e�V��s@�����㙧[�w�<=~kBC�A$],I�b���E������9�\o�[�����/3�ӿ���6jZ��
y)���DA     