<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/konfig/konfig.jsp" %>
<%-- 
    Document   : index
    Created on : Mar 14, 2015, 2:23:50 PM
    Author     : ade
--%>
<%@include file="/WEB-INF/layout/header.jsp" %>
<!DOCTYPE html>
<div class="row">
	<div class="col-xs-8">
		<h1>Klaim Garansi</h1>
	</div>
	<div class="col-xs-4 text-right">
		<a href="${baseURL}klaimgaransi/add" class="btn btn-success">Tambah Baru</a>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<table class="table">
			<colgroup>
				<col width="100" />
				<col width="100" />
				<col width="100" />
				<col width="100" />
				<col width="100" />
                                <col width="100" />
                                <col width="100" />
			</colgroup>
			<thead>
				<tr>
					<th>Nomer Klaim Garansi</th>
					<th>Tanggal</th>
					<th>No. Faktur Penjualan</th>
					<th>Pelanggan</th>
                                        <th>Barang</th>
                                        <th>Jumlah</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
                            
                        <c:forEach items="${dataList}" var="data1">
                            <tr>
                                <td><c:out value="${data1.no_klaim}"/></td>
                                <td><c:out value="${data1.tanggal}"/></td>
                                <td><c:out value="${data1.no_faktur}"/></td>
                                <td><c:out value="${data1.pelanggan}"/></td>
                                <td><c:out value="${data1.barang}"/></td>
                                <td class=""numberfilter><c:out value="${data1.jumlah}"/></td>
                                <td>
                                    <button type="button" class="btn btn-warning btedit" data-kode="${data1.no_klaim}">Edit</button>
                                    <button type="button" class="btn btn-danger btdelete" data-kode="${data1.no_klaim}">Delete</button>
                                </td>
                            </tr>                    
                        </c:forEach>
			</tbody>
		</table>
	</div>
</div>
<%@include file="/WEB-INF/layout/footer.jsp" %>
<script>
$( document ).ready(function() {
    $('.btedit').click(function() {
        kode = $(this).data('kode');
        document.location = '${baseURL}klaimgaransi/edit?kode='+kode;
    });
    $('.btdelete').click(function() {
        kode = $(this).data('kode');
        if (confirm('Apakah kode Klaim Garansi '+kode+' mau di hapus ?')) {
            document.location = '${baseURL}klaimgaransi/delete?kode='+kode;
        }
    });
});
</script>