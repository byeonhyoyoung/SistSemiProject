<%@page import="data.dao.SemiMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	
	SemiMemberDao dao=new SemiMemberDao();
	String id=dao.findId(name, email);
	
	request.setAttribute("id", id);
	
	String encodedName=java.net.URLEncoder.encode(name, "UTF-8");
    String encodedEmail=java.net.URLEncoder.encode(email, "UTF-8");

	response.sendRedirect("../index.jsp?main=find/findIdResult.jsp&name="+encodedName+"&email="+encodedEmail);
%>