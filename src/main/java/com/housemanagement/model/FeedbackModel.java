package com.housemanagement.model;

import java.sql.Timestamp;

public class FeedbackModel extends AbstractModel<FeedbackModel>{
	private String content;
	private Timestamp createdDate;
	private Long userId;
	
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
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
}
