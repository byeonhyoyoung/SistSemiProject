<%@page import="data.dto.SemiMemberDto"%>
<%@page import="data.dao.SemiMemberDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dongle&family=Gowun+Dodum&family=Nanum+Pen+Script&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>



</head>
<%
//프로젝트 경로 : 이것이 사실상 메인 화면이다.
String root = request.getContextPath();

//addaction.jsp로부터 id를 받아야 써먹을 수 있다.
String id = request.getParameter("id");

SemiMemberDao dao = new SemiMemberDao();
SemiMemberDto dto = dao.getMemberById(id);
String name = dto.getName(); // 수정된 부분
	
%>

<body>
	<div class="container mt-5">
		<div>
			<div align="center">
				<img src="member/member_image/gaipsuccess_1.PNG" alt=""
					width="400px">

				<h5><%=id %>(<%=name %>)님, 회원가입에 성공했습니다.
				</h5>
				<br>
				<button type="button" class="btn btn-warning"
					onclick="location.href='index.jsp?main=login/loginForm3.jsp'" style="background: pink; border-color: pink;">로그인</button>
				<button type="button" class="btn btn-success" 
					onclick="location.href='index.jsp'" >메인</button>
			</div>
		</div>
	</div>


</body>
</html>