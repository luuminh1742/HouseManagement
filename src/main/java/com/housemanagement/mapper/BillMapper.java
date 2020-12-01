package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.BillModel;

public class BillMapper implements RowMapper<BillModel>{

	@Override
	public BillModel mapRow(ResultSet resultSet) {
		try {
			BillModel billModel = new BillModel();
			billModel.setId(resultSet.getLong("id"));
			billModel.setRoomId(resultSet.getLong("roomid"));
			billModel.setLastElectrictyNumber(resultSet.getInt("electricty_number"));
			billModel.setLastWaterNumber(resultSet.getInt("water_number"));
			billModel.setTotalMoney(resultSet.getInt("total_money"));
			billModel.setStatus(resultSet.getInt("status"));
			billModel.setCreatedBy(resultSet.getString("createdby"));
			billModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			billModel.setRoomMoney(resultSet.getInt("room_money"));
			billModel.setElectrictyMoney(resultSet.getInt("electricy_money"));
			billModel.setWaterMoney(resultSet.getInt("water_money"));
			billModel.setNetworkMoney(resultSet.getInt("network_money"));
			billModel.setOtherMoney(resultSet.getInt("other_money"));
			return billModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
