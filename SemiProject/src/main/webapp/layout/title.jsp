<%@page import="data.dao.SemiMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<style type="text/css">

*{
	font-family: 'Noto Sans KR';
}


div.btnlog {
	position: absolute;
	top: 50px;
	right: 100px;
	border: 0px solid gray;
}

i {
	color: gray;
}
</style>

<script type="text/javascript">
  $(document).ready(function(){
    // 팝오버 호버로 변경
    $('.bi').hover(function(){
        $(this).popover('show');
    }, function(){
        $(this).popover('hide');
    });
  });
</script>

</head>
<%
   //프로젝트 경로
   String root=request.getContextPath();
   
%>
<body >
	
	<div class="btnlog">
		<%
      //로그인 세션얻기
      String loginok=(String)session.getAttribute("loginok");
      
      //아이디얻기
      String myid=(String)session.getAttribute("myid");
      
      SemiMemberDao dao=new SemiMemberDao();
      String name=dao.getName(myid);
      
      
      if(loginok!=null){
    	  %>
		<b style="font-size: 10pt; color: gray;"><i
			class="bi bi-person-lock "></i><%=name %>님 로그인상태</b>
		<!--lmy: 로그인한 상태에서 마이페이지로 넘어감! -->
		<a href="index.jsp?main=member/mypage.jsp" style="font-size: 12pt; color: black; font-weight: bold; text-decoration: none;">mypage</a> 
		
		
		<a href="login/logoutAction.jsp" style="font-size: 12pt; color: black;font-weight: bold; text-decoration: none;">logout</a>

      
      <%
	
    	  
      }else{%>
		 <a href="index.jsp?main=login/loginForm3.jsp" style="font-size: 12pt; color: black; font-weight: bold; text-decoration: none;">login</a> 
			
	     <a href="index.jsp?main=member/addform2.jsp" style="font-size: 12pt; color: black; font-weight: bold; text-decoration: none;">join</a>
    <%}
   %>




	</div>
</body>
</html>