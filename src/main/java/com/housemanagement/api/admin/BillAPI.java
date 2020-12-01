package com.housemanagement.api.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.housemanagement.model.BillModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IBillService;
import com.housemanagement.utils.HttpUtil;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-admin-bill"})
public class BillAPI extends HttpServlet{

	@Inject
	private IBillService billService;
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		BillModel billModel = HttpUtil.of(req.getReader()).toModel(BillModel.class);
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		billModel = billService.save(billModel,userModel);
		mapper.writeValue(resp.getOutputStream(),billModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		BillModel updateBill = HttpUtil.of(req.getReader()).toModel(BillModel.class);
		updateBill = billService.updateStatus(updateBill);
		mapper.writeValue(resp.getOutputStream(), updateBill);
	}
}
