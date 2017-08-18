--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO blog;

--
-- Name: category; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE category (
    id integer NOT NULL,
    name character varying(100),
    slug character varying(100),
    is_menu integer
);


ALTER TABLE category OWNER TO blog;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO blog;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE contact (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    email character varying(255),
    comment text,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE contact OWNER TO blog;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_id_seq OWNER TO blog;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: email; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE email (
    id integer NOT NULL,
    email character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE email OWNER TO blog;

--
-- Name: email_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_id_seq OWNER TO blog;

--
-- Name: email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE email_id_seq OWNED BY email.id;


--
-- Name: emailgroup; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE emailgroup (
    id integer NOT NULL,
    email_id integer,
    group_id integer,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE emailgroup OWNER TO blog;

--
-- Name: emailgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE emailgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emailgroup_id_seq OWNER TO blog;

--
-- Name: emailgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE emailgroup_id_seq OWNED BY emailgroup.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE event (
    id integer NOT NULL,
    title character varying(500),
    slug character varying(500),
    description text,
    date timestamp without time zone,
    feature_image character varying(300),
    views integer,
    user_id integer,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE event OWNER TO blog;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE event_id_seq OWNER TO blog;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE event_id_seq OWNED BY event.id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE "group" (
    id integer NOT NULL,
    name character varying(255),
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE "group" OWNER TO blog;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_id_seq OWNER TO blog;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE group_id_seq OWNED BY "group".id;


--
-- Name: member; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE member (
    id integer NOT NULL,
    name character varying(50),
    slug character varying(50),
    feature_image character varying(300),
    possition character varying(300),
    detail text,
    facebook character varying(500),
    linkin character varying(500),
    duty character varying(500),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE member OWNER TO blog;

--
-- Name: member_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE member_id_seq OWNER TO blog;

--
-- Name: member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE member_id_seq OWNED BY member.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE page (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    description text,
    published_at timestamp without time zone DEFAULT now(),
    is_menu integer
);


ALTER TABLE page OWNER TO blog;

--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE page_id_seq OWNER TO blog;

--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE page_id_seq OWNED BY page.id;


--
-- Name: partner; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE partner (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    url character varying(100),
    description text,
    feature_image character varying(300),
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE partner OWNER TO blog;

--
-- Name: partner_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partner_id_seq OWNER TO blog;

--
-- Name: partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE partner_id_seq OWNED BY partner.id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE post (
    id integer NOT NULL,
    title character varying(255),
    description text,
    link character varying(255),
    feature_image character varying(300),
    slug character varying(255),
    category_id integer,
    user_id integer,
    published_at timestamp without time zone DEFAULT now(),
    views integer,
    images text,
    trainers character varying(150),
    price integer,
    location character varying(300),
    date character varying(200)
);


ALTER TABLE post OWNER TO blog;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_id_seq OWNER TO blog;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE post_id_seq OWNED BY post.id;


--
-- Name: user_member; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE user_member (
    id integer NOT NULL,
    name character varying(50),
    email character varying(100),
    password character varying(600),
    password2 character varying(200),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE user_member OWNER TO blog;

--
-- Name: user_member_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE user_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_member_id_seq OWNER TO blog;

--
-- Name: user_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE user_member_id_seq OWNED BY user_member.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY email ALTER COLUMN id SET DEFAULT nextval('email_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup ALTER COLUMN id SET DEFAULT nextval('emailgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY "group" ALTER COLUMN id SET DEFAULT nextval('group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY member ALTER COLUMN id SET DEFAULT nextval('member_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY page ALTER COLUMN id SET DEFAULT nextval('page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY partner ALTER COLUMN id SET DEFAULT nextval('partner_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post ALTER COLUMN id SET DEFAULT nextval('post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY user_member ALTER COLUMN id SET DEFAULT nextval('user_member_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY alembic_version (version_num) FROM stdin;
98bf1cfd3ba5
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY category (id, name, slug, is_menu) FROM stdin;
1	Slide	slide	0
2	what we do	what-we-do	0
3	News	news	0
4	resources	resources	0
5	Get Involved	get-involved	0
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('category_id_seq', 5, true);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY contact (id, firstname, lastname, email, comment, published_at) FROM stdin;
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('contact_id_seq', 1, false);


--
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY email (id, email, firstname, lastname, published_at) FROM stdin;
\.


--
-- Name: email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('email_id_seq', 1, false);


--
-- Data for Name: emailgroup; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY emailgroup (id, email_id, group_id, published_at) FROM stdin;
\.


--
-- Name: emailgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('emailgroup_id_seq', 1, false);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY event (id, title, slug, description, date, feature_image, views, user_id, published_at) FROM stdin;
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('event_id_seq', 1, false);


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY "group" (id, name, published_at) FROM stdin;
\.


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('group_id_seq', 1, false);


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY member (id, name, slug, feature_image, possition, detail, facebook, linkin, duty, created_at) FROM stdin;
1	Ms. Suyheang KRY	ms-suyheang-kry	20170818183556343981-aa3ff6d2f13d4b8ae4aec358a51204a4--business-headshots-business-portrait.jpg	Executive Director	<p class="">Ms. Kry is the executive director of Women Peace Makers (WPM). Born and raised in a conservative family in the post conflict context, Ms. Kry witnessed and understood well the pressure of traditional gender norms on women and girls in Cambodia. Growing up striving to challenge the status quo, Ms. KRY dreams to see a nonviolent and gender-just world where everyone are able to reach their full potential and resolve conflict their nonviolently. Over the years, Ms. Kry has developed her expertise and research interest in gender, mediation, conflict transformation, and transitional justice. Prior to joining WPM, she served as the deputy director of Anlong Veng Peace Center, a peace-building initiative housed at the Documentation Center of Cambodia (DC-Cam) aiming to transform Cambodia’s former battle field and Khmer Rouge stronghold into an educational and historical learning site. Before that, Ms. Kry held a research role focusing on the Myanmar peace process and communal violence, at the Centre for Peace and Conflict Studies (CPCS), a NGO working in the field of conflict transformation to strengthen strategic intervention into violent conflicts in the Asia region. Through her many years of work with DC-Cam, Ms. Kry had worked directly with Khmer Rouge survivors across the country, documented specifically about women survivors’ stories, and supported them in their efforts to seek justice before the Extraordinary Chambers in the Courts of Cambodia (ECCC), an internationalized tribunal established to bring surviving leaders of the Khmer Rouge to trials. Ms. Kry holds a Master’s Degree in Peace and Conflict Studies from the University of Massachusetts Lowell, USA, and a Bachelor of Education from the Royal University of Phnom Penh.<br></p>	www.facebook.com	www.linkedin.com	It's People	2017-08-18 18:35:55.812366
\.


--
-- Name: member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('member_id_seq', 1, true);


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY page (id, title, slug, description, published_at, is_menu) FROM stdin;
1	WHO WE ARE	who-we-are	\r\n                <p></p><p class="">As a longstanding NGO working responsibly in Cambodia since 2003, WPM has developed its guiding principles over time through hard work and significant learning. Our vision, mission, and values are more than an organizational process, they shape who we are, what we do, and how we do it. <br></p><p></p>\r\n              	2017-08-18 18:14:44.688691	0
2	WHAT WE DO	what-we-do	<p class="">Women Peace Makers works on gender and peacebuilding initiatives that contribute to its vision of a peaceful and just society where women and men are able to reach their full potential, take leadership, and directly contribute to promoting gender equality, transforming conflict, and creating a culture of nonviolence. <br></p>	2017-08-18 18:15:42.264818	0
3	GET INVOLVED	get-involved	<p class="">Congratulations! We are connected. We believe you are here because you have the same passion and goal like us. As you do your part, your presence will influence and inspire others to do the same. As you be the change, you will inspire others to do the same and be the change they wish to see in this world. Join us now to learn many ways we can inspire each other and be part this endeavor - together for gender equality and peace. <br></p>	2017-08-18 18:16:16.87951	0
4	Our organizational pledge	our-organizational-pledge	<p class="">As a longstanding NGO working responsibly in Cambodia since 2003, WPM has developed its guiding principles over time through hard work and significant learning. Our vision, mission, and values are more than an organizational process, they shape who we are, what we do, and how we do it. <br></p>	2017-08-18 18:29:34.458069	0
5	Our Vision	our-vision	\r\n                <p></p><p class="">A peaceful and just society where both women and men can reach their full potential, take leadership, and directly contribute to promoting gender equality, transforming conflict, and creating a culture of nonviolence.<br></p><p></p>\r\n              	2017-08-18 18:30:24.222535	0
6	Our mission	our-mission	<p class="">To empower, engage, and work together with women and men on issues of gender and conflicts in Cambodia by tapping into the strength and leadership of women and peacebuilders.<br></p>	2017-08-18 18:31:37.801974	0
7	Our Values	our-values	<p class="" style="text-align: center;"><b>Women are equal</b><br></p><p class="" style="text-align: left;">We believe women are intrinsically equal to men and must be partner with men in decision making, leadership, peacebuilding and development.<b><br></b></p><p style="text-align: center;"><b>Peace is now and begin with us</b></p><p>We believe that finding peace in oneself allows us to contribute towards finding peaceful solutions to all conflicts, big and small, and we ultimately strive to transform conflict through nonviolence.=</p><p style="text-align: center;"><b>Mindfulness is key</b></p><p>We use nonviolence principles that are constantly reflected upon to ensure our approach is human and in line with our own value and belief as gender advocates and peacebuilders working in participation with our partners and accountable to those we serve. Continued to learn, reflect and share our approach.  </p><p class="" style="text-align: left;"><br></p>	2017-08-18 18:33:46.647493	0
8	Our Story	our-story	<p>WPM began as a small working group in 2000, mostly comprised of female university students concerned about violence against women in their communities. In 2003, we formally registered as an NGO in Cambodia and focused our efforts on delivering trainings on conflict resolution and women rights protection for women and rural communities. At the same time, we sought to build networks of women and youth to engage in dialogue on women rights and contribute to positive social change. </p><p>Today’s WPM is the culmination of over a decade and a half of action and learning in the field. We have learned that although women are more likely to be victims of violence and require specific support, they are also key agents of change in their communities and in society at large. We have also learned that men, who may often be the perpetrators of gender-based violence, are fundamental allies in fighting for gender equality and engaging in conflict transformation. Our efforts to achieve gender equality and peace, and to leverage female leadership to transform conflict at every level of society, require the support and collaboration of everyone, including the youth. </p>	2017-08-18 18:34:43.724706	0
9	partners	partners	\r\n                <p></p><p class="">Investing in gender equality and peacebuilding in Cambodia benefits all women, men, and children. We could not accomplish our goals without the support, enthusiasm, and involvement of our committed supporters.<br></p><p></p>\r\n              	2017-08-18 18:38:26.112777	0
10	Our Thematic Expertise	our-thematic-expertise	<p>Women Peace Makers works on gender and peacebuilding initiatives that contribute to its vision of a peaceful and just society where women and men are able to reach their full potential, take leadership, and directly contribute to promoting gender equality, transforming conflict, and creating a culture of nonviolence. </p><p>We do this by developing interventions that incorporate gender and peacebuilding elements, informed by theory and critical analysis of issues that the people we serve wish to change, transform, learn from, or replicate in their communities. We also serve as a knowledge hub, taking our lessons to others that might benefit from them in their own contexts, including communities, local organizations, and government bodies.</p>	2017-08-18 18:40:35.733889	0
11	Our Approaches	our-approaches	<p class="">Our initiatives take various approaches depending on the type of intervention being used and the well-defined goal shared by all partners and participants involved. In order to be fully effective, all work must incorporate one or more of the following approaches:<br></p>	2017-08-18 18:41:45.004241	0
12	Knowledge seeking	knowledge-seeking	<p class="">It may be research or analysis based, primarily to explore a situation or gain knowledge about a context or prevailing dynamics by gathering data or analysing information. The findings of these projects may be used to better inform us or other WPM stakeholders on issues that affect our work. <br></p>	2017-08-18 18:42:12.552131	0
13	Training	training	<p class="">It may be focused on training and knowledge sharing, usually in the form of interventions that affect our target communities or beneficiaries through informed content that contributes to changing behaviour, building capacity, and/or creating networks.<br></p>	2017-08-18 18:42:56.435955	0
14	Mobilization	mobilization	<p class="">It may center on knowledge mobilization and/or advocacy to take knowledge or information, either based on existing projects or from other initiatives, to intended audiences for uptake. They can include dissemination projects or communication initiatives that aim to influence policy or practice. They may also consist of core network-building initiatives that aim to bring together particular groups for joint action and/or dialogue on key issues.<br></p>	2017-08-18 18:43:13.924506	0
15	Our Work	our-work	<p class="">WPM works on a portfolio of initiatives and projects under our gender and peacebuilding programs in order to achieve our overall objectives. We incorporate our different approaches to intervene in areas that benefit from a gender lens and strive toward transforming conflict. Our activities range from research, trainings, and advocacy.<br></p>	2017-08-18 18:43:49.482825	0
16	Resources	resources	\r\n                <p></p><p>WPM compiles relevant resources on conflict, violence, and gender in Cambodia and elsewhere to better inform and guide our programming.</p><p></p>\r\n              	2017-08-18 19:11:12.582252	0
17	Get Involved	get-involved	<p class="">Congratulations! We are connected. We believe you are here because you have the same passion and goal like us. As you do your part, your presence will influence and inspire others to do the same. As you be the change, you will inspire others to do the same and be the change they wish to see in this world. Join us now to learn many ways we can inspire each other and be part this endeavor - together for gender equality and peace. <br></p>	2017-08-18 19:40:44.015916	0
18	Take Action	take-action	<p class="">Your contribution indeed matters.<br></p>	2017-08-18 19:57:25.220617	0
19	Volunteer	volunteer	<p class="">No opening call for volunteer at the moment.<br></p>	2017-08-18 19:58:04.704362	0
20	Donate us	donate-us	<p class="">Your donation will allow us to expand our targets and contribute to making a different in the community we serve – for gender equality and peace.<br></p>	2017-08-18 19:58:26.795944	0
\.


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('page_id_seq', 20, true);


--
-- Data for Name: partner; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY partner (id, name, slug, url, description, feature_image, published_at) FROM stdin;
1	SmallWorld	smallworld	www.facebook.com	<p class="medium-insert-active"><br></p>	20170818183710294931-logo-title-dark.png	2017-08-18 18:37:09.75565
\.


--
-- Name: partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('partner_id_seq', 1, true);


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY post (id, title, description, link, feature_image, slug, category_id, user_id, published_at, views, images, trainers, price, location, date) FROM stdin;
1	Women Peace Makers	<p class="">Women Peace Makers is a non-governmental organization working on issues of peace and gender across Cambodia. We work directly with women and men to tackle gender based violence, transform conflict, and mobilise leadership to contribute to gender equality and peacebuilding initiatives.<br></p>		20170818181729662038-maxresdefault.jpg	women-peace-makers	1	1	2017-08-18 18:17:29.105283	0			0		
2	Who is listening: Tackling hard issue with empathy	<p class="">This publication is a result of three months field work by twelve listeners employing Facilitative Listening Design (FLD) to understand the dynamics of anti-Vietnamese sentiment in Cambodia. It explores opinions and perceptions of anti-Vietnamese sentiment in Cambodia from very different viewpoints. Also, it reveals the internal process and the potential of using FLD to encourage critical thinking and discussion to move beyond protracted negative sentiment. <br></p>		20170818181819352115-maxresdefault.jpg	who-is-listening-tackling-hard-issue-with-empathy	1	1	2017-08-18 18:18:18.800173	0			0		
3	Gender and Peace Leadership Program	<p class="">As youth under 35 consists of more than two third of the population, we believe that a great potential for the realization of gender equality and peacebuilding lies in the hands of our youth GPLP thus provides youth an opportunity to develop their leadership potentials and cultivate necessary analytical skills and knowledge on gender and peace with an aim to empower them to utilize their leadership and become the change they wish to see in their community in tackling gender based violence and creating a culture of nonviolence.<br></p>		20170818181855177926-cambodia1.jpg	gender-and-peace-leadership-program	1	1	2017-08-18 18:18:54.629562	0			0		
4	Prevention of Gender Based Violence in the Community 	<p class="">1 in 3 women across Cambodia suffers from gender based violence and 49 percent of them do not seek help thinking that GBV is acceptable. Child marriage remains a concern with 4% to 6% girl married between the age of 15 and 17. PGBV seeks to reduce GBV through raising awareness and challenging gender norm, increasing understanding of sexual reproductive health issues, and strengthening a supportive and caring community intolerant of GBV.<br></p>		20170818181927735979-maxresdefault.jpg	prevention-of-gender-based-violence-in-the-community	1	1	2017-08-18 18:19:27.161163	0			0		
5	Gender & Women’s Issues Program	\r\n                <p></p><p class="">Our Gender & Women’s Issues Program hosts projects that focus on gender dynamics, women’s rights and leadership dealing with a range of issues relevant to society at large, including children. These initiatives incorporate a focused gender lens and strive to improve the lives of women and/or youth. We tackle women’s leadership, empowerment, equality, and strengthen networks for dialogue on gender and women’s issues. Our Gender & Women’s Issues Program additionally incorporates peacebuilding elements that intersect with gender issues and builds upon Sustainable Development Goal 5 to promote gender equality and empower all women and girls. Our efforts in this area continually seek to leverage the potential of women leadership and participation while still recognizing the work that needs to be done to protect women and their rights. <br></p><h6><b>1. Prevention of Gender Based Violence</b></h6><p class="">1 in 3 women across Cambodia suffers from gender based violence and 49 percent of them do not seek help thinking that GBV is acceptable. Child marriage remains a concern with 4% to 6% girl married between the age of 15 and 17. PGBV seeks to reduce GBV through raising awareness and challenging gender norm, increasing understanding of sexual reproductive health issues, and strengthening a supportive and caring community intolerant of GBV. PGBV also equips participants with effective conflict transformation skills to address their daily conflict nonviolently and empower the participant to build first a peaceful mind and next a peaceful family and community. We works directly with women and men in the community, youth, Commune Committee for Women and Children, and local authority. <br></p><h6><b>2. Women Peacebuilders Leadership</b></h6><p class="">Over time, we’ve shifted from seeing women as primarily victims of violence to seeing them as strong leaders for peace and real agents for change at all levels of society. We believe that women empower themselves and by mobilizing together, can intervene directly in community conflict, envision creative solutions, participate in and influence policy development, and transform relationships that may be stuck in deep protracted conflict. With this in mind, WPM is working to bring like-minded women together from all corners of Cambodia to learn from one another and collaborate to build peace in diverse contexts and situations throughout the country. Our network of women peacebuilders is made up of leaders and aspiring leaders to take gender and conflict transformation principles and tools to their work and lives and bring change to themselves and those around them. <br></p><h6><b>Send girls to school</b></h6><p class="">Research has shown that women of no education suffers twice the violence against them than the educated ones. Unfortunately in Cambodia, uneducated women and girls are among the poorest making education a costly and illusion dream. Send Girls to School is an initiative by our like-minded youth seeking to change the life of the girls in the rural areas of Cambodia who suffer from domestic violence, poverty, and other obstacles preventing her from achieving her full potentials. Only 16 USD can support a girl in Trapeang Kea village to go to school for one month.<br></p><p></p>\r\n              		20170818184658980696-maxresdefault.jpg	gender-womens-issues-program	2	1	2017-08-18 18:46:58.423082	0			0		
6	Peace & Conflict Transformation Program	<p class="">Our Peace & Conflict Transformation Program is made up of diverse initiatives focusing on conflict analysis, prevention, management, resolution, and/or transformation through peacebuilding efforts. Peacebuilding tools, such as mediation, nonviolence communication, qualitative research, or conflict transformation workshops are important components in our interventions. Gender elements are also always included and specific gender lenses may also be incorporated, leveraging on the knowledge and resources of our gender work. With an overarching vision of the principles of negative and positive peace and Sustainable Development Goal 16 to promote peace and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels, our Peace & Conflict Transformation Program works to positively transform conflict at any level. <br></p><h6><b>1. Promoting Nonviolence in Addressing Conflict</b></h6><p class="">We believe there is always a nonviolence way to all violent conflict situations. Nonviolence begins with the choice to reject violence as a means to an end. In contemporary Cambodia context of social conflicts, however, violence remains the last, if not the first, resort to resolving conflict and thus effective and sustainable resolutions have been few. Violence will always breed violence. In the case of protracted land conflict, for example, where women and children suffer the most, the villagers have learned their hard lesson that being violent will not bring them anywhere far to a long-term solution. We thus train the community leaders and members in various strategies, including art, of active nonviolence to better express themselves, dialogue and demand for their human rights nonviolently. Another important element of the program is that we work to plant the seed of nonviolence as a way of life and not just a method to struggle for land right justice. </p><h6><b>2. Promoting Inter-ethnic harmony </b></h6><p class="">Ethnically speaking, Cambodia is a diverse country. Though 90% of the population is predominately Khmer, 10% of the population is made up of a rich mix of both indigenous and non-indigenous ethnic minorities. Through our work on conflict and violence, we have heard from specific ethnic communities who experience anti-sentiment or discrimination based on their ethnic identity. We have also learned that different ethnic communities face different contexts and have unique needs. Within this scope, we have committed to better understand how conflict and violence affect groups such as the ethnic Vietnamese, the Cham Muslims, and the indigenous, for example. We are employing an adapted version of Facilitative Listening Design, a conflict transformational research tool to better understand and talk about difficult issues in our society. As we continue to work to understand deeper protracted social conflicts, we use our findings to better inform our work and develop more relevant approaches to confront and transform conflict.  <br></p>		20170818185314977583-cambodia-tour-3-265.jpg	peace-conflict-transformation-program	2	1	2017-08-18 18:53:14.448252	0			0		
8	Gender and Peace Leadership Programs	\r\n                <p></p><p class="">With almost two-thirds of the population under 35, Cambodia has one of the youngest populations in the region. The tragic history of the country having gone through a massive genocide in relatively recent times (1975-1979) has certainly altered the current demographic make-up. At the same time, it has contributed to a social generational divide between those who lived through the genocide, and those born after. With starkly different perspectives and ideas for the future, we have found that a great potential for the realization of gender equality and peacebuilding lies in the hands of our youth. We have been working through this initiative to train young people in the city and rural areas with necessary analytical skills and knowledge on leadership, gender and peace. The program also mobilizes and empowers them to take the lead in making a difference and becoming the change they wish to see in their community in tackling gender based violence and creating a culture of nonviolence. Our young leaders are focused on shaping a future that brings peacebuilding and gender equality to the forefront of Cambodia.<br></p><p></p>\r\n              		20170818185550456670-cambodia1.jpg	gender-and-peace-leadership-programs	2	1	2017-08-18 18:55:28.072154	0			0		
9	News for testing WPM website	<p class="">Text to be giving later: stories from the field, story of women of nonviolence, success story, training event, reactions/quotes from the participants, outside news related to wpm or gender, peace, leadership, etc<br></p>		20170818190259641868-maxresdefault.jpg	news-for-testing-wpm-website	3	1	2017-08-18 19:02:59.06131	0			0		
10	Tom and Jerry 	<p class="">In the middle of the night, Tuan Ngo and his father fled their home in war-torn Vietnam. But slipping away on a tiny boat was only the beginning of this young boy's journey to freedom. "Leaving Vietnam" is the true story of Tuan's escape, a first-person telling of his experience as a boat boy and refugee.<br></p>	www.facebook.com	20170818190559612160-7405685.jpg	tom-and-jerry	4	1	2017-08-18 19:05:59.071708	0			0		
11	Labor and human rights NGO launches book on the impact of extra-judicial killings on families of victims	<p class="">The Center for Trade Union and Human Rights (CTUHR) in partnership with the Pro-Labor Legal Assistance Center (PLACE) with support from the European Union (EU) launched on Thursday, August 25, From Despair to Defiance, a book on the impact of extra-judicial killings, enforced disappearances and other human rights violations on the families of victims, at the Kowloon House West Avenue, Quezon City. Norman Tubera, CTUHR Project Manager for the EU-funded project for the Rehabilitation of Families of Victims of EJKs, EDs and Arbitrary Detention Towards Ending These Violations noted the book’s .<br></p>	www.test.com	20170818190709717742-From-Despair-to-Defiance-Front-Cover.jpg	labor-and-human-rights-ngo-launches-book-on-the-impact-of-extra-judicial-killings-on-families-of-victims	4	1	2017-08-18 19:07:09.166654	0			0		
12	Test Get Involved	<p>Test get involves</p>		20170818201504249010-cambodia-tour-3-265.jpg	test-get-involved	5	1	2017-08-18 20:15:03.698348	0			0		
\.


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('post_id_seq', 12, true);


--
-- Data for Name: user_member; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY user_member (id, name, email, password, password2, created_at) FROM stdin;
1	SAN Vuthy	san.vuthy08@gmail.com	$6$rounds=656000$SHnm6EwHK3vhq7o3$Zjs4B0l0sKOHE79qMdmcLYVMzUBq7cVzpl5F5qVZjPOed8Y/PWdTCI4c8BQkQw7b/5SB6tMO0kUsTUZQZdDmH.	vuthy1997*	2017-08-18 18:13:05.295586
\.


--
-- Name: user_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('user_member_id_seq', 1, true);


--
-- Name: alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: category_name_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: contact_email_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_email_key UNIQUE (email);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: email_email_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_email_key UNIQUE (email);


--
-- Name: email_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- Name: emailgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup
    ADD CONSTRAINT emailgroup_pkey PRIMARY KEY (id);


--
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_slug_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_slug_key UNIQUE (slug);


--
-- Name: group_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: member_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: page_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: page_title_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_title_key UNIQUE (title);


--
-- Name: partner_name_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY partner
    ADD CONSTRAINT partner_name_key UNIQUE (name);


--
-- Name: partner_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY partner
    ADD CONSTRAINT partner_pkey PRIMARY KEY (id);


--
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: post_slug_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_slug_key UNIQUE (slug);


--
-- Name: post_title_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_title_key UNIQUE (title);


--
-- Name: user_member_email_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY user_member
    ADD CONSTRAINT user_member_email_key UNIQUE (email);


--
-- Name: user_member_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY user_member
    ADD CONSTRAINT user_member_pkey PRIMARY KEY (id);


--
-- Name: emailgroup_email_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup
    ADD CONSTRAINT emailgroup_email_id_fkey FOREIGN KEY (email_id) REFERENCES email(id);


--
-- Name: emailgroup_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup
    ADD CONSTRAINT emailgroup_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_member(id);


--
-- Name: post_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_member(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

