package com.housemanagement.api.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.housemanagement.model.HouseModel;
import com.housemanagement.service.IHouseService;
import com.housemanagement.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-house"})
public class HouseAPI extends HttpServlet{

	@Inject
	private IHouseService houseService;
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		HouseModel houseModel = HttpUtil.of(req.getReader()).toModel(HouseModel.class);
		houseModel = houseService.save(houseModel);
		mapper.writeValue(resp.getOutputStream(), houseModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		HouseModel updateHouse = HttpUtil.of(req.getReader()).toModel(HouseModel.class);
		updateHouse = houseService.update(updateHouse);
		mapper.writeValue(resp.getOutputStream(), updateHouse);
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		HouseModel houseModel = HttpUtil.of(req.getReader()).toModel(HouseModel.class);
		houseService.delete(houseModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
