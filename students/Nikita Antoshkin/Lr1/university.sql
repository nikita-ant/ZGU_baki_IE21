PGDMP     *                    {         
   university    15.1    15.1 &    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    16994 
   university    DATABASE     ~   CREATE DATABASE university WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE university;
                postgres    false            �            1259    17002 
   department    TABLE     �   CREATE TABLE public.department (
    id integer NOT NULL,
    d_name character varying(255) NOT NULL,
    unversityid integer
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    17052    exam    TABLE     4  CREATE TABLE public.exam (
    id integer NOT NULL,
    status integer,
    semester integer,
    subjectid integer,
    teacherid integer,
    studentid integer,
    CONSTRAINT check_semestr CHECK (((semester >= 1) AND (semester <= 16))),
    CONSTRAINT check_status CHECK ((status = ANY (ARRAY[0, 1])))
);
    DROP TABLE public.exam;
       public         heap    postgres    false            �            1259    17012    program    TABLE     �   CREATE TABLE public.program (
    id integer NOT NULL,
    p_name character varying(255) NOT NULL,
    year_num integer NOT NULL,
    passing_points integer,
    depid integer
);
    DROP TABLE public.program;
       public         heap    postgres    false            �            1259    17042    student    TABLE     �   CREATE TABLE public.student (
    id integer NOT NULL,
    stud_name character varying(255) NOT NULL,
    course integer NOT NULL,
    age integer,
    programid integer
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    17032    subject    TABLE     y   CREATE TABLE public.subject (
    id integer NOT NULL,
    s_name character varying(255) NOT NULL,
    progid integer
);
    DROP TABLE public.subject;
       public         heap    postgres    false            �            1259    17022    teacher    TABLE     �   CREATE TABLE public.teacher (
    id integer NOT NULL,
    t_name character varying(255) NOT NULL,
    rank character varying(100),
    departmentid integer
);
    DROP TABLE public.teacher;
       public         heap    postgres    false            �            1259    17074    teacher_subject    TABLE     j   CREATE TABLE public.teacher_subject (
    teacher_id integer NOT NULL,
    subject_id integer NOT NULL
);
 #   DROP TABLE public.teacher_subject;
       public         heap    postgres    false            �            1259    16995 
   university    TABLE     �   CREATE TABLE public.university (
    id integer NOT NULL,
    u_name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(100) NOT NULL
);
    DROP TABLE public.university;
       public         heap    postgres    false            +          0    17002 
   department 
   TABLE DATA           =   COPY public.department (id, d_name, unversityid) FROM stdin;
    public          postgres    false    215   E-       0          0    17052    exam 
   TABLE DATA           U   COPY public.exam (id, status, semester, subjectid, teacherid, studentid) FROM stdin;
    public          postgres    false    220   �-       ,          0    17012    program 
   TABLE DATA           N   COPY public.program (id, p_name, year_num, passing_points, depid) FROM stdin;
    public          postgres    false    216   .       /          0    17042    student 
   TABLE DATA           H   COPY public.student (id, stud_name, course, age, programid) FROM stdin;
    public          postgres    false    219   �.       .          0    17032    subject 
   TABLE DATA           5   COPY public.subject (id, s_name, progid) FROM stdin;
    public          postgres    false    218   #/       -          0    17022    teacher 
   TABLE DATA           A   COPY public.teacher (id, t_name, rank, departmentid) FROM stdin;
    public          postgres    false    217   �/       1          0    17074    teacher_subject 
   TABLE DATA           A   COPY public.teacher_subject (teacher_id, subject_id) FROM stdin;
    public          postgres    false    221    0       *          0    16995 
   university 
   TABLE DATA           ?   COPY public.university (id, u_name, address, city) FROM stdin;
    public          postgres    false    214   /0       �           2606    17006    department department_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            postgres    false    215            �           2606    17058    exam exam_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_pkey;
       public            postgres    false    220            �           2606    17016    program program_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.program DROP CONSTRAINT program_pkey;
       public            postgres    false    216            �           2606    17046    student student_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            postgres    false    219            �           2606    17036    subject subject_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_pkey;
       public            postgres    false    218            �           2606    17026    teacher teacher_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public            postgres    false    217            �           2606    17078 $   teacher_subject teacher_subject_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.teacher_subject
    ADD CONSTRAINT teacher_subject_pkey PRIMARY KEY (teacher_id, subject_id);
 N   ALTER TABLE ONLY public.teacher_subject DROP CONSTRAINT teacher_subject_pkey;
       public            postgres    false    221    221            �           2606    17001    university university_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.university
    ADD CONSTRAINT university_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.university DROP CONSTRAINT university_pkey;
       public            postgres    false    214            �           2606    17007 &   department department_unversityid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_unversityid_fkey FOREIGN KEY (unversityid) REFERENCES public.university(id);
 P   ALTER TABLE ONLY public.department DROP CONSTRAINT department_unversityid_fkey;
       public          postgres    false    214    3203    215            �           2606    17069    exam exam_studentid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_studentid_fkey FOREIGN KEY (studentid) REFERENCES public.student(id);
 B   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_studentid_fkey;
       public          postgres    false    3213    219    220            �           2606    17059    exam exam_subjectid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_subjectid_fkey FOREIGN KEY (subjectid) REFERENCES public.subject(id);
 B   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_subjectid_fkey;
       public          postgres    false    3211    220    218            �           2606    17064    exam exam_teacherid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_teacherid_fkey FOREIGN KEY (teacherid) REFERENCES public.teacher(id);
 B   ALTER TABLE ONLY public.exam DROP CONSTRAINT exam_teacherid_fkey;
       public          postgres    false    217    3209    220            �           2606    17017    program program_depid_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_depid_fkey FOREIGN KEY (depid) REFERENCES public.department(id);
 D   ALTER TABLE ONLY public.program DROP CONSTRAINT program_depid_fkey;
       public          postgres    false    3205    215    216            �           2606    17047    student student_programid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_programid_fkey FOREIGN KEY (programid) REFERENCES public.program(id);
 H   ALTER TABLE ONLY public.student DROP CONSTRAINT student_programid_fkey;
       public          postgres    false    219    3207    216            �           2606    17037    subject subject_progid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_progid_fkey FOREIGN KEY (progid) REFERENCES public.program(id);
 E   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_progid_fkey;
       public          postgres    false    3207    216    218            �           2606    17027 !   teacher teacher_departmentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES public.department(id);
 K   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_departmentid_fkey;
       public          postgres    false    3205    215    217            �           2606    17084 /   teacher_subject teacher_subject_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_subject
    ADD CONSTRAINT teacher_subject_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);
 Y   ALTER TABLE ONLY public.teacher_subject DROP CONSTRAINT teacher_subject_subject_id_fkey;
       public          postgres    false    218    3211    221            �           2606    17079 /   teacher_subject teacher_subject_teacher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_subject
    ADD CONSTRAINT teacher_subject_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher(id);
 Y   ALTER TABLE ONLY public.teacher_subject DROP CONSTRAINT teacher_subject_teacher_id_fkey;
       public          postgres    false    3209    221    217            +   �   x��N��0='Sd��9�ä�����
��"E
��y�N�g�\8U�l��go�HrCĊ��'�(��"�f�;)�����Y�X�$i����p<;��4S���!A�l�9f���Ҕ7��Ĵ#�8����i*k����      0   "   x�3�4�4bC�?.#NNcN# rb���� ER^      ,   �   x��O��0|��HH��@1��> �>`�X�HZ��	��#�������n)��-zDdݲ����X���O�#H#���<a���VJcݼ��tˁ��w�Ġ=J>��j%ָ�M����#����q��	u|7�i����C<f��c� i#�x�ę������<      /   J   x�3�0�b�ņ�.l�4�42�4�2�0��֋�6\�
5�46�4�2漰�b�M�AU-8M�b���� ��O      .   \   x�3�0��M�^��w\�ua�!��%@�v���1��^l���b�Zc.�K��=v\��4�2���b��µ��qqq 9�>k      -   a   x�U���0��a����0I�����%P (BJX��OIy�φ����
*�T�Q%�aKX��ˤQ"<��%H�D�����D��J������B�      1      x�3�4�2�4bS.#Nc.cN�=... '��      *   ?   x�3�0����9/6_ح�paօ}v_�$7_�w�Ho��AG��l����@|�=... 9-"R     