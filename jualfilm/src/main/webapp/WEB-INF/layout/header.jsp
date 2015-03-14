<%-- 
    Document   : header
    Created on : Mar 14, 2015, 3:19:53 PM
    Author     : ade
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Note there is no responsive meta tag here -->

		<link rel="icon" href="favicon.ico">

		<title>Infinity Movie Store</title>

		<!-- Bootstrap core CSS -->
		<link href="${baseURL}resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="${baseURL}resources/css/jquery-ui.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="${baseURL}resources/css/non-responsive.css" rel="stylesheet">
		<link href="${baseURL}resources/css/style.css" rel="stylesheet">

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->


		<!-- Bootstrap core JavaScript
		================================================== -->
		<script src="${baseURL}resources/js/jquery.min.js"></script>
		<script src="${baseURL}resources/js/jquery-ui.min.js"></script>
		<script src="${baseURL}resources/js/bootstrap.min.js"></script>
	</head>

	<body>

		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top hidden-print">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Infinity Movie Store</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Input <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${baseURL}pelanggan">Pelanggan</a></li>
								<li><a href="${baseURL}supplier">Supplier</a></li>
                                                                <li><a href="${baseURL}pegawai">Pegawai</a></li>
                                                                <li><a href="${baseURL}barang">Barang</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Penjualan <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Nota Pesan</a></li>
								<li><a href="#">Nota Jual</a></li>
								<li><a href="#">Surat Jalan</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Pembelian <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Nota Beli</a></li>
								<li><a href="#">Surat Terima</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Pengembalian <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Nota Retur</a></li>
							</ul>
						</li>
						<li><a href="#">Stok</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Laporan <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Laporan Penjualan</a></li>
								<li><a href="#">Laporan Pembelian</a></li>
								<li><a href="#">Laporan Persediaan Barang</a></li>
								<li><a href="#">Laporan Retur</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Keluar</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>


		<div class="container-fluid">

			<div class="row">
				<div class="col-xs-offset-1 col-xs-10">
