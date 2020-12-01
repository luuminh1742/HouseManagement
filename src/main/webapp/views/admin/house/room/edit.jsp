<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-room" />
<c:url var="RoomURL" value="/admin/house/room" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:if test="${empty model.id}">Thêm phòng</c:if> <c:if
		test="${not empty model.id}">Chỉnh sửa phòng</c:if></title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>
						<c:if test="${empty model.id}">Thêm phòng</c:if>
						<c:if test="${not empty model.id}">Cập nhật phòng</c:if>
					</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item"><a
							href="<c:url value='/admin/housemanagement'/>">Quản lý nhà</a></li>
						<li class="breadcrumb-item text-blue" onclick="goBack()">Quản
							lý phòng</li>
						<li class="breadcrumb-item active"><c:if
								test="${empty model.id}">Thêm phòng</c:if> <c:if
								test="${not empty model.id}">Cập nhật phòng</c:if></li>
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
					<label class="col-sm-3 control-label no-padding-right">Tên
						phòng</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="roomName"
							name="roomName" value="${model.roomName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Tiền
						phòng</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="roomMoney"
							name="roomMoney" value="${model.roomMoney}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Tiền
						điện</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="electrictyMoney"
							name="electrictyMoney" value="${model.electrictyMoney}" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Tính
						tiền nước theo</label>
					<div class="col-sm-9">
						<select class="form-control" id="typeWaterMoney"
							onchange="changeTypeWaterMoney()">
							<option value="1"
								<c:if test="${model.typeWaterMoney == 1}">selected</c:if>>Theo
								đầu người</option>
							<option value="2"
								<c:if test="${model.typeWaterMoney == 2}">selected</c:if>>Theo
								phòng</option>
							<option value="3"
								<c:if test="${model.typeWaterMoney == 3}">selected</c:if>>Theo
								số công tơ</option>
							<option value="4"
								<c:if test="${model.typeWaterMoney == 4}">selected</c:if>>Miễn
								phí</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Tiền
						nước</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="waterMoney"
							name="waterMoney" value="${model.waterMoney}" />
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Tính
						tiền mạng theo</label>
					<div class="col-sm-9">
						<select class="form-control" id="typeNetworkMoney"
							onchange="changeTypeNetworkMoney()">
							<option value="1"
								<c:if test="${model.typeNetworkMoney == 1}">selected</c:if>>Theo
								đầu người</option>
							<option value="2"
								<c:if test="${model.typeNetworkMoney == 2}">selected</c:if>>Theo
								phòng</option>
							<option value="3"
								<c:if test="${model.typeNetworkMoney == 3}">selected</c:if>>Miễn
								phí</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Tiền
						mạng</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="networkMoney"
							name="networkMoney" value="${model.networkMoney}" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Tiền
						khác</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="otherMoney"
							name="otherMoney" value="${model.otherMoney}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Số
						nước cuối</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="lastWaterNumber"
							name="lastWaterNumber" value="${model.lastWaterNumber}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Số
						điện cuối</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="lastElectrictyNumber"
							name="lastElectrictyNumber" value="${model.lastElectrictyNumber}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Ghi
						chú</label>
					<div class="col-sm-9">
						<textarea rows="7" class="form-control" id="notes" name="notes">${model.notes}</textarea>

					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-12">
						<c:if test="${not empty model.id}">
							<input type="button" class="btn btn-white btn-warning btn-bold"
								value="Cập nhật phòng" id="btnAddOrUpdateRoom" />
						</c:if>
						<c:if test="${empty model.id}">
							<input type="button" class="btn btn-white btn-warning btn-bold"
								value="Thêm phòng" id="btnAddOrUpdateRoom" />
						</c:if>

						<input type="button" class="btn btn-white btn-warning btn-bold"
							value="Trở về" onclick="goBack()" />
					</div>
				</div>
				<input type="hidden" value="<%=request.getParameter("houseId")%>"
					id="houseId" name="houseId" /> <input type="hidden"
					value="${model.id}" id="id" name="id" />
			</form>

			</div>
		</div>
	</section>



	<script>
		function loadTypeWaterMoney() {
			var x = $("#typeWaterMoney").val();
			if (x != "3") {
				$("#lastWaterNumber").prop("disabled", true);
				if (x == "4")
					$("#waterMoney").prop("disabled", true);
				else
					$("#waterMoney").prop("disabled", false);
			} else {
				$("#lastWaterNumber").prop("disabled", false);
			}
		}
		function loadTypeNetworkMoney() {
			var x = $("#typeNetworkMoney").val();
			if (x == "3") {
				$("#networkMoney").prop("disabled", true);
			} else {
				$("#networkMoney").prop("disabled", false);
			}
		}

		loadTypeWaterMoney();
		loadTypeNetworkMoney();

		function changeTypeNetworkMoney() {
			loadTypeNetworkMoney();
		}
		function changeTypeWaterMoney() {
			loadTypeWaterMoney();
		}
		function goBack() {
			window.history.back();
		}
		$('#btnAddOrUpdateRoom').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});

			data["typeNetworkMoney"] = $("#typeNetworkMoney").val();
			data["typeWaterkMoney"] = $("#typeWaterkMoney").val();
			var id = $('#id').val();
			if (id == "") {
				data["houseId"] = $('#houseId').val();
				addRoom(data);
			} else {
				updateRoom(data);
			}

		});

		var houseId =
	<%=request.getParameter("houseId")%>
		;
		function addRoom(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${RoomURL}?type=manager&houseId="
							+ houseId + "&page=1";
					alert("Thêm thành công");
				},
				error : function(error) {
					alert("Thêm thất bại");
				}
			});
		}
		function updateRoom(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Cập nhật thành công");
				},
				error : function(error) {
					alert("Cập nhật thất bại");
				}
			});
		}
	</script>
</body>
</html>