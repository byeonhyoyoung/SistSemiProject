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
<!--  삭제후 보던페이지의 목록으로 이동-->
<%
  String n_num=request.getParameter("n_num");
  String currentPage=request.getParameter("currentPage");
  
  NotiDao dao=new NotiDao();
  dao.deleteNoti(n_num);
  
  response.sendRedirect("../index.jsp?main=noti/boardList.jsp?currentPage="+currentPage);
%>

</body>
</html>