package com.housemanagement.api.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.housemanagement.model.FeedbackModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IFeedbackService;
import com.housemanagement.utils.HttpUtil;
import com.housemanagement.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-user-feedback"})
public class FeedbackAPI extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Inject
	private IFeedbackService feedbackService;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		FeedbackModel feedbackModel = HttpUtil.of(req.getReader()).toModel(FeedbackModel.class);
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		feedbackModel.setUserId(userModel.getId());
		feedbackModel = feedbackService.save(feedbackModel);
		mapper.writeValue(resp.getOutputStream(),feedbackModel);
	}
	
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		FeedbackModel feedbackModel = HttpUtil.of(req.getReader()).toModel(FeedbackModel.class);
		feedbackService.delete(feedbackModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
