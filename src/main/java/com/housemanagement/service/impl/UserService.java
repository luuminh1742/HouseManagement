package com.housemanagement.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import com.housemanagement.dao.IUserDAO;
import com.housemanagement.model.UserModel;
import com.housemanagement.service.IUserService;
import com.housemanagement.utils.ConvertStringUtil;

public class UserService implements IUserService {

	@Inject
	private IUserDAO userDAO;

	@Override
	public UserModel addMember(UserModel userModel,String createdBy) {
		Random rd = new Random();
		int pass = 111111 + rd.nextInt(999999);
		userModel.setStatus(1);
		userModel.setUsername(ConvertStringUtil.toUsername(userModel.getFullName()));
		userModel.setPassword(String.valueOf(pass));
		userModel.setRoleId(2L);
		userModel.setCreatedBy(createdBy);
		userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long id = userDAO.save(userModel);
		return findOne(id);
	}

	@Override
	public UserModel findOne(Long id) {
		return userDAO.findOne(id);
	}

	@Override
	public List<UserModel> findByRoomId(Long roomId) {
		return userDAO.findByRoomId(roomId);
	}

	@Override
	public UserModel update(UserModel updateUser) {
		userDAO.update(updateUser);
		return findOne(updateUser.getId());
	}

	@Override
	public void deleteMemberInRoom(Long[] ids) {
		for (Long id : ids) {
			userDAO.delete(id);
		}
		
	}

	@Override
	public UserModel findByUsernameAndPasswordAndStatus(String username, String password) {
		return userDAO.findByUsernameAndPasswordAndStatus(username, password);
	}

	@Override
	public UserModel findByHouseId(Long houseId) {
		return userDAO.findByHouseId(houseId);
	}

	@Override
	public UserModel updateGeneralInfor(UserModel updateUser) {
		userDAO.updateGeneralInfor(updateUser);
		return findOne(updateUser.getId());
	}

	@Override
	public UserModel updatePassword(UserModel updateUser) {
		userDAO.updatePassword(updateUser);
		return findOne(updateUser.getId());
	}

}
