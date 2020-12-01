package com.housemanagement.dao.impl;

import java.util.List;

import com.housemanagement.dao.IBillDAO;
import com.housemanagement.mapper.BillMapper;
import com.housemanagement.model.BillModel;

public class BillDAO extends AbstractDAO<BillModel> implements IBillDAO{

	@Override
	public List<BillModel> findByRoomId(Long roomId) {
		String sql = "select * from bill where roomid = ?";
		return query(sql, new BillMapper(), roomId);
	}

	@Override
	public Long save(BillModel billModel) {
		StringBuilder sql = new StringBuilder("insert into bill ");
		sql.append(" (electricty_number,water_number,total_money,");
		sql.append("room_money,electricy_money,water_money,");
		sql.append("network_money,other_money,");
		sql.append(" status,createddate,createdby,roomid)");
		sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
		return insert(sql.toString(), billModel.getLastElectrictyNumber(),
				billModel.getLastWaterNumber(),billModel.getTotalMoney(),
				billModel.getRoomMoney(),billModel.getElectrictyMoney(),
				billModel.getWaterMoney(),billModel.getNetworkMoney(),
				billModel.getOtherMoney(),
				billModel.getStatus(),billModel.getCreatedDate(),
				billModel.getCreatedBy(),billModel.getRoomId());
	}

	@Override
	public BillModel findOne(Long id) {
		String sql = "select * from bill where id = ?";
		return findById(sql, new BillMapper(), id);
	}

	@Override
	public void updateStatus(BillModel updateBill) {
		String sql = "update bill set status = 1 where id = ?";
		update(sql,updateBill.getId());
	}

}
