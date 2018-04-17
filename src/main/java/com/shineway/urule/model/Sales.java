package com.shineway.urule.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bstek.dorado.annotation.PropertyDef;
import com.bstek.urule.model.Label;

/**
 * 附件6-销量
 * 
 * @author Andy
 *
 */
@Entity
@Table(name = "POC_SALES")
public class Sales implements Serializable {
    
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;
	
	@Column(name = "OFFICE_", length = 40)
	@PropertyDef(label = "省办", description = "")
	private String office;
	
	@Column(name = "TO_DO_", length = 40)
	@PropertyDef(label = "地办", description = "")
	private String toDo;
	@Label("月份")
	@Column(name = "MONTH_")
	@PropertyDef(label = "月", description = "")
	private String month;
	@Label("客户编码")
    @Column(name = "CUSTOMER_NO_", length = 40)
	@PropertyDef(label = "客户编号", description = "")
	private String customerNo;
	@Label("产品编号")
	@Column(name = "PRODUCT_NO_", length = 40)
	@PropertyDef(label = "产品编号", description = "")
	private String productNO;
	@Label("产品")
	@Column(name = "PRODUCT_NAME_", length = 255)
	@PropertyDef(label = "产品", description = "")
	private String productName;
	@Label("中包数量")
	@Column(name = "Packet_NUMBER_", length = 40)
	@PropertyDef(label = "中包数量", description = "")
	private String packetNumber;
	@Label("客户属性")
	@Column(name = "CLIENT_PROPERTY_", length = 40)
	@PropertyDef(label = "客户属性", description = "")
	private String clientProperty;
	@Column(name = "NUMBER_", length = 40)
	@PropertyDef(label = "数量", description = "")
	private String number;
	@Column(name = "PARENT_CUSTOMER_", length = 40)
	@PropertyDef(label = "上级客户", description = "")
	private String parentCustomer;
	@Column(name = "MONEY_", length = 40)
	@PropertyDef(label = "金额", description = "")
	private String money;
	@Column(name = "PRODUCT_GROUP_", length = 40)
	@PropertyDef(label = "产品组", description = "")
	private String productGroup;
	@Column(name = "FIRST_CUSTOMER_NUMBER_", length = 40)
	@PropertyDef(label = "一级客户编号", description = "")
	private String firstCustomerNumber;

	@Column(name = "FIRST_CUSTOMER_NAME_", length = 40)
	@PropertyDef(label = "一级客户名称", description = "")
	private String firstCustomerName;
	
	@Column(name = "Auxiliary_column_", length = 40)
	@PropertyDef(label = "辅助列", description = "")
	private String auxiliaryColumn;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getToDo() {
		return toDo;
	}

	public void setToDo(String toDo) {
		this.toDo = toDo;
	}


	public String getParentCustomer() {
		return parentCustomer;
	}

	public void setParentCustomer(String parentCustomer) {
		this.parentCustomer = parentCustomer;
	}

	public String getProductGroup() {
		return productGroup;
	}

	public void setProductGroup(String productGroup) {
		this.productGroup = productGroup;
	}

	public String getProduct() {
		return productName;
	}

	public void setProduct(String product) {
		this.productName = product;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPacketNumber() {
		return packetNumber;
	}

	public void setPacketNumber(String packetNumber) {
		this.packetNumber = packetNumber;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getClientProperty() {
		return clientProperty;
	}

	public void setClientProperty(String clientProperty) {
		this.clientProperty = clientProperty;
	}

	public String getFirstCustomerNumber() {
		return firstCustomerNumber;
	}

	public void setFirstCustomerNumber(String firstCustomerNumber) {
		this.firstCustomerNumber = firstCustomerNumber;
	}

	public String getFirstCustomerName() {
		return firstCustomerName;
	}

	public void setFirstCustomerName(String firstCustomerName) {
		this.firstCustomerName = firstCustomerName;
	}

	public String getAuxiliaryColumn() {
		return auxiliaryColumn;
	}

	public void setAuxiliaryColumn(String auxiliaryColumn) {
		this.auxiliaryColumn = auxiliaryColumn;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}

	public String getProductNO() {
		return productNO;
	}

	public void setProductNO(String productNO) {
		this.productNO = productNO;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
