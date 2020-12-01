package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.UserModel;

public interface IUserService {
	UserModel addMember(UserModel userModel,String createdBy);
	UserModel findOne(Long id);
	List<UserModel> findByRoomId(Long roomId);
	UserModel update(UserModel updateUser);
	void deleteMemberInRoom(Long[] ids);
	
	UserModel findByUsernameAndPasswordAndStatus(String username,String password);
	UserModel findByHouseId(Long houseId);
	
	UserModel updateGeneralInfor(UserModel updateUser);
	UserModel updatePassword(UserModel updateUser);
}
