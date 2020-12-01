package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.RoomModel;

public class RoomMapper implements RowMapper<RoomModel>{

	@Override
	public RoomModel mapRow(ResultSet resultSet) {
		try {
			RoomModel roomModel = new RoomModel();
			roomModel.setId(resultSet.getLong("id"));
			roomModel.setRoomName(resultSet.getString("room_name"));
			roomModel.setNotes(resultSet.getString("notes"));
			roomModel.setRoomMoney(resultSet.getInt("room_money"));
			roomModel.setElectrictyMoney(resultSet.getInt("electricy_money"));
			roomModel.setWaterMoney(resultSet.getInt("water_money"));
			roomModel.setNetworkMoney(resultSet.getInt("network_money"));
			roomModel.setOtherMoney(resultSet.getInt("other_money"));
			roomModel.setLastElectrictyNumber(resultSet.getInt("last_electricty_number"));
			roomModel.setLastWaterNumber(resultSet.getInt("last_water_number"));
			roomModel.setHouseId(resultSet.getLong("houseid"));
			roomModel.setStatus(resultSet.getInt("status"));
			roomModel.setMember(resultSet.getInt("member"));
			roomModel.setTypeNetworkMoney(resultSet.getInt("type_network_money"));
			roomModel.setTypeWaterMoney(resultSet.getInt("type_water_money"));
			return roomModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
