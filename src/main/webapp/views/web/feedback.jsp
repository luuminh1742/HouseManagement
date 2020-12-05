<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-user-feedback" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Phản hồi</title>
</head>

<body>
	<div class="main-content-inner">
		<div class="page-content mt-3  mb-3  ml-3  mr-3">
			<form id="formFeedback">
				<h3>Gửi phản hồi</h3>
				<hr>
				<h4>Nhập ý kiến ở đây</h4>
				<textarea rows="5" cols="100" placeholder="Nhập nội dung" id="content"></textarea>
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-primary" type="submit">
						<i class="fa fa-check bigger-110"></i> Gửi
					</button>

					&nbsp; &nbsp;
					<button class="btn btn-primary" type="reset">
						<i class="fa fa-undo bigger-110"></i> Đặt lại
					</button>
				</div>
			</form>
			<br> <br>
			<h3>Phản hồi đã gửi</h3>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th class="text-left" style="min-width: 130px;">Thời gian gửi</th>
							<th scope="col" class="text-left">Nội dung phản hồi</th>
							<th class="text-right">
	
								<button id="btnDelete" type="button"
									class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip"
									title='Xóa phòng'>
									<span> <i class="fa fa-trash-o bigger-110 pink"></i>
									</span>
								</button>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${feedback.listResult}">
							<tr>
								<td><input type="checkbox" value="${item.id}" class="checkAllItem"></td>
								<td class="text-left">${item.createdDate}</td>
								<td colspan="2" class="text-left">${item.content}</td>
							<tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>


	<script>


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

		$("#formFeedback").submit(function (e) {
			e.preventDefault();
			var data = {};
			data["content"] = $('#content').val();

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
					alert("Gửi thất bại");
				}
			});

		});


		$("#btnDelete").click(function () {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			var confirmDelete = confirm("Xác nhận xóa phản hồi này");
			if (confirmDelete) {
				deleteFeedback(data);
			}
		});

		function deleteFeedback(data) {
			$.ajax({
				url: '${APIurl}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function (result) {
					location.reload();
					alert("Xóa thành công");
				},
				error: function (error) {
					location.reload();
					alert("Xóa thất bại");
				}
			});
		}



	</script>
</body>

</html>