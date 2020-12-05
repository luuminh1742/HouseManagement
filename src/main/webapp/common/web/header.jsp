<%@page import="com.housemanagement.utils.SessionUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
  <button class="btn btn-primary" id="menu-toggle">
    <i class="fa fa-bars" style="font-size:20px;color:white;"></i>
  </button>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          ${USERMODEL.fullName}
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<c:url value='/tai-khoan'/>">
            <i class="fa fa-user"></i> Tài khoản
          </a>
          <a class="dropdown-item" href="<c:url value='/thoat'/>">
            <i class="fa fa-power-off"></i> Đăng xuất
          </a>
        </div>
      </li>
    </ul>
  </div>
</nav>