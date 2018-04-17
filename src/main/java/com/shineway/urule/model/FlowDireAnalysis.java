package com.shineway.urule.model;

import java.io.Serializable;
import java.util.List;

import com.bstek.urule.model.Label;

/**
 * 附件6-流向统计
 * 
 */
public class FlowDireAnalysis implements Serializable {
	private static final long serialVersionUID = 1L;
	@Label("流向")
	private List<FlowDire> flowDireList;
	@Label("高开月份")
    private String highMonth;
	@Label("高开流向合计1-11月一级")
	private int totalOfOverJanToNov1;
	@Label("高开流向合计1-11月二级")
	private int totalOfOverJanToNov2;
	@Label("高开流向合计12月一级")
	private int totalOfOverJanToDec1;
	@Label("高开流向合计12月二级")
	private int totalOfOverJanToDec2;
	@Label("1月流向一级")
	public int flowDireJan1;
	@Label("1月流向二级")
	public int flowDireJan2;
	@Label("2月流向一级")
	public int flowDireFeb1;
	@Label("2月流向二级")
	public int flowDireFeb2;
	@Label("3月流向一级")
	public int flowDireMar1;
	@Label("3月流向二级")
	public int flowDireMar2;

	@Label("4月流向一级")
	public int flowDireApri1;
	@Label("4月流向二级")
	public int flowDireApri2;
	@Label("5月流向一级")
	public int flowDireMay1;
	@Label("5月流向二级")
	public int flowDireMay2;
	@Label("6月流向一级")
	public int flowDireJun1;
	@Label("6月流向二级")
	public int flowDireJun2;

	@Label("7月流向一级")
	public int flowDireJul1;
	@Label("7月流向二级")
	public int flowDireJul2;
	@Label("8月流向一级")
	public int flowDireAug1;
	@Label("8月流向二级")
	public int flowDireAug2;
	@Label("9月流向一级")
	public int flowDireSep1;
	@Label("9月流向二级")
	public int flowDireSep2;

	@Label("10月流向一级")
	public int flowDireOct1;
	@Label("10月流向二级")
	public int flowDireOct2;
	@Label("11月流向一级")
	public int flowDireNov1;
	@Label("11月流向二级")
	public int flowDireNov2;
	@Label("12月流向一级")
	public int flowDireDec1;
	@Label("12月流向二级")
	public int flowDireDec2;

