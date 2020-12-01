package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.ManagerModel;

public interface IManagerDAO extends GenericDAO<ManagerModel>{
	void save(ManagerModel managerModel);
	List<ManagerModel> findByUserId(Long id);
}
