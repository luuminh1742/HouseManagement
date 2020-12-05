package com.housemanagement.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.HouseModel;
import com.housemanagement.model.RoomStatusStatisticsModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IHomeService;
import com.housemanagement.service.IHouseService;
import com.housemanagement.utils.RoomStatusStatisticsUtil;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/admin"})
public class HomeController extends HttpServlet{

	@Inject
	private IHomeService homeService;
	@Inject
	private IHouseService houseService;
	
	private static final long serialVersionUID = -9122691137140154563L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/home.jsp");
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		RoomStatusStatisticsModel roomStatusStatistics = new RoomStatusStatisticsModel();
		roomStatusStatistics.setListResult(homeService.findByUserId(userModel.getId()));
		RoomStatusStatisticsUtil roomStatusStatisticsUtil = new RoomStatusStatisticsUtil();
		List<RoomStatusStatisticsUtil> listRoomStatusStatistics = roomStatusStatisticsUtil.convert(roomStatusStatistics.getListResult());
		
		req.setAttribute("RoomStatusStatistics", listRoomStatusStatistics);
		/*
		if(roomStatusStatistics.getListResult().size()!=0) {
			int unfinished = 0;
			int finished = 0;
			if(roomStatusStatistics.getListResult().size()==1) {
				if(roomStatusStatistics.getListResult().get(0).getStatus() == 1)
					finished = roomStatusStatistics.getListResult().get(0).getNumber();
				else
					unfinished = roomStatusStatistics.getListResult().get(0).getNumber();
			}else {
				if(roomStatusStatistics.getListResult().get(0).getStatus() == 1) {
					unfinished = roomStatusStatistics.getListResult().get(1).getNumber();
					finished = roomStatusStatistics.getListResult().get(0).getNumber();
				}else {
					unfinished = roomStatusStatistics.getListResult().get(0).getNumber();
					finished = roomStatusStatistics.getListResult().get(1).getNumber();
				}
					
			}
			req.setAttribute("unfinished", unfinished);
			req.setAttribute("finished", finished);
		}
		*/
		 
		//-- load house name in sidebar
		HouseModel houseModel = new HouseModel();
		houseModel.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", houseModel);
		
		rd.forward(req, resp);
	}
}
