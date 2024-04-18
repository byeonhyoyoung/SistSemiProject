<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.QuestionDao"/>
<jsp:useBean id="dto" class="data.dto.QuestionDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertQusetion(dto);
	//일단 목록.. 나중에 디테일페이지로 이동
	int q_num=dao.getMaxNum();
	String currentPage=request.getParameter("currentPage");
	
	response.sendRedirect("../index.jsp?main=question/contentView.jsp?q_num="+q_num+"&currentPage="+1);
%>