package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.RoomModel;
import com.housemanagement.paging.Pageble;

public interface IRoomService {
	List<RoomModel> findAll();
	List<RoomModel> findByHouseId(Long houseId,Pageble pageble);
	List<RoomModel> findByHouseId(Long houseId);
	RoomModel findOne(Long id);
	RoomModel save(RoomModel roomModel);
	void delete(Long[] ids);
	RoomModel update(RoomModel updateRoom);
	List<RoomModel> findByUserId(Long userId);
	int getTotalItem(Long houseId);
}
