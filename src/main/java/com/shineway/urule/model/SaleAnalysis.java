package com.shineway.urule.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bstek.urule.model.Label;

/**
 * 销量统计
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
	@Label("销量明细")
	@Transient
	private List<Sales> sales;
    @Label("1月销量一级")
	public int saleJan1;
    @Label("1月销量二级") 
	public int saleJan2;
    @Label("2月销量一级") 
   	public int saleFeb1;
    @Label("2月销量二级") 
   	public int saleFeb2;
    @Label("3月销量一级") 
   	public int saleMar1;
    @Label("3月销量二级") 
   	public int saleMar2;
    
    @Label("4月销量一级") 
   	public int saleApri1;
    @Label("4月销量二级") 
   	public int saleApri2;
    @Label("5月销量一级") 
   	public int saleMay1;
    @Label("5月销量二级") 
   	public int saleMay2;
    @Label("6月销量一级") 
   	public int saleJun1;
    @Label("6月销量二级") 
   	public int saleJun2;
    
    @Label("7月销量一级") 
   	public int saleJul1;
    @Label("7月销量二级") 
   	public int saleJul2;
    @Label("8月销量一级") 
   	public int saleAug1;
    @Label("8月销量二级") 
   	public int saleAug2;
    @Label("9月销量一级") 
   	public int saleSep1;
    @Label("9月销量二级") 
   	public int saleSep2;
  
    @Label("10月销量一级") 
   	public int saleOct1;
    @Label("10月销量二级") 
   	public int saleOct2;
    @Label("11月销量一级") 
   	public int saleNov1;
    @Label("11月销量二级") 
   	public int saleNov2;
    @Label("12月销量一级") 
   	public int saleDec1;
    @Label("12月销量二级") 
   	public int saleDec2;
    
    @Label("销量合计一级") 
   	public int saleTotal1;
    @Label("销量合计二级") 
   	public int saleTotal2;
	public List<Sales> getSales() {
		return sales;
	}
	public void setSales(List<Sales> sales) {
		this.sales = sales;
	}
	public int getSaleJan1() {
		return saleJan1;
	}
	public void setSaleJan1(int saleJan1) {
		this.saleJan1 = saleJan1;
	}
	public int getSaleJan2() {
		return saleJan2;
	}
	public void setSaleJan2(int saleJan2) {
		this.saleJan2 = saleJan2;
	}
	public int getSaleFeb1() {
		return saleFeb1;
	}
	public void setSaleFeb1(int saleFeb1) {
		this.saleFeb1 = saleFeb1;
	}
	public int getSaleFeb2() {
		return saleFeb2;
	}
	public void setSaleFeb2(int saleFeb2) {
		this.saleFeb2 = saleFeb2;
	}
	public int getSaleMar1() {
		return saleMar1;
	}
	public void setSaleMar1(int saleMar1) {
		this.saleMar1 = saleMar1;
	}
	public int getSaleMar2() {
		return saleMar2;
	}
	public void setSaleMar2(int saleMar2) {
		this.saleMar2 = saleMar2;
	}
	public int getSaleApri1() {
		return saleApri1;
	}
	public void setSaleApri1(int saleApri1) {
		this.saleApri1 = saleApri1;
	}
	public int getSaleApri2() {
		return saleApri2;
	}
	public void setSaleApri2(int saleApri2) {
		this.saleApri2 = saleApri2;
	}
	public int getSaleMay1() {
		return saleMay1;
	}
	public void setSaleMay1(int saleMay1) {
		this.saleMay1 = saleMay1;
	}
	public int getSaleMay2() {
		return saleMay2;
	}
	public void setSaleMay2(int saleMay2) {
		this.saleMay2 = saleMay2;
	}
	public int getSaleJun1() {
		return saleJun1;
	}
	public void setSaleJun1(int saleJun1) {
		this.saleJun1 = saleJun1;
	}
	public int getSaleJun2() {
		return saleJun2;
	}
	public void setSaleJun2(int saleJun2) {
		this.saleJun2 = saleJun2;
	}
	public int getSaleJul1() {
		return saleJul1;
	}
	public void setSaleJul1(int saleJul1) {
		this.saleJul1 = saleJul1;
	}
	public int getSaleJul2() {
		return saleJul2;
	}
	public void setSaleJul2(int saleJul2) {
		this.saleJul2 = saleJul2;
	}
	public int getSaleAug1() {
		return saleAug1;
	}
	public void setSaleAug1(int saleAug1) {
		this.saleAug1 = saleAug1;
	}
	public int getSaleAug2() {
		return saleAug2;
	}
	public void setSaleAug2(int saleAug2) {
		this.saleAug2 = saleAug2;
	}
	public int getSaleSep1() {
		return saleSep1;
	}
	public void setSaleSep1(int saleSep1) {
		this.saleSep1 = saleSep1;
	}
	public int getSaleSep2() {
		return saleSep2;
	}
	public void setSaleSep2(int saleSep2) {
		this.saleSep2 = saleSep2;
	}
	public int getSaleOct1() {
		return saleOct1;
	}
	public void setSaleOct1(int saleOct1) {
		this.saleOct1 = saleOct1;
	}
	public int getSaleOct2() {
		return saleOct2;
	}
	public void setSaleOct2(int saleOct2) {
		this.saleOct2 = saleOct2;
	}
	public int getSaleNov1() {
		return saleNov1;
	}
	public void setSaleNov1(int saleNov1) {
		this.saleNov1 = saleNov1;
	}
	public int getSaleNov2() {
		return saleNov2;
	}
	public void setSaleNov2(int saleNov2) {
		this.saleNov2 = saleNov2;
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
	public int getSaleTotal1() {
		return saleTotal1;
	}
	public void setSaleTotal1(int saleTotal1) {
		this.saleTotal1 = saleTotal1;
	}
	public int getSaleTotal2() {
		return saleTotal2;
	}
	public void setSaleTotal2(int saleTotal2) {
		this.saleTotal2 = saleTotal2;
	}
	
}
