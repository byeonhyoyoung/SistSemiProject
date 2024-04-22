<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'><link rel="stylesheet" href="menu_design/dist/style.css">

</head>

<%
   //프로젝트 경로
   String root=request.getContextPath();
%>
<body>
<!-- partial:index.partial.html -->
<nav>
  <div class="wrapper">
    <div class="logo"><a href="<%=root%>"><img
		src="<%=root%>/image/semi/logo3.png" style="width: 200px; " id="logo"></a></div>
    <input type="radio" name="slider" id="menu-btn">
    <input type="radio" name="slider" id="close-btn">
    <ul class="nav-links">
      <label for="close-btn" class="btn close-btn"><i class="fas fa-times"></i></label>

      <li><a href="#">교토 소개</a></li>
      <li><a href="#">교토 관광</a></li>
      <li><a href="#">숙박시설</a></li>
      <li><a href="#"><i class="bi bi-flower3 flower"></i>벚꽃캘린더</a></li>
      <li>
        <a href="#" class="desktop-item">먹거리</a>
        <input type="checkbox" id="showDrop">
        <label for="showDrop" class="mobile-item">먹거리</label>
        <ul class="drop-menu">
          <li><a href="#">식당</a></li>
          <li><a href="#">상점</a></li>
        </ul>
      </li>
      
      <li>
        <a href="#" class="desktop-item">커뮤니티</a>
        <input type="checkbox" id="showDrop">
        <label for="showDrop" class="mobile-item">커뮤니티</label>
        <ul class="drop-menu">
          <li><a href="#">공지사항</a></li>
          <li><a href="#">후기<br>게시판</a></a></li>
          <li><a href="#">Q&A</a></li>
        </ul>
      </li>
    
    
    </ul>
    <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
  </div>
</nav>

<!-- partial -->
  
</body>
</html>
