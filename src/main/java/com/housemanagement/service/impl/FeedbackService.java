package com.housemanagement.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.housemanagement.dao.IFeedbackDAO;
import com.housemanagement.dao.IViewFeedbackDAO;
import com.housemanagement.model.FeedbackModel;
import com.housemanagement.model.ViewFeedbackModel;
import com.housemanagement.paging.Pageble;
import com.housemanagement.service.IFeedbackService;

public class FeedbackService implements IFeedbackService{

	@Inject
	private IFeedbackDAO feedbackDAO;
	@Inject 
	private IViewFeedbackDAO viewFeedbackDAO;
	@Override
	public FeedbackModel save(FeedbackModel feedbackModel) {
		feedbackModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long id = feedbackDAO.save(feedbackModel);
		return feedbackDAO.findOne(id);
	}
	@Override
	public List<FeedbackModel> findByUserId(Long userId) {
		return feedbackDAO.findByUserId(userId);
	}
	@Override
	public void delete(Long[] ids) {
		for (Long id : ids) {
			feedbackDAO.delete(id);
		}
		
	}
	@Override
	public List<ViewFeedbackModel> findByHouseId(Long houseId,Pageble pageble) {
		return viewFeedbackDAO.findByHouseId(houseId,pageble);
	}
	@Override
	public List<ViewFeedbackModel> findMessageSendedFromAdminByHouseId(Long houseId,Pageble pageble) {
		return viewFeedbackDAO.findMessageSendedFromAdminByHouseId(houseId,pageble);
	}
	@Override
	public int getTotalItemMessageSendedFromAdminByHouseId(Long houseId) {
		return viewFeedbackDAO.getTotalItemMessageSendedFromAdminByHouseId(houseId);
	}
	@Override
	public int getTotalItemMessageSendedFromUserByHouseId(Long houseId) {
		return viewFeedbackDAO.getTotalItemMessageSendedFromUserByHouseId(houseId);
	}

}
