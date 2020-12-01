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
			<h4>Quản lý : ${manager.fullName}</h4>
			<h4>Số điện thoại : ${manager.phone}</h4>
			<h4>Địa chỉ nhà : ${houseModel.address}</h4>
			
			<h4><u>Bảng tiền phòng</u></h4>
			<ul style="font-size:18px;">
				<li>Tiền phòng : ${roomModel.roomMoney} (VNĐ/tháng)</li>
				<li>Tiền điện : ${roomModel.electrictyMoney} (VNĐ/số)</li>
				<li>
					<c:if test="${roomModel.typeWaterMoney == 1}">
						Tiền nước : ${roomModel.waterMoney} (VNĐ/người)
					</c:if>
					<c:if test="${roomModel.typeWaterMoney == 2}">
						Tiền nước : ${roomModel.waterMoney} (VNĐ/phòng)
					</c:if>
					<c:if test="${roomModel.typeWaterMoney == 3}">
						Tiền nước : ${roomModel.waterMoney} (VNĐ/số)
					</c:if>
					<c:if test="${roomModel.typeWaterMoney == 4}">
						Tiền nước : ${roomModel.waterMoney} (VNĐ)
					</c:if>
				</li>
				<li>
					<c:if test="${roomModel.typeNetworkMoney == 1}">
						Tiền mạng : ${roomModel.networkMoney} (VNĐ/người)
					</c:if>
					<c:if test="${roomModel.typeNetworkMoney == 2}">
						Tiền mạng : ${roomModel.networkMoney} (VNĐ/phòng)
					</c:if>
					<c:if test="${roomModel.typeNetworkMoney == 3}">
						Tiền mạng : ${roomModel.networkMoney} (VNĐ)
					</c:if>
				</li>
				
				<li>Tiền khác : ${roomModel.otherMoney} (VNĐ)</li>
				<li>Số điện cuối : ${roomModel.lastElectrictyNumber} (số)</li>
				<li>Số nước cuối : ${roomModel.lastWaterNumber} (số)</li>
			</ul>
			<h4><u>Ghi chú : </u></h4>
			<p style="padding-left:10px;font-size:18px;">${roomModel.notes}</p>
			<h4><u>Nội quy : </u></h4>
			<p style="padding-left:10px;">${houseModel.rules}</p>
		</div>
	</div>
</body>

</html>