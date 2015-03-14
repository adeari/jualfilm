<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/konfig/konfig.jsp" %>
<%-- 
    Document   : pelangganTambah
    Created on : Mar 14, 2015, 3:34:56 PM
    Author     : ade
--%>
<%@include file="/WEB-INF/layout/header.jsp" %>
<div class="row">
	<div class="col-xs-12">
		<h1>Pelanggan Baru</h1>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
            <form class="form-horizontal" method="post">
			<div class="form-group">
				<label for="nomor_pelanggan" class="col-xs-2 control-label">Nomor Pelanggan</label>
				<div class="col-xs-10">
					<input type="text" class="form-control" name="nomor_pelanggan" id="nomor_pelanggan" placeholder="Nomor Pelanggan">
				</div>
			</div>
			<div class="form-group">
				<label for="nama" class="col-xs-2 control-label">Nama</label>
				<div class="col-xs-10">
					<input type="text" class="form-control" id="nama" name="nama" placeholder="Nama">
				</div>
			</div>
			<div class="form-group">
				<label for="alamat" class="col-xs-2 control-label">Alamat</label>
				<div class="col-xs-10">
					<input type="text" class="form-control" id="alamat" name="alamat" placeholder="Alamat">
				</div>
			</div>
			<div class="form-group">
				<label for="telp" class="col-xs-2 control-label">Telp</label>
				<div class="col-xs-10">
					<input type="text" class="form-control" id="telp" name="telp" placeholder="Telp">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-xs-2 control-label">Email</label>
				<div class="col-xs-10">
					<input type="email" class="form-control" id="email" name="email" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-offset-2 col-xs-10">
					<button type="submit" class="btn btn-success">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%@include file="/WEB-INF/layout/footer.jsp" %>