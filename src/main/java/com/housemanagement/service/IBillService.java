package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.BillModel;
import com.housemanagement.model.UserModel;

public interface IBillService {
	List<BillModel> findByRoomId(Long id);
	BillModel save(BillModel billModel,UserModel userModel);
	BillModel findOne(Long id);
	BillModel updateStatus(BillModel updateBill);
}
