package com.housemanagement.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/thoat"})
public class LogoutController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SessionUtil.getInstance().removeValue(req, "USERMODEL");
		resp.sendRedirect(req.getContextPath()+"/dang-nhap");
	}
}
