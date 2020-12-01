<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-member" />
<c:url var="CategoryURL" value="/quan-tri/the-loai" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:if test="${empty model.id}">Thêm thành viên</c:if> <c:if
		test="${not empty model.id}">Chỉnh sửa thành viên</c:if></title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>
						<c:if test="${empty model.id}">Thêm thành viên</c:if>
						<c:if test="${not empty model.id}">Chỉnh sửa thành viên</c:if>
					</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item"><a
							href="<c:url value='/admin/housemanagement'/>">Quản lý nhà</a></li>
						<li class="breadcrumb-item text-blue">Quản lý phòng</li>
						<li class="breadcrumb-item active"><c:if
								test="${empty model.id}">Thêm thành viên</c:if> <c:if
								test="${not empty model.id}">Chỉnh sửa thành viên</c:if></li>
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
			<h2>Phòng : 101</h2>
			<form id="formSubmit">
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Họ
						tên</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="fullName"
							name="fullName" value="${model.fullName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Ngày
						sinh</label>
					<div class="col-sm-9">
						<input class="form-control date-picker" id="birth" name="birth"
							type="date" value="${model.birth}" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Địa
						chỉ</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="address"
							name="address" value="${model.address}" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Giới
						tính</label>
					<div class="col-sm-9">
						<!-- Default unchecked -->
						<c:if test="${empty model.id}">
						
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input" id="genderMale"
									name="gender" checked> <label
									class="custom-control-label"  for="genderMale">Nam</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input"
								id="genderFemale" name="gender"> <label
								class="custom-control-label" for="genderFemale">Nữ</label>
							
							</div>
						
						</c:if>
						<c:if test="${not empty model.id}">
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input" id="genderMale"
									name="gender"
									<c:if test="${model.gender == 'Nam'}">checked</c:if>> <label
									class="custom-control-label">Nam</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input"
									id="genderFemale" name="gender"
									<c:if test="${model.gender == 'Nữ'}">checked</c:if>> <label
									class="custom-control-label">Nữ</label>
							</div>
						</c:if>
					</div>

				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Số
						điện thoại</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="phone" name="phone"
							value="${model.phone}">
					</div>
				</div>
				<br /> <br />

				<div class="form-group">
					<div class="col-sm-12">
						<c:if test="${not empty model.id}">
							<input type="button" class="btn btn-white btn-warning btn-bold"
								value="Cập nhật thông tin thành viên" id="btnAddOrUpdateUser" />
						</c:if>
						<c:if test="${empty model.id}">
							<input type="button" class="btn btn-white btn-warning btn-bold"
								value="Thêm thành viên" id="btnAddOrUpdateUser" />
						</c:if>
						<input type="button" class="btn btn-white btn-warning btn-bold"
							value="Trở về" onclick="goBack()" />
					</div>
				</div>

				<input type="hidden" value="<%=request.getParameter("roomId")%>"
					id="roomId" name="roomId" /> <input type="hidden"
					value="${model.id}" id="id" name="id" />
			</form>

			</div>

		</div>
	</section>





	<!-- old -->





	<script>
		function goBack() {
			window.history.back();
			//location.reload();
		}
		$('#btnAddOrUpdateUser').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});

			if ($("#genderMale").prop("checked", true)) {
				data["gender"] = "Nam";
			} else if ($("#genderFmale").prop("checked", true)) {
				data["gender"] = "Nữ";
			}
			data["roomId"] = $('#roomId').val();
			var id = $('#id').val();
			if (id == "") {
				addUser(data);
			} else {
				updateUser(data);
			}

		});
		function addUser(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					//window.location.href = "${CategoryURL}";
					alert("Thêm thành công");
					//console.log(result);
				},
				error : function(error) {
					//window.location.href = "${CategoryURL}";
					alert("Thêm thất bại");
					//console.log(error);
				}
			});
		}

		function updateUser(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					//window.location.href = "${CategoryURL}";
					alert("Cập nhật thành công");
					window.history.back();
					//console.log(result);
				},
				error : function(error) {
					//window.location.href = "${CategoryURL}";
					alert("Cập nhật thất bại");
					window.history.back();
					//console.log(error);
				}
			});
		}
	</script>


</body>
</html>