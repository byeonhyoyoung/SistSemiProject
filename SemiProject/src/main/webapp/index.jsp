<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>Kyoto Inside</title>
<style type="text/css">

	*{
	font-family: 'Noto Sans KR';
}
	
	div.layout{
		border: 0px solid gray;
	}
	
	div.title{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 30pt;
		text-align: center;
		margin-top: 20px;
	}
	
	div.menu{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 20pt;
		text-align: center;
		margin-top: -60px;
	}
</style>
<link rel="shortcut icon" href="image/semi/logo.ico" type="image/x-icon">
</head>
<%
	//프로젝트 경로
	String mainPge="layout/main.jsp"; //기본페이지
	
	//url을 통해서 main값을 읽어서 메인페이지에 출력한다
	if(request.getParameter("main")!=null){
		
		mainPge=request.getParameter("main");
	}
%>
<body>
<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>
<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPge %>"/>
</div>
<div class="laout intro">
	<jsp:include page="layout/intro.jsp"/>
</div>
</body>
</html>