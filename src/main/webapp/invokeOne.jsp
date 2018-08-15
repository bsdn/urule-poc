<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bstek.bdf2.core.context.ContextHolder"%>
<%@page import="com.shineway.urule.service.RuleInvokeService"%>
<%@page import="com.bstek.dorado.core.Configure"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome</title>
</head>
<body>
<%
	RuleInvokeService invokeService = ContextHolder.getBean("ruleInvokeService");
    Map<String, Object> params = new HashMap<String, Object>();
    invokeService.invoveOne(params);
    String calcResult1 = (String)params.get("calcResult1");
    String calcResult2 = (String)params.get("calcResult2");
	out.println("本次最终计算结果：" + calcResult1 + "," + calcResult2);
%>
</body>
</html>