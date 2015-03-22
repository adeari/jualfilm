
CREATE TABLE barang (
    kode_barang character varying NOT NULL,
    nama_barang character varying,
    harga bigint,
    jumlah_stok bigint
);


--
-- TOC entry 174 (class 1259 OID 16404)
-- Name: detail_penjualan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE detail_penjualan (
	kode_detail_penjualan bigint NOT NULL,
    no_faktur character varying,
    kode_barang character varying,
    nama_barang character varying,
    jumlah bigint,
    harga bigint,
    diskon bigint,
    total bigint    
);


--
-- TOC entry 173 (class 1259 OID 16402)
-- Name: detail_penjualan_kode_detail_penjualan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detail_penjualan_kode_detail_penjualan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 173
-- Name: detail_penjualan_kode_detail_penjualan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detail_penjualan_kode_detail_penjualan_seq OWNED BY detail_penjualan.kode_detail_penjualan;


--
-- TOC entry 176 (class 1259 OID 16415)
-- Name: detail_purchase_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE detail_purchase_order (
    kode_detail_po bigint NOT NULL,
    no_po character varying,
    kode_barang character varying,
    nama_barang character varying,
    jumlah bigint
);


--
-- TOC entry 175 (class 1259 OID 16413)
-- Name: detail_purchase_order_kode_detail_po_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detail_purchase_order_kode_detail_po_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 175
-- Name: detail_purchase_order_kode_detail_po_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detail_purchase_order_kode_detail_po_seq OWNED BY detail_purchase_order.kode_detail_po;


--
-- TOC entry 177 (class 1259 OID 16424)
-- Name: klaim_garansi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE klaim_garansi (
    no_klaim character varying NOT NULL,
    tanggal timestamp with time zone,
    no_faktur character varying,
    kode_pelanggan character varying,
    kode_barang character varying,
    jumlah integer
);


--
-- TOC entry 178 (class 1259 OID 16432)
-- Name: pegawai; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pegawai (
    id_pegawai character varying NOT NULL,
    nama_pegawai character varying,
    alamat_pegawai character varying,
    telepon_pegawai character varying,
    email_pegawai character varying,
    divisi character varying
);


--
-- TOC entry 179 (class 1259 OID 16440)
-- Name: pelanggan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pelanggan (
    kode_pelanggan character varying NOT NULL,
    nama_pelanggan character varying,
    alamat_pelanggan character varying,
    telepon_pelanggan character varying,
    email_pelanggan character varying
);


--
-- TOC entry 180 (class 1259 OID 16448)
-- Name: penjualan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE penjualan (
    no_faktur character varying NOT NULL,
    tanggal timestamp with time zone,
    kode_pelanggan character varying,
    id_pegawai character varying
);


--
-- TOC entry 181 (class 1259 OID 16456)
-- Name: purchase_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE purchase_order (
    no_po character varying NOT NULL,
    tanggal timestamp with time zone,
    kode_supplier character varying,
    id_pegawai character varying
);


--
-- TOC entry 182 (class 1259 OID 16464)
-- Name: retur_pembelian; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE retur_pembelian (
    no_retur_pembelian character varying NOT NULL,
    tanggal timestamp with time zone,
    no_po character varying,
    id_pegawai character varying,
    kode_supplier character varying,
    kode_barang character varying
);


--
-- TOC entry 183 (class 1259 OID 16478)
-- Name: retur_penjualan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE retur_penjualan (
    no_returpenjualan character varying NOT NULL,
    tanggal timestamp with time zone,
    no_faktur character varying,
    id_pegawai character varying,
    kode_pelanggan character varying,
    kode_barang character varying,
    nama_barang character varying
);


--
-- TOC entry 184 (class 1259 OID 16486)
-- Name: supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE supplier (
    kode_supplier character varying NOT NULL,
    nama_supplier character varying,
    alamat_supplier character varying,
    telepon_supplier character varying,
    email_supplier character varying
);


--
-- TOC entry 1934 (class 2604 OID 16407)
-- Name: kode_detail_penjualan; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_penjualan ALTER COLUMN kode_detail_penjualan SET DEFAULT nextval('detail_penjualan_kode_detail_penjualan_seq'::regclass);


