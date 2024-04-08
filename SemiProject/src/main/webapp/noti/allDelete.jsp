<%@page import="data.dao.NotiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	//nums를 읽기
	String nums=request.getParameter("nums");
	//,로 분리해서 배열선언
	String [] n_num=nums.split(",");
	//배열의 갯수만큼 delete
	NotiDao dao=new NotiDao();
	for(String n:n_num)
	{
		dao.deleteNoti(n); //n갯수만큼 지우기
	}
	
	//목록으로 이동
	response.sendRedirect("../index.jsp?main=noti/boardList.jsp");
%>
</body>
</html>