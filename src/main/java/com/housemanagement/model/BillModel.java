package com.housemanagement.model;

import java.sql.Timestamp;

public class BillModel extends AbstractModel<BillModel>{
	private int status;
	private int lastElectrictyNumber;
	private int lastWaterNumber;
	private int totalMoney;
	private String createdBy;
	private Timestamp createdDate;
	private Long roomId;
	private int roomMoney;
	private int electrictyMoney;
	private int waterMoney;
	private int networkMoney;
	private int otherMoney;
	
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public Long getRoomId() {
		return roomId;
	}
	public void setRoomId(Long roomId) {
		this.roomId = roomId;
	}
	
}
