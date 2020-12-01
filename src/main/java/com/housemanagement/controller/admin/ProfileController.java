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
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = { "/admin/profile" })
public class ProfileController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Inject
	private IHouseService houseService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//-- load house name in sidebar
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		HouseModel houseModel = new HouseModel();
		houseModel.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", houseModel);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/profile.jsp");
		rd.forward(req, resp);
	}
}
