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
import com.housemanagement.utils.FormUtil;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = { "/admin/inforhouse" })
public class InforHouseController extends HttpServlet {

	@Inject
	private IHouseService houseService;

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * String id = req.getParameter("id"); String type = req.getParameter("type");
		 */
		String view = "";
		HouseModel model = FormUtil.toModel(HouseModel.class, req);
		if (model.getType().equals("edit")) {
			view = "/views/admin/house/infor/edit.jsp";

		} else {
			view = "/views/admin/house/infor/infor.jsp";
		}
		if (model.getId() != null) {
			model = houseService.findOne(model.getId());
		}

		req.setAttribute("model", model);
		
		
		//-- load house name in sidebar
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		HouseModel houseModel = new HouseModel();
		houseModel.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", houseModel);
		

		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
}
