package com.shineway.urule.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bstek.urule.model.Label;

/**
 * @author Lucas 台账
 * @since 2018-04-14
 */
@Entity
@Table(name = "POC_LEDGER")
public class Ledger {
	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;
	@Label("高开月份")
	@Column(name = "MONTH_", length = 10)
    private String highMonth;
	@Label("客户编号")
	@Column(name = "CUSTOMER_NO_")
	private String customerNo;
	@Label("客户")
	@Column(name = "CUSTOMER_NAME_")
	private String customerName;
	@Label("商品编号")
	private String productNo;
	@Label("商品")
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
	@Label("理论售出")
	private int salesTheory;
	@Label("发货总计")
	private int totalSendout;
	
	//本次计算
	@Label("12月销量一级")
	private int saleDec1;
	@Label("12月销量二级")
	private int saleDec2;
	
	/*计算是否消化完1*/
	@Label("1-11月是否消化完")
	private String hasOverplusJanToNov;
	@Label("12月是否消化完")
	private String hasOverplusDec;
	@Label("当月是否消化完")
	private String hasOverplusCurMonth;
	@Label("高开流向合计1-11月一级")
	private int totalOfOverJanToNov1;
	@Label("高开流向合计1-11月二级")
	private int totalOfOverJanToNov2;
	@Label("高开流向合计12月一级")
	private int totalOfOverJanToDec1;
	@Label("高开流向合计12月二级")
	private int totalOfOverJanToDec2;
	@Label("期初库存一级")
	private int inventoryOpening1;
	@Label("期初库存二级")
	private int inventoryOpening2;
	/*计算是否消化完2*/
	@Label("期末库存")
	private int inventoryFinal;
	@Label("本次计算一级")
	private int calcLevel1;
	@Label("本次计算二级")
	private int calcLevel2;
	@Label("扣除超发货一级")
	private int moreLevel1;
	@Label("扣除超发货二级")
	private int moreLevel2;
	@Label("本次最终计算一级")
	private int calcResult1;
	@Label("本次最终计算二级")
	private int calcResult2;
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

	//计算销量
	@Label("已计算销量1-11月一级")
	private int calcSaleJanToNov1;
	@Label("已计算销量1-11月二级")
	private int calcSaleJanToNov2;
	
	public int getCalcLevel1() {
		return calcLevel1;
	}

	public void setCalcLevel1(int calcLevel1) {
		this.calcLevel1 = calcLevel1;
	}

	public int getCalcLevel2() {
		return calcLevel2;
	}

	public void setCalcLevel2(int calcLevel2) {
		this.calcLevel2 = calcLevel2;
	}

	public int getMoreLevel1() {
		return moreLevel1;
	}

	public void setMoreLevel1(int moreLevel1) {
		this.moreLevel1 = moreLevel1;
	}

	public int getMoreLevel2() {
		return moreLevel2;
	}

	public void setMoreLevel2(int moreLevel2) {
		this.moreLevel2 = moreLevel2;
	}

	public int getCalcResult1() {
		return calcResult1;
	}

	public void setCalcResult1(int calcResult1) {
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


	public int getTotalOfOverJanToNov1() {
		return totalOfOverJanToNov1;
	}

	public void setTotalOfOverJanToNov1(int totalOfOverJanToNov1) {
		this.totalOfOverJanToNov1 = totalOfOverJanToNov1;
	}

	public int getTotalOfOverJanToNov2() {
		return totalOfOverJanToNov2;
	}

	public void setTotalOfOverJanToNov2(int totalOfOverJanToNov2) {
		this.totalOfOverJanToNov2 = totalOfOverJanToNov2;
	}

	public int getTotalOfOverJanToDec1() {
		return totalOfOverJanToDec1;
	}

	public void setTotalOfOverJanToDec1(int totalOfOverJanToDec1) {
		this.totalOfOverJanToDec1 = totalOfOverJanToDec1;
	}

	public int getTotalOfOverJanToDec2() {
		return totalOfOverJanToDec2;
	}

	public void setTotalOfOverJanToDec2(int totalOfOverJanToDec2) {
		this.totalOfOverJanToDec2 = totalOfOverJanToDec2;
	}

	public int getInventoryOpening1() {
		return inventoryOpening1;
	}

	public void setInventoryOpening1(int inventoryOpening1) {
		this.inventoryOpening1 = inventoryOpening1;
	}

	public int getInventoryOpening2() {
		return inventoryOpening2;
	}

	public void setInventoryOpening2(int inventoryOpening2) {
		this.inventoryOpening2 = inventoryOpening2;
	}

	public int getInventoryFinal() {
		return inventoryFinal;
	}

	public void setInventoryFinal(int inventoryFinal) {
		this.inventoryFinal = inventoryFinal;
	}

	public int getCalcResult2() {
		return calcResult2;
	}

	public void setCalcResult2(int calcResult2) {
		this.calcResult2 = calcResult2;
	}

	public int getSalesTheory() {
		return salesTheory;
	}

	public void setSalesTheory(int salesTheory) {
		this.salesTheory = salesTheory;
	}

	public int getTotalSendout() {
		return totalSendout;
	}

	public void setTotalSendout(int totalSendout) {
		this.totalSendout = totalSendout;
	}

	public int getSaleDec1() {
		return saleDec1;
	}

	public void setSaleDec1(int saleDec1) {
		this.saleDec1 = saleDec1;
	}

	public int getSaleDec2() {
		return saleDec2;
	}

	public void setSaleDec2(int saleDec2) {
		this.saleDec2 = saleDec2;
	}

	public int getCalcSaleJanToNov1() {
		return calcSaleJanToNov1;
	}

	public void setCalcSaleJanToNov1(int calcSaleJanToNov1) {
		this.calcSaleJanToNov1 = calcSaleJanToNov1;
	}

	public int getCalcSaleJanToNov2() {
		return calcSaleJanToNov2;
	}

	public void setCalcSaleJanToNov2(int calcSaleJanToNov2) {
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

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
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

}
