package com.shineway.urule.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bstek.urule.model.Label;

/**
 * 附件5-发货统计
 * 
 */
@Entity
@Table(name = "POC_SENDOUT_ANALYSIS")
public class SendOutAnalysis implements Serializable {
	@Id
	@Column(name = "ID_", length = 40)
	private String id;
	@Column(name = "LEDGER_ID_", length = 40)
	private String ledgerId;
	private static final long serialVersionUID = 1L;
	@Label("发货明细")
	private List<SendOut> sendOutList;
	@Label("1月发货")
	public int sendOutJan;
	@Label("2月发货")
	public int sendOutFeb;
	@Label("3月发货")
	public int sendOutMar;

	@Label("4月发货")
	public int sendOutApri;
	@Label("5月发货")
	public int sendOutMay;
	@Label("6月发货")
	public int sendOutJun;

	@Label("7月发货")
	public int sendOutJul;
	@Label("8月发货")
	public int sendOutAug;
	@Label("9月发货")
	public int sendOutSep;

	@Label("10月发货")
	public int sendOutOct;
	@Label("11月发货")
	public int sendOutNov;
	@Label("12月发货")
	public int sendOutDec;

	@Label("发货合计")
	public int sendOutTotal;
	public List<SendOut> getSendOutList() {
		return sendOutList;
	}
	public void setSendOutList(List<SendOut> sendOutList) {
		this.sendOutList = sendOutList;
	}
	public int getSendOutJan() {
		return sendOutJan;
	}
	public void setSendOutJan(int sendOutJan) {
		this.sendOutJan = sendOutJan;
	}
	public int getSendOutFeb() {
		return sendOutFeb;
	}
	public void setSendOutFeb(int sendOutFeb) {
		this.sendOutFeb = sendOutFeb;
	}
	public int getSendOutMar() {
		return sendOutMar;
	}
	public void setSendOutMar(int sendOutMar) {
		this.sendOutMar = sendOutMar;
	}
	public int getSendOutApri() {
		return sendOutApri;
	}
	public void setSendOutApri(int sendOutApri) {
		this.sendOutApri = sendOutApri;
	}
	public int getSendOutMay() {
		return sendOutMay;
	}
	public void setSendOutMay(int sendOutMay) {
		this.sendOutMay = sendOutMay;
	}
	public int getSendOutJun() {
		return sendOutJun;
	}
	public void setSendOutJun(int sendOutJun) {
		this.sendOutJun = sendOutJun;
	}
	public int getSendOutJul() {
		return sendOutJul;
	}
	public void setSendOutJul(int sendOutJul) {
		this.sendOutJul = sendOutJul;
	}
	public int getSendOutAug() {
		return sendOutAug;
	}
	public void setSendOutAug(int sendOutAug) {
		this.sendOutAug = sendOutAug;
	}
	public int getSendOutSep() {
		return sendOutSep;
	}
	public void setSendOutSep(int sendOutSep) {
		this.sendOutSep = sendOutSep;
	}
	public int getSendOutOct() {
		return sendOutOct;
	}
	public void setSendOutOct(int sendOutOct) {
		this.sendOutOct = sendOutOct;
	}
	public int getSendOutNov() {
		return sendOutNov;
	}
	public void setSendOutNov(int sendOutNov) {
		this.sendOutNov = sendOutNov;
	}
	public int getSendOutDec() {
		return sendOutDec;
	}
	public void setSendOutDec(int sendOutDec) {
		this.sendOutDec = sendOutDec;
	}
	public int getSendOutTotal() {
		return sendOutTotal;
	}
	public void setSendOutTotal(int sendOutTotal) {
		this.sendOutTotal = sendOutTotal;
	}

}
