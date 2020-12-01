package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.RoomStatusStatisticsModel;

public interface IHomeService {
	List<RoomStatusStatisticsModel> findByUserId(Long userId);
}
