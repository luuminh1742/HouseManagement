<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-bill" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hóa đơn cuối tháng</title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Hóa đơn cuối tháng</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item"><a
							href="<c:url value='/admin/housemanagement'/>">Quản lý nhà</a></li>
						<li class="breadcrumb-item">Quản lý phòng</li>
						<li class="breadcrumb-item active">Hóa đơn cuối tháng</li>
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

			<form id="formSubmit">
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1"> Số điện cuối tháng </label>
					<div class="col-sm-9">
						<input type="text" id="lastElectrictyNumber" placeholder="Số điện"
							class="col-xs-10 col-sm-5" name="lastElectrictyNumber">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1"> Số nước cuối tháng </label>
					<div class="col-sm-9">
						<input type="text" id="lastWaterNumber" placeholder="Số nước"
							class="col-xs-10 col-sm-5" name="lastWaterNumber"
							<c:if test="${room.typeWaterMoney != 3}">disabled value = "0"</c:if>>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-12">
						<input type="button" class="btn btn-white btn-warning btn-bold"
							value="Tạo hóa đơn" id="btnAddBill" /> <input type="button"
							class="btn btn-white btn-warning btn-bold" value="Trở về"
							onclick="goBack()" />
					</div>
				</div>
			</form>
			</div>
		</div>
	</section>


	<script>
		function goBack() {
			window.history.back();
		}
		$('#btnAddBill').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var checkWater = $
			{
				room.typeWaterMoney
			}
			;
			if (checkWater != 3) {
				data["lastWaterNumber"] = "0";
			}
			data["roomId"] =
	<%=request.getParameter("roomId")%>
		;
			addBill(data);
		});

		function addBill(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.history.back();
					alert("Thêm thành công");
					//console.log(result);
				},
				error : function(error) {
					alert("Thêm thất bại");
					//console.log(error);
				}
			});
		}
	</script>
</body>
</html>