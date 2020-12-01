package com.housemanagement.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.housemanagement.model.FeedbackModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IFeedbackService;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/phan-hoi"})
public class FeedbackController extends HttpServlet{
	private static final long serialVersionUID = -9122691137140154563L;
	@Inject
	private IFeedbackService feedbackService;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		FeedbackModel feedback = new FeedbackModel();
		feedback.setListResult(feedbackService.findByUserId(userModel.getId()));
		req.setAttribute("feedback", feedback);
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/feedback.jsp");
		rd.forward(req, resp);
	}
}
