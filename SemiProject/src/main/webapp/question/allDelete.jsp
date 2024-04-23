<%@page import="data.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String nums=request.getParameter("nums");
	String currentPage=request.getParameter("currentPage");
	
	String num[]=nums.split(",");

	QuestionDao dao=new QuestionDao();
	
	for(String n:num){
		dao.deleteQusetion(n);
	}
	
	response.sendRedirect("../index.jsp?main=question/questionList.jsp");
%>