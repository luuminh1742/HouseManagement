<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<!-- Sidebar -->
<div class="bg-light border-right" id="sidebar-wrapper">
	<div class="sidebar-heading">Tài khoản phòng</div>
	<div class="list-group list-group-flush">
		<a href="<c:url value='/trang-chu'/>" class="list-group-item list-group-item-action bg-light">
			<i class="fa fa-home" style="font-size:20px;color:blue;"></i> Trang chủ
		</a>
		<a href="<c:url value='/thong-bao'/>" class="list-group-item list-group-item-action bg-light">
			<i class="fa fa-bell" style="font-size:20px;color:blue;"></i> Thông báo
		</a>
		<a href="<c:url value='/phan-hoi'/>" class="list-group-item list-group-item-action bg-light">
			<i class="fa fa-comment" style="font-size:20px;color:blue;"></i> Gửi ý kiến
		</a>
		<a href="<c:url value='/giao-dich'/>" class="list-group-item list-group-item-action bg-light">
			<i class="fa fa-money" style="font-size:20px;color:blue;"></i> Theo dõi giao dịch
		</a>
		<a href="<c:url value='/tai-khoan'/>" class="list-group-item list-group-item-action bg-light">
			<i class="fa fa-user" style="font-size:20px;color:blue;"></i> Thông tin cá nhân
		</a>

	</div>
</div>
<!-- /#sidebar-wrapper -->