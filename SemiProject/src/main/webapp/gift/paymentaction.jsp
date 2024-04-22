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
<body>

<%
request.setCharacterEncoding("utf-8");

String num= request.getParameter("num");
%>

<jsp:useBean id="dao" class="data.dao.PaymentDao"/>
<jsp:useBean id="dto" class="data.dto.PaymentDto"/>
<jsp:useBean id="gdao" class="data.dao.GiftDao"/>
<jsp:setProperty property="*" name="dto"/>

<<<<<<< HEAD
<%
 
 dao.insertPayment(dto, num);

 gdao.deleteCartAfterPay(num);

 //일단은 리스트...가입성공페이지로 바꿀예정 : ?id=아이디 이용해서 gaipSuccess.jsp에 id를 보내줘야한다.
 response.sendRedirect("../index.jsp?main=gift/paysuccess.jsp");
 
 
%>

=======

<%
 
 dao.insertPayment(dto, num);

 gdao.deleteCartAfterPay(num);

 //일단은 리스트...가입성공페이지로 바꿀예정 : ?id=아이디 이용해서 gaipSuccess.jsp에 id를 보내줘야한다.
 response.sendRedirect("../index.jsp?main=gift/paysuccess.jsp");
 
 
 
%>
>>>>>>> refs/heads/main

</body>
</html>