package com.housemanagement.model;

public class NotifyDetailModel extends AbstractModel<NotifyDetailModel>{
	private Long roomId;
	private Long notifyId;
	public Long getRoomId() {
		return roomId;
	}
	public void setRoomId(Long roomId) {
		this.roomId = roomId;
	}
	public Long getNotifyId() {
		return notifyId;
	}
	public void setNotifyId(Long notifyId) {
		this.notifyId = notifyId;
	}
	
}
