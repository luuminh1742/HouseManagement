package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.FeedbackModel;

public interface IFeedbackDAO extends GenericDAO<FeedbackModel>{
	Long save(FeedbackModel feedbackModel);
	FeedbackModel findOne(Long id);
	List<FeedbackModel> findByUserId(Long userId);
	void delete(Long id);
	
	
}
