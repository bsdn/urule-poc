package com.shineway.urule.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bstek.urule.ClassUtils;
import com.bstek.urule.runtime.KnowledgePackage;
import com.bstek.urule.runtime.KnowledgeSession;
import com.bstek.urule.runtime.KnowledgeSessionFactory;
import com.bstek.urule.runtime.service.KnowledgeService;
import com.shineway.urule.model.FlowDireAnalysis;
import com.shineway.urule.model.Ledger;
import com.shineway.urule.model.SaleAnalysis;
import com.shineway.urule.model.SendOut;
import com.shineway.urule.model.SendOutAnalysis;
@Component
public class RuleInvokeService{
	private static final String TEST = "poc/test";
	private static final String TESTFLOW = "poc/testFlow";
	private static final String TESTHASOVERPLUS = "poc/testHasOverplus";
	private static final String TESTCALCLEVEL = "poc/testCalcLevel";
	private static final String TESTMORELEVEL = "poc/testMoreLevel";
	private static final String TESTFLOWDIRE = "poc/testFlowDire";
	private static final String CALCRESULTFLOW = "calcResultFlow";
	
	@Resource(name = KnowledgeService.BEAN_ID)
	private KnowledgeService knowledgeService;
	
	public Map<String, Object> invove(Map<String, Object> params) {
		KnowledgePackage knowledgePackage;
		try {
			knowledgePackage = knowledgeService
					.getKnowledge(TESTFLOW);
			KnowledgeSession session = KnowledgeSessionFactory
					.newKnowledgeSession(knowledgePackage);
			//统计流向基础数据
			Ledger ledger = initLedger(params);
			session.insert(ledger);
			session.insert(initFlowDireAnalysis(params));
			session.insert(initSaleAnalysis(params));
			session.insert(initSendOutAnalysis(params));
			session.insert(params);
			session.startProcess(CALCRESULTFLOW,params);
			System.out.println(ledger.getCalcResult1());
			System.out.println(ledger.getCalcResult2());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return params;
	}
	private Ledger initLedger(Map<String, Object> params) {
		Ledger ledger = new Ledger();
		ledger.setHighMonth("4");//计算高开流向
		ledger.setInventoryOpening1(4812);//计算是否消化完
		ledger.setInventoryOpening2(298);
		ledger.setInventoryFinal(7386);//计算理论售出
		ledger.setCalcSaleJanToNov1(5604);//计算本次计算、是否超发货
		ledger.setCalcSaleJanToNov2(8196);
		return ledger;
	}
	private FlowDireAnalysis initFlowDireAnalysis(Map<String, Object> params) {
		FlowDireAnalysis flowDireAnalysis = new FlowDireAnalysis();
		//计算是否消化完
		
		return flowDireAnalysis;
	}
	private SaleAnalysis initSaleAnalysis(Map<String, Object> params) {
		SaleAnalysis saleAnalysis = new SaleAnalysis();
		saleAnalysis.setSaleDec1(2318);//计算本次计算、是否超发货
		saleAnalysis.setSaleDec2(3386);
		return saleAnalysis;
	}	
	private SendOutAnalysis initSendOutAnalysis(Map<String, Object> params) {
		SendOutAnalysis sendOutAnalysis = new SendOutAnalysis();
		sendOutAnalysis.setSendOutTotal(13800);//计算是否消化完、计算理论售出\是否超发货
		return sendOutAnalysis;
	}
	public static void main(String[] args) {
		File arg1 = new File("aa.xml");
		ClassUtils.classToXml(SendOut.class, arg1);
	}
}
