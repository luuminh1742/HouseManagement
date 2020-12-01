package com.housemanagement.dao.impl;

import java.util.List;

import com.housemanagement.dao.IManagerDAO;
import com.housemanagement.mapper.ManagerMapper;
import com.housemanagement.model.ManagerModel;

public class ManagerDAO extends AbstractDAO<ManagerModel> implements IManagerDAO{

	@Override
	public void save(ManagerModel managerModel) {
		String sql = "insert into manager (userid,houseid) values (?,?);";
		Long id = insert(sql, managerModel.getUserId(),managerModel.getHouseId());
	}

	

	@Override
	public List<ManagerModel> findByUserId(Long id) {
		String sql = "select * from manager where userid = ?";
		return query(sql, new ManagerMapper(), id);
	}

}
