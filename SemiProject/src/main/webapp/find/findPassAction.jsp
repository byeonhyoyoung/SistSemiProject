<%@page import="data.dao.SemiMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	
	SemiMemberDao dao=new SemiMemberDao();
	String pass=dao.findPass(name, id, email);
	
	request.setAttribute("pass", pass);
	
	String encodedName=java.net.URLEncoder.encode(name, "UTF-8");
	String encodedId=java.net.URLEncoder.encode(id, "UTF-8");
    String encodedEmail=java.net.URLEncoder.encode(email, "UTF-8");

	response.sendRedirect("../index.jsp?main=find/findPassResult.jsp&name="+encodedName+"&id="+encodedId+"&email="+encodedEmail);
%>