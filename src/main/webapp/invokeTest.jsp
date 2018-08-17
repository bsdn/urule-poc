<%@page import="test.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="com.bstek.bdf2.core.context.ContextHolder"%>
<%@page import="com.shineway.urule.service.RuleInvokeService"%>
<%@page import="com.bstek.dorado.core.Configure"%>
<%@page import="com.bstek.urule.runtime.service.KnowledgeService"%>
<%@page import="com.bstek.urule.runtime.KnowledgePackage"%>
<%@page import="com.bstek.urule.runtime.KnowledgeSession"%>
<%@page import="com.bstek.urule.runtime.KnowledgeSessionFactory"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>urule call test</title>
</head>
<body>
	<%
		KnowledgeService knowledgeService = ContextHolder.getBean(KnowledgeService.BEAN_ID);
		KnowledgePackage klp = null;
		try {
			klp = knowledgeService.getKnowledge("urule-test/test1");
			KnowledgeSession ses = KnowledgeSessionFactory.newKnowledgeSession(klp);
			List<Order> list = new ArrayList<Order>();
			Order o1 = new Order();
			o1.setName("o1");
			o1.setPrice(1.1);
			Order o2 = new Order();
			o2.setName("o2");
			o2.setPrice(1.2);
			list.add(o1);
			list.add(o2);
			Mainobj mainobj = new Mainobj();
			mainobj.setName("name1");
			mainobj.setOrders(list);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("orders", list);
			params.put("name", "sss");
            ses.insert(mainobj);
			ses.fireRules();
			out.println("obj测试<br/>");
			ses.insert(params);
			ses.fireRules();
			out.println("map测试<br/>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>