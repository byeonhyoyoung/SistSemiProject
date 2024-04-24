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

*{
   font-family: 'Noto Sans KR';
 }

#logo{
   border: 0px solid black;
   float: left;
}

#primary_nav_wrap
{
   margin-top: -100px;
   text-align: center; /* 가운데 정렬을 위한 설정 */ 
   border: 0px solid black;
   width: 1000px;
   margin: 0 auto;
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
<a href="<%=root%>" style="color: black;">
	<img src="<%=root%>/image/semi/logo4.png" style="width: 200px; margin-left: 50px; margin-top: 20px; " id="logo">
</a>

<nav id="primary_nav_wrap" style="margin-top: 15px;">
<ul>
  <li><a href="index.jsp?main=intro/intromain.jsp" style="font-size:12pt;">About Kyoto</a></li>
   <li><a href="index.jsp?main=kyotomap/kyotoMap.jsp" style="font-size:12pt;">Cherry Blossom Calendar</a></li>
  <li><a href="index.jsp?main=tour/tourmain.jsp" style="font-size:12pt;">Tour</a></li>
  <li><a href="index.jsp?main=hotel/hotelmain.jsp" style="font-size:12pt;">Accommodation</a></li>
  <li><a href="#" style="font-size:12pt;">Food</a>
     <ul>
        <li><a href="index.jsp?main=food/foodmain.jsp" style="font-size:12pt;">Restaurant</a></li>
        <li><a href="index.jsp?main=gift/giftmain.jsp" style="font-size:12pt;">Store</a></li>
     </ul>
  </li>
 
 
  <li><a href="#" style="font-size:12pt;">Community</a>
     <ul>  
      <li><a href="index.jsp?main=noti/boardList.jsp" style="font-size:12pt;">Notice</a></li>
      <li><a href="index.jsp?main=review/reviewlist.jsp" style="font-size:12pt;">Review</a></li>
      <li><a href="index.jsp?main=question/questionList.jsp" style="font-size:12pt;">Q&A</a></li>
    </ul>
  </li>
 <!--  <li><a href="#">Contact Us</a></li> -->
</ul>
</nav>
</body>
</html>