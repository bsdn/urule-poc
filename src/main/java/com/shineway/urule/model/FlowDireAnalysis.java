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
 * 附件6-流向统计
 * 
 */
@Entity
@Table(name = "POC_FLOWDIRE_ANALYSIS")
public class FlowDireAnalysis implements Serializable {
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
	
	@Label("流向明细")
	@Transient
	private List<FlowDire> flowDireList;
	
	
	@Label("高开月份")
	@Column(name = "HIGH_MONTH_", length = 40)
	private String highMonth;
	
	@Label("高开流向合计1-11月一级")
	@Column(name = "TOTAL_OF_OVER_JAN_TO_NOV1_")
	private Double totalOfOverJanToNov1;
	
	@Label("高开流向合计1-11月二级")
	@Column(name = "TOTAL_OF_OVER_JAN_TO_NOV2_")
	private Double totalOfOverJanToNov2;
	
	@Label("高开流向合计1-12月一级")
	@Column(name = "TOTAL_OF_OVER_JAN_TO_DEC1_")
	private Double totalOfOverJanToDec1;
	
	@Label("高开流向合计1-12月二级")
	@Column(name = "TOTAL_OF_OVER_JAN_TO_DEC2_")
	private Double totalOfOverJanToDec2;
	
	@Label("1月流向一级")
	@Column(name = "FLOW_DIRE_JAN1_")
	public Double flowDireJan1;
	
	
	@Label("1月流向二级")
	@Column(name = "FLOW_DIRE_JAN2_")
	public Double flowDireJan2;
	
	@Label("2月流向一级")
	@Column(name = "FLOW_DIRE_FEB1_")
	public Double flowDireFeb1;
	
	@Label("2月流向二级")
	@Column(name = "FLOW_DIRE_FEB2_")
	public Double flowDireFeb2;
	
	@Label("3月流向一级")
	@Column(name = "FLOW_DIRE_MAR1_")
	public Double flowDireMar1;
	
	@Label("3月流向二级")
	@Column(name = "FLOW_DIRE_MAR2_")
	public Double flowDireMar2;

	@Label("4月流向一级")
	@Column(name = "FLOW_DIRE_APR1_")
	public Double flowDireApr1;
	
	@Label("4月流向二级")
	@Column(name = "FLOW_DIRE_APR2_")
	public Double flowDireApr2;
	
	@Label("5月流向一级")
	@Column(name = "FLOW_DIRE_MAY1_")
	public Double flowDireMay1;
	
	
	@Label("5月流向二级")
	@Column(name = "FLOW_DIRE_MAY2_")
	public Double flowDireMay2;
	
	
	@Label("6月流向一级")
	@Column(name = "FLOW_DIRE_JUN1")
	public Double flowDireJun1;
	
	@Label("6月流向二级")
	@Column(name = "FLOW_DIRE_JUN2")
	public Double flowDireJun2;

	@Label("7月流向一级")
	@Column(name = "FLOW_DIRE_JUL1")
	public Double flowDireJul1;
	
	
	@Label("7月流向二级")
	@Column(name = "FLOW_DIRE_JUL2")
	public Double flowDireJul2;
	
	@Label("8月流向一级")
	@Column(name = "FLOW_DIRE_AUG1")
	public Double flowDireAug1;
	
	@Label("8月流向二级")
	@Column(name = "FLOW_DIRE_AUG2")
	public Double flowDireAug2;
	
	@Label("9月流向一级")
	@Column(name = "FLOW_DIRE_SEP1_")
	public Double flowDireSep1;
	
	@Label("9月流向二级")
	@Column(name = "FLOW_DIRE_SEP2_")
	public Double flowDireSep2;

	@Label("10月流向一级")
	@Column(name = "FLOW_DIRE_OCT1_")
	public Double flowDireOct1;
	
	@Label("10月流向二级")
	@Column(name = "FLOW_DIRE_OCT2_")
	public Double flowDireOct2;
	
	@Label("11月流向一级")
	@Column(name = "FLOW_DIRE_NOV1_")
	public Double flowDireNov1;
	
	@Label("11月流向二级")
	@Column(name = "FLOW_DIRE_NOV2_")
	public Double flowDireNov2;
	
	@Label("12月流向一级")
	@Column(name = "FLOW_DIRE_DEC1_")
	public Double flowDireDec1;
	
	@Label("12月流向二级")
	@Column(name = "FLOW_DIRE_DEC2_")
	public Double flowDireDec2;

	@Label("流向合计一级")
	@Column(name = "FLOW_DIRE_TOTAL1_")
	public Double flowDireTotal1;
	
	@Label("流向合计二级")
	@Column(name = "FLOW_DIRE_TOTAL2_")
	public Double flowDireTotal2;

	public String getHighMonth() {
		return highMonth;
	}

	public void setHighMonth(String highMonth) {
		this.highMonth = highMonth;
	}

	public Double getTotalOfOverJanToNov1() {
		return totalOfOverJanToNov1;
	}

	public void setTotalOfOverJanToNov1(Double totalOfOverJanToNov1) {
		this.totalOfOverJanToNov1 = totalOfOverJanToNov1;
	}

	public Double getTotalOfOverJanToNov2() {
		return totalOfOverJanToNov2;
	}

	public void setTotalOfOverJanToNov2(Double totalOfOverJanToNov2) {
		this.totalOfOverJanToNov2 = totalOfOverJanToNov2;
	}

	public Double getTotalOfOverJanToDec1() {
		return totalOfOverJanToDec1;
	}

	public void setTotalOfOverJanToDec1(Double totalOfOverJanToDec1) {
		this.totalOfOverJanToDec1 = totalOfOverJanToDec1;
	}

	public Double getTotalOfOverJanToDec2() {
		return totalOfOverJanToDec2;
	}

