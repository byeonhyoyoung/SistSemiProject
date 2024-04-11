<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.QuestionDao"/>
<jsp:useBean id="dto" class="data.dto.QuestionDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.updateQusetion(dto);
	String q_num=request.getParameter("q_num");
	String currentPage=request.getParameter("currentPage");
	
	response.sendRedirect("../index.jsp?main=question/contentView.jsp?q_num="+q_num+"&currentPage="+currentPage);
%>