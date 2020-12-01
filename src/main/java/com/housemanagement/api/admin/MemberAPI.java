package com.housemanagement.api.admin;

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
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-admin-member"})
public class MemberAPI  extends HttpServlet{

	@Inject
	private IUserService userService;
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel userModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		UserModel user = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		userModel = userService.addMember(userModel,user.getFullName());
		mapper.writeValue(resp.getOutputStream(), userModel);
		
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel updateUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		updateUser = userService.update(updateUser);
		mapper.writeValue(resp.getOutputStream(), updateUser);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel userModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		userService.deleteMemberInRoom(userModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
