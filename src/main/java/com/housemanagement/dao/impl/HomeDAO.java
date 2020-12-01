package com.housemanagement.dao.impl;

import java.util.List;

import com.housemanagement.dao.IHomeDAO;
import com.housemanagement.mapper.RoomStatusStatisticsMapper;
import com.housemanagement.model.RoomStatusStatisticsModel;

public class HomeDAO extends AbstractDAO<RoomStatusStatisticsModel> implements IHomeDAO {

	@Override
	public List<RoomStatusStatisticsModel> findByUserId(Long userId) {
		StringBuilder sql = new StringBuilder();
		sql.append("select b.status,count(b.status) as number ");
		sql.append(" from room r inner join house h on r.houseid = h.id ");
		sql.append(" inner join bill b on r.id = b.roomid ");
		sql.append(" inner join manager m on m.houseid = h.id ");
		sql.append(" where m.userid = ? group by b.status order by b.status");
		return query(sql.toString(),new RoomStatusStatisticsMapper(), userId);
	}

}
