package com.shineway.urule.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bstek.dorado.annotation.PropertyDef;
import com.bstek.urule.model.Label;

/**
 * @author Lucas 台账
 * @since 2018-04-14
 */
@Entity
@Table(name = "POC_LEDGER")
public class Ledger {
	@Id
	@PropertyDef(label = "编号")
	@Column(name = "ID_", length = 40)
	private String id;
	
	@Column(name = "OFFICE_")
	private String office;
	
    @Label("是否超发货")
	@Column(name = "MORE_SENDOUT_FLAG", length = 10)
	private String moreSendoutFlag;
	
	@Label("高开月份")
	@PropertyDef(label = "高开月份")
	@Column(name = "HIGH_MONTH_", length = 10)
	private String highMonth;

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

	@Label("销量统计")
	@Transient
	private SaleAnalysis saleAnalysis;
	@Label("流向统计")
	@Transient
	private FlowDireAnalysis flowDireAnalysis;
	@Label("发货统计")
	@Transient
	private SendOutAnalysis sendOutAnalysis;

	@PropertyDef(label = "理论售出")
	@Label("理论售出")
	@Column(name = "SALES_THEORY_")
	private Double salesTheory;

	/* 计算是否消化完1 */
	@PropertyDef(label = "1-11月是否消化完")
	@Label("1-11月是否消化完")
	@Column(name = "HAS_OVERPLUS_JAN_TO_NOV_", length = 50)
	private String hasOverplusJanToNov;

	@PropertyDef(label = "12月是否消化完")
	@Label("12月是否消化完")
	@Column(name = "HAS_OVERPLUS_DEC_", length = 50)
	private String hasOverplusDec;

	@PropertyDef(label = "当月是否消化完")
	@Label("当月是否消化完")
	@Column(name = "HAS_OVERPLUS_CUR_MONTH_", length = 50)
	private String hasOverplusCurMonth;

	@PropertyDef(label = "一级")
	@Label("期初库存一级")
	@Column(name = "INVENTORY_OPENING1_")
	private Double inventoryOpening1;

	@PropertyDef(label = "二级")
	@Label("期初库存二级")
	@Column(name = "INVENTORY_OPENING2_")
	private Double inventoryOpening2;

	/* 计算是否消化完2 */
	@PropertyDef(label = "期末库存")
	@Label("期末库存")
	@Column(name = "INVENTORY_FINAL_")
	private Double inventoryFinal;

	@PropertyDef(label = "一级")
	@Label("本次计算一级")
	@Column(name = "CALC_LEVEL1_")
	private Double calcLevel1;

	@PropertyDef(label = "二级")
	@Label("本次计算二级")
	@Column(name = "CALC_LEVEL2_")
	private Double calcLevel2;

	@PropertyDef(label = "一级")
	@Label("扣除超发货一级")
	@Column(name = "MORE_LEVEL1_")
	private Double moreLevel1;

	@PropertyDef(label = "二级")
	@Label("扣除超发货二级")
	@Column(name = "MORE_LEVEL2_")
	private Double moreLevel2;

	@PropertyDef(label = "一级")
	@Label("本次最终计算一级")
	@Column(name = "CALC_RESULT1_")
	private Double calcResult1;

	@PropertyDef(label = "二级")
	@Label("本次最终计算二级")
	@Column(name = "CALC_RESULT2_")
	private Double calcResult2;

	// 计算销量
	@PropertyDef(label = "一级")
	@Label("已计算销量1-11月一级")
	@Column(name = "CALC_SALE_JAN_TO_NOV1_")
	private Double calcSaleJanToNov1;
	
	@PropertyDef(label = "二级")
	@Label("已计算销量1-11月二级")
	@Column(name = "CALC_SALE_JAN_TO_NOV2_")
	private Double calcSaleJanToNov2;

	public SendOutAnalysis getSendOutAnalysis() {
		return sendOutAnalysis;
	}

	public void setSendOutAnalysis(SendOutAnalysis sendOutAnalysis) {
		this.sendOutAnalysis = sendOutAnalysis;
	}

	public FlowDireAnalysis getFlowDireAnalysis() {
		return flowDireAnalysis;
	}

