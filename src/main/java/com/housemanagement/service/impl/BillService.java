package com.housemanagement.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.housemanagement.dao.IBillDAO;
import com.housemanagement.dao.IRoomDAO;
import com.housemanagement.model.BillModel;
import com.housemanagement.model.RoomModel;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IBillService;

public class BillService implements IBillService {

	@Inject
	private IBillDAO billDAO;
	@Inject
	private IRoomDAO roomDAO;

	@Override
	public List<BillModel> findByRoomId(Long id) {
		return billDAO.findByRoomId(id);
	}

	@Override
	public BillModel save(BillModel billModel,UserModel userModel) {
		billModel.setCreatedBy(userModel.getFullName());
		billModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		billModel.setStatus(0);
		RoomModel roomModel = roomDAO.findOne(billModel.getRoomId());
		billModel.setRoomMoney(roomModel.getRoomMoney());
		billModel.setElectrictyMoney(roomModel.getElectrictyMoney()
						* (billModel.getLastElectrictyNumber() - roomModel.getLastElectrictyNumber()));
		/*
		 * Tính tiền nước
		 * 1- Tính tiền theo đầu người
		 * 2- Tính tiền theo phòng 
		 * 3- Tính theo số công tơ
		 * 3- Miễn phí
		 * */
		switch(roomModel.getTypeWaterMoney()){
		case 1:
			billModel.setWaterMoney(roomModel.getWaterMoney() * roomModel.getMember());
			break;
		case 2: 
			billModel.setWaterMoney(roomModel.getWaterMoney());
			break;
		case 3: 
			billModel.setWaterMoney(roomModel.getWaterMoney() * (billModel.getLastWaterNumber() - roomModel.getLastWaterNumber()));
			break;
		case 4: 
			billModel.setWaterMoney(0);
			break;
		}
		
		/*
		 * Tính tiền mạng
		 * 1- Tính tiền theo đầu người
		 * 2- Tính tiền theo phòng 
		 * 3- Miễn phí
		 * */
		switch(roomModel.getTypeNetworkMoney()){
		case 1:
			billModel.setNetworkMoney(roomModel.getNetworkMoney() * roomModel.getMember());
			break;
		case 2: 
			billModel.setNetworkMoney(roomModel.getWaterMoney());
			break;
		case 3:
			billModel.setNetworkMoney(0);
			break;
		}
		
		billModel.setOtherMoney(roomModel.getOtherMoney());
		
		int totalMoney = 0;
		totalMoney+=billModel.getRoomMoney() +  billModel.getOtherMoney() ;
		totalMoney+=billModel.getElectrictyMoney()+billModel.getWaterMoney();
		totalMoney+=billModel.getNetworkMoney();
		billModel.setTotalMoney(totalMoney);
		
		Long id = billDAO.save(billModel);
		return billDAO.findOne(id);
	}

	@Override
	public BillModel findOne(Long id) {
		return billDAO.findOne(id);
	}

	@Override
	public BillModel updateStatus(BillModel updateBill) {
		billDAO.updateStatus(updateBill);
		return findOne(updateBill.getId());
	}

}
