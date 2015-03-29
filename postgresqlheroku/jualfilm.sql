--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-03-29 23:21:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 194 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 194
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16608)
-- Name: barang; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE barang (
    id integer NOT NULL,
    kode_barang character varying NOT NULL,
    nama_barang character varying,
    harga bigint,
    jumlah_stok bigint
);


ALTER TABLE barang OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16606)
-- Name: barang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE barang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE barang_id_seq OWNER TO postgres;

--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 180
-- Name: barang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE barang_id_seq OWNED BY barang.id;


--
-- TOC entry 193 (class 1259 OID 16743)
-- Name: detail_penjualan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detail_penjualan (
    kode_detail_penjualan bigint NOT NULL,
    no_faktur integer,
    id_barang integer,
    nama_barang character varying,
    jumlah bigint,
    harga bigint,
    diskon bigint,
    total bigint
);


ALTER TABLE detail_penjualan OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16741)
-- Name: detail_penjualan_kode_detail_penjualan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detail_penjualan_kode_detail_penjualan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detail_penjualan_kode_detail_penjualan_seq OWNER TO postgres;

--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 192
-- Name: detail_penjualan_kode_detail_penjualan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detail_penjualan_kode_detail_penjualan_seq OWNED BY detail_penjualan.kode_detail_penjualan;


--
-- TOC entry 189 (class 1259 OID 16687)
-- Name: detail_purchase_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detail_purchase_order (
    kode_detail_po bigint NOT NULL,
    no_po integer,
    id_barang integer,
    nama_barang character varying,
    jumlah bigint
);


ALTER TABLE detail_purchase_order OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16685)
-- Name: detail_purchase_order_kode_detail_po_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detail_purchase_order_kode_detail_po_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detail_purchase_order_kode_detail_po_seq OWNER TO postgres;

--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 188
-- Name: detail_purchase_order_kode_detail_po_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detail_purchase_order_kode_detail_po_seq OWNED BY detail_purchase_order.kode_detail_po;


--
-- TOC entry 173 (class 1259 OID 16508)
-- Name: klaim_garansi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE klaim_garansi (
    id integer NOT NULL,
    no_klaim character varying NOT NULL,
    tanggal timestamp with time zone,
    no_faktur integer,
    id_pelanggan integer,
    id_barang integer,
    jumlah integer
);


ALTER TABLE klaim_garansi OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16506)
-- Name: klaim_garansi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE klaim_garansi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE klaim_garansi_id_seq OWNER TO postgres;

--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 172
-- Name: klaim_garansi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE klaim_garansi_id_seq OWNED BY klaim_garansi.id;


--
-- TOC entry 175 (class 1259 OID 16519)
-- Name: pegawai; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pegawai (
    id integer NOT NULL,
    id_pegawai character varying NOT NULL,
    nama_pegawai character varying,
    alamat_pegawai character varying,
    telepon_pegawai character varying,
    email_pegawai character varying,
    divisi character varying
);


ALTER TABLE pegawai OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16517)
-- Name: pegawai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pegawai_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pegawai_id_seq OWNER TO postgres;

--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 174
-- Name: pegawai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pegawai_id_seq OWNED BY pegawai.id;


--
-- TOC entry 177 (class 1259 OID 16530)
-- Name: pelanggan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pelanggan (
    id integer NOT NULL,
    kode_pelanggan character varying NOT NULL,
    nama_pelanggan character varying,
    alamat_pelanggan character varying,
    telepon_pelanggan character varying,
    email_pelanggan character varying
);


ALTER TABLE pelanggan OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16528)
-- Name: pelanggan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pelanggan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pelanggan_id_seq OWNER TO postgres;

--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 176
-- Name: pelanggan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pelanggan_id_seq OWNED BY pelanggan.id;


--
-- TOC entry 191 (class 1259 OID 16732)
-- Name: penjualan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE penjualan (
    id integer NOT NULL,
    no_faktur character varying NOT NULL,
    tanggal timestamp with time zone,
    id_pelanggan integer,
    id_pegawai integer
);


ALTER TABLE penjualan OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16730)
-- Name: penjualan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE penjualan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE penjualan_id_seq OWNER TO postgres;

--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 190
-- Name: penjualan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE penjualan_id_seq OWNED BY penjualan.id;


--
-- TOC entry 185 (class 1259 OID 16665)
-- Name: purchase_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE purchase_order (
    id integer NOT NULL,
    no_po character varying NOT NULL,
    tanggal timestamp with time zone,
    id_supplier integer,
    id_pegawai integer
);


ALTER TABLE purchase_order OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16663)
-- Name: purchase_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE purchase_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purchase_order_id_seq OWNER TO postgres;

--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 184
-- Name: purchase_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE purchase_order_id_seq OWNED BY purchase_order.id;


