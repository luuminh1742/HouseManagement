package com.housemanagement.dao.impl;

import java.util.List;

import com.housemanagement.dao.INotifyDAO;
import com.housemanagement.mapper.NotifyMapper;
import com.housemanagement.model.NotifyModel;

public class NotifyDAO extends AbstractDAO<NotifyModel> implements INotifyDAO{

	@Override
	public Long save(NotifyModel notifyModel) {
		StringBuilder sql = new StringBuilder("insert into notify ");
		sql.append("(content, createddate)");
		sql.append(" values(?,?)");
		return insert(sql.toString(), notifyModel.getContent(),
				notifyModel.getCreatedDate());
	}

	@Override
	public NotifyModel findOne(Long id) {
		String sql = "select * from notify where id = ?";
		return findById(sql, new NotifyMapper(), id);
	}

	@Override
	public List<NotifyModel> findByRoomId(Long roomId) {
		StringBuilder sql =new StringBuilder("select * from notifydetail as nd inner join notify as n"); 
		sql.append(" on nd.notifyid = n.id where roomid = ?  order by createddate desc");	
		return query(sql.toString(), new NotifyMapper(), roomId);
	}

	

}
