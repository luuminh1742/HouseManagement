package com.housemanagement.service.impl;

import javax.inject.Inject;

import com.housemanagement.dao.INotifyDetailDAO;
import com.housemanagement.model.NotifyDetailModel;
import com.housemanagement.service.INotifyDetailService;

public class NotifyDetailService implements INotifyDetailService{

	@Inject
	private INotifyDetailDAO notifyDetailDAO;
	@Override
	public void save(NotifyDetailModel notifyDetailModel) {
		notifyDetailDAO.save(notifyDetailModel);
	}

}
