<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin giao dịch</title>
</head>
<body>
	<div class="main-content-inner">
		<div class="page-content mt-3  mb-3  ml-3  mr-3">
			<h3>Thông tin giao dịch</h3>
			<hr>
			<form id="formBill" method="get">
				<div class="row">
					<div class="col-xs-12">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Ngày tạo</th>
										<th>Tiền phòng (VNĐ)</th>
										<th>Tiền mạng (VNĐ)</th>
										<th>Tiền nước (VNĐ)</th>
										<th>Tiền điện (VNĐ)</th>
										<th>Tiền khác (VNĐ)</th>
										<th>Tổng tiền (VNĐ)</th>
										<th>Tình trạng</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${billModel.listResult}">
										<tr>
											<td>${item.createdDate}</td>
											<td>${item.roomMoney}</td>
											<td>${item.networkMoney}</td>
											<td>${item.waterMoney}</td>
											<td>${item.electrictyMoney}</td>
											<td>${item.otherMoney}</td>
											<td>${item.totalMoney}</td>
											<td><c:if test="${item.status == 0}">Chưa đóng tiền</c:if>
												<c:if test="${item.status == 1}">Đã đóng tiền</c:if>
											</td>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>