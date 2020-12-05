package com.housemanagement.model;

public class RoomStatusStatisticsModel extends AbstractModel<RoomStatusStatisticsModel> {
	private int status;
	private int number;
	private String date;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
