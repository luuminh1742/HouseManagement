package com.housemanagement.model;

public class RoomModel extends AbstractModel<RoomModel> {
	private String roomName;
	private String notes;
	private int status;
	private int roomMoney;
	private int electrictyMoney;
	private int waterMoney;
	private int networkMoney;
	private int otherMoney;
	private int lastElectrictyNumber;
	private int lastWaterNumber;
	private Long houseId;
	private int member;
	private int typeNetworkMoney;
	private int typeWaterMoney;

	public int getTypeNetworkMoney() {
		return typeNetworkMoney;
	}

	public void setTypeNetworkMoney(int typeNetworkMoney) {
		this.typeNetworkMoney = typeNetworkMoney;
	}

	

	public int getTypeWaterMoney() {
		return typeWaterMoney;
	}

	public void setTypeWaterMoney(int typeWaterMoney) {
		this.typeWaterMoney = typeWaterMoney;
	}

	public Long getHouseId() {
		return houseId;
	}

	public void setHouseId(Long houseId) {
		this.houseId = houseId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getRoomMoney() {
		return roomMoney;
	}

	public void setRoomMoney(int roomMoney) {
		this.roomMoney = roomMoney;
	}

	public int getElectrictyMoney() {
		return electrictyMoney;
	}

	public void setElectrictyMoney(int electrictyMoney) {
		this.electrictyMoney = electrictyMoney;
	}

	public int getWaterMoney() {
		return waterMoney;
	}

	public void setWaterMoney(int waterMoney) {
		this.waterMoney = waterMoney;
	}

	public int getNetworkMoney() {
		return networkMoney;
	}

	public void setNetworkMoney(int networkMoney) {
		this.networkMoney = networkMoney;
	}

	public int getOtherMoney() {
		return otherMoney;
	}

	public void setOtherMoney(int otherMoney) {
		this.otherMoney = otherMoney;
	}

	public int getLastElectrictyNumber() {
		return lastElectrictyNumber;
	}

	public void setLastElectrictyNumber(int lastElectrictyNumber) {
		this.lastElectrictyNumber = lastElectrictyNumber;
	}

	public int getLastWaterNumber() {
		return lastWaterNumber;
	}

	public void setLastWaterNumber(int lastWaterNumber) {
		this.lastWaterNumber = lastWaterNumber;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

}
