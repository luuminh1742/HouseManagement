package com.housemanagement.api.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.housemanagement.model.NotifyDetailModel;
import com.housemanagement.model.NotifyModel;
import com.housemanagement.model.RoomModel;
import com.housemanagement.service.INotifyDetailService;
import com.housemanagement.service.INotifyService;
import com.housemanagement.service.IRoomService;
import com.housemanagement.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-notify"})
public class NotifyAPI extends HttpServlet{

	@Inject
	private INotifyDetailService notifyDetailService;
	@Inject
	private INotifyService notifyService;
	@Inject
	private IRoomService roomService;
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		NotifyModel notifyModel = HttpUtil.of(req.getReader()).toModel(NotifyModel.class);
		Long[] ids = notifyModel.getIds();
		notifyModel = notifyService.save(notifyModel);
		if(ids[0]==0) {
			RoomModel roomModel = new RoomModel();
			roomModel.setListResult(roomService.findByHouseId(ids[1]));
			for (RoomModel room : roomModel.getListResult()) {
				NotifyDetailModel notifyDetailModel = new NotifyDetailModel();
				notifyDetailModel.setNotifyId(notifyModel.getId());
				notifyDetailModel.setRoomId(room.getId());
				notifyDetailService.save(notifyDetailModel);
			}
		}else {
			NotifyDetailModel notifyDetailModel = new NotifyDetailModel();
			notifyDetailModel.setNotifyId(notifyModel.getId());
			notifyDetailModel.setRoomId(ids[0]);
			notifyDetailService.save(notifyDetailModel);
		}
		mapper.writeValue(resp.getOutputStream(),notifyModel);
	}
	
}
