<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-user-setpassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cá nhân</title>
</head>
<body>
	<div class="main-content-inner">
		<div class="page-content mt-3  mb-3  ml-3  mr-3">
			<h3>Thông tin cá nhân</h3>
			<hr>
			<form id="form-profile">
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Họ
						tên</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="fullName"
							name="fullName" value="${model.fullName}" disabled/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Ngày
						sinh</label>
					<div class="col-sm-9">
						<input class="form-control date-picker" id="birth" name="birth"
							type="date" value="${model.birth}" disabled/>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Địa
						chỉ</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="address"
							name="address" value="${model.address}" disabled/>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Giới
						tính</label>
					<div class="col-sm-9">
						<!-- Default unchecked -->
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="genderMale"
								name="gender" disabled
								<c:if test="${model.gender == 'Nam'}">checked</c:if>> <label
								class="custom-control-label" for="genderMale">Nam</label>
						</div>

						<!-- Default checked -->
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="genderFemale" name="gender" disabled
								<c:if test="${model.gender == 'Nữ'}">checked</c:if>> <label
								class="custom-control-label" for="genderFemale">Nữ</label>
						</div>
					</div>

				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Số
						điện thoại</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="phone" name="phone"
							value="${model.phone}" disabled>
					</div>
				</div>
				
				<hr>
				<h4>Đổi mật khẩu</h4>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Mật khẩu mới</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="newPassword"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right">Xác nhận mật khẩu</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="confirmPassword"/>
					</div>
				</div>
				
				
				<br />

				<div class="form-group">
					<div class="col-sm-12">

						<input type="button" class="btn btn-white btn-warning btn-bold"
							value="Cập nhật mật khẩu" id="btnChangePassword" /> 
						<input
							type="reset" class="btn btn-white btn-warning btn-bold"
							value="Đặt lại"/>
					</div>
				</div>

				
			</form>
		</div>
	</div>
	<script>
		$("#fullName").prop("disabled", true);
		$("#birth").prop("disabled", true);
		$("#address").prop("disabled", true);
		$("#phone").prop("disabled", true);
	
		$("#btnChangePassword").click(function(e){
			e.preventDefault();
			var data = {};
			data["id"] = ${USERMODEL.id};
			data["password"] = $('#newPassword').val();
			if($('#newPassword').val() != $('#confirmPassword').val() || $('#newPassword').val() == ''){
				alert('Bạn cần nhập đúng thông tin');
			}else{
				$.ajax({
					url : '${APIurl}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						location.reload();
						alert("Cập nhật thành công");
					},
					error : function(error) {
						alert("Cập nhật thất bại");
					}
				});
			}
		});
	</script>
</body>
</html>