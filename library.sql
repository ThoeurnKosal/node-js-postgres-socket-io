PGDMP     $                    w            library    10.9    10.9     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �
           1262    87576    library    DATABASE     �   CREATE DATABASE library WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE library;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    96003    book    TABLE     �   CREATE TABLE public.book (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    author character varying(255) NOT NULL
);
    DROP TABLE public.book;
       public         postgres    false    3            �            1259    96001    book_id_seq    SEQUENCE     t   CREATE SEQUENCE public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.book_id_seq;
       public       postgres    false    197    3            �
           0    0    book_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;
            public       postgres    false    196            o
           2604    96006    book id    DEFAULT     b   ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);
 6   ALTER TABLE public.book ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
          0    96003    book 
   TABLE DATA               0   COPY public.book (id, name, author) FROM stdin;
    public       postgres    false    197   �       �
           0    0    book_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.book_id_seq', 19, true);
            public       postgres    false    196            q
           2606    96011    book book_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public         postgres    false    197            �
   �   x�uP�N�0=�_�/@�����8B�ʥ��:-�W'%��u�4F���~�^�
>L�b��C{�u�Ԫ���R�����!�&��k���O)�>�~��Y�dv�y�!��w����-�-��\c|3���[Y��U� �s'�87 ��ʱ��e�p>W��� #I���VBP�RV��B�b�G�@^OR)/pc�ʅ���Ud��bz���Ԗ?��6¯;D�Q��P     