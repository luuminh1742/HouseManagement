package com.housemanagement.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.UserModel;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/tai-khoan"})
public class ProfileController extends HttpServlet{

	
	
	private static final long serialVersionUID = -9122691137140154563L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		req.setAttribute("model", userModel);
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/profile.jsp");
		rd.forward(req, resp);
	}
}
