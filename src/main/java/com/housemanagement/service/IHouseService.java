package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.HouseModel;

public interface IHouseService {
	HouseModel save(HouseModel houseModel);
	HouseModel update(HouseModel updateHouse);
	void delete(Long[] ids);
	HouseModel findOne(Long id);
	List<HouseModel> findAll(Long userId);
}
