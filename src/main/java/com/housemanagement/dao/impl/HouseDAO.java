package com.housemanagement.dao.impl;

import java.util.List;

import com.housemanagement.dao.IHouseDAO;
import com.housemanagement.mapper.HouseMapper;
import com.housemanagement.model.HouseModel;

public class HouseDAO extends AbstractDAO<HouseModel> implements IHouseDAO{

	@Override
	public Long save(HouseModel houseModel) {
		StringBuilder sql = new StringBuilder("insert into house ");
		sql.append(" (name, address, rules, status) ");
		sql.append(" values (?, ?, ?, ?)");
		return insert(sql.toString(), houseModel.getName(),
				houseModel.getAddress(),
				houseModel.getRules(),houseModel.getStatus());
	}

	@Override
	public void update(HouseModel updateHouse) {
		StringBuilder sql = new StringBuilder("UPDATE house SET name = ?,");
		sql.append(" address = ?, rules = ? WHERE id = ?");
		update(sql.toString(),updateHouse.getName(),updateHouse.getAddress(),
				updateHouse.getRules(),updateHouse.getId());
	}

	@Override
	public void delete(Long id) {
		String sql = "delete from house where id = ?";
		update(sql, id);
	}

	@Override
	public HouseModel findOne(Long id) {
		String sql = "select * from house where id = ?";
		return findById(sql, new HouseMapper(), id);
	}

	@Override
	public List<HouseModel> findAll(Long userId) {
		StringBuilder sql = new StringBuilder("select * from manager as m inner");
		sql.append(" join house as h on m.houseid = h.id where userid = ?");
		return query(sql.toString(), new HouseMapper(),userId);
	}

}
