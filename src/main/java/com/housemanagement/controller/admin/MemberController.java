package com.housemanagement.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.HouseModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IHouseService;
import com.housemanagement.service.IUserService;
import com.housemanagement.utils.FormUtil;

@WebServlet(urlPatterns = {"/admin/member"})
public class MemberController extends HttpServlet{

	@Inject
	private IUserService userService;
	@Inject
	private IHouseService houseService;
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel userModel = FormUtil.toModel(UserModel.class, req);
		if(userModel.getId() != null) {
			userModel = userService.findOne(userModel.getId());
			req.setAttribute("model", userModel);
		}
		
		
		//-- load house name in sidebar
		HouseModel houseModel = new HouseModel();
		houseModel.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", houseModel);
		
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/house/member/edit.jsp");
		rd.forward(req, resp);
	}
}
