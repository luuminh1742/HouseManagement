package com.housemanagement.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.housemanagement.dao.INotifyDAO;
import com.housemanagement.model.NotifyModel;
import com.housemanagement.service.INotifyService;

public class NotifyService implements INotifyService{

	@Inject
	private INotifyDAO notifyDAO;
	@Override
	public NotifyModel save(NotifyModel notifyModel) {
		notifyModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long id = notifyDAO.save(notifyModel);
		return notifyDAO.findOne(id);
	}
	@Override
	public List<NotifyModel> findByRoomId(Long roomId) {
		return notifyDAO.findByRoomId(roomId);
	}

}
