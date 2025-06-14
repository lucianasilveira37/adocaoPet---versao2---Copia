PGDMP  '                    }         	   adocaopet    16.6    16.6 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16501 	   adocaopet    DATABASE     �   CREATE DATABASE adocaopet WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE adocaopet;
                postgres    false            �            1259    16804    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expiration timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false            �            1259    16803    password_resets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.password_resets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.password_resets_id_seq;
       public          postgres    false    220            �           0    0    password_resets_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.password_resets_id_seq OWNED BY public.password_resets.id;
          public          postgres    false    219            �            1259    16759    pet    TABLE     �  CREATE TABLE public.pet (
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
       public         heap    postgres    false            �            1259    16783 
   pet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.pet_id_seq;
       public          postgres    false    215            �           0    0 
   pet_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.pet_id_seq OWNED BY public.pet.id;
          public          postgres    false    216            �            1259    16784    users    TABLE       CREATE TABLE public.users (
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
    reset_token_expires timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16794    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    218            �            1259    16819 
   volunteers    TABLE     �   CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.volunteers;
       public         heap    postgres    false            �            1259    16818    volunteers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.volunteers_id_seq;
       public          postgres    false    222            �           0    0    volunteers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;
          public          postgres    false    221            C           2604    16807    password_resets id    DEFAULT     x   ALTER TABLE ONLY public.password_resets ALTER COLUMN id SET DEFAULT nextval('public.password_resets_id_seq'::regclass);
 A   ALTER TABLE public.password_resets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            )           2604    16795    pet id    DEFAULT     `   ALTER TABLE ONLY public.pet ALTER COLUMN id SET DEFAULT nextval('public.pet_id_seq'::regclass);
 5   ALTER TABLE public.pet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            =           2604    16796    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            E           2604    16822    volunteers id    DEFAULT     n   ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);
 <   ALTER TABLE public.volunteers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �          0    16804    password_resets 
   TABLE DATA           U   COPY public.password_resets (id, user_id, token, expiration, created_at) FROM stdin;
    public          postgres    false    220   Z.       �          0    16759    pet 
   TABLE DATA           }  COPY public.pet (id, name, specie, sex, age, size, state_id, city_id, description, avatar, castrated, vaccinated, vermifugate, need_special_care, docile, aggressive, calm, playful, sociable, aloof, independent, needy, friendly_with_house_with_backyard, friendly_with_apartment, sociability_cats, sociability_dogs, sociability_children, sociability_unknown, created_at) FROM stdin;
    public          postgres    false    215   �.       �          0    16784    users 
   TABLE DATA           �   COPY public.users (id, nome, email, whatsapp, password, entrou_com_facebook, entrou_com_google, quer_divulgar, quer_adotar, criado_em, reset_token, reset_token_expires) FROM stdin;
    public          postgres    false    217   �2       �          0    16819 
   volunteers 
   TABLE DATA           G   COPY public.volunteers (id, name, email, role, created_at) FROM stdin;
    public          postgres    false    222   @=       �           0    0    password_resets_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.password_resets_id_seq', 2, true);
          public          postgres    false    219            �           0    0 
   pet_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.pet_id_seq', 59, true);
          public          postgres    false    216            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 71, true);
          public          postgres    false    218            �           0    0    volunteers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.volunteers_id_seq', 1, true);
          public          postgres    false    221            N           2606    16810 $   password_resets password_resets_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_pkey;
       public            postgres    false    220            P           2606    16812 )   password_resets password_resets_token_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_token_key UNIQUE (token);
 S   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_token_key;
       public            postgres    false    220            H           2606    16798    pet pet_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pet DROP CONSTRAINT pet_pkey;
       public            postgres    false    215            J           2606    16800    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    217            L           2606    16802    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            R           2606    16829    volunteers volunteers_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.volunteers DROP CONSTRAINT volunteers_email_key;
       public            postgres    false    222            T           2606    16827    volunteers volunteers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.volunteers DROP CONSTRAINT volunteers_pkey;
       public            postgres    false    222            U           2606    16813 ,   password_resets password_resets_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_user_id_fkey;
       public          postgres    false    217    220    4684            �   �   x�]���0�jk�,`����,iH���8���h �lz�ؙ�DPJ@T|i��$u���q��P�E��7�({��8E'�э~<<���7)Kp��I��Tp��b���Y��R1�t?�R����`�� ͎��@����;���Z� @8      �   �  x�͗�n�F����-P!%��7ډ�U DW�0"��JK��%����Jr0R�O��,%1�ŢB	^ɒ8?��fgmO|�D��,���-�2Q|��3L9���_�� 7l�Y�\z��R�e٫�6� 2�;��gV}�|aO c���,���W��4E������I�)GxX���װ)`�y�=�+��*?���ǜy\�$��iz�1x�We����)dlb����U�@�ReRuC)Mf��u��:��zy�:!��[x�a�i�	B i�RP�l�JR�)>K����;fV�j�U�w�brH�v���;L}Ú��r�eh�$ �����x��!G�'k��%=�9}�����2��d)M��"B�������G�F�Nyv]y���ߠ���hP�D�:�>n `e*�h'��:�h<�P9����W��R�dy���{����6��z?�	��1�a[��<��禸�)�fM����
g��$�Ӧ`�X����ޣIS�:�W�UUc�}��^o[i�f��Y]I�Ui,�OҸ׺��+��[ڷ��z�.��q��U�+�m��w���{�Rjx?����t�$��3��9�u�ٺ2]G�M$�m��;�5}�@�sX06��{|��$|��/^��Ju#9�d�sM-�S��R�n&������cR��6?ХS�3��V5���.��30�M��%�m�gC8u�P/;�j<ǚ2{~d�ϴ����W�M�����p���V����(\�MH�r�V����>PR�]a��QRM��u��M�aO��_�-7k�&]v�BE�����q�^����,�?k1:9�dgv09b��x�Ӯ��ضe�7��9�����!�����.�O�����f-d��$�h=n��#��<��h蟵�N�l`���� ��9�vtp�A�"�s7�����$��'�"�;�6��.�����X��Z��
�����E����)�!�ښ�_�����D��T      �   R
  x����~�������LwA��� �DDD�ߙ ��������}��b���w�Ī�>���.�gv�����a�<E�Y!��_�k�����g��:��(����X�G�\u�Φ�ՙSD@LU�n��ED|��|�p�'F�ĘHMHf�C@�����Y� ��R���~����T.O{瓶�lc;�M�U����+���Xs�
�(����C�M
�*�wX?�=>��d��r�#�������Qk=Y�h̙��l�c��x�=�諫}�v�S;;����! wD���	Gj�y8/ĵhiM��Wq�=Zk�ϖ���#ƛ3�P�'���5 ��a�~x�yiUܝ�VЌ���Z1�`�T��0�v��fs)��)yaM��}�H�||+)l�]�ʥh���l�W�R
�F ���m�VȢ����:]-m��[9ĭ������'aˊa�����n�|�D�F���p^��:cغ&�E����Z'~��C|�����!�馐�h����u����\����w�����3w�Mg�l�@i��q$�ݰ�q�����3����Y�cp˼���ag"C��~�AǇ.�-�R�֮S�p��o��=���EM��A ~egnxq�_Ǟe4�pG%g�B	�d�a�(,W H����"WM@+"��T�1��g�A�?c�&�a�!��O�o��3"$���X̨	ʜt�RwԊ/��ט���k�i
S��v[���9~�ŀ@�>�`$>"���~n^���1��(*�(��������~	t��OV�Η{s���X�7����`�	fD���v���+,�@,,�x�LN�})y��:) �1�k:3��b�bсI�CG���`�8�cH6���2{�y魊���:N[��u����j�'�U>���`��ˌ7Vuq-?1�R���8���ϡ�8A\�o��TQdWL�ghtV��L�t́"�j@3]��VBX�mx�~ѿ���������<��K�O�v�%�WN@j��z�F{Fk���[�7D�(��"�޺��&�����GR����s�hwc�NQ ����v�f�����?`�n��B^�&gG�nA�|h�^�( Yn$��R�#��[��V,�S�S�n��:��wR�c3���+:���)_,��k\�﵈?���8��Eq����/���R\\�U�)��M��.�k[\���hqM6z7o/'*M�%O}=>�$N�A!�s���V�����P�#�%A��G�Z����́2O��߉�����#�zI��$�n��'��������18�y&�ev��0̛i���u۴�j���N_�i����R�H0P�N����,O�4.�㙜 �#U0W�o)H�tE�aǗ�����R0� �N�ø�̥�ʒŉ��# ��� �g��ԥ��<)3�9��W�7��Cz�#�, Ey��4"��(vd�#`o�a\o��oC3}��1a~[9��Q�oP�s�H����`�\��~ۨ�ڸ%,k�0�	����Jɚ,V2 �;�}l����Ąb G��~�W��"<�GC�nw+�iS�m"*���֞���<���w�ծ�M:�:u&�FP��R87���:@@�$Ս7�M/��x}Fה�vC�����6����Ŭ��f��Aϖ���/Y�m0(Kh�3�$�e�5e� RU
�Fp��g���-���O�ev�\I�wG�D�[~-�w���s�;�}����I�jb��+�t	-�S�J��T�̠�ˏ���R^��IL�]�V��^X�T����p���?@nBa=���4�R�ߔ�7��*x�U��A&e�;k�Q`������Ķl����q�õ��>^�7�x%J�Xr$�_�6@�Ӱ��@�ϟ���_6��������x`��c.�n�����s��y}���X�"�}ob�N��}37�����l����z�@#�ͲX��AYk[��/��z�LVu��26��S	ݝ���<Ӎ}[�F����ԫ=��J�=̂�@�T�|��.Z�d���F���Kn���7�wv>�����d�­�2��`cWES��W�������O'�~��^��rz��p�_ӆحE�),����v�������,�[ܙi�8l�soǍ�o.�.��^5��xFۀK�4�1�#0�9jDZ��:a5E����/�;�o�:=�rB �=��ct>z1*E�G"pbhv�>l^o�E /�����5���%�DUT�-�Ի�K@J��"�����h%�N����#VE��z�a�R;�*ɼ���ׯ9hT#������<Ƭ�LWY�h��͏pa�����߳+.k��]���Ű����1�1C2y���k�V*�a�>��&��U�W��Q��S�I����Ι$=�k�^�p lZ�~� z�L?.�$��!��۱�~"�����r���S��m!�����.����\��^����2��4��/�GU�Z ���-@E��ia��`qa}�������I�'KS�O�!�pm����������@�,�ȯB�U��V���X�siU��j�^kT������):�y=����F�#�I���lUfy9���!�*o�U�zH֟>�.^/�aJ��?|�/��c18��?�Ǐ����      �      x������ � �     