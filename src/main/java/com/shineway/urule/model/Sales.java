package com.shineway.urule.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bstek.dorado.annotation.PropertyDef;

/**
 * 附件6-销量
 * 
 * @author Andy
 *
 */
@Entity
@Table(name = "POC_SALES")
public class Sales implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;
	
	@Column(name = "DATE_")
	@PropertyDef(label = "月", description = "")
	private String date;
	
	@Column(name = "OFFICE_", length = 40)
	@PropertyDef(label = "省办", description = "")
	private String office;
	
	@Column(name = "TO_DO_", length = 40)
	@PropertyDef(label = "地办", description = "")
	private String toDo;
	
	@Column(name = "CUSTOMER_ID_", length = 40)
	@PropertyDef(label = "客户编码", description = "")
	private String customerId;
	
	@Column(name = "PARENT_CUSTOMER_", length = 40)
	@PropertyDef(label = "上级客户", description = "")
	private String parentCustomer;
	
	@Column(name = "PRODUCT_GROUP_", length = 40)
	@PropertyDef(label = "产品组", description = "")
	private String productGroup;
	
	@Column(name = "PRODUCT_Id_", length = 40)
	@PropertyDef(label = "产品编号", description = "")
	private String productId;
	
	@Column(name = "PRODUCT_", length = 255)
	@PropertyDef(label = "产品", description = "")
	private String product;
	
	@Column(name = "NUMBER_", length = 40)
	@PropertyDef(label = "数量", description = "")
	private String number;
	
	@Column(name = "Packet_NUMBER_", length = 40)
	@PropertyDef(label = "中包数量", description = "")
	private String packetNumber;
	
	@Column(name = "MONEY_", length = 40)
	@PropertyDef(label = "金额", description = "")
	private String money;
	
	@Column(name = "CLIENT_PROPERTY_", length = 40)
	@PropertyDef(label = "客户属性", description = "")
	private String clientProperty;

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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
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

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
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

}
