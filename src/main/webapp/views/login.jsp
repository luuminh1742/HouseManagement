<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>



	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('template/login/images/bg-01.jpg');">
			<div class="wrap-login100" style="width: 400px;">
				<form class="login100-form validate-form"
					action="<c:url value='/dang-nhap'/>" id="formLogin" method="post">
					<span class="login100-form-logo"> <i
						class="zmdi zmdi-landscape"></i>
					</span> <span class="login100-form-title p-b-34 p-t-27"> Đăng nhập
					</span> 




					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" id="username" name="username"
							placeholder="Tên đăng nhập"> <span class="focus-input100"
							data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" id="password"
							name="password" placeholder="Mật khẩu"> <span
							class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<input type="hidden" value="login" name="action" />
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">Đăng nhập
						</button>
					</div>

					
					<c:if test="${not empty message}">
						<br>
						<div class="alert alert-${alert}">${message}</div>
						<br>
					</c:if>
					
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>

</body>
</html>