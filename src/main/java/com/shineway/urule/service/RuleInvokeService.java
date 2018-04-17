package com.shineway.urule.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Component;

import com.bstek.bdf2.core.orm.hibernate.HibernateDao;
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
public class RuleInvokeService extends HibernateDao {
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
			knowledgePackage = knowledgeService.getKnowledge(TESTFLOW);
			KnowledgeSession session = KnowledgeSessionFactory.newKnowledgeSession(knowledgePackage);
			// 统计流向基础数据
			Session sessionHiber = this.getSessionFactory().openSession();
			try {

			} finally {
				sessionHiber.flush();
				sessionHiber.close();
			}
			Ledger ledger = initLedger(sessionHiber, params);
			session.insert(ledger);
			session.insert(initFlowDireAnalysis(sessionHiber, params));
			session.insert(initSaleAnalysis(sessionHiber, params));
			session.insert(initSendOutAnalysis(sessionHiber, params));
			session.startProcess(CALCRESULTFLOW, params);
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
		String ledgerId = (String) params.get("ledgerId");
		Ledger ledger = null;// new Ledger();
		ledger = (Ledger) session.load(Ledger.class, ledgerId);
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
		String sql = "select product_name_ as productName, FIRST_CUSTOMER_NO_ as firstCustomerNo, sum(if(CLIENT_PROPERTY_='一级' && month_=1,packet_Number_,0)) as flowDireJan1, sum(if(CLIENT_PROPERTY_='二级'  && month_=1,packet_Number_,0)) as flowDireJan2, sum(if(CLIENT_PROPERTY_='一级' && month_=2,packet_Number_,0)) as flowDireFeb1, sum(if(CLIENT_PROPERTY_='二级'  && month_=2,packet_Number_,0)) as flowDireFeb2, sum(if(CLIENT_PROPERTY_='一级' && month_=3,packet_Number_,0)) as flowDireMar1, sum(if(CLIENT_PROPERTY_='二级'  && month_=3,packet_Number_,0)) as flowDireMar2, sum(if(CLIENT_PROPERTY_='一级' && month_=4,packet_Number_,0)) as flowDireApr1, sum(if(CLIENT_PROPERTY_='二级'  && month_=4,packet_Number_,0)) as flowDireApr2, sum(if(CLIENT_PROPERTY_='一级' && month_=5,packet_Number_,0)) as flowDireMay1, sum(if(CLIENT_PROPERTY_='二级'  && month_=5,packet_Number_,0)) as flowDireMay2, sum(if(CLIENT_PROPERTY_='一级' && month_=6,packet_Number_,0)) as flowDireJun1, sum(if(CLIENT_PROPERTY_='二级'  && month_=6,packet_Number_,0)) as flowDireJun2, sum(if(CLIENT_PROPERTY_='一级' && month_=7,packet_Number_,0)) as flowDireJul1, sum(if(CLIENT_PROPERTY_='二级'  && month_=7,packet_Number_,0)) as flowDireJul2, sum(if(CLIENT_PROPERTY_='一级' && month_=8,packet_Number_,0)) as flowDireAug1, sum(if(CLIENT_PROPERTY_='二级'  && month_=8,packet_Number_,0)) as flowDireAug2, sum(if(CLIENT_PROPERTY_='一级' && month_=9,packet_Number_,0)) as flowDireSep1, sum(if(CLIENT_PROPERTY_='二级'  && month_=9,packet_Number_,0)) as flowDireSep2, sum(if(CLIENT_PROPERTY_='一级' && month_=10,packet_Number_,0)) as flowDireOct1, sum(if(CLIENT_PROPERTY_='二级'  && month_=10,packet_Number_,0)) as flowDireOct2, sum(if(CLIENT_PROPERTY_='一级' && month_=11,packet_Number_,0)) as flowDireNov1, sum(if(CLIENT_PROPERTY_='二级'  && month_=11,packet_Number_,0)) as flowDireNov2, sum(if(CLIENT_PROPERTY_='一级' && month_=12,packet_Number_,0)) as flowDireDec12, sum(if(CLIENT_PROPERTY_='二级'  && month_=12,packet_Number_,0)) as flowDireDec2 from poc_flowdire where product_name_=:productName and FIRST_CUSTOMER_NO_=:customerNo";
		FlowDireAnalysis flowDireAnalysis = (FlowDireAnalysis) sqlQueryObject(session, params, sql,
				FlowDireAnalysis.class);
		// 计算是否消化完
		// FlowDireAnalysis flowDireAnalysis = new FlowDireAnalysis();
		// flowDireAnalysis.setFlowDireJan1(2345);
		// flowDireAnalysis.setFlowDireJan2(4231);
		// flowDireAnalysis.setFlowDireFeb1(2606);
		// flowDireAnalysis.setFlowDireFeb2(2473);
		// flowDireAnalysis.setFlowDireMar1(2623);
		// flowDireAnalysis.setFlowDireMar2(2220);
		// flowDireAnalysis.setFlowDireApri1(1363);
		// flowDireAnalysis.setFlowDireApri2(1092);
		// flowDireAnalysis.setFlowDireMay1(1784);
		// flowDireAnalysis.setFlowDireMay2(1473);
		// flowDireAnalysis.setFlowDireJun1(1145);
		// flowDireAnalysis.setFlowDireJun2(1844);
		// flowDireAnalysis.setFlowDireJul1(900);
		// flowDireAnalysis.setFlowDireJul2(2000);
		// flowDireAnalysis.setFlowDireAug1(1303);
		// flowDireAnalysis.setFlowDireAug2(2125);
		// flowDireAnalysis.setFlowDireSep1(4988);
		// flowDireAnalysis.setFlowDireSep2(3553);
		// flowDireAnalysis.setFlowDireOct1(0);
		// flowDireAnalysis.setFlowDireOct2(0);
		// flowDireAnalysis.setFlowDireNov1(9817);
		// flowDireAnalysis.setFlowDireNov2(4590);
		// flowDireAnalysis.setFlowDireDec1(5898);
		// flowDireAnalysis.setFlowDireDec2(4709);
		return flowDireAnalysis;
	}

	private SaleAnalysis initSaleAnalysis(Session session, Map<String, Object> params) {
		String sql = "select product_name_ as productName, FIRST_CUSTOMER_NO_ as firstCustomerNo, sum(if(CLIENT_PROPERTY_='一级' && month_=1,packet_Number_,0)) as flowDireJan1, sum(if(CLIENT_PROPERTY_='二级'  && month_=1,packet_Number_,0)) as flowDireJan2, sum(if(CLIENT_PROPERTY_='一级' && month_=2,packet_Number_,0)) as flowDireFeb1, sum(if(CLIENT_PROPERTY_='二级'  && month_=2,packet_Number_,0)) as flowDireFeb2, sum(if(CLIENT_PROPERTY_='一级' && month_=3,packet_Number_,0)) as flowDireMar1, sum(if(CLIENT_PROPERTY_='二级'  && month_=3,packet_Number_,0)) as flowDireMar2, sum(if(CLIENT_PROPERTY_='一级' && month_=4,packet_Number_,0)) as flowDireApr1, sum(if(CLIENT_PROPERTY_='二级'  && month_=4,packet_Number_,0)) as flowDireApr2, sum(if(CLIENT_PROPERTY_='一级' && month_=5,packet_Number_,0)) as flowDireMay1, sum(if(CLIENT_PROPERTY_='二级'  && month_=5,packet_Number_,0)) as flowDireMay2, sum(if(CLIENT_PROPERTY_='一级' && month_=6,packet_Number_,0)) as flowDireJun1, sum(if(CLIENT_PROPERTY_='二级'  && month_=6,packet_Number_,0)) as flowDireJun2, sum(if(CLIENT_PROPERTY_='一级' && month_=7,packet_Number_,0)) as flowDireJul1, sum(if(CLIENT_PROPERTY_='二级'  && month_=7,packet_Number_,0)) as flowDireJul2, sum(if(CLIENT_PROPERTY_='一级' && month_=8,packet_Number_,0)) as flowDireAug1, sum(if(CLIENT_PROPERTY_='二级'  && month_=8,packet_Number_,0)) as flowDireAug2, sum(if(CLIENT_PROPERTY_='一级' && month_=9,packet_Number_,0)) as flowDireSep1, sum(if(CLIENT_PROPERTY_='二级'  && month_=9,packet_Number_,0)) as flowDireSep2, sum(if(CLIENT_PROPERTY_='一级' && month_=10,packet_Number_,0)) as flowDireOct1, sum(if(CLIENT_PROPERTY_='二级'  && month_=10,packet_Number_,0)) as flowDireOct2, sum(if(CLIENT_PROPERTY_='一级' && month_=11,packet_Number_,0)) as flowDireNov1, sum(if(CLIENT_PROPERTY_='二级'  && month_=11,packet_Number_,0)) as flowDireNov2, sum(if(CLIENT_PROPERTY_='一级' && month_=12,packet_Number_,0)) as flowDireDec12, sum(if(CLIENT_PROPERTY_='二级'  && month_=12,packet_Number_,0)) as flowDireDec2 from poc_flowdire where product_name_=:productName and FIRST_CUSTOMER_NO_=:customerNo";
		SaleAnalysis saleAnalysis = (SaleAnalysis) sqlQueryObject(session, params, sql,
				SaleAnalysis.class);
		/*
		 * SaleAnalysis saleAnalysis = new SaleAnalysis();
		 * saleAnalysis.setSaleDec1(2318);//计算本次计算、是否超发货
		 * saleAnalysis.setSaleDec2(3386);
		 * saleAnalysis.setSaleTotal1(15415);//计算扣除超发货
		 * saleAnalysis.setSaleTotal2(22526);
		 */
		return saleAnalysis;
	}

	private SendOutAnalysis initSendOutAnalysis(Session session, Map<String, Object> params) {
		String sql = "select product_name_ as productName, FIRST_CUSTOMER_NO_ as firstCustomerNo, sum(if(CLIENT_PROPERTY_='一级' && month_=1,packet_Number_,0)) as flowDireJan1, sum(if(CLIENT_PROPERTY_='二级'  && month_=1,packet_Number_,0)) as flowDireJan2, sum(if(CLIENT_PROPERTY_='一级' && month_=2,packet_Number_,0)) as flowDireFeb1, sum(if(CLIENT_PROPERTY_='二级'  && month_=2,packet_Number_,0)) as flowDireFeb2, sum(if(CLIENT_PROPERTY_='一级' && month_=3,packet_Number_,0)) as flowDireMar1, sum(if(CLIENT_PROPERTY_='二级'  && month_=3,packet_Number_,0)) as flowDireMar2, sum(if(CLIENT_PROPERTY_='一级' && month_=4,packet_Number_,0)) as flowDireApr1, sum(if(CLIENT_PROPERTY_='二级'  && month_=4,packet_Number_,0)) as flowDireApr2, sum(if(CLIENT_PROPERTY_='一级' && month_=5,packet_Number_,0)) as flowDireMay1, sum(if(CLIENT_PROPERTY_='二级'  && month_=5,packet_Number_,0)) as flowDireMay2, sum(if(CLIENT_PROPERTY_='一级' && month_=6,packet_Number_,0)) as flowDireJun1, sum(if(CLIENT_PROPERTY_='二级'  && month_=6,packet_Number_,0)) as flowDireJun2, sum(if(CLIENT_PROPERTY_='一级' && month_=7,packet_Number_,0)) as flowDireJul1, sum(if(CLIENT_PROPERTY_='二级'  && month_=7,packet_Number_,0)) as flowDireJul2, sum(if(CLIENT_PROPERTY_='一级' && month_=8,packet_Number_,0)) as flowDireAug1, sum(if(CLIENT_PROPERTY_='二级'  && month_=8,packet_Number_,0)) as flowDireAug2, sum(if(CLIENT_PROPERTY_='一级' && month_=9,packet_Number_,0)) as flowDireSep1, sum(if(CLIENT_PROPERTY_='二级'  && month_=9,packet_Number_,0)) as flowDireSep2, sum(if(CLIENT_PROPERTY_='一级' && month_=10,packet_Number_,0)) as flowDireOct1, sum(if(CLIENT_PROPERTY_='二级'  && month_=10,packet_Number_,0)) as flowDireOct2, sum(if(CLIENT_PROPERTY_='一级' && month_=11,packet_Number_,0)) as flowDireNov1, sum(if(CLIENT_PROPERTY_='二级'  && month_=11,packet_Number_,0)) as flowDireNov2, sum(if(CLIENT_PROPERTY_='一级' && month_=12,packet_Number_,0)) as flowDireDec12, sum(if(CLIENT_PROPERTY_='二级'  && month_=12,packet_Number_,0)) as flowDireDec2 from poc_flowdire where product_name_=:productName and FIRST_CUSTOMER_NO_=:customerNo";
		SendOutAnalysis sendOutAnalysis = (SendOutAnalysis) sqlQueryObject(session, params, sql,
				SendOutAnalysis.class);
		/*SendOutAnalysis sendOutAnalysis = new SendOutAnalysis();
		sendOutAnalysis.setSendOutTotal(13800);// 计算是否消化完、计算理论售出\是否超发货
*/		return sendOutAnalysis;
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
		File arg1 = new File("aa.xml");
		ClassUtils.classToXml(SendOut.class, arg1);
	}
}
