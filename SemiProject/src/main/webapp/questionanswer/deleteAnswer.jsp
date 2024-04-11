<%@page import="data.dao.QuestionAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String qa_idx=request.getParameter("qa_idx");
	QuestionAnswerDao dao=new QuestionAnswerDao();
	dao.deleteAnswer(qa_idx);
%>