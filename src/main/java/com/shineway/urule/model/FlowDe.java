package com.shineway.urule.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bstek.dorado.annotation.PropertyDef;

/**
 * 附件4-流向
 * 
 * @author Andy
 *
 */
@Entity
@Table(name = "POC_FLOWDE")
public class FlowDe implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;

	@Column(name = "DATE_")
	@PropertyDef(label = "年月", description = "")
	private String date;

	@Column(name = "CHANNEL_ONE_", length = 40)
	@PropertyDef(label = "渠道", description = "")
	private String channelOne;

	@Column(name = "CHANNEL_TWO_", length = 40)
	@PropertyDef(label = "渠道2", description = "")
	private String channelTwo;

	@Column(name = "OFFICE_", length = 40)
	@PropertyDef(label = "省办", description = "")
	private String office;

	@Column(name = "PROVINCIAL_AREA_", length = 40)
	@PropertyDef(label = "省区", description = "")
	private String provincialArea;

	@Column(name = "PRODUCT_Id_", length = 40)
	@PropertyDef(label = "产品编号", description = "")
	private String productId;

	@Column(name = "PRODUCT_", length = 255)
	@PropertyDef(label = "产品", description = "")
	private String product;

	@Column(name = "DISTRIBUTOR_", length = 40)
	@PropertyDef(label = "经销商", description = "")
	private String distributor;

	@Column(name = "CUSTOMER_", length = 40)
	@PropertyDef(label = "客户", description = "")
	private String customer;

	@Column(name = "MATCHINGCUSTOMERS_", length = 40)
	@PropertyDef(label = "匹配客户属性", description = "")
	private String matchingCustomers;

	@Column(name = "PACKET_NUMBER_", length = 40)
	@PropertyDef(label = "中包数量", description = "")
	private String packetNumber;

	@Column(name = "NUMBER_", length = 40)
	@PropertyDef(label = "数量", description = "")
	private String number;

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

	public String getChannelOne() {
		return channelOne;
	}

	public void setChannelOne(String channelOne) {
		this.channelOne = channelOne;
	}

	public String getChannelTwo() {
		return channelTwo;
	}

	public void setChannelTwo(String channelTwo) {
		this.channelTwo = channelTwo;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getProvincialArea() {
		return provincialArea;
	}

	public void setProvincialArea(String provincialArea) {
		this.provincialArea = provincialArea;
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

	public String getDistributor() {
		return distributor;
	}

	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getMatchingCustomers() {
		return matchingCustomers;
	}

	public void setMatchingCustomers(String matchingCustomers) {
		this.matchingCustomers = matchingCustomers;
	}

	public String getPacketNumber() {
		return packetNumber;
	}

	public void setPacketNumber(String packetNumber) {
		this.packetNumber = packetNumber;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
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

}
