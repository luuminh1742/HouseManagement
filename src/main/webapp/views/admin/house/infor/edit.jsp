<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-house" />
<c:url var="InfoHouseURL" value="/admin/inforhouse" />
<c:url var="HouseManagerURL" value="/admin/housemanagement" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:if test="${empty model.id}">Thêm nhà</c:if> <c:if
		test="${not empty model.id}">Chỉnh sửa thông tin nhà</c:if></title>
</head>
<body>

<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Chỉnh sửa thông tin nhà</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item text-blue">Thông tin nhà</li>
						<li class="breadcrumb-item active">Chỉnh sửa</li>
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
					nhà</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="name" name="name"
						value="${model.name}" />
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
				<label class="col-sm-3 control-label no-padding-right">Quy
					định</label>
				<div class="col-sm-9">
					<textarea rows="" cols="" id="rules" name="rules"
						style="width: 820px; height: 175px">${model.rules}</textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-12">
					<c:if test="${not empty model.id}">
						<input type="button" class="btn btn-white btn-warning btn-bold"
							value="Cập nhật thông tin nhà" id="btnAddOrUpdateInfoHouse" />
					</c:if>
					<c:if test="${empty model.id}">
						<input type="button" class="btn btn-white btn-warning btn-bold"
							value="Thêm nhà" id="btnAddOrUpdateInfoHouse" />
					</c:if>
					<input type="button" class="btn btn-white btn-warning btn-bold"
							value="Trở về" onclick="goBack()" />
				</div>

			</div>
			<br /> <br />

			


			<input type="hidden" value="${model.id}" id="id" name="id" />
		</form>
		</div>
		</div>
	</section>




	<script>
		function goBack() {
			window.history.back();
		}
		var editor = '';
		$(document).ready(function() {
			editor = CKEDITOR.replace('rules');
		});
		$('#btnAddOrUpdateInfoHouse').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			data["rules"] = editor.getData();
			var id = $('#id').val();

			if (id == "") {
				addInfoHouse(data);
			} else {
				updateInfoHouse(data, id);
			}

		});

		function addInfoHouse(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${HouseManagerURL}";
					alert("Thêm thành công");
					//console.log(result);
				},
				error : function(error) {
					window.location.href = "${HouseManagerURL}";
					alert("Thêm thất bại");
					//console.log(error);
				}
			});
		}

		function updateInfoHouse(data, id) {
			$
					.ajax({
						url : '${APIurl}',
						type : 'PUT',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${InfoHouseURL}?type=info&id="
									+ id;
							alert("Cập nhật thành công");
							//console.log(result);
						},
						error : function(error) {
							window.location.href = "${InfoHouseURL}?type=info&id="
									+ id;
							alert("Cập nhật thất bại");
							//console.log(error);
						}
					});
		}
	</script>
</body>
</html>