<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin nhà</title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Thông tin nhà</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item active">Thông tin nhà</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>


	<!-- Main content -->
	<section class="content">
		<!-- /.card-header -->
		<div class="card-body">
				<div class="card card-outline card-primary" style="padding: 20px;">
					<div class="card-header pull-right">
					
						<h3>Thông tin chi tiết</h3><br>
					
						<button onclick="goBack()" type="button"
							class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
							data-toggle="tooltip" title='Quay lại'>
							<span> <i class="fas fa-arrow-left bigger-110 pink"></i>
							</span>
						</button>
						&ensp;
						<a flag="info"
							class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
							data-toggle="tooltip" title='Sửa thông tin nhà'
							href='<c:url value='/admin/inforhouse?type=edit&id=${model.id}'/>'>
							<span> <i class="fas fa-edit bigger-110 purple"></i>
						</span>
						</a>
					</div>
					<div class="card-body p-0">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td style="min-width: 135px;">Tên nhà</td>
									<td>${model.name}</td>
								</tr>
								<tr>
									<td>Người quản lý</td>
									<td></td>
								</tr>
								<tr>
									<td>Địa chỉ</td>
									<td>${model.address}</td>
								</tr>
								<tr>
									<td>Quy định</td>
									<td>${model.rules}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>


		</div>
	</section>

<script>
function goBack() {
	window.history.back();
}
</script>

</body>
</html>