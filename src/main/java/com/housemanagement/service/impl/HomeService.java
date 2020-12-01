package com.housemanagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.housemanagement.dao.IHomeDAO;
import com.housemanagement.model.RoomStatusStatisticsModel;
import com.housemanagement.service.IHomeService;

public class HomeService implements IHomeService{

	@Inject
	private IHomeDAO homeDAO;
	
	@Override
	public List<RoomStatusStatisticsModel> findByUserId(Long userId) {
		return homeDAO.findByUserId(userId);
	}

}
