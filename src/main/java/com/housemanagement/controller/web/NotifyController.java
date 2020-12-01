package com.housemanagement.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.NotifyModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.INotifyService;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/thong-bao"})
public class NotifyController extends HttpServlet{

	
	
	private static final long serialVersionUID = -9122691137140154563L;
	@Inject
	private INotifyService notifyService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		NotifyModel notifyModel = new NotifyModel();
		notifyModel.setListResult(notifyService.findByRoomId(userModel.getRoomId()));
		req.setAttribute("notify", notifyModel);
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/notify.jsp");
		rd.forward(req, resp);
	}
}
