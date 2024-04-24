<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- swiper -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<%
   //프로젝트 경로
   String root=request.getContextPath();
%>
<style type="text/css">
body{
  background-color: white;
}
.swiper {
  width:  98%;
  height:  700px;
}
.swiper-slide img {
  width: 100%; /* 이미지의 너비를 슬라이드의 너비에 맞게 조절 */
  height: 100%; /* 이미지의 높이를 부모 요소인 .swiper-slide의 높이에 맞게 조절 */
  object-fit: cover; /* 이미지가 비율을 유지하면서 슬라이더에 맞춰지도록 설정 */
}
.swiper-button-next {
 /*  background: url(./image/semi/buttonRight.png) no-repeat; */
  background-size: cover;
  width: 50px;
  height: 50px;
}
.swiper-button-prev {
 /*  background: url(./image/semi/buttonLeft.png) no-repeat; */
  background-size: cover;
  width: 50px;
  height: 50px;
}
.swiper-button-next::after,
.swiper-button-prev::after {
  display: none;
}

.swiper-pagination-bullet{
	background-color: white;
}

</style>
</head>
<body>
    <!-- 슬라이더 메인 컨테이너 -->
    <div class="swiper">
      <!-- 필수 래퍼 : swiper-wrapper -->
      <div class="swiper-wrapper">
        <!-- 슬라이드 -->
        <div class="swiper-slide">
        	<a href="index.jsp?main=intro/intromain.jsp"><img src="<%=root %>/image/semi/cover1.jpg"></a>
        </div>
        <div class="swiper-slide">
        	<a href="index.jsp?main=kyotomap/kyotoMap.jsp"><img src="<%=root %>/image/semi/cover2.jpg"></a>
        </div>
        <div class="swiper-slide">
        	<a href="index.jsp?main=tour/tourmain.jsp"><img src="<%=root %>/image/semi/cover3.jpg"></a>
        </div>
        <div class="swiper-slide">
        	<a href="index.jsp?main=hotel/hotelmain.jsp"><img src="<%=root %>/image/semi/cover4.jpg"></a>
        </div>
         <div class="swiper-slide">
        	<a href="index.jsp?main=food/foodmain.jsp"><img src="<%=root %>/image/semi/cover5.jpg"></a>
        </div>
        ...
      </div>
 
      <!-- 아래는 필요시 추가 : 순서대로 페이징, 화살표, 스크롤바-->
      <!-- If we need pagination -->
      <div class="swiper-pagination"></div>
 
      <!-- If we need navigation buttons -->
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
 
      <!-- If we need scrollbar -->
      <div class="swiper-scrollbar"></div>
    </div>
    
<script type="text/javascript">
const swiper = new Swiper('.swiper', {
     direction: 'horizontal',
     loop: true,
     slidesPerView: 'auto',
     centeredSlides: true,
     spaceBetween: 20,
     autoplay: {
        delay: 5000,
        disableOnInteraction: false // 필수
     },
     pagination: {
       el: '.swiper-pagination',
       clickable: true,
     },
     navigation: {
       nextEl: '.swiper-button-next',
       prevEl: '.swiper-button-prev',
     },
     scrollbar: {
       el: '.swiper-scrollbar',
     },
   });
</script>
</body>
</html>