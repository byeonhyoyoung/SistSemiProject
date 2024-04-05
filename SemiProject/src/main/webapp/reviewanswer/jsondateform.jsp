<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.ReviewAnswerDto"%>
<%@page import="data.dao.ReviewAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ra_idx=request.getParameter("ra_idx");
	ReviewAnswerDao adao=new ReviewAnswerDao();
	ReviewAnswerDto adto=adao.getAnswerData(ra_idx);
	
	JSONObject ob=new JSONObject();
	ob.put("ra_idx", adto.getRa_idx());
	ob.put("ra_writer", adto.getRa_writer());
	ob.put("ra_content", adto.getRa_content());
%>
<%=ob.toString()%>