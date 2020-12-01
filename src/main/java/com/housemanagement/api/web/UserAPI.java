package com.housemanagement.api.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IUserService;
import com.housemanagement.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-user-setpassword"})
public class UserAPI extends HttpServlet{
	@Inject
	private IUserService userService;
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel updateUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		updateUser = userService.updatePassword(updateUser);
		mapper.writeValue(resp.getOutputStream(), updateUser);
	}
}
