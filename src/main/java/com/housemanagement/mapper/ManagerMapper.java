package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.ManagerModel;

public class ManagerMapper implements RowMapper<ManagerModel>{

	@Override
	public ManagerModel mapRow(ResultSet resultSet) {
		try {
			ManagerModel managerModel = new ManagerModel();
			managerModel.setUserId(resultSet.getLong("userid"));
			managerModel.setHouseId(resultSet.getLong("houseid"));
			return managerModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
