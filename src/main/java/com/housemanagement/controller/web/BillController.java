package com.housemanagement.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.BillModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IBillService;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/giao-dich"})
public class BillController extends HttpServlet{

	
	@Inject
	private IBillService billService;
	
	private static final long serialVersionUID = -9122691137140154563L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		BillModel billModel = new BillModel();
		billModel.setListResult(billService.findByRoomId(userModel.getRoomId()));
		req.setAttribute("billModel", billModel);
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/bill.jsp");
		rd.forward(req, resp);
	}
}