	public void setTotalOfOverJanToDec2(Double totalOfOverJanToDec2) {
		this.totalOfOverJanToDec2 = totalOfOverJanToDec2;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<FlowDire> getFlowDireList() {
		return flowDireList;
	}

	public void setFlowDireList(List<FlowDire> flowDireList) {
		this.flowDireList = flowDireList;
	}

	public Double getFlowDireJan1() {
		return flowDireJan1;
	}

	public void setFlowDireJan1(Double flowDireJan1) {
		this.flowDireJan1 = flowDireJan1;
	}

	public Double getFlowDireJan2() {
		return flowDireJan2;
	}

	public void setFlowDireJan2(Double flowDireJan2) {
		this.flowDireJan2 = flowDireJan2;
	}

	public Double getFlowDireFeb1() {
		return flowDireFeb1;
	}

	public void setFlowDireFeb1(Double flowDireFeb1) {
		this.flowDireFeb1 = flowDireFeb1;
	}

	public Double getFlowDireFeb2() {
		return flowDireFeb2;
	}

	public void setFlowDireFeb2(Double flowDireFeb2) {
		this.flowDireFeb2 = flowDireFeb2;
	}

	public Double getFlowDireMar1() {
		return flowDireMar1;
	}

	public void setFlowDireMar1(Double flowDireMar1) {
		this.flowDireMar1 = flowDireMar1;
	}

	public Double getFlowDireMar2() {
		return flowDireMar2;
	}

	public void setFlowDireMar2(Double flowDireMar2) {
		this.flowDireMar2 = flowDireMar2;
	}

	public Double getFlowDireApr1() {
		return flowDireApr1;
	}

	public void setFlowDireApri1(Double flowDireApr1) {
		this.flowDireApr1 = flowDireApr1;
	}

	public Double getFlowDireApr2() {
		return flowDireApr2;
	}

	public void setFlowDireApr2(Double flowDireApr2) {
		this.flowDireApr2 = flowDireApr2;
	}

	public Double getFlowDireMay1() {
		return flowDireMay1;
	}

	public void setFlowDireMay1(Double flowDireMay1) {
		this.flowDireMay1 = flowDireMay1;
	}

	public Double getFlowDireMay2() {
		return flowDireMay2;
	}

	public void setFlowDireMay2(Double flowDireMay2) {
		this.flowDireMay2 = flowDireMay2;
	}

	public Double getFlowDireJun1() {
		return flowDireJun1;
	}

	public void setFlowDireJun1(Double flowDireJun1) {
		this.flowDireJun1 = flowDireJun1;
	}

	public Double getFlowDireJun2() {
		return flowDireJun2;
	}

	public void setFlowDireJun2(Double flowDireJun2) {
		this.flowDireJun2 = flowDireJun2;
	}

	public Double getFlowDireJul1() {
		return flowDireJul1;
	}

	public void setFlowDireJul1(Double flowDireJul1) {
		this.flowDireJul1 = flowDireJul1;
	}

	public Double getFlowDireJul2() {
		return flowDireJul2;
	}

	public void setFlowDireJul2(Double flowDireJul2) {
		this.flowDireJul2 = flowDireJul2;
	}

	public Double getFlowDireAug1() {
		return flowDireAug1;
	}

	public void setFlowDireAug1(Double flowDireAug1) {
		this.flowDireAug1 = flowDireAug1;
	}

	public Double getFlowDireAug2() {
		return flowDireAug2;
	}

	public void setFlowDireAug2(Double flowDireAug2) {
		this.flowDireAug2 = flowDireAug2;
	}

	public Double getFlowDireSep1() {
		return flowDireSep1;
	}

	public void setFlowDireSep1(Double flowDireSep1) {
		this.flowDireSep1 = flowDireSep1;
	}

	public Double getFlowDireSep2() {
		return flowDireSep2;
	}

	public void setFlowDireSep2(Double flowDireSep2) {
		this.flowDireSep2 = flowDireSep2;
	}

	public Double getFlowDireOct1() {
		return flowDireOct1;
	}

	public void setFlowDireOct1(Double flowDireOct1) {
		this.flowDireOct1 = flowDireOct1;
	}

	public Double getFlowDireOct2() {
		return flowDireOct2;
	}

	public void setFlowDireOct2(Double flowDireOct2) {
		this.flowDireOct2 = flowDireOct2;
	}

	public Double getFlowDireNov1() {
		return flowDireNov1;
	}

	public void setFlowDireNov1(Double flowDireNov1) {
		this.flowDireNov1 = flowDireNov1;
	}

	public Double getFlowDireNov2() {
		return flowDireNov2;
	}

	public void setFlowDireNov2(Double flowDireNov2) {
		this.flowDireNov2 = flowDireNov2;
	}

	public Double getFlowDireDec1() {
		return flowDireDec1;
	}

	public void setFlowDireDec1(Double flowDireDec1) {
		this.flowDireDec1 = flowDireDec1;
	}

	public Double getFlowDireDec2() {
		return flowDireDec2;
	}

	public void setFlowDireDec2(Double flowDireDec2) {
		this.flowDireDec2 = flowDireDec2;
	}

	public Double getFlowDireTotal1() {
		return flowDireTotal1;
	}

	public void setFlowDireTotal1(Double flowDireTotal1) {
		this.flowDireTotal1 = flowDireTotal1;
	}

	public Double getFlowDireTotal2() {
		return flowDireTotal2;
	}

	public void setFlowDireTotal2(Double flowDireTotal2) {
		this.flowDireTotal2 = flowDireTotal2;
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

	public void setFlowDireApr1(Double flowDireApr1) {
		this.flowDireApr1 = flowDireApr1;
	}
}
