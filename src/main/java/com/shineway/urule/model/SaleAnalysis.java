package com.shineway.urule.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bstek.dorado.annotation.PropertyDef;
import com.bstek.urule.model.Label;

/**
 * 销量统计
 * 
 * @author Lucas
 *
 * @since 2018-04-16
 */
@Entity
@Table(name = "POC_SALE_ANALYSIS")
public class SaleAnalysis {
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
	
	@Label("销量明细")
	@Transient
	private List<Sales> sales;

	@Label("1月销量一级")
	@Column(name = "SALE_JAN1_")
	public Double saleJan1;
	@Label("1月销量二级")
	@Column(name = "SALE_JAN2_")
	public Double saleJan2;
	@Label("2月销量一级")
	@Column(name = "SALE_FEB1_")
	public Double saleFeb1;
	@Label("2月销量二级")
	@Column(name = "SALE_FEB2_")
	public Double saleFeb2;
	@Label("3月销量一级")
	@Column(name = "SALE_MAR1_")
	public Double saleMar1;
	@Label("3月销量二级")
	@Column(name = "SALE_MAR2_")
	public Double saleMar2;

	@Label("4月销量一级")
	@Column(name = "SALE_APR1_")
	public Double saleApr1;
	@Label("4月销量二级")
	@Column(name = "SALE_APR2_")
	public Double saleApr2;
	@Label("5月销量一级")
	@Column(name = "SALE_MAY1_")
	public Double saleMay1;
	@Label("5月销量二级")
	@Column(name = "SALE_MAY2_")
	public Double saleMay2;
	@Label("6月销量一级")
	@Column(name = "SALE_JUN1_")
	public Double saleJun1;
	@Label("6月销量二级")
	@Column(name = "SALE_JUN2_")
	public Double saleJun2;

	@Label("7月销量一级")
	@Column(name = "SALE_JUL1_")
	public Double saleJul1;
	@Label("7月销量二级")
	@Column(name = "SALE_JUL2_")
	public Double saleJul2;
	@Label("8月销量一级")
	@Column(name = "SALE_AUG1_")
	public Double saleAug1;
	@Label("8月销量二级")
	@Column(name = "SALE_AUG2_")
	public Double saleAug2;
	@Label("9月销量一级")
	@Column(name = "SALE_SEP1_")
	public Double saleSep1;
	@Label("9月销量二级")
	@Column(name = "SALE_SEP2_")
	public Double saleSep2;

	@Label("10月销量一级")
	@Column(name = "SALE_OCT1_")
	public Double saleOct1;
	@Label("10月销量二级")
	@Column(name = "SALE_OCT2_")
	public Double saleOct2;
	@Label("11月销量一级")
	@Column(name = "SALE_NOV1_")
	public Double saleNov1;
	@Label("11月销量二级")
	@Column(name = "SALE_NOV2_")
	public Double saleNov2;
	@Label("12月销量一级")
	@Column(name = "SALE_DEC1_")
	public Double saleDec1;
	@Label("12月销量二级")
	@Column(name = "SALE_DEC2_")
	public Double saleDec2;

	@Label("销量合计一级")
	@Column(name = "SALE_TOTAL1_")
	public Double saleTotal1;
	@Label("销量合计二级")
	@Column(name = "SALE_TOTAL2_")
	public Double saleTotal2;

	public List<Sales> getSales() {
		return sales;
	}

	public void setSales(List<Sales> sales) {
		this.sales = sales;
	}

	public Double getSaleJan1() {
		return saleJan1;
	}

	public void setSaleJan1(Double saleJan1) {
		this.saleJan1 = saleJan1;
	}

	public Double getSaleJan2() {
		return saleJan2;
	}

	public void setSaleJan2(Double saleJan2) {
		this.saleJan2 = saleJan2;
	}

	public Double getSaleFeb1() {
		return saleFeb1;
	}

	public void setSaleFeb1(Double saleFeb1) {
		this.saleFeb1 = saleFeb1;
	}

