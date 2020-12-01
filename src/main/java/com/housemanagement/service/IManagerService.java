package com.housemanagement.service;

import java.util.List;

import com.housemanagement.model.ManagerModel;

public interface IManagerService {
	List<ManagerModel> findByUserId(Long id);
}