--
-- TOC entry 187 (class 1259 OID 16676)
-- Name: retur_pembelian; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE retur_pembelian (
    id integer NOT NULL,
    no_retur_pembelian character varying NOT NULL,
    tanggal timestamp with time zone,
    id_po integer,
    id_pegawai integer,
    id_supplier integer,
    id_barang integer
);


ALTER TABLE retur_pembelian OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16674)
-- Name: retur_pembelian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE retur_pembelian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retur_pembelian_id_seq OWNER TO postgres;

--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 186
-- Name: retur_pembelian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE retur_pembelian_id_seq OWNED BY retur_pembelian.id;


--
-- TOC entry 183 (class 1259 OID 16642)
-- Name: retur_penjualan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE retur_penjualan (
    id integer NOT NULL,
    no_returpenjualan character varying NOT NULL,
    tanggal timestamp with time zone,
    no_faktur integer,
    id_pegawai integer,
    id_pelanggan integer,
    id_barang integer,
    nama_barang character varying,
    jumlah bigint
);


ALTER TABLE retur_penjualan OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16640)
-- Name: retur_penjualan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE retur_penjualan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retur_penjualan_id_seq OWNER TO postgres;

--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 182
-- Name: retur_penjualan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE retur_penjualan_id_seq OWNED BY retur_penjualan.id;


--
-- TOC entry 179 (class 1259 OID 16586)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE supplier (
    id integer NOT NULL,
    kode_supplier character varying NOT NULL,
    nama_supplier character varying,
    alamat_supplier character varying,
    telepon_supplier character varying,
    email_supplier character varying
);


ALTER TABLE supplier OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16584)
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supplier_id_seq OWNER TO postgres;

--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 178
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE supplier_id_seq OWNED BY supplier.id;


--
-- TOC entry 1956 (class 2604 OID 16611)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY barang ALTER COLUMN id SET DEFAULT nextval('barang_id_seq'::regclass);


--
-- TOC entry 1962 (class 2604 OID 16746)
-- Name: kode_detail_penjualan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_penjualan ALTER COLUMN kode_detail_penjualan SET DEFAULT nextval('detail_penjualan_kode_detail_penjualan_seq'::regclass);


--
-- TOC entry 1960 (class 2604 OID 16690)
-- Name: kode_detail_po; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_purchase_order ALTER COLUMN kode_detail_po SET DEFAULT nextval('detail_purchase_order_kode_detail_po_seq'::regclass);


--
-- TOC entry 1952 (class 2604 OID 16511)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY klaim_garansi ALTER COLUMN id SET DEFAULT nextval('klaim_garansi_id_seq'::regclass);


--
-- TOC entry 1953 (class 2604 OID 16522)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pegawai ALTER COLUMN id SET DEFAULT nextval('pegawai_id_seq'::regclass);


--
-- TOC entry 1954 (class 2604 OID 16533)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pelanggan ALTER COLUMN id SET DEFAULT nextval('pelanggan_id_seq'::regclass);


--
-- TOC entry 1961 (class 2604 OID 16735)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY penjualan ALTER COLUMN id SET DEFAULT nextval('penjualan_id_seq'::regclass);


--
-- TOC entry 1958 (class 2604 OID 16668)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order ALTER COLUMN id SET DEFAULT nextval('purchase_order_id_seq'::regclass);


--
-- TOC entry 1959 (class 2604 OID 16679)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retur_pembelian ALTER COLUMN id SET DEFAULT nextval('retur_pembelian_id_seq'::regclass);


--
-- TOC entry 1957 (class 2604 OID 16645)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retur_penjualan ALTER COLUMN id SET DEFAULT nextval('retur_penjualan_id_seq'::regclass);


--
-- TOC entry 1955 (class 2604 OID 16589)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY supplier ALTER COLUMN id SET DEFAULT nextval('supplier_id_seq'::regclass);


--
-- TOC entry 2103 (class 0 OID 16608)
-- Dependencies: 181
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY barang (id, kode_barang, nama_barang, harga, jumlah_stok) FROM stdin;
\.


--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 180
-- Name: barang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('barang_id_seq', 1, false);


--
-- TOC entry 2115 (class 0 OID 16743)
-- Dependencies: 193
-- Data for Name: detail_penjualan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_penjualan (kode_detail_penjualan, no_faktur, id_barang, nama_barang, jumlah, harga, diskon, total) FROM stdin;
\.


--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 192
-- Name: detail_penjualan_kode_detail_penjualan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detail_penjualan_kode_detail_penjualan_seq', 1, false);


--
-- TOC entry 2111 (class 0 OID 16687)
-- Dependencies: 189
-- Data for Name: detail_purchase_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_purchase_order (kode_detail_po, no_po, id_barang, nama_barang, jumlah) FROM stdin;
\.


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 188
-- Name: detail_purchase_order_kode_detail_po_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detail_purchase_order_kode_detail_po_seq', 1, false);


