<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user" />
<c:url var="Logouturl" value="/thoat" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Tài khoản</title>
</head>

<body>


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Tài khoản</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang chủ</a></li>
						<li class="breadcrumb-item active">Tài khoản</li>
					</ol>
				</div>
			</div>
		</div><!-- /.container-fluid -->
	</section>


	<!-- Main content -->
	<section class="content">
		<!-- /.card-header -->
		<div class="card-body">

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">

						<!-- Profile Image -->
						<div class="card card-primary card-outline">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle"
										src='<c:url value = "/template/admin/dist/img/avatar5.png"/>'
										alt="User profile picture">
								</div>

								<h3 class="profile-username text-center">${USERMODEL.fullName}</h3>

								<a href='<c:url value="/thoat"/>' class="btn btn-primary btn-block"><b>Đăng xuất</b></a>

							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->


					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="card card-outline card-primary">
							<div class="card-header p-2">
								<ul class="nav nav-pills">
									<li class="nav-item"><a class="nav-link active" href="#inforuser"
											data-toggle="tab">Thông tin tài khoản</a></li>
									<li class="nav-item"><a class="nav-link" href="#update-infor" data-toggle="tab">Cập
											nhật thông tin</a></li>
									<li class="nav-item"><a class="nav-link" href="#change-password"
											data-toggle="tab">Mật khẩu</a></li>
								</ul>
							</div><!-- /.card-header -->

							<div class="card-body">
								<div class="tab-content">
									<!-- Thông tin tài khoản -->
									<div class="active tab-pane" id="inforuser">


										<div class="card-body p-0">
											<table class="table table-sm table-hover table-striped">
												<tbody>
													<tr>
														<td>Tên đăng nhập</td>
														<td>${USERMODEL.username}</td>
													</tr>
													<tr>
														<td>Tên hiển thị</td>
														<td>${USERMODEL.fullName}</td>
													</tr>
													<tr>
														<td>Địa chỉ</td>
														<td>
															<i class="fa fa-map-marker light-orange bigger-110"></i>
															${USERMODEL.address}
														</td>
													</tr>
													<tr>
														<td>Số điện thoại</td>
														<td>${USERMODEL.phone}</td>
													</tr>
													<tr>
														<td>Ngày sinh</td>
														<td>${USERMODEL.birth}</td>
													</tr>
													<tr>
														<td>Ngày tham gia</td>
														<td>${USERMODEL.createdDate}</td>
													</tr>
												</tbody>
											</table>
										</div>



									</div>
									<!-- /.tab-pane -->

									<div class="tab-pane" id="update-infor">
										<form class="form-horizontal" id="formGeneralInfor">

											<h4 class="header blue bolder smaller">Chung</h4>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-username">Tên đăng nhập</label>

												<div class="col-sm-12">
													<div class="input-group">
														<input class="form-control" type="text" name="username"
															placeholder="Tên đăng nhập" value="${USERMODEL.username}" />
													</div>
												</div>
											</div>

											<div class="space-4"></div>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-first">Tên hiển thị</label>

												<div class="col-sm-12">
													<div class="input-group">
														<input class="form-control" type="text" name="fullName"
															placeholder="Tên hiển thị" value="${USERMODEL.fullName}" />
													</div>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-date">Ngày sinh</label>

												<div class="col-sm-12">
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																	class="far fa-calendar-alt"></i></span>
														</div>
														<input type="text" class="form-control"
															data-inputmask-alias="datetime"
															data-inputmask-inputformat="dd/mm/yyyy" data-mask=""
															inputmode="numeric" name="birth" type="text"
															value="${USERMODEL.birth}">
													</div>
												</div>
											</div>

											<div class="space-4"></div>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right">Giới
													tính</label>

												<div class="col-sm-12">
													<label class="inline"> <input name="gender" type="radio" class="ace"
															id="male" <c:if test="${USERMODEL.gender == 'Nam'}">checked
														</c:if>>
														<span class="lbl middle"> Nam</span>
													</label> &nbsp; &nbsp; &nbsp; <label class="inline"> <input
															name="gender" type="radio" class="ace" id="female" <c:if
															test="${USERMODEL.gender == 'Nữ'}">checked
														</c:if>>
														<span class="lbl middle"> Nữ</span>
													</label>
												</div>
											</div>

											<div class="space-4"></div>


											<h4 class="header blue bolder smaller">Liên hệ</h4>


											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-phone">Số điện thoại</label>

												<div class="col-sm-12">
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																	class="fas fa-phone"></i></span>
														</div>
														<input type="text" class="form-control" data-mask=""
															inputmode="text" name="phone" placeholder="Số điện thoại"
															value="${USERMODEL.phone}">
													</div>



												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-username">Địa chỉ</label>

												<div class="col-sm-12">

													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																	class="fas fa-map-marker"></i></span>
														</div>
														<input type="text" class="form-control" data-mask=""
															inputmode="text" value="${USERMODEL.address}"
															id="form-field-username" placeholder="Địa chỉ"
															name="address">
													</div>

												</div>
											</div>

											<div class="space-4"></div>


											<div class="clearfix form-actions">
												<div class="col-md-offset-3 col-md-9">
													<button class="btn btn-primary" type="submit">
														<i class="ace-icon fa fa-check bigger-110"></i> Lưu
													</button>

													&nbsp; &nbsp;
													<button class="btn btn-primary" type="reset">
														<i class="ace-icon fa fa-undo bigger-110"></i> Đặt lại
													</button>
												</div>
											</div>
										</form>

									</div>
									<!-- /.tab-pane -->
									<!-- Cập nhật mật khẩu -->
									<div class="tab-pane" id="change-password">
										<form class="form-horizontal" id="formUpdatePassword">


											<div class="space-10"></div>

											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-pass1">Mật khẩu mới</label>

												<div class="col-sm-9">
													<div class="input-group">
														<input class="form-control" type="password" id="password" />
													</div>
												</div>
											</div>


											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-pass2">Xác nhận mật khẩu</label>

												<div class="col-sm-9">
													<div class="input-group">
														<input class="form-control" type="password"
															id="confirmPassword" />
													</div>
												</div>
											</div>

											<div class="clearfix form-actions">
												<div class="col-md-offset-3 col-md-9">
													<button class="btn btn-primary" type="submit">
														<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật
													</button>

													&nbsp; &nbsp;
													<button class="btn btn-primary" type="reset">
														<i class="ace-icon fa fa-undo bigger-110"></i> Reset
													</button>
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div><!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div><!-- /.container-fluid -->




		</div>
	</section>






	<script>
		$("#formGeneralInfor").submit(function (e) {
			e.preventDefault();
			var data = {};
			var formData = $(this).serializeArray();
			$.each(formData, function (i, v) {
				data["" + v.name + ""] = v.value;
			});
			if ($('#male').prop('checked', true)) {
				data["gender"] = 'Nam';
			} else {
				data["gender"] = 'Nữ';
			}
			data["id"] = ${ USERMODEL.id };
			data["type"] = 'UPDATEGI';

			$.ajax({
				url: '${APIurl}',
				type: 'PUT',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					window.location.href = "${Logouturl}";
					alert("Cập nhật thành công");
				},
				error: function (error) {
					alert("Cập nhật thất bại");
				}
			});


		});


		$('#formUpdatePassword').submit(function (e) {
			e.preventDefault();
			var data = {};
			data["id"] = ${ USERMODEL.id };
			data["password"] = $('#password').val();
			data["type"] = 'UPDATEPASS';
			if ($('#password').val() != $('#confirmPassword').val() || $('#password').val() == '') {
				alert('Bạn cần nhập đúng thông tin');
			} else {
				$.ajax({
					url: '${APIurl}',
					type: 'PUT',
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function (result) {
						location.reload();
						alert("Cập nhật thành công");
					},
					error: function (error) {
						alert("Cập nhật thất bại");
					}
				});
			}


		});
	</script>

</body>

</html>