	public Double getSaleFeb2() {
		return saleFeb2;
	}

	public void setSaleFeb2(Double saleFeb2) {
		this.saleFeb2 = saleFeb2;
	}

	public Double getSaleMar1() {
		return saleMar1;
	}

	public void setSaleMar1(Double saleMar1) {
		this.saleMar1 = saleMar1;
	}

	public Double getSaleMar2() {
		return saleMar2;
	}

	public void setSaleMar2(Double saleMar2) {
		this.saleMar2 = saleMar2;
	}

	public Double getSaleApr1() {
		return saleApr1;
	}

	public void setSaleApr1(Double saleApr1) {
		this.saleApr1 = saleApr1;
	}

	public Double getSaleApr2() {
		return saleApr2;
	}

	public void setSaleApr2(Double saleApr2) {
		this.saleApr2 = saleApr2;
	}

	public Double getSaleMay1() {
		return saleMay1;
	}

	public void setSaleMay1(Double saleMay1) {
		this.saleMay1 = saleMay1;
	}

	public Double getSaleMay2() {
		return saleMay2;
	}

	public void setSaleMay2(Double saleMay2) {
		this.saleMay2 = saleMay2;
	}

	public Double getSaleJun1() {
		return saleJun1;
	}

	public void setSaleJun1(Double saleJun1) {
		this.saleJun1 = saleJun1;
	}

	public Double getSaleJun2() {
		return saleJun2;
	}

	public void setSaleJun2(Double saleJun2) {
		this.saleJun2 = saleJun2;
	}

	public Double getSaleJul1() {
		return saleJul1;
	}

	public void setSaleJul1(Double saleJul1) {
		this.saleJul1 = saleJul1;
	}

	public Double getSaleJul2() {
		return saleJul2;
	}

	public void setSaleJul2(Double saleJul2) {
		this.saleJul2 = saleJul2;
	}

	public Double getSaleAug1() {
		return saleAug1;
	}

	public void setSaleAug1(Double saleAug1) {
		this.saleAug1 = saleAug1;
	}

	public Double getSaleAug2() {
		return saleAug2;
	}

	public void setSaleAug2(Double saleAug2) {
		this.saleAug2 = saleAug2;
	}

	public Double getSaleSep1() {
		return saleSep1;
	}

	public void setSaleSep1(Double saleSep1) {
		this.saleSep1 = saleSep1;
	}

	public Double getSaleSep2() {
		return saleSep2;
	}

	public void setSaleSep2(Double saleSep2) {
		this.saleSep2 = saleSep2;
	}

	public Double getSaleOct1() {
		return saleOct1;
	}

	public void setSaleOct1(Double saleOct1) {
		this.saleOct1 = saleOct1;
	}

	public Double getSaleOct2() {
		return saleOct2;
	}

	public void setSaleOct2(Double saleOct2) {
		this.saleOct2 = saleOct2;
	}

	public Double getSaleNov1() {
		return saleNov1;
	}

	public void setSaleNov1(Double saleNov1) {
		this.saleNov1 = saleNov1;
	}

	public Double getSaleNov2() {
		return saleNov2;
	}

	public void setSaleNov2(Double saleNov2) {
		this.saleNov2 = saleNov2;
	}

	public Double getSaleDec1() {
		return saleDec1;
	}

	public void setSaleDec1(Double saleDec1) {
		this.saleDec1 = saleDec1;
	}

	public Double getSaleDec2() {
		return saleDec2;
	}

	public void setSaleDec2(Double saleDec2) {
		this.saleDec2 = saleDec2;
	}

	public Double getSaleTotal1() {
		return saleTotal1;
	}

	public void setSaleTotal1(Double saleTotal1) {
		this.saleTotal1 = saleTotal1;
	}

	public Double getSaleTotal2() {
		return saleTotal2;
	}

	public void setSaleTotal2(Double saleTotal2) {
		this.saleTotal2 = saleTotal2;
	}

}
