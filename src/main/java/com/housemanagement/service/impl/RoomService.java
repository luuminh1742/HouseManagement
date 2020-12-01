package com.housemanagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.housemanagement.dao.IRoomDAO;
import com.housemanagement.model.RoomModel;
import com.housemanagement.paging.Pageble;
import com.housemanagement.service.IRoomService;

public class RoomService implements IRoomService{

	@Inject
	private IRoomDAO roomDAO;
	@Override
	public List<RoomModel> findAll() {
		return roomDAO.findAll();
	}
	@Override
	public RoomModel findOne(Long id) {
		return roomDAO.findOne(id);
	}
	@Override
	public List<RoomModel> findByHouseId(Long houseId,Pageble pageble) {
		return roomDAO.findByHouseId(houseId,pageble);
	}
	@Override
	public List<RoomModel> findByHouseId(Long houseId) {
		return roomDAO.findByHouseId(houseId);
	}
	@Override
	public RoomModel save(RoomModel roomModel) {
		roomModel.setStatus(1);
		roomModel.setMember(0);
		Long id = roomDAO.save(roomModel);
		return findOne(id);
	}
	@Override
	public void delete(Long[] ids) {
		for (Long id : ids) {
			roomDAO.delete(id);
		}
		
	}
	@Override
	public RoomModel update(RoomModel updateRoom) {
		roomDAO.update(updateRoom);
		return findOne(updateRoom.getId());
	}
	@Override
	public List<RoomModel> findByUserId(Long userId) {
		return roomDAO.findByUserId(userId);
	}
	@Override
	public int getTotalItem(Long houseId) {
		return roomDAO.getTotalItem(houseId);
	}

}
