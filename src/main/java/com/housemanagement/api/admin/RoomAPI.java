package com.housemanagement.api.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.housemanagement.model.RoomModel;
import com.housemanagement.service.IRoomService;
import com.housemanagement.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-room"})
public class RoomAPI extends HttpServlet{

	@Inject
	private IRoomService roomService;
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		RoomModel roomModel = HttpUtil.of(req.getReader()).toModel(RoomModel.class);
		roomModel = roomService.save(roomModel);
		mapper.writeValue(resp.getOutputStream(), roomModel);	
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		RoomModel updateRoom = HttpUtil.of(req.getReader()).toModel(RoomModel.class);
		updateRoom = roomService.update(updateRoom);
		mapper.writeValue(resp.getOutputStream(), updateRoom);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		RoomModel roomModel = HttpUtil.of(req.getReader()).toModel(RoomModel.class);
		roomService.delete(roomModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
