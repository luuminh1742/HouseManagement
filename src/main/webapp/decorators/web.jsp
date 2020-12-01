<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="Trang chủ" /></title>
<!--===============================================================================================-->	
<link rel="icon" type="image/png" href='<c:url value="/template/login/images/icons/favicon.ico"/>'/>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/simple-sidebar.css'/>"
	rel="stylesheet">

<script
	src='<c:url value="/template/admin/assets/ajax/jquery.min.js" />'></script>


<!--  -->




<!--  -->


</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<%@ include file="/common/web/sidebar.jsp"%>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<!-- header -->
			<%@ include file="/common/web/header.jsp"%>
			<!-- header -->
			<div class="container-fluid">
				<dec:body />
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<c:url value='/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

</body>
</html>