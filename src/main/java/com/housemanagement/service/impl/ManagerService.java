package com.housemanagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.housemanagement.dao.IManagerDAO;
import com.housemanagement.model.ManagerModel;
import com.housemanagement.service.IManagerService;

public class ManagerService implements IManagerService{

	@Inject
	private IManagerDAO managerDAO;
	@Override
	public List<ManagerModel> findByUserId(Long id) {
		return managerDAO.findByUserId(id);
	}

}
