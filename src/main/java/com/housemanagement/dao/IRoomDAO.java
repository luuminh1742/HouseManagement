package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.RoomModel;
import com.housemanagement.paging.Pageble;

public interface IRoomDAO extends GenericDAO<RoomModel>{
	List<RoomModel> findAll();
	List<RoomModel> findByHouseId(Long houseId,Pageble pageble);
	RoomModel findOne(Long id);
	Long save(RoomModel roomModel);
	void delete(Long id);
	void update(RoomModel updateRoom);
	List<RoomModel> findByUserId(Long userId);
	int getTotalItem(Long houseId);
	List<RoomModel> findByHouseId(Long houseId);
}
