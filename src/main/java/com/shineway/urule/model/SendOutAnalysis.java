package com.shineway.urule.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

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

	@Label("发货明细")
	@Transient
	private List<SendOut> sendOutList;

	@Label("1月发货")
	@Column(name = "SENDOUT_JAN_")
	public int sendOutJan;
	@Label("2月发货")
	@Column(name = "SENDOUT_FEB_")
	public int sendOutFeb;
	@Label("3月发货")
	@Column(name = "SENDOUT_MAR_")
	public int sendOutMar;

	@Label("4月发货")
	@Column(name = "SENDOUT_APRI_")
	public int sendOutApri;
	@Label("5月发货")
	@Column(name = "SENDOUT_MAY_")
	public int sendOutMay;
	@Label("6月发货")
	@Column(name = "SENDOUT_JUN_")
	public int sendOutJun;

	@Label("7月发货")
	@Column(name = "SENDOUT_JUL_")
	public int sendOutJul;
	@Label("8月发货")
	@Column(name = "SENDOUT_AUG_")
	public int sendOutAug;
	@Label("9月发货")
	@Column(name = "SENDOUT_SEP_")
	public int sendOutSep;

	@Label("10月发货")
	@Column(name = "SENDOUT_OCT_")
	public int sendOutOct;
	@Label("11月发货")
	@Column(name = "SENDOUT_NOV_")
	public int sendOutNov;
	@Label("12月发货")
	@Column(name = "SENDOUT_DEC_")
	public int sendOutDec;

	@Label("发货合计")
	@Column(name = "SENDOUT_TOTAL_")
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
