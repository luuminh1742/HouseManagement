package com.housemanagement.utils;

import java.util.ArrayList;
import java.util.List;

import com.housemanagement.model.RoomStatusStatisticsModel;

public class RoomStatusStatisticsUtil {
	private int unfinished = 0;
	private int finished = 0;
	private String date = "";
	public RoomStatusStatisticsUtil() {
		this.unfinished = 0;
		this.finished = 0;
	}
	public RoomStatusStatisticsUtil(int unfinished,int finished,String date) {
		this.unfinished = unfinished;
		this.finished = finished;
		this.date = date;
	}
	public List<RoomStatusStatisticsUtil> convert(List<RoomStatusStatisticsModel> list){
		List<RoomStatusStatisticsUtil> result = new ArrayList<>();
		String d = list.get(0).getDate();
		for(RoomStatusStatisticsModel roomSS : list) {
			if(roomSS.getDate().equals(d)) {
				if(roomSS.getStatus() == 0) {
					unfinished = roomSS.getNumber();
				}
				if(roomSS.getStatus() == 1) {
					finished = roomSS.getNumber();
				}
				if(roomSS == list.get(list.size()-1)) {
					result.add(new RoomStatusStatisticsUtil(unfinished,finished,d));
				}
			}else {
				result.add(new RoomStatusStatisticsUtil(unfinished,finished,d));
				unfinished = 0;
				finished = 0;
				d = roomSS.getDate();
				if(roomSS.getStatus() == 0) {
					unfinished = roomSS.getNumber();
				}
				if(roomSS.getStatus() == 1) {
					finished = roomSS.getNumber();
				}
				if(roomSS == list.get(list.size()-1)) {
					result.add(new RoomStatusStatisticsUtil(unfinished,finished,d));
				}
				
			}
		}
		return result;
	}
	public int getUnfinished() {
		return unfinished;
	}
	public void setUnfinished(int unfinished) {
		this.unfinished = unfinished;
	}
	public int getFinished() {
		return finished;
	}
	public void setFinished(int finished) {
		this.finished = finished;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
