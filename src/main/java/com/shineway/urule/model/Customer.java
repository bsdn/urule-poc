package com.shineway.urule.model;

import com.bstek.urule.model.Label;

public class Customer {
	private String id;
	@Label("客户编号")
	private String customerNo;
	@Label("客户名称")
	private String customerName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
}
