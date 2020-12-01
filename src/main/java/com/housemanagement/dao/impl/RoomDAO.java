package com.housemanagement.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.housemanagement.dao.IRoomDAO;
import com.housemanagement.mapper.RoomMapper;
import com.housemanagement.model.RoomModel;
import com.housemanagement.paging.Pageble;

public class RoomDAO extends AbstractDAO<RoomModel> implements IRoomDAO {

	@Override
	public List<RoomModel> findAll() {
		String sql = "select * from room";
		return query(sql, new RoomMapper());
	}

	@Override
	public RoomModel findOne(Long id) {
		String sql = "select * from room where id = ?";
		return findById(sql, new RoomMapper(), id);
	}

	@Override
	public List<RoomModel> findByHouseId(Long houseId,Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from room where houseid = ? ");
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		}
		return query(sql.toString(), new RoomMapper(),houseId);
	}

	@Override
	public List<RoomModel> findByHouseId(Long houseId) {
		StringBuilder sql = new StringBuilder("select * from room where houseid = ? ");
		return query(sql.toString(), new RoomMapper(),houseId);
	}

	@Override
	public Long save(RoomModel roomModel) {
		StringBuilder sql = new StringBuilder("insert into room");
		sql.append("(room_name, notes,room_money,electricy_money,");
		sql.append("water_money,network_money,other_money,");
		sql.append("last_electricty_number,last_water_number,");
		sql.append("houseid,status,member,type_network_money,");
		sql.append("type_water_money) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		return insert(sql.toString(), roomModel.getRoomName(),
				roomModel.getNotes(),roomModel.getRoomMoney(),
				roomModel.getElectrictyMoney(),roomModel.getWaterMoney(),
				roomModel.getNetworkMoney(),roomModel.getOtherMoney(),
				roomModel.getLastElectrictyNumber(),
				roomModel.getLastWaterNumber(),roomModel.getHouseId(),
				roomModel.getStatus(),roomModel.getMember(),
				roomModel.getTypeNetworkMoney(),
				roomModel.getTypeWaterMoney());
	}

	@Override
	public void delete(Long id) {
		String sql = "delete from room where id = ?";
		update(sql, id);
	}

	@Override
	public void update(RoomModel updateRoom) {
		StringBuilder sql = new StringBuilder("update room set ");	
		sql.append("room_name = ?, room_money = ?, electricy_money = ?,");
		sql.append("water_money = ?, network_money = ?, other_money = ?,");
		sql.append("last_electricty_number = ?, last_water_number = ?,");
		sql.append("notes = ? where id = ?");
		update(sql.toString(), updateRoom.getRoomName(),
				updateRoom.getRoomMoney(),updateRoom.getElectrictyMoney(),
				updateRoom.getWaterMoney(),updateRoom.getNetworkMoney(),
				updateRoom.getOtherMoney(),updateRoom.getLastElectrictyNumber(),
				updateRoom.getLastWaterNumber(),updateRoom.getNotes(),updateRoom.getId());
	}

	@Override
	public List<RoomModel> findByUserId(Long userId) {
		StringBuilder sql = new StringBuilder("");
		sql.append("select * from manager as m inner join room as r ");
		sql.append(" on m.houseid = r.houseid where userid = ?");
		return query(sql.toString(), new RoomMapper(), userId);
	}

	@Override
	public int getTotalItem(Long houseId) {
		String sql = "select count(*) from room where houseid = ?";
		return count(sql,houseId);
	}

	
	

}
