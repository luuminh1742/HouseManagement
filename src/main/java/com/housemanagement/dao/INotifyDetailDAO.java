package com.housemanagement.dao;

import com.housemanagement.model.NotifyDetailModel;

public interface INotifyDetailDAO extends GenericDAO<NotifyDetailModel> {
	void save(NotifyDetailModel notifyDetailModel);
}
