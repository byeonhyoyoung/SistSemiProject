<%@page import="data.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String q_num=request.getParameter("q_num");
	String currentPage=request.getParameter("currentPage");
	QuestionDao dao=new QuestionDao();
	dao.deleteQusetion(q_num);
	response.sendRedirect("../index.jsp?main=question/questionList.jsp?currentPage="+currentPage);
%>