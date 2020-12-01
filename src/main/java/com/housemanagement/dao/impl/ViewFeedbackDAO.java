package com.housemanagement.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.housemanagement.dao.IViewFeedbackDAO;
import com.housemanagement.mapper.ViewFeedbackMapper;
import com.housemanagement.model.ViewFeedbackModel;
import com.housemanagement.paging.Pageble;

public class ViewFeedbackDAO extends AbstractDAO<ViewFeedbackModel> implements IViewFeedbackDAO{

	@Override
	public List<ViewFeedbackModel> findByHouseId(Long houseId,Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from ViewFeedback where houseid = ? ");
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		}
		return query(sql.toString(), new ViewFeedbackMapper(), houseId);
	}

	@Override
	public List<ViewFeedbackModel> findMessageSendedFromAdminByHouseId(Long houseId,Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from ViewMessageFromAddmin where houseid = ? ");
		//sql.append("order by createddate desc");
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		}
		//sql.append("");
		//String sql =  ";
		return query(sql.toString(), new ViewFeedbackMapper(), houseId);
	}

	@Override
	public int getTotalItemMessageSendedFromAdminByHouseId(Long houseId) {
		String sql = "select count(*) from ViewMessageFromAddmin where houseid = ?";
		return count(sql,houseId);
	}

	@Override
	public int getTotalItemMessageSendedFromUserByHouseId(Long houseId) {
		String sql = "select count(*) from ViewFeedback where houseid = ?";
		return count(sql,houseId);
	}

}
