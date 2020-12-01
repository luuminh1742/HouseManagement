package com.housemanagement.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.HouseModel;
import com.housemanagement.model.RoomModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IHouseService;
import com.housemanagement.service.IRoomService;
import com.housemanagement.service.IUserService;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/trang-chu"})
public class HomeController extends HttpServlet{

	@Inject
	private IRoomService roomService;
	@Inject 
	private IUserService userService;
	@Inject
	private IHouseService houseService;
	
	private static final long serialVersionUID = -9122691137140154563L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		RoomModel roomModel = roomService.findOne(userModel.getRoomId());
		UserModel manager = userService.findByHouseId(roomModel.getHouseId());
		HouseModel houseModel = houseService.findOne(roomModel.getHouseId());
		req.setAttribute("houseModel", houseModel);
		req.setAttribute("manager", manager);
		req.setAttribute("roomModel", roomModel);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
		rd.forward(req, resp);
	}
}
