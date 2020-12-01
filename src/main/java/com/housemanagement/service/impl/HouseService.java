package com.housemanagement.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.housemanagement.dao.IHouseDAO;
import com.housemanagement.dao.IManagerDAO;
import com.housemanagement.model.HouseModel;
import com.housemanagement.model.ManagerModel;
import com.housemanagement.service.IHouseService;

public class HouseService implements IHouseService{

	@Inject
	private IHouseDAO houseDAO;
	@Inject
	private IManagerDAO managerDAO;
	
	@Override
	public HouseModel save(HouseModel houseModel) {
		houseModel.setStatus(1);
		Long id = houseDAO.save(houseModel);
		ManagerModel managerModel = new ManagerModel();
		managerModel.setHouseId(id);
		// chưa xử lý lấy id user khi đăng nhập
		managerModel.setUserId(1L);
		managerDAO.save(managerModel);
		return findOne(id);
	}

	@Override
	public HouseModel update(HouseModel updateHouse) {
		houseDAO.update(updateHouse);
		return findOne(updateHouse.getId());
	}

	@Override
	public void delete(Long[] ids) {
		for (Long id : ids) {
			houseDAO.delete(id);
		}
	}

	@Override
	public HouseModel findOne(Long id) {
		return houseDAO.findOne(id);
	}

	@Override
	public List<HouseModel> findAll(Long userId) {
		return houseDAO.findAll(userId);
	}

}
