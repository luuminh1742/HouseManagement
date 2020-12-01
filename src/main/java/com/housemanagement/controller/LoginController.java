package com.housemanagement.controller;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.UserModel;
import com.housemanagement.service.IUserService;
import com.housemanagement.utils.FormUtil;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/dang-nhap"})
public class LoginController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	@Inject
	private IUserService userService;
	
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String alert = req.getParameter("alert");
		String message = req.getParameter("message");
		if (message != null && alert != null) {
			req.setAttribute("message", resourceBundle.getString(message));
			req.setAttribute("alert", alert);
		}
		RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel model = FormUtil.toModel(UserModel.class, req);
		model = userService.findByUsernameAndPasswordAndStatus(model.getUsername(), model.getPassword());
		if(model !=null) {
			SessionUtil.getInstance().putValue(req, "USERMODEL", model);
			if(model.getRole().getCode().equals("USER")) {
				resp.sendRedirect(req.getContextPath()+"/trang-chu");
			}else if(model.getRole().getCode().equals("ADMIN")) {
				resp.sendRedirect(req.getContextPath()+"/admin");
			}
		}else {
			resp.sendRedirect(req.getContextPath()+"/dang-nhap?message=username_password_invalid&alert=danger");
		}
	}
}
