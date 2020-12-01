package com.housemanagement.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.housemanagement.model.RoleModel;
import com.housemanagement.model.UserModel;

public class UserMapper implements RowMapper<UserModel>{

	@Override
	public UserModel mapRow(ResultSet resultSet) {
		try {
			UserModel userModel = new UserModel();
			userModel.setId(resultSet.getLong("id"));
			userModel.setUsername(resultSet.getString("username"));
			userModel.setPassword(resultSet.getString("password"));
			userModel.setFullName(resultSet.getString("fullname"));
			userModel.setBirth(resultSet.getString("birth"));
			userModel.setGender(resultSet.getString("gender"));
			userModel.setPhone(resultSet.getString("phone"));
			userModel.setAddress(resultSet.getString("address"));
			userModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			userModel.setCreatedBy(resultSet.getString("createdby"));
			userModel.setRoleId(resultSet.getLong("roleid"));
			userModel.setRoomId(resultSet.getLong("roomid"));
			userModel.setStatus(resultSet.getInt("status"));
			/*
			 * if(resultSet.getLong("roomid") != null) {
			 * userModel.setRoomId(resultSet.getLong("roomid")); }
			 */
			try {
				RoleModel role = new RoleModel();
				role.setCode(resultSet.getString("code"));
				role.setName(resultSet.getString("name"));
				userModel.setRole(role);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return userModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
