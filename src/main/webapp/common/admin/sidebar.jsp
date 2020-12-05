<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="" class="brand-link"> <img src='<c:url value="/template/admin/dist/img/AdminLTELogo.png"/>'
			alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> <span
			class="brand-text font-weight-light">Quản
			lý nhà</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src='<c:url value="/template/admin/dist/img/user2-160x160.jpg"/>' class="img-circle elevation-2"
					alt="User Image">
			</div>
			<div class="info">
				<a href='<c:url value="/admin/profile?type=info"/>' class="d-block">${USERMODEL.fullName}</a>
			</div>
		</div>


		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item menu-open"><a href='<c:url value="/admin"/>' class="nav-link active"> <i
							class="nav-icon fas fa-tachometer-alt"></i>
						<p>Trang chủ</p>
					</a></li>
				<li class="nav-item"><a class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							Quản lý nhà <i class="right fas fa-angle-left"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href='<c:url value="/admin/housemanagement"/>' class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
								<p>Danh sách nhà</p>
							</a></li>

						<c:forEach var="item" items="${houses.listResult}">
							<li class="nav-item"><a
									href='<c:url value="/admin/house/room?type=manager&houseId=${item.id}&page=1"/>'
									class="nav-link"> <i class="fas fa-caret-right nav-icon"></i>
									<p>${item.name}</p>
								</a></li>
						</c:forEach>

					</ul>
				</li>



				<li class="nav-item"><a href='<c:url value="/admin/profile?type=info"/>' class="nav-link">
						<i class="nav-icon fas fa-user-alt"></i>
						<p>
							Quản lý tài khoản
						</p>
					</a>
				</li>

			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>