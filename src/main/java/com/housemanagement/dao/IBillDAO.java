package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.BillModel;

public interface IBillDAO extends GenericDAO<BillModel>{
	List<BillModel> findByRoomId(Long roomId);
	Long save(BillModel billModel);
	BillModel findOne(Long id);
	void updateStatus(BillModel updateBill);
}
