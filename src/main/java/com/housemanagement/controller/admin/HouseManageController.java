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

@WebServlet(urlPatterns = {"/admin/housemanagement"})
public class HouseManageController extends HttpServlet{

	@Inject
	private IHouseService houseService;
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		HouseModel model = new HouseModel();
		model.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", model);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/house/house.jsp");
		rd.forward(req, resp);
	}
}
