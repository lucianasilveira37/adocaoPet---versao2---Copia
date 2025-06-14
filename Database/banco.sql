PGDMP  4                    }         	   adocaopet    16.6    16.6 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
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
          public          postgres    false    218            �            1259    16886    users    TABLE       CREATE TABLE public.users (
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
       public          postgres    false    218    217            ?           2604    16906    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            E           2604    16907    volunteers id    DEFAULT     n   ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);
 <   ALTER TABLE public.volunteers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �          0    16856    password_resets 
   TABLE DATA           U   COPY public.password_resets (id, user_id, token, expiration, created_at) FROM stdin;
    public          postgres    false    215   J.       �          0    16861    pet 
   TABLE DATA           }  COPY public.pet (id, name, specie, sex, age, size, state_id, city_id, description, avatar, castrated, vaccinated, vermifugate, need_special_care, docile, aggressive, calm, playful, sociable, aloof, independent, needy, friendly_with_house_with_backyard, friendly_with_apartment, sociability_cats, sociability_dogs, sociability_children, sociability_unknown, created_at) FROM stdin;
    public          postgres    false    217   �.       �          0    16886    users 
   TABLE DATA           �   COPY public.users (id, nome, email, whatsapp, password, entrou_com_facebook, entrou_com_google, quer_divulgar, quer_adotar, criado_em, reset_token, reset_token_expires) FROM stdin;
    public          postgres    false    219   N3       �          0    16897 
   volunteers 
   TABLE DATA           G   COPY public.volunteers (id, name, email, role, created_at) FROM stdin;
    public          postgres    false    221   x>       �           0    0    password_resets_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.password_resets_id_seq', 2, true);
          public          postgres    false    216            �           0    0 
   pet_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.pet_id_seq', 65, true);
          public          postgres    false    218            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 75, true);
          public          postgres    false    220            �           0    0    volunteers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.volunteers_id_seq', 1, true);
          public          postgres    false    222            H           2606    16909 $   password_resets password_resets_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_pkey;
       public            postgres    false    215            J           2606    16911 )   password_resets password_resets_token_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_token_key UNIQUE (token);
 S   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_token_key;
       public            postgres    false    215            L           2606    16913    pet pet_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pet DROP CONSTRAINT pet_pkey;
       public            postgres    false    217            N           2606    16915    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    219            P           2606    16917    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            R           2606    16919    volunteers volunteers_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.volunteers DROP CONSTRAINT volunteers_email_key;
       public            postgres    false    221            T           2606    16921    volunteers volunteers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.volunteers DROP CONSTRAINT volunteers_pkey;
       public            postgres    false    221            U           2606    16922 ,   password_resets password_resets_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_user_id_fkey;
       public          postgres    false    219    215    4688            �   �   x�]���0�jk�,`����,iH���8���h �lz�ؙ�DPJ@T|i��$u���q��P�E��7�({��8E'�э~<<���7)Kp��I��Tp��b���Y��R1�t?�R����`�� ͎��@����;���Z� @8      �   P  x�͘�N�Vǯ���][��؉t/*�.�h���mz1�����^Tꫴ���y��q�8����!!��g�?Ʋ@���q(�n��	L?�5�?#�c���3>}�����[c��.z��D�Yz�\�CJ?�c�+-ޝ>����L��H&La�#\c����G�����%=�*�:0-�ְ`�Y�܁#|������ǌ�\�8���z�16�!�y����(d,b~�����oA��J�j�R� ���\ӱW�� uHԛ�p�A�I�1�/}i,�Q���qJ��(huꖙ�ϚwQ�ݲ�Ҭ�`�q��ǣnX��E�	@F\K5py�%���LfMzd�טG(O,e	�I�rుȞ�N����8�������c�]�a�3�l~�(���=�����+�Y�J7܊'��3wtT��4���D�̯�_Ub�4<��뮷�`L�#Ե��3[xN�k���ì/	��pV��]���u��f��9;�{4iZ���7�j��oOQ�km+u�ڬ�3�� n�*���i�j]p��J��-����r��m�87�(ŕֶ��v�ԑY���'}Q�%���=����r�v��L��r�~c�}B�P��
ʙ鰑t?��oH2���|��p�V�Ɏ&��kJ�Y���xȻ��*�gz��M���<_��毈a����=?6A���%m4?/�fk~3�]Ft��7#��PSfϏ���;���Ea�j�b�8���U���-<�bP�������r��-�=%��^֯X�+�X�\s�6�n�i�+Tl^BұwFl�՟�>�"���R�N�=ܚ�L�X����i�=�e����%AN:�j%�e�%}����i��zX�B�I����:�B��[�	-��ڭS����ǯjO(�:ؗ 2����dwy�{H���&��nB+�I�>�9�
��2ˁf��|�<�B�͋�]�J���Li	闎i���yI�x��j�	PH8�u�B�ޢ��-��r� �������ӳ��֬���������뫩��ڴ3C��뼨���D��U�mq��<���ַ/�'�_��0}��ǹ�ߗ}������w�8:�z��g'''� R<��      �     x����z�����U�`���ř� j@TPy��|RN���Y7�!	��Ĥ�XU�������1b���nb1p��g������_�U�M4*�Ғs���r*+�e�s���g�l�X����ң�st���1����?0�;�H���b������FwOܧ���>��X:<�O�,���>n�M�|իf\N�^��W�G)?�v-��	(D���F�a�{{t�/�i[,� 3]��L�M����X>��q�9�ݎ�v���8������i�N��d�/�] �B���1G��Y0�EM4�:	A�/q��LfӅ��oa�1��%�0|?`�,�߻��f���Iju�؃�Ԕm��r�n���,tC
ә�ׄ�������Y$@��J
cנ�B4����l�-� ��	A	c�D���;�ݮWZ�Z��r�S�����'aÊka��L�R;u�PBC�4��+��R���cP0�K^0]t���-1ĳ�Ab�lw�K;��o�E����u��Eu���f���.�Փgg��nM�j5�f_��G��	�D���I`?#@��ȑ6`�n݊O��T�;�Mo�)<zС��%�z�؄#�G���<�	��8 8(��K��v�����س��x�n�t�X(���e�>
� ���v*gKЊ���y&��=(�G,���Ff(<������҉Y,b�1�9鴡n4�O�9�2'��(VN]����&�z�gs���䁀 #�����c+��Y>mÌ��4�\OM�^N;��@?���l�l�7���?[�1�G���`F�>/l�~Z>��B6]0�]�3���ɵo�I��ۺ5�^x(fN!Ȁ�:�~ ��'^p��:xZ>6Bj�[7��hhQҰ�+W��Ro��_Wل�����\��vU���#��
;������95>2'��}W�J�v��{�F�U�J�K�(bF�[h$���Hh���� ��47zr�6|?6��U7iy�����G���ju�G�=#m�����D%D}�1޺��  9&g
nO���c�Mˡ�ժ�q^=�SY�
xS d��C�B^�:O-�n@�ܵ@},P ��H@�R�>F�&]��f�/�S�Q�Nބ�K�wZ2V1���K:)��)���l/����ұ�p�5ĉ��~Z?	�И�|aVź �&�֜�W�c�\�Do�|��z;��~/i�(x�N>����8f,L����"|�- ��W���Zl��^Xl)���̀2���߈�s���3�qq�I�U��'�?S�����W��3�١H�[������_7u��c�I��5��(�*����g
��&F^��V��(�Γ� �|bQ9s�:}C�@�%�0;���n��A�?2F%f,��S,N���y���> ��,R�ra,�G��3���W�u�!=0HaV6�J��b�[���Sb{�DW�6fx��c¬[s�_$���vg��M��$��M�d�m�|�TA�B<��9�G�#������?����~��I<P�8�O�,��g�n��v�4���E%sԓ�γ�%�;u/ղ-�L�U:϶~��J�ܐ��t���_H$�jw��^��L���,�1?���5=<�a�[�b���źb'薞.\y�_Ҩ]cp.��G,�$�OkЯ%�s�*p����v#s[�XP�	�e���2�ZGR�;�?������8�\���>��ybc�~���u��.!"�A3JX�*K�/n�Gpat)+Y�$&�]��5���^X�(/	c����
�) N�v������}�q�D�۴����S)��Xc��mف��Nl
߆�Is���@s��ǋ���C� K�����}�_��3RT��:�t�?Ԕr��Х���з�5_6��d��۾Ue"�yob�N�x z176�����l��z�#�ͲX��¹Z׶2ir^�_��"^U%�ͱ�
��� �]��T���6�P�	K�ڃ���߂���O��;W��fc�Mx��ݸ˩0(�Ynz�b��*>{q@�,�(�=�!:�!6�*�B�����߿�͞N���t���bҹx �פ&v�hsӭ�~��-���Ff�r&��7fR3�5&���qc��E�ri�5F���hp	���2�q�`8G�HZ��b�Y&���^��o��2�Փ4#���h���
ϖ�b�g�{$�;Nb����Ux�,2 �A�w���4�h��_��/*�{���6�I�au�f���L���k1+C�}
=ӰO�{Iݠ����9hT%�찇���"V=N��\]�h/�f�MT�vmZx{vu���ƚ��
�!t1l�_1�3f(&/A�t����sP$�3��U|�%1}Tm�Ts��?D��L�����e8�U�w=�L?.�$��QC���F?��v\�<����m#V���o�8�\�^��{��]�hx���d�q��� ��Q�"rZ�>X�DX��(Ʊp�� m���Ҕ�f�!��<��wA�i�# h���@�g��ĪW��-u},홴ʧF9Y^+T��Jw
��\ONf������N�=[�F^�z�g�����*K\$�O�����0��ӇO�K`��X�������;��N�����ugm��y�L��ً�I�^�
_n��5��^5ry��Y>�,� �_����`�1b�e������Rk��a�P]K�no���+{^��B�P�i��Y�`[��l���m=C���{��g�+��ί��?wIDe��spU���ȹu�sY���~�pF.��v�k��T݈.�$=Ԕ!���)�0�|������Y      �      x������ � �     