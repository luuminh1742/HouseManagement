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
import com.housemanagement.model.RoomModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.model.ViewFeedbackModel;
import com.housemanagement.paging.PageRequest;
import com.housemanagement.paging.Pageble;
import com.housemanagement.service.IFeedbackService;
import com.housemanagement.service.IHouseService;
import com.housemanagement.service.IRoomService;
import com.housemanagement.sort.Sorter;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/admin/house/notify"})
public class NotifyController extends HttpServlet{

	
	private static final long serialVersionUID = -9122691137140154563L;
	@Inject
	private IRoomService roomService;
	@Inject
	private IFeedbackService feedbackService;
	@Inject
	private IHouseService houseService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		Long houseId = Long.parseLong(req.getParameter("houseId"));
		int page = Integer.parseInt(req.getParameter("page"));
		String path = "";
		if(type.equals("notify")) {
			Pageble pageble = new PageRequest(page, 10,
					new Sorter("createddate", "desc"));
			ViewFeedbackModel feedback = new ViewFeedbackModel();
			feedback.setPage(page);
			feedback.setMaxPageItem(10);
			feedback.setTotalItem(feedbackService.getTotalItemMessageSendedFromUserByHouseId(houseId));
			feedback.setTotalPage((int)Math.ceil((double)feedback.getTotalItem()/feedback.getMaxPageItem()));
			feedback.setListResult(feedbackService.findByHouseId(houseId,pageble));
			req.setAttribute("feedback", feedback);
			path = "/views/admin/house/notify/notify.jsp";
		}else {
			Pageble pageble = new PageRequest(page, 10,
					new Sorter("createddate", "desc"));
			ViewFeedbackModel messageSended = new ViewFeedbackModel();
			messageSended.setPage(page);
			messageSended.setMaxPageItem(10);
			messageSended.setTotalItem(feedbackService.getTotalItemMessageSendedFromAdminByHouseId(houseId));
			messageSended.setTotalPage((int)Math.ceil((double)messageSended.getTotalItem()/messageSended.getMaxPageItem()));
			messageSended.setListResult(feedbackService.findMessageSendedFromAdminByHouseId(houseId,pageble));
			req.setAttribute("messageSended", messageSended);
			path = "/views/admin/house/notify/sendedmessage.jsp";
		}
		RoomModel roomModel = new RoomModel();
		roomModel.setListResult(roomService.findByHouseId(houseId));
		req.setAttribute("roomModel", roomModel);
		
		
		//-- load house name in sidebar
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		HouseModel houseModel = new HouseModel();
		houseModel.setListResult(houseService.findAll(userModel.getId()));
		req.setAttribute("houses", houseModel);
		
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
