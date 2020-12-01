package com.housemanagement.model;

import java.sql.Timestamp;

public class NotifyModel extends AbstractModel<NotifyModel>{
	private String content;
	private Timestamp createdDate;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	
}
