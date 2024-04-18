<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
<script type="text/javascript" src="menu/js/jquery.js"></script>
<script type="text/javascript" src="menu/js/function.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#primary_nav_wrap
{
   margin-top: -100px;
   text-align: center; /* 가운데 정렬을 위한 설정 */ 
   
}

#primary_nav_wrap ul
{
   list-style: none;
    margin: 0 auto; /* 좌우 여백을 자동으로 설정하여 가운데 정렬 */
    padding: 0;
}

#primary_nav_wrap ul a
{
   display:block;
   color:#333;
   text-decoration:none;
   font-weight:700;
   font-size:12px;
   line-height:32px;
   padding:0 15px;
   font-family:"HelveticaNeue","Helvetica Neue",Helvetica,Arial,sans-serif;
}

#primary_nav_wrap ul li
{
   display: inline-block; /* 가로로 배치 */
    position: relative;
}

#primary_nav_wrap ul li:hover
{
   background:#f6f6f6;
}

#primary_nav_wrap ul ul
{
   display:none;
   position:absolute;
   background:#fff;
   padding:0;
   z-index: 1000;
}

#primary_nav_wrap ul ul li
{
   float:none;
   width: 100%;
}

#primary_nav_wrap ul ul a
{
   line-height:120%;
   padding:10px 15px;
}

#primary_nav_wrap ul li:hover > ul
{
   display:block;
}

#primary_nav_wrap ul ul ul
{
   top:0;
   left:100%;
}

i.flower{
	color: pink;
}
</style>
</head>
<%
   //프로젝트 경로
   String root=request.getContextPath();
%>
<body>
<nav id="primary_nav_wrap">
<ul>
  <li class="current-menu-item"><a href="#">홈</a></li>
  
  <li><a href="index.jsp?main=kyotomap/kyotoMap.jsp"><i class="bi bi-flower3 flower"></i>벚꽃테마</a>
    <ul>
      <li><a href="">Sub Menu 1</a></li>
      <li><a href="#">Sub Menu 2</a></li>
    </ul>
  </li>
  
  <li><a href="index.jsp?main=intro/intromain.jsp">교토 소개</a></li>
  
  <li><a href="index.jsp?main=tour/tourmain.jsp">교토 관광</a>
    <ul>
      <li><a href="index.jsp?main=tour/tourmain.jsp#tabs-sawon">사원 및 신사</a></li>
      <li><a href="index.jsp?main=tour/tourmain.jsp#tabs-mus">박물관</a></li>
      <li><a href="index.jsp?main=tour/tourmain.jsp#tabs-event">축제</a></li>
    </ul>
  </li>
  <li><a href="index.jsp?main=food/foodmain.jsp">먹거리</a>
  	<ul>
  	   <li><a href="#">음식점</a></li>
	   <li><a href="#">카페</a></li>
  	</ul>
  </li>
  
  <li><a href="index.jsp?main=hotel/hotelmain.jsp">숙박시설</a>
  	<ul>
	   <li><a href="#">호텔</a></li>
	   <li><a href="#">료칸</a></li>
  	</ul>
  </li>
  <li><a href="#">커뮤니티</a>
     <ul>  
      <li><a href="index.jsp?main=noti/boardList.jsp">공지사항</a></li>
      <li><a href="index.jsp?main=review/reviewlist.jsp">후기<br>게시판</a></li>
      <li><a href="index.jsp?main=question/questionList.jsp">Q&A</a></li>
    </ul>
  </li>
 <!--  <li><a href="#">Contact Us</a></li> -->
</ul>
</nav>
</body>
</html>