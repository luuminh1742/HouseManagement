package com.housemanagement.dao.impl;

import java.util.List;

import com.housemanagement.dao.IUserDAO;
import com.housemanagement.mapper.UserMapper;
import com.housemanagement.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO{

	@Override
	public Long save(UserModel userModel) {
		StringBuilder sql = new StringBuilder("insert into user ");
		sql.append("(username,password,fullname,birth,gender,address,");
		sql.append("phone,createddate,createdby,roleid,roomid,status)");
		sql.append("values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), userModel.getUsername(),
				userModel.getPassword(),userModel.getFullName(),
				userModel.getBirth(),userModel.getGender(),
				userModel.getAddress(),userModel.getPhone(),
				userModel.getCreatedDate(),userModel.getCreatedBy(),
				userModel.getRoleId(),userModel.getRoomId(),
				userModel.getStatus());
	}

	@Override
	public UserModel findOne(Long id) {
		String sql = "select * from user where id = ?";
		return findById(sql, new UserMapper(), id);
	}

	@Override
	public List<UserModel> findByRoomId(Long roomId) {
		String sql = "select * from user where roomid = ? and status = 1";
		return query(sql, new UserMapper(), roomId);
	}

	@Override
	public void update(UserModel updateUser) {
		StringBuilder sql = new StringBuilder("update user set ");
		sql.append(" fullname = ?, gender = ?, address = ?,");
		sql.append(" phone = ?, birth = ? where id = ?");
		update(sql.toString(), updateUser.getFullName(),
				updateUser.getGender(),updateUser.getAddress(),
				updateUser.getPhone(),updateUser.getBirth(),
				updateUser.getId());
		
	}

	@Override
	public void delete(Long id) {
		String sql = "delete from user where id = ?";
		update(sql, id);
	}

	@Override
	public UserModel findByUsernameAndPasswordAndStatus(String username, String password) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user AS u");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ? AND password = ? AND status = 1");
		List<UserModel> users = query(sql.toString(), new UserMapper(), username, password);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public UserModel findByHouseId(Long houseId) {
		StringBuilder sql = new StringBuilder("select * from manager as m inner");
		sql.append(" join user as u on m.userid = u.id where houseid = ?");
		List<UserModel> result = query(sql.toString(), new UserMapper(), houseId);
		return result.isEmpty() ? null : result.get(0);
	}

	@Override
	public void updateGeneralInfor(UserModel updateUser) {
		StringBuilder sql = new StringBuilder("update user set ");
		sql.append(" fullname = ?, gender = ?, address = ?,");
		sql.append(" phone = ?, birth = ?, username = ? where id = ?");
		update(sql.toString(), updateUser.getFullName(),
				updateUser.getGender(),updateUser.getAddress(),
				updateUser.getPhone(),updateUser.getBirth(),
				updateUser.getUsername(),updateUser.getId());
		
	}

	@Override
	public void updatePassword(UserModel updateUser) {
		String sql = "update user set password = ? where id = ?";
		update(sql,updateUser.getPassword(),updateUser.getId());
	}

}
