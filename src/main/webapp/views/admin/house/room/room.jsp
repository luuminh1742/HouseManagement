<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-room" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phòng</title>
</head>
<body>

<!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Quản lý phòng</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<c:url value='/admin'/>" >Trang chủ</a></li>
              <li class="breadcrumb-item"><a href="<c:url value='/admin/housemanagement'/>" >Quản lý nhà</a></li>
              <li class="breadcrumb-item active">Quản lý phòng</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>


<!-- Main content -->
	<section class="content">
		<!-- /.card-header -->
		<div class="card-body">
		
		<div class="card card-outline card-primary" style="padding: 20px;">
			<div class="pull-right">

				<button onclick="goBack()" type="button"
					class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
					data-toggle="tooltip" title='Quay lại'>
					<span> <i class="fas fa-arrow-left bigger-110 pink"></i>
					</span>
				</button>
				<button onclick="reloadPage()" type="button"
					class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
					data-toggle="tooltip" title='Làm mới trang'>
					<span> <i class="fas fa-redo bigger-110 pink"></i>
					</span>
				</button> 
				<a flag="info"
					class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
					data-toggle="tooltip" title='Thông báo'
					href='<c:url value="/admin/house/notify?type=notify&houseId=${model.houseId}&page=1"/>'>
					<span> <i class="fa fa-envelope bigger-110 purple"></i>
					</span>
				</a> 
				<a flag="info"
					class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
					data-toggle="tooltip" title='Thêm phòng'
					href='<c:url value="/admin/house/room?type=edit&houseId=${model.houseId}"/>'>
					<span> <i class="fa fa-plus-circle bigger-110 purple"></i>
					</span>
				</a> 
				<button id="btnDelete" type="button"
					class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
					data-toggle="tooltip" title='Xóa phòng'>
					<span> <i class="fas fa-trash bigger-110 pink"></i>
					</span>
				</button>
			</div>
			<hr>
			<form action="<c:url value='/admin/house/room'/>" id="formSubmit"
				method="get">
				<div class="col-xs-12">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll"></th>
									<th>Tên phòng</th>
									<th>Tình trạng</th>
									<th>Thành viên</th>
									<th>Ghi chú</th>
									<th style="min-width: 174px;">Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td><input type="checkbox" id="checkbox_${item.id}"
											value="${item.id}" class="checkAllItem"></td>
										<td>${item.roomName}</td>
										<td><c:if test="${item.member > 0 }"><span class="text-red">Đang thuê</span></c:if>
											<c:if test="${item.member == 0 }"><span class="text-green">Trống</span></c:if></td>
										<td>${item.member}</td>
										<td>${item.notes}</td>
										<td><a class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title="Cập nhật phòng"
											href="<c:url value='/admin/house/room?type=edit&id=${item.id}'/>">
												<i class="fas fa-edit" aria-hidden="true"></i>
										</a> <a class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title="Xem phòng"
											href="<c:url value='/admin/house/room?type=info&id=${item.id}'/>">
												<i class="fa fa-eye" aria-hidden="true"></i>
										</a> <a class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title="Thu tiền"
											href="<c:url value='/admin/house/room/bill?type=add&roomId=${item.id}'/>">
												<i class="fas fa-money-bill" aria-hidden="true"></i>
										</a> <a class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title="Thêm người ở"
											href="<c:url value='/admin/member?roomId=${item.id}'/>">
												<i class="fas fa-user-plus" aria-hidden="true"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<ul class="pagination" id="pagination"></ul>
						<input type="hidden" value="" id="type" name="type" /> 
						<input type="hidden" value="" id="houseId" name="houseId" />
						<input type="hidden" value="" id="page" name="page"> 
					</div>
				</div>
			</form>
			
			
			</div>
		</div>
	</section>

	<!-- /.main-content -->
	<script>
	
		function goBack() {
			window.history.back();
		}
	
		function reloadPage() {
			location.reload();
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
		
		
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		var limit = 10;
		var houseId = <%=request.getParameter("houseId")%>;
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 5,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#type').val('manager');
						$('#houseId').val(houseId);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
	
		

		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function() {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			var confirmDelete = confirm("Xác nhận xóa phòng");
			if (confirmDelete) {
				deleteRoom(data);
			}
		});

		function deleteRoom(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'DELETE',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					location.reload();
					alert("Xóa thành công");
				},
				error : function(error) {
					location.reload();
					alert("Xóa thất bại");
				}
			});
		}
	</script>
</body>
</html>