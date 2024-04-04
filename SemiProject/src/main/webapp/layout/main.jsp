<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
	//프로젝트 경로
	String root=request.getContextPath();
%>
<style>
	.img_list{
		width: 100vw;
        height: 100vh;
       
        padding: 0;
        list-style: none;
        overflow: hidden;
        position: relative;
	}
	
	.img_list li {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        display: none;
    }
    
	.img_list img{
		width: 100%;
        height: 100%;
        object-fit: cover;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
    var count = 0;
    var total = $('.img_list li').length;

    // 첫 번째 이미지 표시
    $('.img_list li').eq(count).show();

    setInterval(function() {
        // 현재 이미지 숨기기
        $('.img_list li').eq(count).animate({left: '-100%'}, 'slow');

        // 다음 이미지로 이동
        count = (count + 1) % total;

        // 다음 이미지 보이기
        $('.img_list li').eq(count).css('left', '100%').show().animate({left: '0'}, 'slow');
    }, 5000); // 2초마다 슬라이드 전환
});
</script>
</head>
<body>
<ul class="img_list">
	<li>
		<img src="<%=root %>/image/semi/10.jpg" alt="">
	</li>
	<li>
		<img src="<%=root %>/image/semi/12.jpg" alt="">
	</li>
	<li>
		<img src="<%=root %>/image/semi/11.jpg" alt="">
	</li>
</ul>
</body>
</html>