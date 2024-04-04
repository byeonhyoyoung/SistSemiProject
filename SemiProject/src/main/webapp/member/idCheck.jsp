<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	System.out.println("id "+id);
	SemiMemberDao dao = new SemiMemberDao();
	int count = dao.isIdCheck(id);
	
	JSONObject ob = new JSONObject();
	ob.put("count",count);
	
	
%>

<%=ob.toString()%>


