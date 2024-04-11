<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.QuestionAnswerDto"%>
<%@page import="data.dao.QuestionAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String qa_idx=request.getParameter("qa_idx");
	QuestionAnswerDao adao=new QuestionAnswerDao();
	QuestionAnswerDto adto=adao.getAnswerData(qa_idx);
	
	JSONObject ob=new JSONObject();
	ob.put("qa_idx", adto.getQa_idx());
	ob.put("qa_writer", adto.getQa_writer());
	ob.put("qa_content", adto.getQa_content());
%>
<%=ob.toString()%>