--
-- TOC entry 2095 (class 0 OID 16508)
-- Dependencies: 173
-- Data for Name: klaim_garansi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY klaim_garansi (id, no_klaim, tanggal, no_faktur, id_pelanggan, id_barang, jumlah) FROM stdin;
\.


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 172
-- Name: klaim_garansi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('klaim_garansi_id_seq', 1, false);


--
-- TOC entry 2097 (class 0 OID 16519)
-- Dependencies: 175
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pegawai (id, id_pegawai, nama_pegawai, alamat_pegawai, telepon_pegawai, email_pegawai, divisi) FROM stdin;
\.


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 174
-- Name: pegawai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pegawai_id_seq', 1, false);


--
-- TOC entry 2099 (class 0 OID 16530)
-- Dependencies: 177
-- Data for Name: pelanggan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pelanggan (id, kode_pelanggan, nama_pelanggan, alamat_pelanggan, telepon_pelanggan, email_pelanggan) FROM stdin;
\.


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 176
-- Name: pelanggan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pelanggan_id_seq', 1, false);


--
-- TOC entry 2113 (class 0 OID 16732)
-- Dependencies: 191
-- Data for Name: penjualan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY penjualan (id, no_faktur, tanggal, id_pelanggan, id_pegawai) FROM stdin;
\.


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 190
-- Name: penjualan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('penjualan_id_seq', 1, false);


--
-- TOC entry 2107 (class 0 OID 16665)
-- Dependencies: 185
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY purchase_order (id, no_po, tanggal, id_supplier, id_pegawai) FROM stdin;
\.


--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 184
-- Name: purchase_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('purchase_order_id_seq', 1, false);


--
-- TOC entry 2109 (class 0 OID 16676)
-- Dependencies: 187
-- Data for Name: retur_pembelian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY retur_pembelian (id, no_retur_pembelian, tanggal, id_po, id_pegawai, id_supplier, id_barang) FROM stdin;
\.


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 186
-- Name: retur_pembelian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('retur_pembelian_id_seq', 1, false);


--
-- TOC entry 2105 (class 0 OID 16642)
-- Dependencies: 183
-- Data for Name: retur_penjualan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY retur_penjualan (id, no_returpenjualan, tanggal, no_faktur, id_pegawai, id_pelanggan, id_barang, nama_barang, jumlah) FROM stdin;
\.


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 182
-- Name: retur_penjualan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('retur_penjualan_id_seq', 1, false);


--
-- TOC entry 2101 (class 0 OID 16586)
-- Dependencies: 179
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY supplier (id, kode_supplier, nama_supplier, alamat_supplier, telepon_supplier, email_supplier) FROM stdin;
\.


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 178
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('supplier_id_seq', 1, false);


--
-- TOC entry 1976 (class 2606 OID 16673)
-- Name: pkdfdfer; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY purchase_order
    ADD CONSTRAINT pkdfdfer PRIMARY KEY (id);


--
-- TOC entry 1978 (class 2606 OID 16684)
-- Name: pkdfgrtr; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY retur_pembelian
    ADD CONSTRAINT pkdfgrtr PRIMARY KEY (id);


--
-- TOC entry 1984 (class 2606 OID 16751)
-- Name: pkdgdget; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detail_penjualan
    ADD CONSTRAINT pkdgdget PRIMARY KEY (kode_detail_penjualan);


--
-- TOC entry 1982 (class 2606 OID 16740)
-- Name: pkdsfdfrer; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY penjualan
    ADD CONSTRAINT pkdsfdfrer PRIMARY KEY (id);


--
-- TOC entry 1966 (class 2606 OID 16527)
-- Name: pkfdgrte; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pegawai
    ADD CONSTRAINT pkfdgrte PRIMARY KEY (id);


--
-- TOC entry 1972 (class 2606 OID 16616)
-- Name: pkfertets; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY barang
    ADD CONSTRAINT pkfertets PRIMARY KEY (id);


--
-- TOC entry 1980 (class 2606 OID 16695)
-- Name: pkfgfdgr; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detail_purchase_order
    ADD CONSTRAINT pkfgfdgr PRIMARY KEY (kode_detail_po);


--
-- TOC entry 1968 (class 2606 OID 16538)
-- Name: pkgjfdgste; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pelanggan
    ADD CONSTRAINT pkgjfdgste PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 16516)
-- Name: pksdfe; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY klaim_garansi
    ADD CONSTRAINT pksdfe PRIMARY KEY (id);


--
-- TOC entry 1974 (class 2606 OID 16650)
-- Name: pksdfr35; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY retur_penjualan
    ADD CONSTRAINT pksdfr35 PRIMARY KEY (no_returpenjualan);


--
-- TOC entry 1970 (class 2606 OID 16594)
-- Name: pkxcvre6576yhd; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT pkxcvre6576yhd PRIMARY KEY (id);


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-03-29 23:21:24

--
-- PostgreSQL database dump complete
--

