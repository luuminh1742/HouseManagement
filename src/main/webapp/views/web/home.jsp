<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">

	<title>Trang chủ</title>

</head>

<body>
	<div class="main-content-inner">
		<div class="page-content mt-3  mb-3  ml-3  mr-3">
			<h1 class="text-center">Thông tin chi tiết nhà ở</h1>
			<h3>Quản lý</h3>
			<hr>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr>
							<td>Họ tên</td>
							<td>${manager.fullName}</td>
						</tr>
						<tr>
							<td>Số điện thoại</td>
							<td>${manager.phone}</td>
						</tr>
						<tr>
							<td>Giới tính</td>
							<td>${manager.gender}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<h3>Bảng tiền phòng</h3>
			<hr>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr>
							<td>Tiền phòng</td>
							<td>${roomModel.roomMoney} (VNĐ/tháng)</td>
						</tr>
						<tr>
							<td>Tiền điện</td>
							<td>${roomModel.electrictyMoney} (VNĐ/số)</td>
						</tr>
						<tr>
							<td>Tiền nước</td>
							<td>
								<c:if test="${roomModel.typeWaterMoney == 1}">
									${roomModel.waterMoney} (VNĐ/người)
								</c:if>
								<c:if test="${roomModel.typeWaterMoney == 2}">
									${roomModel.waterMoney} (VNĐ/phòng)
								</c:if>
								<c:if test="${roomModel.typeWaterMoney == 3}">
									${roomModel.waterMoney} (VNĐ/số)
								</c:if>
								<c:if test="${roomModel.typeWaterMoney == 4}">
									${roomModel.waterMoney} (VNĐ)
								</c:if>
							</td>
						</tr>
						<tr>
							<td>Tiền mạng</td>
							<td>
								<c:if test="${roomModel.typeNetworkMoney == 1}">
									${roomModel.networkMoney} (VNĐ/người)
								</c:if>
								<c:if test="${roomModel.typeNetworkMoney == 2}">
									${roomModel.networkMoney} (VNĐ/phòng)
								</c:if>
								<c:if test="${roomModel.typeNetworkMoney == 3}">
									${roomModel.networkMoney} (VNĐ)
								</c:if>
							</td>
						</tr>
						<tr>
							<td>Tiền khác</td>
							<td>${roomModel.otherMoney} (VNĐ)</td>
						</tr>
						<tr>
							<td>Số điện cuối</td>
							<td>${roomModel.lastElectrictyNumber} (số)</td>
						</tr>
						<tr>
							<td>Số nước cuối</td>
							<td>${roomModel.lastWaterNumber} (số)</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<h3>Chi tiết phòng</h3>
			<hr>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr>
							<td style="min-width: 120px;">Địa chỉ nhà</td>
							<td>${houseModel.address}</td>
						</tr>
						<tr>
							<td>Ghi chú</td>
							<td>${roomModel.notes}</td>
						</tr>
						<tr>
							<td>Nội quy</td>
							<td>${houseModel.rules}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>

</html>