	public void setFlowDireAnalysis(FlowDireAnalysis flowDireAnalysis) {
		this.flowDireAnalysis = flowDireAnalysis;
	}

	public String getHighMonth() {
		return highMonth;
	}

	public void setHighMonth(String highMonth) {
		this.highMonth = highMonth;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public Double getCalcLevel1() {
		return calcLevel1;
	}

	public void setCalcLevel1(Double calcLevel1) {
		this.calcLevel1 = calcLevel1;
	}

	public Double getCalcLevel2() {
		return calcLevel2;
	}

	public void setCalcLevel2(Double calcLevel2) {
		this.calcLevel2 = calcLevel2;
	}

	public Double getMoreLevel1() {
		return moreLevel1;
	}

	public void setMoreLevel1(Double moreLevel1) {
		this.moreLevel1 = moreLevel1;
	}

	public Double getMoreLevel2() {
		return moreLevel2;
	}

	public void setMoreLevel2(Double moreLevel2) {
		this.moreLevel2 = moreLevel2;
	}

	public Double getCalcResult1() {
		return calcResult1;
	}

	public void setCalcResult1(Double calcResult1) {
		this.calcResult1 = calcResult1;
	}

	public String isHasOverplusJanToNov() {
		return hasOverplusJanToNov;
	}

	public void setHasOverplusJanToNov(String hasOverplusJanToNov) {
		this.hasOverplusJanToNov = hasOverplusJanToNov;
	}

	public String isHasOverplusDec() {
		return hasOverplusDec;
	}

	public void setHasOverplusDec(String hasOverplusDec) {
		this.hasOverplusDec = hasOverplusDec;
	}

	public String isHasOverplusCurMonth() {
		return hasOverplusCurMonth;
	}

	public void setHasOverplusCurMonth(String hasOverplusCurMonth) {
		this.hasOverplusCurMonth = hasOverplusCurMonth;
	}

	public Double getInventoryOpening1() {
		return inventoryOpening1;
	}

	public void setInventoryOpening1(Double inventoryOpening1) {
		this.inventoryOpening1 = inventoryOpening1;
	}

	public Double getInventoryOpening2() {
		return inventoryOpening2;
	}

	public void setInventoryOpening2(Double inventoryOpening2) {
		this.inventoryOpening2 = inventoryOpening2;
	}

	public Double getInventoryFinal() {
		return inventoryFinal;
	}

	public void setInventoryFinal(Double inventoryFinal) {
		this.inventoryFinal = inventoryFinal;
	}

	public Double getCalcResult2() {
		return calcResult2;
	}

	public void setCalcResult2(Double calcResult2) {
		this.calcResult2 = calcResult2;
	}

	public Double getSalesTheory() {
		return salesTheory;
	}

	public void setSalesTheory(Double salesTheory) {
		this.salesTheory = salesTheory;
	}

	public Double getCalcSaleJanToNov1() {
		return calcSaleJanToNov1;
	}

	public void setCalcSaleJanToNov1(Double calcSaleJanToNov1) {
		this.calcSaleJanToNov1 = calcSaleJanToNov1;
	}

	public Double getCalcSaleJanToNov2() {
		return calcSaleJanToNov2;
	}

	public void setCalcSaleJanToNov2(Double calcSaleJanToNov2) {
		this.calcSaleJanToNov2 = calcSaleJanToNov2;
	}

	public SaleAnalysis getSaleAnalysis() {
		return saleAnalysis;
	}

	public void setSaleAnalysis(SaleAnalysis saleAnalysis) {
		this.saleAnalysis = saleAnalysis;
	}

	public String getHasOverplusJanToNov() {
		return hasOverplusJanToNov;
	}

	public String getHasOverplusDec() {
		return hasOverplusDec;
	}

	public String getHasOverplusCurMonth() {
		return hasOverplusCurMonth;
	}

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

	public String getMoreSendoutFlag() {
		return moreSendoutFlag;
	}

	public void setMoreSendoutFlag(String moreSendoutFlag) {
		this.moreSendoutFlag = moreSendoutFlag;
	}

}
