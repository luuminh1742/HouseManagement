package com.housemanagement.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.BillModel;
import com.housemanagement.model.HouseModel;
import com.housemanagement.model.RoomModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IBillService;
import com.housemanagement.service.IHouseService;
import com.housemanagement.service.IRoomService;
import com.housemanagement.utils.FormUtil;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/admin/house/room/bill"})
public class BillController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	@Inject
	private IRoomService roomService;
	@Inject
	private IBillService billService;
	@Inject
	private IHouseService houseService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BillModel billModel = FormUtil.toModel(BillModel.class, req);
		String view = "";
		
		
		
		
		if(billModel.getType().equals("add")) {
			view = "/views/admin/house/bill/newbill.jsp";
		}else {
			view = "/views/admin/house/bill/info.jsp";
			billModel = billService.findOne(billModel.getId());
			req.setAttribute("model", billModel);
		}
		RoomModel roomModel = roomService.findOne(billModel.getRoomId());
		req.setAttribute("room", roomModel);
		
		//-- load house name in sidebar
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		HouseModel houseModel = new HouseModel();
		houseModel.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", houseModel);
		
		
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}

	
}
