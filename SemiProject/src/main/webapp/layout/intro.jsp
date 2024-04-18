<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js" integrity="sha512-1PKqXBz2ju2JcAerHKL0ldg0PT/1vr3LghYAtc59+9xy8e19QEtaNUyt1gprouyWnpOPqNJjL4gXMRMEpHYyLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
<%
	//프로젝트 경로
	String root=request.getContextPath();
%>
<style type="text/css">
	footer {
	  background-color: white;
	  border-top: 0px solid #333;
	}
	footer .inner {
	  padding: 40px 0 60px 0
	}
	footer .menu {
	  display: flex;
	  justify-content: center;
	}
	footer .menu li {
	  position: relative;
	}
	footer .menu li::before {
	  content: "";
	  width: 3px;
	  height: 3px;
	  background-color: #555;
	  position: absolute;
	  top: 0;
	  bottom: 0;
	  right: -1px;
	  margin: auto;
	}
	footer .menu li:last-child::before {
	  display: none;
	}
	footer .menu li a {
	  color: #ccc;
	  font-size: 12px;
	  font-weight: 700;
	  padding: 15px;
	  display: block;
	}
	footer .menu li a.green {
	  color: #669900
	}
	footer .btn-group {
	  margin-top: 20px;
	  display: flex;
	  justify-content: center;
	}
	footer .btn-group .btn {
	  font-size: 12px;
	  margin-right: 10px;
	}
	footer .btn-group .btn:last-child {
	  margin-right: 0px;
	}
	footer .info {
	  margin-top: 10px;
	  text-align: center;
	}
	footer .info span {
	  margin-right: 20px;
	  color: #999;
	  font-size: 12px;
	}
	footer .info span:last-child {
	  margin-right: 0;
	}
	footer .copyright {
	  color: #999;
	  font-size: 12px;
	  text-align: center;
	  margin-top: 12px;
	}
	footer .logo {
	  display: block;
	  margin: 10px auto 0;
	  width: 100px;
	  height: 80px;
	}
	#to-top {
	  width: 42px;
	  height: 42px;
	  background-color: #333;
	  color: #fff;
	  border: 2px solid #fff;
	  border-radius: 10px;
	  cursor: pointer;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  position: fixed;
	  bottom: 30px;
	  right: 30px;
	  z-index: 9;
	}
</style>
</head>
<body>
<footer>
  <div class="inner">
    <ul class="menu">
      <li><a href="#">개인정보처리방침</a></li>
      <li><a href="#">영상정보처리기기 운영관리 방침</a></li>
      <li><a href="#">홈페이지 이용약관</a></li>
      <li><a href="#">위치정보 이용약관</a></li>
      <li><a href="#">윤리경영 핫라인</a></li>
    </ul>
    
    <div class="info">
      <span>사업자등록번호 000-00-00000</span>
      <span>(주)Kyoto-Inside 대표이사 이현주</span>
      <span>TEL : 02) 1234-5678 / FAX : 02) 1234-5678</span>
      <span>개인정보 책임자 : 이병준</span>
    </div>

    <p class="copyright">
      &copy; <span class="this-year"></span> Kyoto-Inside Company. All Rights Reseved.
    </p>
      <img src="<%=root%>/image/semi/logo3.png" class="logo" />
  </div>
  
  <div id="to-top">
    <div class="material-icons">arrow_upward</div>
  </div>
</footer>

<script type="text/javascript">
//만약 스크롤의 값이 200px이 넘어가면 header .badges가 자연스럽게 사라지고 #to-top이 나타나고 아니라면 header .badges가 나타나고 #to-top이 사라진다.
  const toTopEl = document.querySelector('#to-top');

  // 스크롤 이벤트 리스너 등록
  window.addEventListener('scroll', function () {
    const scrollY = window.scrollY;
    if (scrollY > 200) {
      // 스크롤 위치가 500px 이상일 때
      toTopEl.style.opacity = '1'; // 버튼 보이기
    } else {
      // 스크롤 위치가 500px 미만일 때
      toTopEl.style.opacity = '0'; // 버튼 숨기기
    }
  });

  // 버튼 클릭 이벤트 처리
  toTopEl.addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: 'smooth' }); // 최상단으로 부드럽게 스크롤
  });
  
  // footer 영역의 년도를 자동으로 변경하기
  const thisYear = document.querySelector('.this-year')
  thisYear.textContent = new Date().getFullYear();
</script>
</body>
</html>