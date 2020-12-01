package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.NotifyModel;

public interface INotifyDAO extends GenericDAO<NotifyModel>{
	Long save(NotifyModel notifyModel);
	NotifyModel findOne(Long id);
	List<NotifyModel> findByRoomId(Long roomId);
}
