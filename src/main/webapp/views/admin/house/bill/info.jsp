<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Hóa đơn</title>
</head>

<body>


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Hóa đơn</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item"><a href="<c:url value='/admin/housemanagement'/>">Quản lý nhà</a>
						</li>
						<li class="breadcrumb-item"><a href="">Quản lý phòng</a></li>
						<li class="breadcrumb-item text-blue" onclick="goBack()">Chi tiết phòng</li>
						<li class="breadcrumb-item active">Hóa đơn</li>
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


				<h4>Phòng : ${room.roomName}</h4>
				<h4>Thành viên : ${room.member}</h4>
				<h4>Ngày lập : ${model.createdDate}</h4>
				<h4>Người lập : ${model.createdBy}</h4>
				<h4>
					Tình trạng :
					<c:if test="${model.status == 0}">Chưa đóng tiền</c:if>
					<c:if test="${model.status == 1}">Đã đóng tiền</c:if>
				</h4>

				<br>
				<h4 style="color: red;">Chi tiết hóa đơn</h4>

				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Loại tiền</th>
							<th>Thành tiền</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tiền phòng</td>
							<td>${model.roomMoney} VNĐ</td>
						</tr>
						<tr>
							<td>Tiền điện</td>
							<td>${model.electrictyMoney} VNĐ</td>
						</tr>
						<tr>
							<td>Tiền nước</td>
							<td>${model.waterMoney} VNĐ</td>
						</tr>
						<tr>
							<td>Tiền mạng</td>
							<td>${model.networkMoney} VNĐ</td>
						</tr>
						<tr>
							<td>Tiền khác</td>
							<td>${model.otherMoney} VNĐ</td>
						</tr>
						<tr style="background-color: yellow; font-weight: bold; font-style: italic;">
							<td>Tổng tiền</td>
							<td>${model.totalMoney} VNĐ</td>
						</tr>
					</tbody>

				</table>



				<br>
				<div class="form-group">
					<div class="col-sm-12">
						<input type="button" class="btn btn-white btn-warning btn-bold" value="In hóa đơn" id="btn" />
						<input type="button" class="btn btn-white btn-warning btn-bold" value="Trở về"
							onclick="goBack()" />
					</div>
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