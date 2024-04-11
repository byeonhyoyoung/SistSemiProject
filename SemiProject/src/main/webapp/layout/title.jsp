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
div.btnlog {
	position: absolute;
	top: 50px;
	right: 100px;
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
<body>
	<a href="<%=root%>" style="color: black;"><img
		src="<%=root%>/image/semi/logo3.png" style="width: 200px;"></a>
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
		<a href="index.jsp?main=member/mypage.jsp"> <i
			class="bi bi-balloon-heart fs-2" data-bs-container="body"
			data-bs-toggle="popover" data-bs-placement="bottom"
			data-bs-content="마이페이지"></i></a> <a href="login/logoutAction.jsp"><i
			class="bi bi-door-open-fill fs-2" data-bs-container="body"
			data-bs-toggle="popover" data-bs-placement="bottom"
			data-bs-content="로그아웃"></i></a>


		<% 

         if(myid.equals("admin")){%>

		<a href="index.jsp?main=member/memberlist.jsp"><i
			class="bi bi-person-lines-fill fs-2" data-bs-container="body"
			data-bs-toggle="popover" data-bs-placement="bottom"
			data-bs-content="회원목록"></i></a>
		<%  }
    	  
      }else{%>
		 <a href="index.jsp?main=login/loginForm3.jsp"> <i
			class="bi bi-door-open fs-2" data-bs-container="body"
			data-bs-toggle="popover" data-bs-placement="bottom"
			data-bs-content="로그인"></i></a> <a
			href="index.jsp?main=member/addform2.jsp"> <i
			class="bi bi-person-plus fs-2" data-bs-container="body"
			data-bs-toggle="popover" data-bs-placement="bottom"
			data-bs-content="회원가입"></i></a>
		<%}
   %>




	</div>
</body>
</html>
