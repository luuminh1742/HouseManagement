<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Quản lý nhà</title>
</head>

<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Quản lý nhà</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang chủ</a></li>
						<li class="breadcrumb-item active">Quản lý nhà</li>
					</ol>
				</div>
			</div>
		</div><!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- /.card-header -->
		<div class="card-body">
			<c:if test="${empty houses.listResult}">
				<div class="alert alert-info">
					<button class="close" data-dismiss="alert">
						<i class="ace-icon fa fa-times"></i>
					</button>
					Bạn chưa có nhà để quản lý!
				</div>
			</c:if>
			<div class="row">
				<div class="col-lg-3 col-6">
					<a href="<c:url value='/admin/inforhouse?type=edit'/>">
						<div class="small-box bg-success" style="height: 100px;">
							<div class="inner">
								<h3>Thêm nhà</h3>
							</div>
							<div class="icon">

								<i class="icon fas fa-plus"></i>
							</div>
						</div>
					</a>
				</div>
			</div>



			<div class="row">
				<c:forEach var="item" items="${houses.listResult}">

					<div class="col-lg-3 col-6">
						<div class="small-box bg-warning">
							<div class="inner">
								<h3>${item.name}</h3>
								<p>Đại chỉ: ${item.address}</p>
							</div>
							<div class="icon">

								<i class="icon fas fa-house-user"></i>
							</div>

							<div class="small-box-footer">
								<a title="Quản lý nhà"
									href="<c:url value='/admin/house/room?type=manager&houseId=${item.id}&page=1'/>">
									<i class="fas fa-cogs fa-lg"></i>
								</a>&ensp; <a title="Chi tiết nhà"
									href="<c:url value='/admin/inforhouse?type=info&id=${item.id}'/>">
									<i class="fas fa-eye fa-lg"></i>
								</a>
							</div>


						</div>
					</div>
				</c:forEach>
			</div>

		</div>

	</section>

</body>

</html>