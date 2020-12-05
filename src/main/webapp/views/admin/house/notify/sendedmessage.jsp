<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-notify" />
<c:url var="SendedMessageUrl" value="/admin/house/notify?type=notify&houseId=" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Thông báo đã gửi</title>
</head>

<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Thư đã gửi</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<c:url value='/admin'/>">Trang
								chủ</a></li>
						<li class="breadcrumb-item"><a href="<c:url value='/admin/housemanagement'/>">Quản lý nhà</a>
						</li>
						<li class="breadcrumb-item text-blue">Quản lý phòng</li>
						<li class="breadcrumb-item active">Thư đã gửi</li>
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
			<div class="pull-right">
				<button type="button" class="btn btn-warning" onclick="goBack()">
					<i class="ace-icon fa fa-arrow-left bigger-130"></i> <span class="bigger-110">Quay lại</span>
				</button>

				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#dialog1">
					<i class="ace-icon fa fa-envelope bigger-130"></i> <span class="bigger-110">Soạn thư</span>
				</button>

				<button class="btn btn-danger" id="btnNotify">
					<i class="ace-icon fa fa-envelope bigger-130"> </i> <span class="bigger-110">Yêu cầu của các
						phòng</span>
				</button>
			</div>
			<hr>
			<div class="card card-outline card-primary" style="padding:20px;">
				<div class="card-header">
					<h3 class="card-title">Thông báo đến các phòng</h3>

					<div class="card-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="table_search" class="form-control float-right"
								placeholder="Search">

							<div class="input-group-append">
								<button type="submit" class="btn btn-default">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<form id="formSubmit">
					<div class="card-body table-responsive p-0">
						<table class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>Nhà</th>
									<th>Phòng</th>
									<th style="min-width: 100px;">Ngày gửi</th>
									<th>Nội dung</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${messageSended.listResult}">
									<tr>
										<td>${item.houseName}</td>
										<td>${item.roomName}</td>
										<td>${item.createdDate}</td>
										<td>${item.content}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
					<br>
					<ul class="pagination" id="pagination"></ul>
					<input type="hidden" value="" id="type" name="type" /> <input type="hidden" value="" id="houseId"
						name="houseId" /> <input type="hidden" value="" id="page" name="page">

				</form>
			</div>
		</div>
	</section>







	<div class="modal fade" id="dialog1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title">Soạn thư</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form id="formNotify">
						<div>
							Gửi đến <select id="notify">
								<option value="0">Tất cả</option>
								<c:forEach var="item" items="${roomModel.listResult}">
									<option value="${item.id}">Phòng : ${item.roomName}</option>
								</c:forEach>
							</select>
						</div>
						<br> <br>
						<textarea rows="5" class="form-control" id="content"
							placeholder="Nhập nội dung ...."></textarea>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" data-dismiss="modal">Hủy</button>
							<button type="button" class="btn btn-primary" id="send">Gửi</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>




	<script>
		var totalPages = ${ messageSended.totalPage };
		var currentPage = ${ messageSended.page };
		var limit = 10;
		var houseId = <%=request.getParameter("houseId") %>;
		$(function () {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages: totalPages,
				visiblePages: 5,
				startPage: currentPage,
				onPageClick: function (event, page) {
					if (currentPage != page) {
						$('#type').val('sendedmessage');
						$('#houseId').val(houseId);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});

		function goBack() {
			window.history.back();
		}
		$(document).ready(function () {
			$('#checkAll').change(function () {
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

		$('#send').on('click', function (e) {
			e.preventDefault();
			var data = {};
			data["content"] = $('#content').val();
			var roomid = $('#notify').val();
			var houseid = <%=request.getParameter("houseId") %>;
			var ids = [roomid, houseid];
			data["ids"] = ids;
			if (data["content"].trim() === '') {
				alert("Bạn chưa nhập nội dung nuốn gửi");
				return;
			}
			$.ajax({
				url: '${APIurl}',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function (result) {
					location.reload();
					alert("Gửi thành công");
				},
				error: function (error) {
					location.reload();
					alert("Gửi thất bại");
				}
			});
		});

		$('#btnNotify').click(
			function () {
				window.location.href = "${SendedMessageUrl}" +<%=request.getParameter("houseId") %> +"&page=1";
			});
	</script>


</body>

</html>