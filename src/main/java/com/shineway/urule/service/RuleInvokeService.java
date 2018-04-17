package com.shineway.urule.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
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
@Component("ruleInvokeService")
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
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> invove(Map<String, Object> params) {
		KnowledgePackage knowledgePackage;
		try {
			knowledgePackage = knowledgeService
					.getKnowledge(TESTFLOW);
			KnowledgeSession session = KnowledgeSessionFactory.newKnowledgeSession(knowledgePackage);
			//统计流向基础数据
			Ledger ledger = initLedger(params);
			session.insert(ledger);
			session.insert(initFlowDireAnalysis(params));
			session.insert(initSaleAnalysis(params));
			session.insert(initSendOutAnalysis(params));
			session.startProcess(CALCRESULTFLOW,params);
			System.out.println(ledger.getCalcResult1());
			System.out.println(ledger.getCalcResult2());
			try {
				params = BeanUtils.describe(ledger);
			} catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
				e.printStackTrace();
			}
			return params;
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
		flowDireAnalysis.setFlowDireJan1(2345);
		flowDireAnalysis.setFlowDireJan2(4231);
		flowDireAnalysis.setFlowDireFeb1(2606);
		flowDireAnalysis.setFlowDireFeb2(2473);
		flowDireAnalysis.setFlowDireMar1(2623);
		flowDireAnalysis.setFlowDireMar2(2220);
		flowDireAnalysis.setFlowDireApri1(1363);
		flowDireAnalysis.setFlowDireApri2(1092);
		flowDireAnalysis.setFlowDireMay1(1784);
		flowDireAnalysis.setFlowDireMay2(1473);
		flowDireAnalysis.setFlowDireJun1(1145);
		flowDireAnalysis.setFlowDireJun2(1844);
		flowDireAnalysis.setFlowDireJul1(900);
		flowDireAnalysis.setFlowDireJul2(2000);
		flowDireAnalysis.setFlowDireAug1(1303);
		flowDireAnalysis.setFlowDireAug2(2125);
		flowDireAnalysis.setFlowDireSep1(4988);
		flowDireAnalysis.setFlowDireSep2(3553);
		flowDireAnalysis.setFlowDireOct1(0);
		flowDireAnalysis.setFlowDireOct2(0);
		flowDireAnalysis.setFlowDireNov1(9817);
		flowDireAnalysis.setFlowDireNov2(4590);
		flowDireAnalysis.setFlowDireDec1(5898);
		flowDireAnalysis.setFlowDireDec2(4709);
		return flowDireAnalysis;
	}
	private SaleAnalysis initSaleAnalysis(Map<String, Object> params) {
		SaleAnalysis saleAnalysis = new SaleAnalysis();
		saleAnalysis.setSaleDec1(2318);//计算本次计算、是否超发货
		saleAnalysis.setSaleDec2(3386);
		saleAnalysis.setSaleTotal1(15415);//计算扣除超发货
		saleAnalysis.setSaleTotal2(22526);
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
