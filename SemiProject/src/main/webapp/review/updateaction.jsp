<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="data.dao.ReviewDao"/>
<jsp:useBean id="dto" class="data.dto.ReviewDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dao.updateReview(dto);
	String r_num=request.getParameter("r_num");
	String currentPage=request.getParameter("currentPage");
	
	response.sendRedirect("../index.jsp?main=review/contentview.jsp?r_num="+r_num+"&currentPage="+currentPage);
%>
</body>
</html>