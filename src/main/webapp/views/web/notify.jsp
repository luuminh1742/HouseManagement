<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Thông báo</title>
</head>

<body>
	<div class="main-content-inner">
		<div class="page-content mt-3  mb-3  ml-3  mr-3">
			<h3>Thông báo</h3>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th scope="col">Nội dung thông báo</th>
						<th scope="col" class="text-right">Thời gian gửi</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${notify.listResult}">
						<tr>
							<td>${item.content}</td>
							<td class="text-right">${item.createdDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</body>

</html>