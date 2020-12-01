package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.FeedbackModel;
import com.housemanagement.model.ViewFeedbackModel;
import com.housemanagement.paging.Pageble;

public interface IFeedbackService {
	FeedbackModel save(FeedbackModel feedbackModel);
	List<FeedbackModel> findByUserId(Long userId);
	void delete(Long[] ids);
	List<ViewFeedbackModel> findByHouseId(Long houseId,Pageble pageble);
	List<ViewFeedbackModel> findMessageSendedFromAdminByHouseId(Long houseId,Pageble pageble);
	int getTotalItemMessageSendedFromAdminByHouseId(Long houseId);
	int getTotalItemMessageSendedFromUserByHouseId(Long houseId);
}
