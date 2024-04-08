<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="dao" class="data.dao.ReviewAnswerDao"/>
 <jsp:useBean id="dto" class="data.dto.ReviewAnswerDto"/>
 <jsp:setProperty property="*" name="dto"/>
<%
	dao.insertAnswer(dto);
%>