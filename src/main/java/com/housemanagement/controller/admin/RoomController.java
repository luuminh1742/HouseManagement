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
import com.housemanagement.paging.PageRequest;
import com.housemanagement.paging.Pageble;
import com.housemanagement.service.IBillService;
import com.housemanagement.service.IHouseService;
import com.housemanagement.service.IRoomService;
import com.housemanagement.service.IUserService;
import com.housemanagement.sort.Sorter;
import com.housemanagement.utils.FormUtil;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/admin/house/room"})
public class RoomController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	@Inject
	private IRoomService roomService;
	@Inject
	private IUserService userService;
	@Inject
	private IBillService billService;
	@Inject
	private IHouseService houseService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RoomModel roomModel = FormUtil.toModel(RoomModel.class, req);
		String view = "";
		if(roomModel.getType().equals("edit")) {
			view = "/views/admin/house/room/edit.jsp";
			if(roomModel.getId() != null) {
				roomModel = roomService.findOne(roomModel.getId());
			}
			
		}else if(roomModel.getType().equals("info")){
			view = "/views/admin/house/room/info.jsp";
			UserModel userModel = new UserModel();
			userModel.setListResult(userService.findByRoomId(roomModel.getId()));
			req.setAttribute("userModel", userModel);
			BillModel billModel = new BillModel();
			billModel.setListResult(billService.findByRoomId(roomModel.getId()));
			req.setAttribute("billModel", billModel);
			roomModel = roomService.findOne(roomModel.getId());
		}
		else {
			view = "/views/admin/house/room/room.jsp";
			roomModel.setMaxPageItem(10);
			roomModel.setSortName("room_name");
			roomModel.setSortBy("asc");
			Pageble pageble = new PageRequest(roomModel.getPage(), roomModel.getMaxPageItem(),
					new Sorter(roomModel.getSortName(), roomModel.getSortBy()));
			roomModel.setTotalItem(roomService.getTotalItem(roomModel.getHouseId()));
			roomModel.setTotalPage((int)Math.ceil((double)roomModel.getTotalItem()/roomModel.getMaxPageItem()));
			roomModel.setListResult(roomService.findByHouseId(roomModel.getHouseId(),pageble));
		}
		
		req.setAttribute("model", roomModel);
		
		
		//-- load house name in sidebar
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		HouseModel houseModel = new HouseModel();
		houseModel.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", houseModel);
		
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
}