	@Label("流向合计一级")
	public int flowDireTotal1;
	@Label("流向合计二级")
	public int flowDireTotal2;
	public String getHighMonth() {
		return highMonth;
	}
	public void setHighMonth(String highMonth) {
		this.highMonth = highMonth;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public List<FlowDire> getFlowDireList() {
		return flowDireList;
	}
	public void setFlowDireList(List<FlowDire> flowDireList) {
		this.flowDireList = flowDireList;
	}
	public int getFlowDireJan1() {
		return flowDireJan1;
	}
	public void setFlowDireJan1(int flowDireJan1) {
		this.flowDireJan1 = flowDireJan1;
	}
	public int getFlowDireJan2() {
		return flowDireJan2;
	}
	public void setFlowDireJan2(int flowDireJan2) {
		this.flowDireJan2 = flowDireJan2;
	}
	public int getFlowDireFeb1() {
		return flowDireFeb1;
	}
	public void setFlowDireFeb1(int flowDireFeb1) {
		this.flowDireFeb1 = flowDireFeb1;
	}
	public int getFlowDireFeb2() {
		return flowDireFeb2;
	}
	public void setFlowDireFeb2(int flowDireFeb2) {
		this.flowDireFeb2 = flowDireFeb2;
	}
	public int getFlowDireMar1() {
		return flowDireMar1;
	}
	public void setFlowDireMar1(int flowDireMar1) {
		this.flowDireMar1 = flowDireMar1;
	}
	public int getFlowDireMar2() {
		return flowDireMar2;
	}
	public void setFlowDireMar2(int flowDireMar2) {
		this.flowDireMar2 = flowDireMar2;
	}
	public int getFlowDireApri1() {
		return flowDireApri1;
	}
	public void setFlowDireApri1(int flowDireApri1) {
		this.flowDireApri1 = flowDireApri1;
	}
	public int getFlowDireApri2() {
		return flowDireApri2;
	}
	public void setFlowDireApri2(int flowDireApri2) {
		this.flowDireApri2 = flowDireApri2;
	}
	public int getFlowDireMay1() {
		return flowDireMay1;
	}
	public void setFlowDireMay1(int flowDireMay1) {
		this.flowDireMay1 = flowDireMay1;
	}
	public int getFlowDireMay2() {
		return flowDireMay2;
	}
	public void setFlowDireMay2(int flowDireMay2) {
		this.flowDireMay2 = flowDireMay2;
	}
	public int getFlowDireJun1() {
		return flowDireJun1;
	}
	public void setFlowDireJun1(int flowDireJun1) {
		this.flowDireJun1 = flowDireJun1;
	}
	public int getFlowDireJun2() {
		return flowDireJun2;
	}
	public void setFlowDireJun2(int flowDireJun2) {
		this.flowDireJun2 = flowDireJun2;
	}
	public int getFlowDireJul1() {
		return flowDireJul1;
	}
	public void setFlowDireJul1(int flowDireJul1) {
		this.flowDireJul1 = flowDireJul1;
	}
	public int getFlowDireJul2() {
		return flowDireJul2;
	}
	public void setFlowDireJul2(int flowDireJul2) {
		this.flowDireJul2 = flowDireJul2;
	}
	public int getFlowDireAug1() {
		return flowDireAug1;
	}
	public void setFlowDireAug1(int flowDireAug1) {
		this.flowDireAug1 = flowDireAug1;
	}
	public int getFlowDireAug2() {
		return flowDireAug2;
	}
	public void setFlowDireAug2(int flowDireAug2) {
		this.flowDireAug2 = flowDireAug2;
	}
	public int getFlowDireSep1() {
		return flowDireSep1;
	}
	public void setFlowDireSep1(int flowDireSep1) {
		this.flowDireSep1 = flowDireSep1;
	}
	public int getFlowDireSep2() {
		return flowDireSep2;
	}
	public void setFlowDireSep2(int flowDireSep2) {
		this.flowDireSep2 = flowDireSep2;
	}
	public int getFlowDireOct1() {
		return flowDireOct1;
	}
	public void setFlowDireOct1(int flowDireOct1) {
		this.flowDireOct1 = flowDireOct1;
	}
	public int getFlowDireOct2() {
		return flowDireOct2;
	}
	public void setFlowDireOct2(int flowDireOct2) {
		this.flowDireOct2 = flowDireOct2;
	}
	public int getFlowDireNov1() {
		return flowDireNov1;
	}
	public void setFlowDireNov1(int flowDireNov1) {
		this.flowDireNov1 = flowDireNov1;
	}
	public int getFlowDireNov2() {
		return flowDireNov2;
	}
	public void setFlowDireNov2(int flowDireNov2) {
		this.flowDireNov2 = flowDireNov2;
	}
	public int getFlowDireDec1() {
		return flowDireDec1;
	}
	public void setFlowDireDec1(int flowDireDec1) {
		this.flowDireDec1 = flowDireDec1;
	}
	public int getFlowDireDec2() {
		return flowDireDec2;
	}
	public void setFlowDireDec2(int flowDireDec2) {
		this.flowDireDec2 = flowDireDec2;
	}
	public int getFlowDireTotal1() {
		return flowDireTotal1;
	}
	public void setFlowDireTotal1(int flowDireTotal1) {
		this.flowDireTotal1 = flowDireTotal1;
	}
	public int getFlowDireTotal2() {
		return flowDireTotal2;
	}
	public void setFlowDireTotal2(int flowDireTotal2) {
		this.flowDireTotal2 = flowDireTotal2;
	}
}
