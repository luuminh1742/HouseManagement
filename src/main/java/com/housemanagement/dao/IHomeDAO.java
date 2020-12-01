package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.RoomStatusStatisticsModel;

public interface IHomeDAO extends GenericDAO<RoomStatusStatisticsModel>{
	List<RoomStatusStatisticsModel> findByUserId(Long userId);
}
