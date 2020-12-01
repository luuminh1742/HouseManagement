package com.housemanagement.dao.impl;

import com.housemanagement.dao.INotifyDetailDAO;
import com.housemanagement.model.NotifyDetailModel;

public class NotifyDetailDAO extends AbstractDAO<NotifyDetailModel> implements INotifyDetailDAO{

	@Override
	public void save(NotifyDetailModel notifyDetailModel) {
		String sql = "insert into notifydetail (roomid,notifyid) values(?,?)";
		insert(sql, notifyDetailModel.getRoomId(),notifyDetailModel.getNotifyId());
	}

}
