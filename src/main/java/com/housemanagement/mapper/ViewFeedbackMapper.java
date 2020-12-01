package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.ViewFeedbackModel;

public class ViewFeedbackMapper implements RowMapper<ViewFeedbackModel>{

	@Override
	public ViewFeedbackModel mapRow(ResultSet resultSet) {
		try {
			ViewFeedbackModel feedback = new ViewFeedbackModel();
			feedback.setId(resultSet.getLong("id"));
			feedback.setContent(resultSet.getString("content"));
			feedback.setCreatedDate(resultSet.getTimestamp("createddate"));
			feedback.setHouseName(resultSet.getString("name"));
			feedback.setRoomName(resultSet.getString("room_name"));
			return feedback;
		} catch (SQLException e) {
			return null;
		}
	}

}
