package com.shineway.urule.service;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;

import com.bstek.bdf2.core.orm.hibernate.HibernateDao;
import com.bstek.urule.runtime.BatchSession;
import com.bstek.urule.runtime.Business;
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
public class RuleInvokeService extends HibernateDao {
//	private static final String TEST = "poc/test";
	private static final String TESTFLOW = "poc/testFlow";
//	private static final String TESTHASOVERPLUS = "poc/testHasOverplus";
//	private static final String TESTCALCLEVEL = "poc/testCalcLevel";
//	private static final String TESTMORELEVEL = "poc/testMoreLevel";
//	private static final String TESTFLOWDIRE = "poc/testFlowDire";
//	private static final String TESTTHEROY = "poc/testTheroy";
	private static final String CALCRESULTFLOW = "calcResultFlow";
	//testHasOverplusFlow

	public Map<String, Object> invoveForEach(Map<String, Object> params) {
		SendOutAnalysis soa = new SendOutAnalysis();
		soa.setCustomerNo("11111");
		List<SendOut> sendOutList = new ArrayList<SendOut>();
		SendOut so1 = new SendOut();
		so1.setPacketNumber("1");
		SendOut so2 = new SendOut();
		so2.setPacketNumber("2");
		SendOut so3 = new SendOut();
		so3.setPacketNumber("3");
		sendOutList.add(so1);
		sendOutList.add(so2);
		sendOutList.add(so3);
		soa.setSendOutList(sendOutList);
		KnowledgePackage klp;
		try {
			klp = knowledgeService.getKnowledge("poc/testForeach");
			KnowledgeSession ses = KnowledgeSessionFactory.newKnowledgeSession(klp);
			ses.insert(soa);
			ses.fireRules();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Resource(name = KnowledgeService.BEAN_ID)
	private KnowledgeService knowledgeService;
	@SuppressWarnings("unchecked")
	public Map<String, Object> invoveOne(Map<String, Object> params) {
		KnowledgePackage knowledgePackage;
		try {
			knowledgePackage = knowledgeService.getKnowledge(TESTFLOW);
			KnowledgeSession session = KnowledgeSessionFactory.newKnowledgeSession(knowledgePackage);
			//统计流向基础数据
			Session sessionHiber = this.getSessionFactory().openSession();
			Ledger ledger = null;
			try {
				ledger = (Ledger) getObjectFromData(1, 0, Ledger.class);
				FlowDireAnalysis direAnalysis = (FlowDireAnalysis) getObjectFromData(1, 0, FlowDireAnalysis.class);
				SaleAnalysis saleAnalysis = (SaleAnalysis) getObjectFromData(1, 0, SaleAnalysis.class);
				SendOutAnalysis sendOutAnalysis = (SendOutAnalysis) getObjectFromData(1, 0, SendOutAnalysis.class);
				session.insert(ledger);
				session.insert(direAnalysis);
				session.insert(saleAnalysis);
				session.insert(sendOutAnalysis);
				session.startProcess(CALCRESULTFLOW, params);
			} finally {
				sessionHiber.flush();
				sessionHiber.close();
			}
			System.out.println(ledger.getCalcResult1()+","+ledger.getCalcResult2());
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
	public boolean batchInvoke(final Map<String, Object> params){
		KnowledgePackage knowledgePackage;
		try {
			String threadCountObj = (String) params.get("threadCount");
			String taskCountObj = (String) params.get("taskCount");
			String totalCountObj = (String) params.get("totalCount");
			Integer threadCount = 8;
			Integer taskCount = 100;
			Integer totalCount = 10000;
			if(threadCountObj != null){
				threadCount = Integer.parseInt(threadCountObj);
			}
			if(taskCountObj != null){
				taskCount = Integer.parseInt(taskCountObj);
			}
			if(totalCountObj != null){
				totalCount = Integer.parseInt(totalCountObj);
			}
    		System.out.println("请求参数："+params);
			final int totalCount1=totalCount;
			knowledgePackage = knowledgeService.getKnowledge(TESTFLOW);
			BatchSession batchSession = KnowledgeSessionFactory.newBatchSession(knowledgePackage, threadCount, taskCount);
            for(int i=0; i < totalCount; i++){
            	final int num = i;
            	batchSession.addBusiness(new Business(){
					@Override
					public void execute(KnowledgeSession session) {
						Ledger ledger = (Ledger) getObjectFromData(num, totalCount1, Ledger.class);
						FlowDireAnalysis direAnalysis = (FlowDireAnalysis) getObjectFromData(num,totalCount1, FlowDireAnalysis.class);
						SaleAnalysis saleAnalysis = (SaleAnalysis) getObjectFromData(num,totalCount1, SaleAnalysis.class);
						SendOutAnalysis sendOutAnalysis = (SendOutAnalysis) getObjectFromData(num,totalCount1, SendOutAnalysis.class);
						session.insert(ledger);
						session.insert(direAnalysis);
						session.insert(saleAnalysis);
						session.insert(sendOutAnalysis);
						session.startProcess(CALCRESULTFLOW, params);
					}
            	});
            	if(i == (totalCount-1)){
            		System.out.println("准备执行次数："+totalCount);
            	}
            }
            batchSession.waitForCompletion();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}
	private Object getObjectFromData(int i,int totalCount, Class<?> clazz) {
		String dataLedger1 = "{\"id\":\"905\",\"office\":\"北京\",\"moreSendoutFlag\":\"是\",\"highMonth\":\"4\",\"customerNo\":\"100000\",\"customerName\":\"四季春\",\"productNo\":\"10001000113\",\"productName\":\"氨酚黄那敏颗粒  100袋/盒*1100盒\",\"saleAnalysis\":null,\"flowDireAnalysis\":null,\"sendOutAnalysis\":null,\"salesTheory\":null,\"hasOverplusJanToNov\":null,\"hasOverplusDec\":null,\"hasOverplusCurMonth\":null,\"inventoryOpening1\":4812.0,\"inventoryOpening2\":298.0,\"inventoryFinal\":7836.0,\"calcLevel1\":null,\"calcLevel2\":null,\"moreLevel1\":null,\"moreLevel2\":null,\"calcResult1\":null,\"calcResult2\":null,\"calcSaleJanToNov1\":5604.489357,\"calcSaleJanToNov2\":8195.510643}";
		String dataFlowDireAnalysis1 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"氨酚黄那敏颗粒  100袋/盒*1100盒\",\"flowDireList\":null,\"highMonth\":null,\"totalOfOverJanToNov1\":34772.0,\"totalOfOverJanToNov2\":30310.0,\"totalOfOverJanToDec1\":40670.0,\"totalOfOverJanToDec2\":35019.0,\"flowDireJan1\":2345.0,\"flowDireJan2\":4231.0,\"flowDireFeb1\":2606.0,\"flowDireFeb2\":2473.0,\"flowDireMar1\":2623.0,\"flowDireMar2\":2220.0,\"flowDireApr1\":1363.0,\"flowDireApr2\":1092.0,\"flowDireMay1\":1784.0,\"flowDireMay2\":1473.0,\"flowDireJun1\":1145.0,\"flowDireJun2\":1844.0,\"flowDireJul1\":900.0,\"flowDireJul2\":2000.0,\"flowDireAug1\":1303.0,\"flowDireAug2\":2125.0,\"flowDireSep1\":4988.0,\"flowDireSep2\":3553.0,\"flowDireOct1\":0.0,\"flowDireOct2\":0.0,\"flowDireNov1\":9817.0,\"flowDireNov2\":4590.0,\"flowDireDec1\":5898.0,\"flowDireDec2\":4709.0,\"flowDireTotal1\":null,\"flowDireTotal2\":null}";
		String dataSaleAnalysis1 = "{\"sales\":null,\"saleJan1\":0.0,\"saleJan2\":0.0,\"saleFeb1\":0.0,\"saleFeb2\":0.0,\"saleMar1\":0.0,\"saleMar2\":0.0,\"saleApr1\":1072.0,\"saleApr2\":948.0,\"saleMay1\":1571.0,\"saleMay2\":1552.0,\"saleJun1\":1400.0,\"saleJun2\":1626.5549999999998,\"saleJul1\":1061.0,\"saleJul2\":1568.4450000000002,\"saleAug1\":1199.0,\"saleAug2\":1993.0,\"saleSep1\":2303.0,\"saleSep2\":3438.0,\"saleOct1\":1522.0,\"saleOct2\":3469.0,\"saleNov1\":2969.0,\"saleNov2\":4044.9990000000003,\"saleDec1\":2318.0,\"saleDec2\":3885.6279999999997,\"saleTotal1\":15415.0,\"saleTotal2\":22525.627}";
		String dataSendOutAnalysis1 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"氨酚黄那敏颗粒  100袋/盒*1100盒\",\"sendOutList\":null,\"sendOutJan\":0.0,\"sendOutFeb\":0.0,\"sendOutMar\":0.0,\"sendOutApr\":2400.0,\"sendOutMay\":3000.0,\"sendOutJun\":3600.0,\"sendOutJul\":0.0,\"sendOutAug\":4800.0,\"sendOutSep\":0.0,\"sendOutOct\":0.0,\"sendOutNov\":0.0,\"sendOutDec\":0.0,\"sendOutTotal\":13800.0}";

		String dataLedger2 = "{\"id\":\"906\",\"office\":\"北京\",\"moreSendoutFlag\":\"否\",\"highMonth\":\"2\",\"customerNo\":\"100000\",\"customerName\":\"四季春\",\"productNo\":\"10001000306\",\"productName\":\"氨酚那敏颗粒 100袋/盒*1100盒\",\"saleAnalysis\":null,\"flowDireAnalysis\":null,\"sendOutAnalysis\":null,\"salesTheory\":36695.0,\"hasOverplusJanToNov\":\"是\",\"hasOverplusDec\":\"是\",\"hasOverplusCurMonth\":\"否\",\"inventoryOpening1\":0.0,\"inventoryOpening2\":1695.0,\"inventoryFinal\":4000.0,\"calcLevel1\":3460.0,\"calcLevel2\":2727.999,\"moreLevel1\":0.0,\"moreLevel2\":0.0,\"calcResult1\":3460.0,\"calcResult2\":2727.999,\"calcSaleJanToNov1\":19719.0,\"calcSaleJanToNov2\":10363.005}";
		String dataFlowDireAnalysis2 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"氨酚那敏颗粒 100袋/盒*1100盒\",\"flowDireList\":null,\"highMonth\":null,\"totalOfOverJanToNov1\":29483.0,\"totalOfOverJanToNov2\":18510.0,\"totalOfOverJanToDec1\":37503.0,\"totalOfOverJanToDec2\":21389.0,\"flowDireJan1\":4740.0,\"flowDireJan2\":4505.0,\"flowDireFeb1\":376.0,\"flowDireFeb2\":2827.0,\"flowDireMar1\":1756.0,\"flowDireMar2\":1934.0,\"flowDireApr1\":2039.0,\"flowDireApr2\":755.0,\"flowDireMay1\":1976.0,\"flowDireMay2\":903.0,\"flowDireJun1\":928.0,\"flowDireJun2\":738.0,\"flowDireJul1\":518.0,\"flowDireJul2\":489.0,\"flowDireAug1\":1565.0,\"flowDireAug2\":738.0,\"flowDireSep1\":3707.0,\"flowDireSep2\":1061.0,\"flowDireOct1\":0.0,\"flowDireOct2\":0.0,\"flowDireNov1\":3858.0,\"flowDireNov2\":1681.0,\"flowDireDec1\":8020.0,\"flowDireDec2\":2879.0,\"flowDireTotal1\":null,\"flowDireTotal2\":null}";
		String dataSaleAnalysis2 = "{\"sales\":null,\"saleJan1\":0.0,\"saleJan2\":0.0,\"saleFeb1\":1660.0,\"saleFeb2\":2637.0,\"saleMar1\":896.0,\"saleMar2\":2538.0,\"saleApr1\":1029.0,\"saleApr2\":425.0,\"saleMay1\":1136.0,\"saleMay2\":870.0,\"saleJun1\":719.0,\"saleJun2\":495.0,\"saleJul1\":438.0,\"saleJul2\":481.0,\"saleAug1\":1445.0,\"saleAug2\":661.0,\"saleSep1\":7956.0,\"saleSep2\":1439.0,\"saleOct1\":1987.0,\"saleOct2\":979.002,\"saleNov1\":2453.0,\"saleNov2\":1253.0030000000002,\"saleDec1\":3460.0,\"saleDec2\":2727.999,\"saleTotal1\":23179.0,\"saleTotal2\":14506.004}";
		String dataSendOutAnalysis2 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"氨酚那敏颗粒 100袋/盒*1100盒\",\"sendOutList\":null,\"sendOutJan\":0.0,\"sendOutFeb\":6000.0,\"sendOutMar\":3600.0,\"sendOutApr\":3600.0,\"sendOutMay\":2400.0,\"sendOutJun\":1800.0,\"sendOutJul\":0.0,\"sendOutAug\":2400.0,\"sendOutSep\":7200.0,\"sendOutOct\":3600.0,\"sendOutNov\":4800.0,\"sendOutDec\":3600.0,\"sendOutTotal\":39000.0}";
		
		String dataLedger3 = "{\"id\":\"910\",\"office\":\"北京\",\"moreSendoutFlag\":\"否\",\"highMonth\":\"2\",\"customerNo\":\"100000\",\"customerName\":\"四季春\",\"productNo\":\"10002000101\",\"productName\":\"阿司匹林肠溶颗粒 25mg*100颗粒*300瓶\",\"saleAnalysis\":null,\"flowDireAnalysis\":null,\"sendOutAnalysis\":null,\"salesTheory\":9904.0,\"hasOverplusJanToNov\":\"是\",\"hasOverplusDec\":\"是\",\"hasOverplusCurMonth\":\"否\",\"inventoryOpening1\":0.0,\"inventoryOpening2\":0.0,\"inventoryFinal\":5096.0,\"calcLevel1\":1363.996,\"calcLevel2\":0.0,\"moreLevel1\":0.0,\"moreLevel2\":0.0,\"calcResult1\":1363.996,\"calcResult2\":0.0,\"calcSaleJanToNov1\":7620.0,\"calcSaleJanToNov2\":680.0}";
		String dataFlowDireAnalysis3 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"阿司匹林肠溶颗粒 25mg*100颗粒*300瓶\",\"flowDireList\":null,\"highMonth\":null,\"totalOfOverJanToNov1\":9428.0,\"totalOfOverJanToNov2\":640.0,\"totalOfOverJanToDec1\":11444.0,\"totalOfOverJanToDec2\":640.0,\"flowDireJan1\":1024.0,\"flowDireJan2\":0.0,\"flowDireFeb1\":0.0,\"flowDireFeb2\":0.0,\"flowDireMar1\":120.0,\"flowDireMar2\":0.0,\"flowDireApr1\":2796.0,\"flowDireApr2\":10.0,\"flowDireMay1\":472.0,\"flowDireMay2\":130.0,\"flowDireJun1\":344.0,\"flowDireJun2\":100.0,\"flowDireJul1\":1128.0,\"flowDireJul2\":80.0,\"flowDireAug1\":784.0,\"flowDireAug2\":20.0,\"flowDireSep1\":-208.0,\"flowDireSep2\":190.0,\"flowDireOct1\":0.0,\"flowDireOct2\":0.0,\"flowDireNov1\":952.0,\"flowDireNov2\":110.0,\"flowDireDec1\":2016.0,\"flowDireDec2\":0.0,\"flowDireTotal1\":null,\"flowDireTotal2\":null}";
		String dataSaleAnalysis3 = "{\"sales\":null,\"saleJan1\":0.0,\"saleJan2\":0.0,\"saleFeb1\":0.0,\"saleFeb2\":0.0,\"saleMar1\":192.0,\"saleMar2\":0.0,\"saleApr1\":2796.0,\"saleApr2\":10.0,\"saleMay1\":472.0,\"saleMay2\":130.0,\"saleJun1\":336.0,\"saleJun2\":100.0,\"saleJul1\":1120.0,\"saleJul2\":80.0,\"saleAug1\":632.0,\"saleAug2\":20.0,\"saleSep1\":328.0,\"saleSep2\":190.0,\"saleOct1\":872.0,\"saleOct2\":40.0,\"saleNov1\":872.0,\"saleNov2\":110.0,\"saleDec1\":1363.996,\"saleDec2\":0.0,\"saleTotal1\":8983.996,\"saleTotal2\":680.0}";
		String dataSendOutAnalysis3 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"阿司匹林肠溶颗粒 25mg*100颗粒*300瓶\",\"sendOutList\":null,\"sendOutJan\":0.0,\"sendOutFeb\":3000.0,\"sendOutMar\":0.0,\"sendOutApr\":0.0,\"sendOutMay\":9000.0,\"sendOutJun\":0.0,\"sendOutJul\":0.0,\"sendOutAug\":0.0,\"sendOutSep\":0.0,\"sendOutOct\":0.0,\"sendOutNov\":0.0,\"sendOutDec\":3000.0,\"sendOutTotal\":15000.0}";
		
		String dataLedger4 = "{\"id\":\"911\",\"office\":\"北京\",\"moreSendoutFlag\":\"否\",\"highMonth\":\"3\",\"customerNo\":\"100000\",\"customerName\":\"四季春\",\"productNo\":\"10002000301\",\"productName\":\"健阳颗粒 0.34g*12颗粒*1板*1000盒\",\"saleAnalysis\":null,\"flowDireAnalysis\":null,\"sendOutAnalysis\":null,\"salesTheory\":null,\"hasOverplusJanToNov\":null,\"hasOverplusDec\":null,\"hasOverplusCurMonth\":null,\"inventoryOpening1\":0.0,\"inventoryOpening2\":157.0,\"inventoryFinal\":1822.0,\"calcLevel1\":null,\"calcLevel2\":null,\"moreLevel1\":null,\"moreLevel2\":null,\"calcResult1\":null,\"calcResult2\":null,\"calcSaleJanToNov1\":1400.0,\"calcSaleJanToNov2\":351.0}";
		String dataFlowDireAnalysis4 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"健阳颗粒 0.34g*12颗粒*1板*1000盒\",\"flowDireList\":null,\"highMonth\":null,\"totalOfOverJanToNov1\":2926.0,\"totalOfOverJanToNov2\":920.0,\"totalOfOverJanToDec1\":3926.0,\"totalOfOverJanToDec2\":1050.0,\"flowDireJan1\":0.0,\"flowDireJan2\":5.0,\"flowDireFeb1\":0.0,\"flowDireFeb2\":-3.0,\"flowDireMar1\":0.0,\"flowDireMar2\":-5.0,\"flowDireApr1\":45.0,\"flowDireApr2\":162.0,\"flowDireMay1\":41.0,\"flowDireMay2\":0.0,\"flowDireJun1\":264.0,\"flowDireJun2\":0.0,\"flowDireJul1\":131.0,\"flowDireJul2\":0.0,\"flowDireAug1\":495.0,\"flowDireAug2\":0.0,\"flowDireSep1\":502.0,\"flowDireSep2\":351.0,\"flowDireOct1\":0.0,\"flowDireOct2\":0.0,\"flowDireNov1\":448.0,\"flowDireNov2\":280.0,\"flowDireDec1\":1000.0,\"flowDireDec2\":130.0,\"flowDireTotal1\":null,\"flowDireTotal2\":null}";
		String dataSaleAnalysis4 = "{\"sales\":null,\"saleJan1\":0.0,\"saleJan2\":0.0,\"saleFeb1\":0.0,\"saleFeb2\":0.0,\"saleMar1\":0.0,\"saleMar2\":-5.0,\"saleApr1\":45.0,\"saleApr2\":162.0,\"saleMay1\":41.0,\"saleMay2\":0.0,\"saleJun1\":264.0,\"saleJun2\":0.0,\"saleJul1\":128.0,\"saleJul2\":0.0,\"saleAug1\":495.0,\"saleAug2\":0.0,\"saleSep1\":151.0,\"saleSep2\":345.0,\"saleOct1\":108.0,\"saleOct2\":6.0,\"saleNov1\":168.0,\"saleNov2\":0.0,\"saleDec1\":0.0,\"saleDec2\":302.0,\"saleTotal1\":1400.0,\"saleTotal2\":810.0}";
		String dataSendOutAnalysis4 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100000\",\"customerName\":null,\"productNo\":null,\"productName\":\"健阳颗粒 0.34g*12颗粒*1板*1000盒\",\"sendOutList\":null,\"sendOutJan\":0.0,\"sendOutFeb\":0.0,\"sendOutMar\":400.0,\"sendOutApr\":0.0,\"sendOutMay\":0.0,\"sendOutJun\":600.0,\"sendOutJul\":0.0,\"sendOutAug\":600.0,\"sendOutSep\":0.0,\"sendOutOct\":0.0,\"sendOutNov\":1000.0,\"sendOutDec\":1600.0,\"sendOutTotal\":4200.0}";

		String dataLedger5 = "{\"id\":\"974\",\"office\":\"广东\",\"moreSendoutFlag\":null,\"highMonth\":\"12\",\"customerNo\":\"100079\",\"customerName\":\"广州\",\"productNo\":\"10006000800\",\"productName\":\"茵栀黄注射液 10克*5支*1100盒\",\"saleAnalysis\":null,\"flowDireAnalysis\":null,\"sendOutAnalysis\":null,\"salesTheory\":null,\"hasOverplusJanToNov\":null,\"hasOverplusDec\":null,\"hasOverplusCurMonth\":null,\"inventoryOpening1\":291.0,\"inventoryOpening2\":157.0,\"inventoryFinal\":496.0,\"calcLevel1\":null,\"calcLevel2\":null,\"moreLevel1\":null,\"moreLevel2\":null,\"calcResult1\":null,\"calcResult2\":null,\"calcSaleJanToNov1\":0.0,\"calcSaleJanToNov2\":0.0}";
		String dataFlowDireAnalysis5 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100079\",\"customerName\":null,\"productNo\":null,\"productName\":\"茵栀黄注射液 10克*5支*1100盒\",\"flowDireList\":null,\"highMonth\":null,\"totalOfOverJanToNov1\":1837.0,\"totalOfOverJanToNov2\":3582.0,\"totalOfOverJanToDec1\":2235.0,\"totalOfOverJanToDec2\":3647.0,\"flowDireJan1\":0.0,\"flowDireJan2\":23.0,\"flowDireFeb1\":25.0,\"flowDireFeb2\":94.0,\"flowDireMar1\":67.0,\"flowDireMar2\":87.0,\"flowDireApr1\":40.0,\"flowDireApr2\":393.0,\"flowDireMay1\":133.0,\"flowDireMay2\":561.0,\"flowDireJun1\":78.0,\"flowDireJun2\":1214.0,\"flowDireJul1\":154.0,\"flowDireJul2\":606.0,\"flowDireAug1\":112.0,\"flowDireAug2\":403.0,\"flowDireSep1\":807.0,\"flowDireSep2\":61.0,\"flowDireOct1\":0.0,\"flowDireOct2\":0.0,\"flowDireNov1\":23.0,\"flowDireNov2\":75.0,\"flowDireDec1\":398.0,\"flowDireDec2\":65.0,\"flowDireTotal1\":null,\"flowDireTotal2\":null}";
		String dataSaleAnalysis5 = "{\"sales\":null,\"saleJan1\":0.0,\"saleJan2\":0.0,\"saleFeb1\":0.0,\"saleFeb2\":0.0,\"saleMar1\":67.0,\"saleMar2\":87.0,\"saleApr1\":40.0,\"saleApr2\":357.0,\"saleMay1\":133.0,\"saleMay2\":77.999,\"saleJun1\":78.0,\"saleJun2\":1336.001,\"saleJul1\":154.0,\"saleJul2\":906.002,\"saleAug1\":112.0,\"saleAug2\":400.0,\"saleSep1\":195.0,\"saleSep2\":61.0,\"saleOct1\":100.0,\"saleOct2\":168.0,\"saleNov1\":243.0,\"saleNov2\":75.0,\"saleDec1\":108.0,\"saleDec2\":65.0,\"saleTotal1\":1230.0,\"saleTotal2\":3533.002}";
		String dataSendOutAnalysis5 = "{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100079\",\"customerName\":null,\"productNo\":null,\"productName\":\"茵栀黄注射液 10克*5支*1100盒\",\"sendOutList\":null,\"sendOutJan\":0.0,\"sendOutFeb\":0.0,\"sendOutMar\":0.0,\"sendOutApr\":0.0,\"sendOutMay\":0.0,\"sendOutJun\":0.0,\"sendOutJul\":0.0,\"sendOutAug\":0.0,\"sendOutSep\":0.0,\"sendOutOct\":0.0,\"sendOutNov\":0.0,\"sendOutDec\":600.0,\"sendOutTotal\":600.0}";
		/*
		 * 
{\"id\":\"974\",\"office\":\"广东\",\"moreSendoutFlag\":null,\"highMonth\":\"12\",\"customerNo\":\"100079\",\"customerName\":\"广州\",\"productNo\":\"10006000800\",\"productName\":\"茵栀黄注射液 10克*5支*1100盒\",\"saleAnalysis\":null,\"flowDireAnalysis\":null,\"sendOutAnalysis\":null,\"salesTheory\":null,\"hasOverplusJanToNov\":null,\"hasOverplusDec\":null,\"hasOverplusCurMonth\":null,\"inventoryOpening1\":291.0,\"inventoryOpening2\":157.0,\"inventoryFinal\":496.0,\"calcLevel1\":null,\"calcLevel2\":null,\"moreLevel1\":null,\"moreLevel2\":null,\"calcResult1\":null,\"calcResult2\":null,\"calcSaleJanToNov1\":0.0,\"calcSaleJanToNov2\":0.0}
{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100079\",\"customerName\":null,\"productNo\":null,\"productName\":\"茵栀黄注射液 10克*5支*1100盒\",\"flowDireList\":null,\"highMonth\":null,\"totalOfOverJanToNov1\":1837.0,\"totalOfOverJanToNov2\":3582.0,\"totalOfOverJanToDec1\":2235.0,\"totalOfOverJanToDec2\":3647.0,\"flowDireJan1\":0.0,\"flowDireJan2\":23.0,\"flowDireFeb1\":25.0,\"flowDireFeb2\":94.0,\"flowDireMar1\":67.0,\"flowDireMar2\":87.0,\"flowDireApr1\":40.0,\"flowDireApr2\":393.0,\"flowDireMay1\":133.0,\"flowDireMay2\":561.0,\"flowDireJun1\":78.0,\"flowDireJun2\":1214.0,\"flowDireJul1\":154.0,\"flowDireJul2\":606.0,\"flowDireAug1\":112.0,\"flowDireAug2\":403.0,\"flowDireSep1\":807.0,\"flowDireSep2\":61.0,\"flowDireOct1\":0.0,\"flowDireOct2\":0.0,\"flowDireNov1\":23.0,\"flowDireNov2\":75.0,\"flowDireDec1\":398.0,\"flowDireDec2\":65.0,\"flowDireTotal1\":null,\"flowDireTotal2\":null}
{\"sales\":null,\"saleJan1\":0.0,\"saleJan2\":0.0,\"saleFeb1\":0.0,\"saleFeb2\":0.0,\"saleMar1\":67.0,\"saleMar2\":87.0,\"saleApr1\":40.0,\"saleApr2\":357.0,\"saleMay1\":133.0,\"saleMay2\":77.999,\"saleJun1\":78.0,\"saleJun2\":1336.001,\"saleJul1\":154.0,\"saleJul2\":906.002,\"saleAug1\":112.0,\"saleAug2\":400.0,\"saleSep1\":195.0,\"saleSep2\":61.0,\"saleOct1\":100.0,\"saleOct2\":168.0,\"saleNov1\":243.0,\"saleNov2\":75.0,\"saleDec1\":108.0,\"saleDec2\":65.0,\"saleTotal1\":1230.0,\"saleTotal2\":3533.002}
{\"id\":null,\"ledgerId\":null,\"customerNo\":\"100079\",\"customerName\":null,\"productNo\":null,\"productName\":\"茵栀黄注射液 10克*5支*1100盒\",\"sendOutList\":null,\"sendOutJan\":0.0,\"sendOutFeb\":0.0,\"sendOutMar\":0.0,\"sendOutApr\":0.0,\"sendOutMay\":0.0,\"sendOutJun\":0.0,\"sendOutJul\":0.0,\"sendOutAug\":0.0,\"sendOutSep\":0.0,\"sendOutOct\":0.0,\"sendOutNov\":0.0,\"sendOutDec\":600.0,\"sendOutTotal\":600.0}
		 
		 
{"id":"974","office":"广东","moreSendoutFlag":null,"highMonth":"12","customerNo":"100079","customerName":"广州","productNo":"10006000800","productName":"茵栀黄注射液 10克*5支*1100盒","saleAnalysis":null,"flowDireAnalysis":null,"sendOutAnalysis":null,"salesTheory":null,"hasOverplusJanToNov":null,"hasOverplusDec":null,"hasOverplusCurMonth":null,"inventoryOpening1":291.0,"inventoryOpening2":157.0,"inventoryFinal":496.0,"calcLevel1":null,"calcLevel2":null,"moreLevel1":null,"moreLevel2":null,"calcResult1":null,"calcResult2":null,"calcSaleJanToNov1":0.0,"calcSaleJanToNov2":0.0}
{"id":null,"ledgerId":null,"customerNo":"100079","customerName":null,"productNo":null,"productName":"茵栀黄注射液 10克*5支*1100盒","flowDireList":null,"highMonth":null,"totalOfOverJanToNov1":1837.0,"totalOfOverJanToNov2":3582.0,"totalOfOverJanToDec1":2235.0,"totalOfOverJanToDec2":3647.0,"flowDireJan1":0.0,"flowDireJan2":23.0,"flowDireFeb1":25.0,"flowDireFeb2":94.0,"flowDireMar1":67.0,"flowDireMar2":87.0,"flowDireApr1":40.0,"flowDireApr2":393.0,"flowDireMay1":133.0,"flowDireMay2":561.0,"flowDireJun1":78.0,"flowDireJun2":1214.0,"flowDireJul1":154.0,"flowDireJul2":606.0,"flowDireAug1":112.0,"flowDireAug2":403.0,"flowDireSep1":807.0,"flowDireSep2":61.0,"flowDireOct1":0.0,"flowDireOct2":0.0,"flowDireNov1":23.0,"flowDireNov2":75.0,"flowDireDec1":398.0,"flowDireDec2":65.0,"flowDireTotal1":null,"flowDireTotal2":null}
{"sales":null,"saleJan1":0.0,"saleJan2":0.0,"saleFeb1":0.0,"saleFeb2":0.0,"saleMar1":67.0,"saleMar2":87.0,"saleApr1":40.0,"saleApr2":357.0,"saleMay1":133.0,"saleMay2":77.999,"saleJun1":78.0,"saleJun2":1336.001,"saleJul1":154.0,"saleJul2":906.002,"saleAug1":112.0,"saleAug2":400.0,"saleSep1":195.0,"saleSep2":61.0,"saleOct1":100.0,"saleOct2":168.0,"saleNov1":243.0,"saleNov2":75.0,"saleDec1":108.0,"saleDec2":65.0,"saleTotal1":1230.0,"saleTotal2":3533.002}
{"id":null,"ledgerId":null,"customerNo":"100079","customerName":null,"productNo":null,"productName":"茵栀黄注射液 10克*5支*1100盒","sendOutList":null,"sendOutJan":0.0,"sendOutFeb":0.0,"sendOutMar":0.0,"sendOutApr":0.0,"sendOutMay":0.0,"sendOutJun":0.0,"sendOutJul":0.0,"sendOutAug":0.0,"sendOutSep":0.0,"sendOutOct":0.0,"sendOutNov":0.0,"sendOutDec":600.0,"sendOutTotal":600.0}


{"id":"957","office":"广东","moreSendoutFlag":null,"highMonth":"3","customerNo":"100085","customerName":"广东四季春","productNo":"10006000800","productName":"茵栀黄注射液 10克*5支*1100盒","saleAnalysis":null,"flowDireAnalysis":null,"sendOutAnalysis":null,"salesTheory":null,"hasOverplusJanToNov":null,"hasOverplusDec":null,"hasOverplusCurMonth":null,"inventoryOpening1":2.0,"inventoryOpening2":782.0,"inventoryFinal":3600.0,"calcLevel1":null,"calcLevel2":null,"moreLevel1":null,"moreLevel2":null,"calcResult1":null,"calcResult2":null,"calcSaleJanToNov1":1192.085603,"calcSaleJanToNov2":3007.914397}
{"id":null,"ledgerId":null,"customerNo":"100085","customerName":null,"productNo":null,"productName":"茵栀黄注射液 10克*5支*1100盒","flowDireList":null,"highMonth":null,"totalOfOverJanToNov1":5728.0,"totalOfOverJanToNov2":7489.0,"totalOfOverJanToDec1":6061.0,"totalOfOverJanToDec2":8348.0,"flowDireJan1":595.0,"flowDireJan2":236.0,"flowDireFeb1":335.0,"flowDireFeb2":549.0,"flowDireMar1":2.0,"flowDireMar2":213.0,"flowDireApr1":11.0,"flowDireApr2":236.0,"flowDireMay1":150.0,"flowDireMay2":634.0,"flowDireJun1":444.0,"flowDireJun2":425.0,"flowDireJul1":170.0,"flowDireJul2":94.0,"flowDireAug1":345.0,"flowDireAug2":1011.0,"flowDireSep1":1466.0,"flowDireSep2":1023.0,"flowDireOct1":0.0,"flowDireOct2":0.0,"flowDireNov1":1877.0,"flowDireNov2":2209.0,"flowDireDec1":333.0,"flowDireDec2":859.0,"flowDireTotal1":null,"flowDireTotal2":null}
{"sales":null,"saleJan1":0.0,"saleJan2":0.0,"saleFeb1":0.0,"saleFeb2":0.0,"saleMar1":0.0,"saleMar2":194.0,"saleApr1":11.0,"saleApr2":289.0,"saleMay1":150.0,"saleMay2":675.0,"saleJun1":444.0,"saleJun2":350.0,"saleJul1":170.0,"saleJul2":74.0,"saleAug1":335.0,"saleAug2":1011.0,"saleSep1":150.0,"saleSep2":773.0,"saleOct1":80.0,"saleOct2":921.0,"saleNov1":340.0,"saleNov2":1799.0,"saleDec1":123.0,"saleDec2":699.0,"saleTotal1":1803.0,"saleTotal2":6785.0}
{"id":null,"ledgerId":null,"customerNo":"100085","customerName":null,"productNo":null,"productName":"茵栀黄注射液 10克*5支*1100盒","sendOutList":null,"sendOutJan":0.0,"sendOutFeb":0.0,"sendOutMar":3000.0,"sendOutApr":600.0,"sendOutMay":0.0,"sendOutJun":0.0,"sendOutJul":0.0,"sendOutAug":0.0,"sendOutSep":0.0,"sendOutOct":600.0,"sendOutNov":0.0,"sendOutDec":3600.0,"sendOutTotal":7800.0}


{"id":"952","office":"广东","moreSendoutFlag":null,"highMonth":"4","customerNo":"100080","customerName":"四药控股广州","productNo":"10006000800","productName":"茵栀黄注射液 10克*5支*1100盒","saleAnalysis":null,"flowDireAnalysis":null,"sendOutAnalysis":null,"salesTheory":null,"hasOverplusJanToNov":null,"hasOverplusDec":null,"hasOverplusCurMonth":null,"inventoryOpening1":0.0,"inventoryOpening2":0.0,"inventoryFinal":0.0,"calcLevel1":null,"calcLevel2":null,"moreLevel1":null,"moreLevel2":null,"calcResult1":null,"calcResult2":null,"calcSaleJanToNov1":2034.2,"calcSaleJanToNov2":824.0}
{"id":null,"ledgerId":null,"customerNo":"100080","customerName":null,"productNo":null,"productName":"茵栀黄注射液 10克*5支*1100盒","flowDireList":null,"highMonth":null,"totalOfOverJanToNov1":5957.0,"totalOfOverJanToNov2":5637.4,"totalOfOverJanToDec1":5971.0,"totalOfOverJanToDec2":5950.4,"flowDireJan1":120.0,"flowDireJan2":590.0,"flowDireFeb1":150.0,"flowDireFeb2":545.0,"flowDireMar1":-61.0,"flowDireMar2":840.8,"flowDireApr1":640.0,"flowDireApr2":511.0,"flowDireMay1":-2.0,"flowDireMay2":433.6,"flowDireJun1":-6.0,"flowDireJun2":444.0,"flowDireJul1":210.0,"flowDireJul2":871.0,"flowDireAug1":50.0,"flowDireAug2":167.0,"flowDireSep1":4842.0,"flowDireSep2":776.0,"flowDireOct1":0.0,"flowDireOct2":0.0,"flowDireNov1":0.0,"flowDireNov2":146.0,"flowDireDec1":14.0,"flowDireDec2":313.0,"flowDireTotal1":null,"flowDireTotal2":null}
{"sales":null,"saleJan1":0.0,"saleJan2":0.0,"saleFeb1":0.0,"saleFeb2":0.0,"saleMar1":59.0,"saleMar2":420.8,"saleApr1":40.0,"saleApr2":176.0,"saleMay1":-2.0,"saleMay2":402.6,"saleJun1":-6.0,"saleJun2":249.0,"saleJul1":30.0,"saleJul2":831.0,"saleAug1":50.0,"saleAug2":67.0,"saleSep1":90.0,"saleSep2":596.0,"saleOct1":0.0,"saleOct2":75.0,"saleNov1":0.0,"saleNov2":56.0,"saleDec1":14.0,"saleDec2":61.0,"saleTotal1":275.0,"saleTotal2":2934.4}
{"id":null,"ledgerId":null,"customerNo":"100080","customerName":null,"productNo":null,"productName":"茵栀黄注射液 10克*5支*1100盒","sendOutList":null,"sendOutJan":0.0,"sendOutFeb":0.0,"sendOutMar":0.0,"sendOutApr":6000.0,"sendOutMay":0.0,"sendOutJun":0.0,"sendOutJul":0.0,"sendOutAug":0.0,"sendOutSep":0.0,"sendOutOct":0.0,"sendOutNov":0.0,"sendOutDec":0.0,"sendOutTotal":6000.0}
		 
		 * */
		
		String dataLedger = null;
		String dataFlowDireAnalysis = null;
		String dataSaleAnalysis = null;
		String dataSendOutAnalysis = null;
		
		ObjectMapper mapper = new ObjectMapper();
		Object obj = null;
		try {
			int num = totalCount/5;
			if (i < 2*num) {
				dataLedger = dataLedger1;
				dataFlowDireAnalysis = dataFlowDireAnalysis1;
				dataSaleAnalysis = dataSaleAnalysis1;
				dataSendOutAnalysis = dataSendOutAnalysis1;
			} else if (i >= 2*num && i < 4*num) {
				dataLedger = dataLedger2;
				dataFlowDireAnalysis = dataFlowDireAnalysis2;
				dataSaleAnalysis = dataSaleAnalysis2;
				dataSendOutAnalysis = dataSendOutAnalysis2;
			} else if (i >= 4*num && i < 6*num) {
				dataLedger = dataLedger3;
				dataFlowDireAnalysis = dataFlowDireAnalysis3;
				dataSaleAnalysis = dataSaleAnalysis3;
				dataSendOutAnalysis = dataSendOutAnalysis3;
			} else if (i >= 6*num && i < 8*num) {
				dataLedger = dataLedger4;
				dataFlowDireAnalysis = dataFlowDireAnalysis4;
				dataSaleAnalysis = dataSaleAnalysis4;
				dataSendOutAnalysis = dataSendOutAnalysis4;
			} else if (i >= 8*num && i < totalCount) {
					dataLedger = dataLedger4;
					dataFlowDireAnalysis = dataFlowDireAnalysis4;
					dataSaleAnalysis = dataSaleAnalysis4;
					dataSendOutAnalysis = dataSendOutAnalysis4;
			} else {
				dataLedger = dataLedger5;
				dataFlowDireAnalysis = dataFlowDireAnalysis5;
				dataSaleAnalysis = dataSaleAnalysis5;
				dataSendOutAnalysis = dataSendOutAnalysis5;
			}
			if(clazz.getName().equals(Ledger.class.getName())){
				obj = mapper.readValue(dataLedger, clazz);
			} else if(clazz.getName().equals(FlowDireAnalysis.class.getName())){
				obj = mapper.readValue(dataFlowDireAnalysis, clazz);
			} else if(clazz.getName().equals(SaleAnalysis.class.getName())){
				obj = mapper.readValue(dataSaleAnalysis, clazz);
			} else if(clazz.getName().equals(SendOutAnalysis.class.getName())){
				obj = mapper.readValue(dataSendOutAnalysis, clazz);
			}  
		} catch (IOException e) {
			e.printStackTrace();
		}
		return obj;
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> invove(Map<String, Object> params) {
		KnowledgePackage knowledgePackage;
		try {
			knowledgePackage = knowledgeService.getKnowledge(TESTFLOW);
			KnowledgeSession session = KnowledgeSessionFactory.newKnowledgeSession(knowledgePackage);
			// 统计流向基础数据
			Session sessionHiber = this.getSessionFactory().openSession();
			Ledger ledger = null;
			try {
				ledger = initLedger(sessionHiber, params);
				FlowDireAnalysis direAnalysis = initFlowDireAnalysis(sessionHiber, params);
				SaleAnalysis saleAnalysis = initSaleAnalysis(sessionHiber, params);
				SendOutAnalysis sendOutAnalysis = initSendOutAnalysis(sessionHiber, params);
				session.insert(ledger);
				session.insert(direAnalysis);
				session.insert(saleAnalysis);
				session.insert(sendOutAnalysis);
				ObjectMapper mapper = new ObjectMapper();
				String s1 = mapper.writeValueAsString(ledger);
				String s2 = mapper.writeValueAsString(direAnalysis);
				String s3 = mapper.writeValueAsString(saleAnalysis);
				String s4 = mapper.writeValueAsString(sendOutAnalysis);
				System.out.println(s1);
				System.out.println(s2);
				System.out.println(s3);
				System.out.println(s4);
				session.startProcess(CALCRESULTFLOW, params);
			} finally {
				sessionHiber.flush();
				sessionHiber.close();
			}
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

	private Ledger initLedger(Session session, Map<String, Object> params) {
		String ledgerId = (String) params.get("id");
		Ledger ledger = null;// new Ledger();
		ledger = (Ledger) session.get(Ledger.class, ledgerId);
		/*
		 * ledger.setHighMonth("4");//计算高开流向
		 * ledger.setInventoryOpening1(4812);//计算是否消化完
		 * ledger.setInventoryOpening2(298);
		 * ledger.setInventoryFinal(7386);//计算理论售出
		 * ledger.setCalcSaleJanToNov1(5604);//计算本次计算、是否超发货
		 * ledger.setCalcSaleJanToNov2(8196);
		 */
		return ledger;
	}

	private FlowDireAnalysis initFlowDireAnalysis(Session session, Map<String, Object> params) {
		// Object productName = params.get("productName");
		// Object customerNo = params.get("customerNo");
		String sql = "select product_name_ as productName, FIRST_CUSTOMER_NO_ as customerNo, sum(if(CLIENT_PROPERTY_='一级' && month_=1,packet_Number_,0)) as flowDireJan1, sum(if(CLIENT_PROPERTY_='二级'  && month_=1,packet_Number_,0)) as flowDireJan2, sum(if(CLIENT_PROPERTY_='一级' && month_=2,packet_Number_,0)) as flowDireFeb1, sum(if(CLIENT_PROPERTY_='二级'  && month_=2,packet_Number_,0)) as flowDireFeb2, sum(if(CLIENT_PROPERTY_='一级' && month_=3,packet_Number_,0)) as flowDireMar1, sum(if(CLIENT_PROPERTY_='二级'  && month_=3,packet_Number_,0)) as flowDireMar2, sum(if(CLIENT_PROPERTY_='一级' && month_=4,packet_Number_,0)) as flowDireApr1, sum(if(CLIENT_PROPERTY_='二级'  && month_=4,packet_Number_,0)) as flowDireApr2, sum(if(CLIENT_PROPERTY_='一级' && month_=5,packet_Number_,0)) as flowDireMay1, sum(if(CLIENT_PROPERTY_='二级'  && month_=5,packet_Number_,0)) as flowDireMay2, sum(if(CLIENT_PROPERTY_='一级' && month_=6,packet_Number_,0)) as flowDireJun1, sum(if(CLIENT_PROPERTY_='二级'  && month_=6,packet_Number_,0)) as flowDireJun2, sum(if(CLIENT_PROPERTY_='一级' && month_=7,packet_Number_,0)) as flowDireJul1, sum(if(CLIENT_PROPERTY_='二级'  && month_=7,packet_Number_,0)) as flowDireJul2, sum(if(CLIENT_PROPERTY_='一级' && month_=8,packet_Number_,0)) as flowDireAug1, sum(if(CLIENT_PROPERTY_='二级'  && month_=8,packet_Number_,0)) as flowDireAug2, sum(if(CLIENT_PROPERTY_='一级' && month_=9,packet_Number_,0)) as flowDireSep1, sum(if(CLIENT_PROPERTY_='二级'  && month_=9,packet_Number_,0)) as flowDireSep2, sum(if(CLIENT_PROPERTY_='一级' && month_=10,packet_Number_,0)) as flowDireOct1, sum(if(CLIENT_PROPERTY_='二级'  && month_=10,packet_Number_,0)) as flowDireOct2, sum(if(CLIENT_PROPERTY_='一级' && month_=11,packet_Number_,0)) as flowDireNov1, sum(if(CLIENT_PROPERTY_='二级'  && month_=11,packet_Number_,0)) as flowDireNov2, sum(if(CLIENT_PROPERTY_='一级' && month_=12,packet_Number_,0)) as flowDireDec1, sum(if(CLIENT_PROPERTY_='二级'  && month_=12,packet_Number_,0)) as flowDireDec2 from poc_flowdire where product_name_=:productName and FIRST_CUSTOMER_NO_=:customerNo";
		sql += " group by product_name_,FIRST_CUSTOMER_NO_";
		FlowDireAnalysis flowDireAnalysis = (FlowDireAnalysis) sqlQueryObject(session, params, sql,
				FlowDireAnalysis.class);
		flowDireAnalysis.setTotalOfOverJanToNov1(flowDireAnalysis.getFlowDireJan1()+flowDireAnalysis.getFlowDireFeb1());
		flowDireAnalysis.setTotalOfOverJanToNov1(flowDireAnalysis.getTotalOfOverJanToNov1()+flowDireAnalysis.getFlowDireMar1()+flowDireAnalysis.getFlowDireApr1());
		flowDireAnalysis.setTotalOfOverJanToNov1(flowDireAnalysis.getTotalOfOverJanToNov1()+flowDireAnalysis.getFlowDireMay1()+flowDireAnalysis.getFlowDireJun1());
		flowDireAnalysis.setTotalOfOverJanToNov1(flowDireAnalysis.getTotalOfOverJanToNov1()+flowDireAnalysis.getFlowDireJul1()+flowDireAnalysis.getFlowDireAug1());
		flowDireAnalysis.setTotalOfOverJanToNov1(flowDireAnalysis.getTotalOfOverJanToNov1()+flowDireAnalysis.getFlowDireSep1()+flowDireAnalysis.getFlowDireOct1());
		flowDireAnalysis.setTotalOfOverJanToNov1(flowDireAnalysis.getTotalOfOverJanToNov1()+flowDireAnalysis.getFlowDireNov1()+flowDireAnalysis.getFlowDireDec1());
		
		flowDireAnalysis.setTotalOfOverJanToNov2(flowDireAnalysis.getFlowDireJan2()+flowDireAnalysis.getFlowDireFeb2());
		flowDireAnalysis.setTotalOfOverJanToNov2(flowDireAnalysis.getTotalOfOverJanToNov2()+flowDireAnalysis.getFlowDireMar2()+flowDireAnalysis.getFlowDireApr2());
		flowDireAnalysis.setTotalOfOverJanToNov2(flowDireAnalysis.getTotalOfOverJanToNov2()+flowDireAnalysis.getFlowDireMay2()+flowDireAnalysis.getFlowDireJun2());
		flowDireAnalysis.setTotalOfOverJanToNov2(flowDireAnalysis.getTotalOfOverJanToNov2()+flowDireAnalysis.getFlowDireJul2()+flowDireAnalysis.getFlowDireAug2());
		flowDireAnalysis.setTotalOfOverJanToNov2(flowDireAnalysis.getTotalOfOverJanToNov2()+flowDireAnalysis.getFlowDireSep2()+flowDireAnalysis.getFlowDireOct2());
		flowDireAnalysis.setTotalOfOverJanToNov2(flowDireAnalysis.getTotalOfOverJanToNov2()+flowDireAnalysis.getFlowDireNov2()+flowDireAnalysis.getFlowDireDec2());
		
		flowDireAnalysis.setTotalOfOverJanToDec1(flowDireAnalysis.getTotalOfOverJanToNov1()+flowDireAnalysis.getFlowDireDec1());
		flowDireAnalysis.setTotalOfOverJanToDec2(flowDireAnalysis.getTotalOfOverJanToNov2()+flowDireAnalysis.getFlowDireDec2());
		// 计算是否消化完
		return flowDireAnalysis;
	}

	private SaleAnalysis initSaleAnalysis(Session session, Map<String, Object> params) {
		String sql = "select product_name_ as productName, FIRST_CUSTOMER_NO_ as customerNo, sum(if(CLIENT_PROPERTY_='一级' && month_=1,packet_Number_,0)) as saleJan1, sum(if(CLIENT_PROPERTY_='二级'  && month_=1,packet_Number_,0)) as saleJan2, sum(if(CLIENT_PROPERTY_='一级' && month_=2,packet_Number_,0)) as saleFeb1, sum(if(CLIENT_PROPERTY_='二级'  && month_=2,packet_Number_,0)) as saleFeb2, sum(if(CLIENT_PROPERTY_='一级' && month_=3,packet_Number_,0)) as saleMar1, sum(if(CLIENT_PROPERTY_='二级'  && month_=3,packet_Number_,0)) as saleMar2, sum(if(CLIENT_PROPERTY_='一级' && month_=4,packet_Number_,0)) as saleApr1, sum(if(CLIENT_PROPERTY_='二级'  && month_=4,packet_Number_,0)) as saleApr2, sum(if(CLIENT_PROPERTY_='一级' && month_=5,packet_Number_,0)) as saleMay1, sum(if(CLIENT_PROPERTY_='二级'  && month_=5,packet_Number_,0)) as saleMay2, sum(if(CLIENT_PROPERTY_='一级' && month_=6,packet_Number_,0)) as saleJun1, sum(if(CLIENT_PROPERTY_='二级'  && month_=6,packet_Number_,0)) as saleJun2, sum(if(CLIENT_PROPERTY_='一级' && month_=7,packet_Number_,0)) as saleJul1, sum(if(CLIENT_PROPERTY_='二级'  && month_=7,packet_Number_,0)) as saleJul2, sum(if(CLIENT_PROPERTY_='一级' && month_=8,packet_Number_,0)) as saleAug1, sum(if(CLIENT_PROPERTY_='二级'  && month_=8,packet_Number_,0)) as saleAug2, sum(if(CLIENT_PROPERTY_='一级' && month_=9,packet_Number_,0)) as saleSep1, sum(if(CLIENT_PROPERTY_='二级'  && month_=9,packet_Number_,0)) as saleSep2, sum(if(CLIENT_PROPERTY_='一级' && month_=10,packet_Number_,0)) as saleOct1, sum(if(CLIENT_PROPERTY_='二级'  && month_=10,packet_Number_,0)) as saleOct2, sum(if(CLIENT_PROPERTY_='一级' && month_=11,packet_Number_,0)) as saleNov1, sum(if(CLIENT_PROPERTY_='二级'  && month_=11,packet_Number_,0)) as saleNov2, sum(if(CLIENT_PROPERTY_='一级' && month_=12,packet_Number_,0)) as saleDec1, sum(if(CLIENT_PROPERTY_='二级'  && month_=12,packet_Number_,0)) as saleDec2 from POC_SALES where product_name_=:productName and FIRST_CUSTOMER_NO_=:customerNo";
		sql += " group by product_name_,FIRST_CUSTOMER_NO_";
		SaleAnalysis saleAnalysis = (SaleAnalysis) sqlQueryObject(session, params, sql,
				SaleAnalysis.class);
		saleAnalysis.setSaleTotal1(saleAnalysis.getSaleJan1()+saleAnalysis.getSaleFeb1());
		saleAnalysis.setSaleTotal1(saleAnalysis.getSaleTotal1()+saleAnalysis.getSaleMar1()+saleAnalysis.getSaleApr1());
		saleAnalysis.setSaleTotal1(saleAnalysis.getSaleTotal1()+saleAnalysis.getSaleMay1()+saleAnalysis.getSaleJun1());
		saleAnalysis.setSaleTotal1(saleAnalysis.getSaleTotal1()+saleAnalysis.getSaleJul1()+saleAnalysis.getSaleAug1());
		saleAnalysis.setSaleTotal1(saleAnalysis.getSaleTotal1()+saleAnalysis.getSaleSep1()+saleAnalysis.getSaleOct1());
		saleAnalysis.setSaleTotal1(saleAnalysis.getSaleTotal1()+saleAnalysis.getSaleNov1()+saleAnalysis.getSaleDec1());
		
		saleAnalysis.setSaleTotal2(saleAnalysis.getSaleJan2()+saleAnalysis.getSaleFeb2());
		saleAnalysis.setSaleTotal2(saleAnalysis.getSaleTotal2()+saleAnalysis.getSaleMar2()+saleAnalysis.getSaleApr2());
		saleAnalysis.setSaleTotal2(saleAnalysis.getSaleTotal2()+saleAnalysis.getSaleMay2()+saleAnalysis.getSaleJun2());
		saleAnalysis.setSaleTotal2(saleAnalysis.getSaleTotal2()+saleAnalysis.getSaleJul2()+saleAnalysis.getSaleAug2());
		saleAnalysis.setSaleTotal2(saleAnalysis.getSaleTotal2()+saleAnalysis.getSaleSep2()+saleAnalysis.getSaleOct2());
		saleAnalysis.setSaleTotal2(saleAnalysis.getSaleTotal2()+saleAnalysis.getSaleNov2()+saleAnalysis.getSaleDec2());
		return saleAnalysis;
	}

	private SendOutAnalysis initSendOutAnalysis(Session session, Map<String, Object> params) {
		String sql = "select product_name_ as productName, CUSTOMER_NO_ as customerNo, sum(if(right(date_,2)='01',packet_Number_,0)) as sendOutJan, sum(if(right(date_,2)='02',packet_Number_,0)) as sendOutFeb, sum(if(right(date_,2)='03',packet_Number_,0)) as sendOutMar, sum(if(right(date_,2)='04',packet_Number_,0)) as sendOutApr, sum(if(right(date_,2)='05',packet_Number_,0)) as sendOutMay, sum(if(right(date_,2)='06',packet_Number_,0)) as sendOutJun, sum(if(right(date_,2)='07',packet_Number_,0)) as sendOutJul, sum(if(right(date_,2)='08',packet_Number_,0)) as sendOutAug, sum(if(right(date_,2)='09',packet_Number_,0)) as sendOutSep, sum(if(right(date_,2)='10',packet_Number_,0)) as sendOutOct, sum(if(right(date_,2)='11',packet_Number_,0)) as sendOutNov, sum(if(right(date_,2)='12',packet_Number_,0)) as sendOutDec from POC_SEND_OUT where HIGH_='是' and product_name_=:productName and CUSTOMER_NO_=:customerNo";
		sql += " group by product_name_, CUSTOMER_NO_";
		SendOutAnalysis sendOutAnalysis = (SendOutAnalysis) sqlQueryObject(session, params, sql,
				SendOutAnalysis.class);
		sendOutAnalysis.setSendOutTotal(sendOutAnalysis.getSendOutJan()+sendOutAnalysis.getSendOutFeb()+sendOutAnalysis.getSendOutMar());
		sendOutAnalysis.setSendOutTotal(sendOutAnalysis.getSendOutTotal()+sendOutAnalysis.getSendOutApr()+sendOutAnalysis.getSendOutMay());
		sendOutAnalysis.setSendOutTotal(sendOutAnalysis.getSendOutTotal()+sendOutAnalysis.getSendOutJun()+sendOutAnalysis.getSendOutJul());
		sendOutAnalysis.setSendOutTotal(sendOutAnalysis.getSendOutTotal()+sendOutAnalysis.getSendOutAug()+sendOutAnalysis.getSendOutSep());
		sendOutAnalysis.setSendOutTotal(sendOutAnalysis.getSendOutTotal()+sendOutAnalysis.getSendOutOct()+sendOutAnalysis.getSendOutNov());
		sendOutAnalysis.setSendOutTotal(sendOutAnalysis.getSendOutTotal()+sendOutAnalysis.getSendOutDec());
    	return sendOutAnalysis;
	}

	private Object sqlQueryObject(Session session, Map<String, Object> params, String sql, Class<?> clazz) {
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		Object productName = params.get("productName");
		Object customerNo = params.get("customerNo");
		sqlQuery.setParameter("productName", productName);
		sqlQuery.setParameter("customerNo", customerNo);
		sqlQuery.setResultTransformer(Transformers.aliasToBean(clazz));
		return sqlQuery.uniqueResult();
		
	}

	public static void main(String[] args) {
	}

	public void invoveRuleHighFlow(Map<String, Object> params) {
	}

	public void invoveRuleHasOverplus(Map<String, Object> params) {
		KnowledgePackage knowledgePackage;
		try {
			knowledgePackage = knowledgeService.getKnowledge("poc/testHasOverplusFlow");
			KnowledgeSession session = KnowledgeSessionFactory.newKnowledgeSession(knowledgePackage);
			// 统计流向基础数据
			Session sessionHiber = this.getSessionFactory().openSession();
			Ledger ledger = null;
			try {
				ledger = initLedger(sessionHiber, params);

				FlowDireAnalysis direAnalysis = initFlowDireAnalysis(sessionHiber, params);
				SaleAnalysis saleAnalysis = initSaleAnalysis(sessionHiber, params);
				SendOutAnalysis sendOutAnalysis = initSendOutAnalysis(sessionHiber, params);
				session.insert(ledger);
				session.insert(direAnalysis);
				session.insert(saleAnalysis);
				session.insert(sendOutAnalysis);
				session.startProcess("hasOverplusFlow", params);
			} finally {
				sessionHiber.flush();
				sessionHiber.close();
			}
			System.out.println(ledger.getCalcResult1());
			System.out.println(ledger.getCalcResult2());
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public void invoveRuleTheroySale(Map<String, Object> params) {
		KnowledgePackage knowledgePackage;
		try {
			knowledgePackage = knowledgeService.getKnowledge("poc/testTheroy");
			KnowledgeSession session = KnowledgeSessionFactory.newKnowledgeSession(knowledgePackage);
			// 统计流向基础数据
			Session sessionHiber = this.getSessionFactory().openSession();
			Ledger ledger = null;
			try {
				ledger = initLedger(sessionHiber, params);

				FlowDireAnalysis direAnalysis = initFlowDireAnalysis(sessionHiber, params);
				SaleAnalysis saleAnalysis = initSaleAnalysis(sessionHiber, params);
				SendOutAnalysis sendOutAnalysis = initSendOutAnalysis(sessionHiber, params);
				session.insert(ledger);
				session.insert(direAnalysis);
				session.insert(saleAnalysis);
				session.insert(sendOutAnalysis);
				session.startProcess("calcTheroySaleFlow", params);
			} finally {
				sessionHiber.flush();
				sessionHiber.close();
			}
			System.out.println(ledger.getCalcResult1());
			System.out.println(ledger.getCalcResult2());
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	public void invoveRuleCalcLevel(Map<String, Object> params) {
		// TODO Auto-generated method stub
		
	}

	public void invoveRuleCalcResultLevel(Map<String, Object> params) {
		// TODO Auto-generated method stub
		
	}
}