--
-- TOC entry 1935 (class 2604 OID 16418)
-- Name: kode_detail_po; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_purchase_order ALTER COLUMN kode_detail_po SET DEFAULT nextval('detail_purchase_order_kode_detail_po_seq'::regclass);


--
-- TOC entry 2067 (class 0 OID 16394)
-- Dependencies: 172
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2069 (class 0 OID 16404)
-- Dependencies: 174
-- Data for Name: detail_penjualan; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 173
-- Name: detail_penjualan_kode_detail_penjualan_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('detail_penjualan_kode_detail_penjualan_seq', 1, false);


--
-- TOC entry 2071 (class 0 OID 16415)
-- Dependencies: 176
-- Data for Name: detail_purchase_order; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 175
-- Name: detail_purchase_order_kode_detail_po_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('detail_purchase_order_kode_detail_po_seq', 1, false);


--
-- TOC entry 2072 (class 0 OID 16424)
-- Dependencies: 177
-- Data for Name: klaim_garansi; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2073 (class 0 OID 16432)
-- Dependencies: 178
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2074 (class 0 OID 16440)
-- Dependencies: 179
-- Data for Name: pelanggan; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2075 (class 0 OID 16448)
-- Dependencies: 180
-- Data for Name: penjualan; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2076 (class 0 OID 16456)
-- Dependencies: 181
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2077 (class 0 OID 16464)
-- Dependencies: 182
-- Data for Name: retur_pembelian; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2078 (class 0 OID 16478)
-- Dependencies: 183
-- Data for Name: retur_penjualan; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2079 (class 0 OID 16486)
-- Dependencies: 184
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1951 (class 2606 OID 16463)
-- Name: pkdfdfer; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchase_order
    ADD CONSTRAINT pkdfdfer PRIMARY KEY (no_po);


--
-- TOC entry 1953 (class 2606 OID 16471)
-- Name: pkdfgrtr; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY retur_pembelian
    ADD CONSTRAINT pkdfgrtr PRIMARY KEY (no_retur_pembelian);


--
-- TOC entry 1939 (class 2606 OID 16412)
-- Name: pkdgdget; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_penjualan
    ADD CONSTRAINT pkdgdget PRIMARY KEY (kode_detail_penjualan);


--
-- TOC entry 1949 (class 2606 OID 16455)
-- Name: pkdsfdfrer; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY penjualan
    ADD CONSTRAINT pkdsfdfrer PRIMARY KEY (no_faktur);


--
-- TOC entry 1945 (class 2606 OID 16439)
-- Name: pkfdgrte; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pegawai
    ADD CONSTRAINT pkfdgrte PRIMARY KEY (id_pegawai);


--
-- TOC entry 1937 (class 2606 OID 16401)
-- Name: pkfertets; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY barang
    ADD CONSTRAINT pkfertets PRIMARY KEY (kode_barang);


--
-- TOC entry 1941 (class 2606 OID 16423)
-- Name: pkfgfdgr; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_purchase_order
    ADD CONSTRAINT pkfgfdgr PRIMARY KEY (kode_detail_po);


--
-- TOC entry 1947 (class 2606 OID 16447)
-- Name: pkgjfdgste; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pelanggan
    ADD CONSTRAINT pkgjfdgste PRIMARY KEY (kode_pelanggan);


--
-- TOC entry 1943 (class 2606 OID 16431)
-- Name: pksdfe; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY klaim_garansi
    ADD CONSTRAINT pksdfe PRIMARY KEY (no_klaim);


--
-- TOC entry 1955 (class 2606 OID 16485)
-- Name: pksdfr35; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY retur_penjualan
    ADD CONSTRAINT pksdfr35 PRIMARY KEY (no_returpenjualan);


--
-- TOC entry 1957 (class 2606 OID 16493)
-- Name: pkxcvre6576yhd; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT pkxcvre6576yhd PRIMARY KEY (kode_supplier);


-- Completed on 2015-03-22 12:48:52

--
-- PostgreSQL database dump complete
--

