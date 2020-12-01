package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.ViewFeedbackModel;
import com.housemanagement.paging.Pageble;

public interface IViewFeedbackDAO extends GenericDAO<ViewFeedbackModel>{
	List<ViewFeedbackModel> findByHouseId(Long houseId,Pageble pageble);
	List<ViewFeedbackModel> findMessageSendedFromAdminByHouseId(Long houseId,Pageble pageble);
	int getTotalItemMessageSendedFromAdminByHouseId(Long houseId);
	int getTotalItemMessageSendedFromUserByHouseId(Long houseId);
}
