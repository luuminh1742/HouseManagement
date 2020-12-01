package com.housemanagement.model;

public class ManagerModel extends AbstractModel<ManagerModel>{
	private Long userId;
	private Long houseId;
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getHouseId() {
		return houseId;
	}
	public void setHouseId(Long houseId) {
		this.houseId = houseId;
	}
}
