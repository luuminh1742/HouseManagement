package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.NotifyModel;

public interface INotifyService {
	NotifyModel save(NotifyModel notifyModel);
	List<NotifyModel> findByRoomId(Long roomId);
}
