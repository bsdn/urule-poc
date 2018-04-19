package com.shineway.urule.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bstek.dorado.annotation.PropertyDef;
import com.bstek.urule.model.Label;

/**
 * 附件5-发货统计
 * 
 */
@Entity
@Table(name = "POC_SENDOUT_ANALYSIS")
public class SendOutAnalysis implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID_", length = 40)
	private String id;

	@Column(name = "LEDGER_ID_", length = 40)
	private String ledgerId;

	@Label("客户编号")
	@PropertyDef(label = "客户编号")
	@Column(name = "CUSTOMER_NO_", length = 50)
	private String customerNo;

	@PropertyDef(label = "客户")
	@Label("客户")
	@Column(name = "CUSTOMER_NAME_", length = 50)
	private String customerName;

	@PropertyDef(label = "商品编号")
	@Label("商品编号")
	@Column(name = "PRODUCT_NO_", length = 50)
	private String productNo;

	@PropertyDef(label = "商品")
	@Label("商品")
	@Column(name = "PRODUCT_NAME_", length = 50)
	private String productName;
	
	@Label("发货明细")
	@Transient
	private List<SendOut> sendOutList;

	@Label("1月发货")
	@Column(name = "SENDOUT_JAN_")
	public Double sendOutJan;
	@Label("2月发货")
	@Column(name = "SENDOUT_FEB_")
	public Double sendOutFeb;
	@Label("3月发货")
	@Column(name = "SENDOUT_MAR_")
	public Double sendOutMar;

	@Label("4月发货")
	@Column(name = "SENDOUT_APR_")
	public Double sendOutApr;
	@Label("5月发货")
	@Column(name = "SENDOUT_MAY_")
	public Double sendOutMay;
	@Label("6月发货")
	@Column(name = "SENDOUT_JUN_")
	public Double sendOutJun;

	@Label("7月发货")
	@Column(name = "SENDOUT_JUL_")
	public Double sendOutJul;
	@Label("8月发货")
	@Column(name = "SENDOUT_AUG_")
	public Double sendOutAug;
	@Label("9月发货")
	@Column(name = "SENDOUT_SEP_")
	public Double sendOutSep;

	@Label("10月发货")
	@Column(name = "SENDOUT_OCT_")
	public Double sendOutOct;
	@Label("11月发货")
	@Column(name = "SENDOUT_NOV_")
	public Double sendOutNov;
	@Label("12月发货")
	@Column(name = "SENDOUT_DEC_")
	public Double sendOutDec;

	@Label("发货合计")
	@Column(name = "SENDOUT_TOTAL_")
	public Double sendOutTotal;

	public List<SendOut> getSendOutList() {
		return sendOutList;
	}

	public void setSendOutList(List<SendOut> sendOutList) {
		this.sendOutList = sendOutList;
	}

	public Double getSendOutJan() {
		return sendOutJan;
	}

	public void setSendOutJan(Double sendOutJan) {
		this.sendOutJan = sendOutJan;
	}

	public Double getSendOutFeb() {
		return sendOutFeb;
	}

	public void setSendOutFeb(Double sendOutFeb) {
		this.sendOutFeb = sendOutFeb;
	}

	public Double getSendOutMar() {
		return sendOutMar;
	}

	public void setSendOutMar(Double sendOutMar) {
		this.sendOutMar = sendOutMar;
	}

	public Double getSendOutApr() {
		return sendOutApr;
	}

	public void setSendOutApr(Double sendOutApr) {
		this.sendOutApr = sendOutApr;
	}

	public Double getSendOutMay() {
		return sendOutMay;
	}

	public void setSendOutMay(Double sendOutMay) {
		this.sendOutMay = sendOutMay;
	}

	public Double getSendOutJun() {
		return sendOutJun;
	}

	public void setSendOutJun(Double sendOutJun) {
		this.sendOutJun = sendOutJun;
	}

	public Double getSendOutJul() {
		return sendOutJul;
	}

	public void setSendOutJul(Double sendOutJul) {
		this.sendOutJul = sendOutJul;
	}

	public Double getSendOutAug() {
		return sendOutAug;
	}

	public void setSendOutAug(Double sendOutAug) {
		this.sendOutAug = sendOutAug;
	}

	public Double getSendOutSep() {
		return sendOutSep;
	}

	public void setSendOutSep(Double sendOutSep) {
		this.sendOutSep = sendOutSep;
	}

	public Double getSendOutOct() {
		return sendOutOct;
	}

	public void setSendOutOct(Double sendOutOct) {
		this.sendOutOct = sendOutOct;
	}

	public Double getSendOutNov() {
		return sendOutNov;
	}

	public void setSendOutNov(Double sendOutNov) {
		this.sendOutNov = sendOutNov;
	}

	public Double getSendOutDec() {
		return sendOutDec;
	}

	public void setSendOutDec(Double sendOutDec) {
		this.sendOutDec = sendOutDec;
	}

	public Double getSendOutTotal() {
		return sendOutTotal;
	}

	public void setSendOutTotal(Double sendOutTotal) {
		this.sendOutTotal = sendOutTotal;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLedgerId() {
		return ledgerId;
	}

	public void setLedgerId(String ledgerId) {
		this.ledgerId = ledgerId;
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

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
