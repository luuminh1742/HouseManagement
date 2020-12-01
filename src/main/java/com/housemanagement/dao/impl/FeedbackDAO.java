package com.housemanagement.dao.impl;

import java.util.List;

import com.housemanagement.dao.IFeedbackDAO;
import com.housemanagement.mapper.FeedbackMapper;
import com.housemanagement.model.FeedbackModel;

public class FeedbackDAO extends AbstractDAO<FeedbackModel> implements IFeedbackDAO{

	@Override
	public Long save(FeedbackModel feedbackModel) {
		StringBuilder sql = new StringBuilder("insert into feedback("); 
		sql.append("content,createddate,userid) values(?,?,?)");
		return insert(sql.toString(), feedbackModel.getContent(),
				feedbackModel.getCreatedDate(),feedbackModel.getUserId());
	}

	@Override
	public FeedbackModel findOne(Long id) {
		String sql = "select * from feedback where id = ?";
		return findById(sql, new FeedbackMapper(), id);
	}

	@Override
	public List<FeedbackModel> findByUserId(Long userId) {
		String sql = "select * from feedback where userid = ? order by createddate desc";
		return query(sql, new FeedbackMapper(), userId);
	}

	@Override
	public void delete(Long id) {
		String sql = "delete from feedback where id = ?";
		update(sql, id);
	}

	

}
