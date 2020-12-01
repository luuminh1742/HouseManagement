package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.FeedbackModel;

public class FeedbackMapper implements RowMapper<FeedbackModel>{

	@Override
	public FeedbackModel mapRow(ResultSet resultSet) {
		try {
			FeedbackModel feedback = new FeedbackModel();
			feedback.setId(resultSet.getLong("id"));
			feedback.setContent(resultSet.getString("content"));
			feedback.setCreatedDate(resultSet.getTimestamp("createddate"));
			feedback.setUserId(resultSet.getLong("userid"));
			
			return feedback;
		} catch (SQLException e) {
			return null;
		}
	}

}
