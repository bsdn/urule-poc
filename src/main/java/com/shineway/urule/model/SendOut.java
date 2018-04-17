package com.shineway.urule.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bstek.dorado.annotation.PropertyDef;
import com.bstek.urule.model.Label;

/**
 * 附件5-发货基础信息
 * 
 * @author Andy
 *
 */
@Entity
@Table(name = "POC_SEND_OUT")
public class SendOut implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;

	@Column(name = "SALES_DOCUMENT_", length = 40)
	@PropertyDef(label = "销售凭证", description = "")
	private String salesDocument;

	@Column(name = "DATE_", length = 40)
	@PropertyDef(label = "年月", description = "")
	private String date;

	@Column(name = "CAUSE_DEPT_ID_", length = 40)
	@PropertyDef(label = "事业部编号", description = "")
	private String causeDeptId;

	@Column(name = "CAUSE_DEPT_", length = 40)
	@PropertyDef(label = "事业部", description = "")
	private String causeDept;

	@Column(name = "OFFICE_ID_", length = 40)
	@PropertyDef(label = "省办编码", description = "")
	private String officeId;

	@Column(name = "OFFICE_", length = 40)
	@PropertyDef(label = "省办", description = "")
	private String office;
	@Label("客户")
	@Column(name = "CUSTOMER_NO_", length = 40)
	@PropertyDef(label = "客户编号", description = "")
	private String customerNO;

	@Column(name = "CUSTOMER_", length = 40)
	@PropertyDef(label = "客户", description = "")
	private String customer;

	@Column(name = "PRODUCT_NO_", length = 40)
	@PropertyDef(label = "产品编号", description = "")
	private String productId;
	@Label("产品")
	@Column(name = "PRODUCT_NAME_", length = 255)
	@PropertyDef(label = "产品", description = "")
	private String productName;

	@Column(name = "UNIT_PRICE_", length = 40)
	@PropertyDef(label = "单价(元/件)", description = "")
	private String unitPrice;
	@Label("中包数量")
	@Column(name = "Packet_NUMBER_", length = 40)
	@PropertyDef(label = "中包数量", description = "")
	private String packetNumber;

	@Column(name = "NUMBER_", length = 40)
	@PropertyDef(label = "数量", description = "")
	private String number;

	@Column(name = "TAX_MONEY_", length = 40)
	@PropertyDef(label = "含税收入（元）", description = "")
	private String taxMoney;

	@Column(name = "DISCOUNT_", length = 40)
	@PropertyDef(label = "折扣（元）", description = "")
	private String discount;

	@Column(name = "TAX_THOUSAND_MONEY_", length = 40)
	@PropertyDef(label = "含税收入（千元）", description = "")
	private String taxThousandMoney;

	@Column(name = "BOX_PRICE_", length = 40)
	@PropertyDef(label = "单价(元/盒)", description = "")
	private String boxPrice;

	@Column(name = "HIGH_PRICE_", length = 40)
	@PropertyDef(label = "高开价格", description = "")
	private String highPrice;

	@Column(name = "HIGH_", length = 40)
	@PropertyDef(label = "是否高开", description = "")
	private String high;

	@Column(name = "NO_HIGH_", length = 40)
	@PropertyDef(label = "是否取消高开", description = "")
	private String noHigh;

	@Column(name = "REMARKS_", length = 255)
	@PropertyDef(label = "备注", description = "")
	private String remarks;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getSalesDocument() {
		return salesDocument;
	}

	public void setSalesDocument(String salesDocument) {
		this.salesDocument = salesDocument;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCauseDeptId() {
		return causeDeptId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setCauseDeptId(String causeDeptId) {
		this.causeDeptId = causeDeptId;
	}

	public String getCauseDept() {
		return causeDept;
	}

	public void setCauseDept(String causeDept) {
		this.causeDept = causeDept;
	}

	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
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

	public String getTaxMoney() {
		return taxMoney;
	}

	public void setTaxMoney(String taxMoney) {
		this.taxMoney = taxMoney;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getTaxThousandMoney() {
		return taxThousandMoney;
	}

	public void setTaxThousandMoney(String taxThousandMoney) {
		this.taxThousandMoney = taxThousandMoney;
	}

	public String getBoxPrice() {
		return boxPrice;
	}

	public void setBoxPrice(String boxPrice) {
		this.boxPrice = boxPrice;
	}

	public String getHighPrice() {
		return highPrice;
	}

	public void setHighPrice(String highPrice) {
		this.highPrice = highPrice;
	}

	public String getHigh() {
		return high;
	}

	public void setHigh(String high) {
		this.high = high;
	}

	public String getNoHigh() {
		return noHigh;
	}

	public void setNoHigh(String noHigh) {
		this.noHigh = noHigh;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCustomerNO() {
		return customerNO;
	}

	public void setCustomerNO(String customerNO) {
		this.customerNO = customerNO;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
