package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.HouseModel;

public interface IHouseDAO extends GenericDAO<HouseModel>{
	Long save(HouseModel houseModel);
	void update(HouseModel updateHouse);
	void delete(Long id);
	HouseModel findOne(Long id);
	List<HouseModel> findAll(Long userId);
}
