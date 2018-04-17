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
import com.shineway.urule.model.SendOut;
@Component
public class RuleInvokeService {
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
			session.insert(initFlowDireAnalysis());
			session.insert(params);
			session.startProcess(CALCRESULTFLOW,params);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return params;
	}

	private FlowDireAnalysis initFlowDireAnalysis() {
		FlowDireAnalysis flowDireAnalysis = new FlowDireAnalysis();
		return flowDireAnalysis;
	}

	public static void main(String[] args) {
		File arg1 = new File("aa.xml");
		ClassUtils.classToXml(SendOut.class, arg1);
	}
}
