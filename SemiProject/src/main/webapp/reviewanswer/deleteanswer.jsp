<%@page import="data.dao.ReviewAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ra_idx=request.getParameter("ra_idx");
	ReviewAnswerDao dao=new ReviewAnswerDao();
	dao.deleteAnswer(ra_idx);
%>