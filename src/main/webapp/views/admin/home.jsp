<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Trang chủ</title>
</head>

<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Trang chủ</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item active">Trang chủ</li>
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
				<div class="card-header">

					<h1 class="card-title">Thống kê trạng thái hóa đơn từng tháng</h1>
					<br>

					<!-- ChartJS -->
					<script src='<c:url value="/template/admin/plugins/chart.js/Chart.min.js"/>'></script>
					<!-- Thống kê -->
					<c:forEach var="item" items="${RoomStatusStatistics}">
						<hr>
						<canvas id="d${item.date}" width="300" height="100"></canvas>
						<script>
							new Chart(document.getElementById("d${item.date}"), {
								type: 'pie',
								data: {
									labels: ["Đã đóng tiền", "Chưa đóng tiền"],
									datasets: [{
										label: "đơn vị (phòng)",
										backgroundColor: ["#0b8902", "#cd2701"],
										data: [${ item.finished }, ${ item.unfinished }]
									}]
								},
								options: {
									title: {
										display: true,
										text: 'Biểu đồ thống kê hóa đơn tháng ${item.date}'
									}
								}
							});
						</script>

					</c:forEach>
				</div>

			</div>
			<!-- /.card -->
		</div>
	</section>






</body>

</html>