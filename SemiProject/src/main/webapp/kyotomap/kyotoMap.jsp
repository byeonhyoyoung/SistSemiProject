<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	font-family: 'Noto Sans KR';
}


body {
	background-color: white;
}
#svgContainer {
    width: 100%;
    max-width: 800px; /* 최대 너비 설정 */
    margin: 0 auto; /* 중앙 정렬을 위해 좌우 마진을 auto로 설정 */
    padding: 20px; /* 컨테이너 주위에 여백 추가 */
    border: 0px solid black;
    box-sizing: border-box; /* border-box를 사용하여 패딩이 너비에 포함되도록 설정 */
}
svg {
    width: 100%; /* 부모 요소에 맞춰짐 */
    height: auto; /* 높이 자동 조절 */
    max-width: 800px; /* 최대 너비 설정 */
    overflow: visible; /* 뷰포트를 벗어나는 요소 보이도록 설정 */
    border: 0px solid black; /* 테두리 추가 (테스트용) */
}
/* <path> 요소의 확대 */
path {
    transform: scale(2); /* 초기 크기 설정 */
    transform-origin: center; /* 확대 기준점을 중심으로 설정 */
    transition: transform 0.3s ease; /* 호버 시 변환 효과 적용 */
    cursor: pointer; /* 마우스 포인터 모양 변경 */
}
/* 호버 시 변환 */
path:hover {
    transform: scale(2.05); /* 호버 시 요소를 조금 확대 */
    fill: url(#imagePattern); /* 이미지 패턴 적용 */
}
#contentContainer {
	float: none;
    margin-left: 20px; /* 텍스트와 내용 간격 조절 */
    order: -1;
}
@media screen and (max-width: 920px) {
    #svgContainer {
        margin-left: 0;
    }
}
</style>
</head>
<body>
<div id="svgContainer">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="-300 0 920 500">
	<defs>
		<pattern id="imagePattern" patternUnits="userSpaceOnUse" width="920" height="500">
			<image href="./kyotomap/image/bloom.jpg" x="0" y="0" width="920" height="500" />
		</pattern>
	</defs>
	
	<g>
		<path
         d="m 450,340 -2,7 v 7 l -4,5 -1,5 6,9 7,4 v -2 l -1,-3 -3,-2 -1,-1 v -2 l -2,-3 3,-1 10,-6 4,4 3,-2 14,-5 3,-12 v 2 l 6,-1 3,5 h 6 v -5 l 8,3 v -12 l 1,-3 h 4 l 2,3 7,2 -7,-7 -5,-6 2,-7 h -3 v -4 h -11 l 5,-5 -2,-5 -6,-2 1,-2 5,3 1,-2 -9,-17 9,-6 -2,-9 4,-8 -2,-3 7,-22 -1,-6 4,-8 -6,-5 -7,-31 4,-3 -2,-8 5,-9 7,-15 v -1 l -1,-2 -8,7 h -5 l -9,-22 -7,-3 -3,7 -5,2 v 6 l 2,2 -3,4 -3,-4 -15,2 -3,7 -1,4 -16,6 -16,-4 -11,8 -1,8 -5,1 v 5 l -4,-2 -9,5 2,4 1,6 -16,26 -1,8 3,7 4,-3 1,3 h 8 l -2,2 3,7 h 3 l 6,4 -5,7 -3,-1 -4,9 6,8 6,-3 3,2 -3,12 2,3 3,-1 6,9 -1,2 4,7 -4,6 1,12 -12,3 2,5 -2,11 -7,7 8,1 5,-4 7,3 16,-9 8,-1 -5,-12 10,3 z"
         id="myPath"
         fill="pink"
         inkscape:connector-curvature="0" />
         <text id="description" x="320" y="50">
                    지도를 클릭하세요!
         </text>
    </g>
</svg>

<div id="contentContainer">
	<h3><b>Kyoto cherry blossom calendar</b></h3>
	<table>
		<tr>
			<td>호호</td>
		</tr>
	</table>
</div>
</div>

<script type="text/javascript">
document.getElementById('myPath').addEventListener('click', function() {
    // 클릭 이벤트 처리 코드 추가
    window.location.href="index.jsp?main=kyotomap/calendar.jsp";
});
</script>
</body>
</html>