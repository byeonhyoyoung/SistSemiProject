<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num읽기
	String q_num=request.getParameter("q_num");
	QuestionDao dao=new QuestionDao();
	dao.updateLikes(q_num);
	
	int likes=dao.getData(q_num).getQ_likes();
	JSONObject ob=new JSONObject();
	ob.put("likes", likes);
%>
<%=ob.toString()%>