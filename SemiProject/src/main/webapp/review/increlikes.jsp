<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num읽기
	String r_num=request.getParameter("r_num");
	ReviewDao dao=new ReviewDao();
	dao.updateLikes(r_num);
	
	int likes=dao.getData(r_num).getR_likes();
	JSONObject ob=new JSONObject();
	ob.put("likes", likes);
%>
<%=ob.toString()%>