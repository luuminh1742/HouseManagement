package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.HouseModel;

public class HouseMapper implements RowMapper<HouseModel>{

	@Override
	public HouseModel mapRow(ResultSet resultSet) {
		try {
			HouseModel houseModel = new HouseModel();
			houseModel.setId(resultSet.getLong("id"));
			houseModel.setName(resultSet.getString("name"));
			houseModel.setAddress(resultSet.getString("address"));
			houseModel.setRules(resultSet.getString("rules"));
			houseModel.setStatus(resultSet.getInt("status"));
			return houseModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
