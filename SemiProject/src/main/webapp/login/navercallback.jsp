<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>네이버 로그인 Call Back</title>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("yM9Km9V1RKBifED86IwM", "http://localhost:8081/POST_GUARD/navercallback.jsp");
  // 접근 토큰 값 출력
  // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    let id = naver_id_login.getProfileData('email');
    let email = naver_id_login.getProfileData('email');
    let addr = naver_id_login.getProfileData('addr');
    let hp = naver_id_login.getProfileData('hp');

    let name = naver_id_login.getProfileData('name');
//    let mobile = naver_id_login.getProfileData('mobile');

//	백엔드랑 통신
	  let xhr = new XMLHttpRequest();
	
	  const userObj = { email:email,addr:addr,hp:hp, id: id, name: name };
	
	  xhr.open("post", "SocialLoginCon");
	  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	
	  xhr.send(JSON.stringify(userObj)); // 문자열로 보내기
	
	  xhr.onreadystatechange = function () {
	    if (xhr.readyState === XMLHttpRequest.DONE) {
	      //요청성공
	      if (xhr.status === 200) {
	        //응답성공
	        console.log(xhr.responseText);
	        if (xhr.responseText === "socialLoginSuccess") {
	          // 로그인 성공
	          // 받은 데이터를 기반으로 회원가입 시켜 버리고 로그인
	          window.opener.location.href = "index.jsp";
	          window.close();
	        } else {
	          // 로그인 실패
	          AlertMessage.classList.remove("hide");
	        }
	      } else {
	        console.log("response fail");
	      }
	    } else {
	      //요청실패
	      console.log("request fail");
	    }
	  };
  }
  
</script>
</body>
</html>