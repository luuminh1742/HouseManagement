package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.NotifyModel;

public class NotifyMapper implements RowMapper<NotifyModel>{

	@Override
	public NotifyModel mapRow(ResultSet resultSet) {
		try {
			NotifyModel notifyModel = new NotifyModel();
			notifyModel.setId(resultSet.getLong("id"));
			notifyModel.setContent(resultSet.getString("content"));
			notifyModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			return notifyModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
