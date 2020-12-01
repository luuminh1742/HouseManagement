<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-member" />
<c:url var="BillAPIurl" value="/api-admin-bill" />
<c:url var="CategoryURL" value="" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phòng ${model.roomName}</title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Chi tiết phòng</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item"><a
							href="<c:url value='/admin/housemanagement'/>">Quản lý nhà</a></li>
						<li class="breadcrumb-item text-blue" onclick="goBack()">Quản
							lý phòng</li>
						<li class="breadcrumb-item active">Chi tiết phòng</li>	
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

			<h1 class="text-danger center font-weight-bold">Phòng :
				${model.roomName}</h1>
			<h2>
				<u>Số người ở : ${model.member}</u>
			</h2>

			<form id="formSubmit" method="get">

				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Họ tên</th>
								<th>Tên đăng nhập</th>
								<th>Mật khẩu</th>
								<th>Ngày sinh</th>
								<th>Giới tính</th>
								<th>Địa chỉ</th>
								<th>Điện thoại</th>
								<th>Ngày vào</th>
								<th style="min-width:110px;">Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${userModel.listResult}">
								<tr>
									<td>${item.fullName}</td>
									<td>${item.username}</td>
									<td>${item.password}</td>
									<td>${item.birth}</td>
									<td>${item.gender}</td>
									<td>${item.address}</td>
									<td>${item.phone}</td>
									<td>${item.createdDate}</td>
									<td>
										<a class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title="Cập nhật thành viên"
											href="<c:url value='/admin/member?id=${item.id}&roomId=${item.roomId}'/>">
												<i class="fas fa-edit" aria-hidden="true"></i>
										</a>
										
										<button type="button" onclick="deleteMember(${item.id})"
											class="btn btn-sm btn-primary"
											data-toggle="tooltip" title='Xóa tài khoản'>
											<span> <i class="fas fa-trash-alt"></i>
											</span>
										</button>
									
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</form>
			<h2>
				<u>Tiền phải trả</u>
			</h2>
			<ul style="font-size: 20px;">
				<li>Tiền phòng : ${model.roomMoney} (VNĐ)</li>
				<li>Tiền điện : ${model.electrictyMoney} (VNĐ/số)</li>
				<li><c:if test="${model.typeWaterMoney == 1}">
						Tiền nước : ${model.waterMoney} (VNĐ/người)
					</c:if> <c:if test="${model.typeWaterMoney == 2}">
						Tiền nước : ${model.waterMoney} (VNĐ/phòng)
					</c:if> <c:if test="${model.typeWaterMoney == 3}">
						Tiền nước : ${model.waterMoney} (VNĐ/số)
					</c:if> <c:if test="${model.typeWaterMoney == 4}">
						Tiền nước : ${model.waterMoney} (VNĐ)
					</c:if></li>
				<li><c:if test="${model.typeNetworkMoney == 1}">
						Tiền mạng : ${model.networkMoney} (VNĐ/người)
					</c:if> <c:if test="${model.typeNetworkMoney == 2}">
						Tiền mạng : ${model.networkMoney} (VNĐ/phòng)
					</c:if> <c:if test="${model.typeNetworkMoney == 3}">
						Tiền mạng : ${model.networkMoney} (VNĐ)
					</c:if></li>

				<li>Tiền khác : ${model.otherMoney} (VNĐ)</li>
				<li>Số điện cuối : ${model.lastElectrictyNumber} (số)</li>
				<li>Số nước cuối : ${model.lastWaterNumber} (số)</li>
			</ul>
			<h2>
				<u>Ghi chú : </u>
			</h2>
			<h3 style="padding-left: 10px;">${model.notes}</h3>
			<h2>
				<u>Hóa đơn tiền phòng</u>
			</h2>
			<form id="formBill" method="get">

				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Ngày tạo</th>
								<th>Tổng tiền</th>
								<th>Tình trạng</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${billModel.listResult}">
								<tr>
									<td>${item.createdDate}</td>
									<td>${item.totalMoney}</td>
									<td><c:if test="${item.status == 0}">Chưa đóng tiền</c:if>
										<c:if test="${item.status == 1}">Đã đóng tiền</c:if>
										<div class="col-xs-3">
											<label> <input name="switch-field-1"
												class="ace ace-switch ace-switch-6" type="checkbox"
												<c:if test="${item.status == 0}">onchange="changeStatusBill(${item.id})"</c:if>
												<c:if test="${item.status == 1}">checked</c:if>> <span
												class="lbl"></span>
											</label>
										</div></td>
									<td><a class="btn btn-sm btn-primary btn-edit"
										data-toggle="tooltip" title="Xem chi tiết hóa đơn"
										href="<c:url value='/admin/house/room/bill?type=info&id=${item.id}'/>">
											<i class="fa fa-eye" aria-hidden="true"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			<div class="col-sm-12">
				<input type="button" class="btn btn-white btn-warning btn-bold"
								value="Trở về" onclick="goBack()" />
			</div>
			
		</div>
		</div>
	</section>



	<script>
		function goBack() {
			window.history.back();
		}
		function changeStatusBill(billId) {
			var check = confirm("Xác nhậ đã đóng tiền?");
			if (check) {
				var data = {};
				data["id"] = billId;
				updateStatusBill(data);
			}

		}
		function updateStatusBill(data) {
			$.ajax({
				url : '${BillAPIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					location.reload();
					alert("Cập nhật tình trạng hóa đơn thành công.");
				},
				error : function(error) {
					//window.location.href = "${CategoryURL}";
					alert("Cập nhật tình trạng hóa đơn thất bại.");
				}
			});
		}
		$(document).ready(function() {
			$('#checkAll').change(function() {
				var checkItem = $('.checkAllItem');
				if ($(this).prop("checked") == true) {
					for (var i = 0; i < checkItem.length; i++) {
						checkItem[i].checked = true;
					}
				} else if ($(this).prop("checked") == false) {
					for (var i = 0; i < checkItem.length; i++) {
						checkItem[i].checked = false;
					}
				}
			});
		})

		
		
		function deleteMember(id){
			var data = {};
			var ids = [id];
			data['ids'] = ids;
			var confirmDelete = confirm("Xác nhận xóa tài khoản");
			if (confirmDelete) {
				deleteM(data);
			}
		}
		
		
		
		/* $("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function() {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			var confirmDelete = confirm("Xác nhận xóa tài khoản");
			if (confirmDelete) {
				deleteMember(data);
			}
		}); */
		function deleteM(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'DELETE',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					//window.location.href = "${CategoryURL}";
					location.reload();
					alert("Xóa thành công");
				},
				error : function(error) {
					//window.location.href = "${CategoryURL}";
					alert("Xóa thất bại");
				}
			});
		}
	</script>
</body>
</html>