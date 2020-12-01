package com.housemanagement.dao;

import java.util.List;

import com.housemanagement.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel>{
	Long save(UserModel userModel);
	UserModel findOne(Long id);
	List<UserModel> findByRoomId(Long roomId);
	void update(UserModel updateUser);
	void delete(Long id);
	
	UserModel findByUsernameAndPasswordAndStatus(String username,String password);
	
	UserModel findByHouseId(Long houseId);
	
	void updateGeneralInfor(UserModel updateUser);
	
	void updatePassword(UserModel updateUser);
}
