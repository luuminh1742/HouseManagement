package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.RoomStatusStatisticsModel;

public class RoomStatusStatisticsMapper implements RowMapper<RoomStatusStatisticsModel>{

	@Override
	public RoomStatusStatisticsModel mapRow(ResultSet resultSet) {
		try {
			RoomStatusStatisticsModel roomStatusStatistics = new RoomStatusStatisticsModel();
			roomStatusStatistics.setStatus(resultSet.getInt("status"));
			roomStatusStatistics.setNumber(resultSet.getInt("number"));
			return roomStatusStatistics;
		} catch (SQLException e) {
			return null;
		}
	}

}
