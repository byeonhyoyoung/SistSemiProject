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
  request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="data.dao.NotiDao"/>
<jsp:useBean id="dto" class="data.dto.NotiDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
  dao.insertNoti(dto);
  
  //디테일 페이지로..
  int n_num=dao.getMaxNum();
  response.sendRedirect("../index.jsp?main=noti/boardList.jsp?currentPage="+1);
  //새로작성된글 contentview.jsp?num19&currentPage=1 출력
%>
</body>
</html>