<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="login-form-03/fonts/icomoon/style.css">
    <link rel="stylesheet" href="login-form-03/css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="login-form-03/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="login-form-03/css/style.css">
    <title>네이버 로그인</title>
</head>

<%
    // 세션으로부터 아이디와 체크값을 얻는다
    String myid = (String) session.getAttribute("myid");
    String saveid = (String) session.getAttribute("saveok");
    boolean save = true;
    if (saveid == null) {
        myid = ""; // 아이디저장을 체크하지 않은 경우 아이디 없앤다
        save = false;
    }
%>

<body>
<div class="half" style="margin-top: 50px; margin-left: 100px; margin-right: 100px;">
    <div class="bg order-1 order-md-2 " style="background-image: url('login-form-03/images/bg_5.jpg');">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-6">
                    <div class="form-block">
                        <div class="text-center mb-5">
                            <h3><strong>KyotoInside</strong>&nbsp;로그인</h3>
                        </div>
                        <form action="login/loginAction.jsp" method="post">
                            <div class="form-group first">
                                <label for="username">아이디</label>
                                <input type="text" class="form-control" placeholder="아이디" id="id" name="id"
                                       required="required" value=<%=myid %>>
                            </div>
                            <div class="form-group last mb-3">
                                <label for="password">비밀번호</label>
                                <input type="password" class="form-control" placeholder="비밀번호" id="pass"
                                       name="pass" required="required">
                            </div>
                            <div class="d-sm-flex mb-5 align-items-center">
                                <label class="control control--checkbox mb-3 mb-sm-0"><span
                                        class="caption">아이디 저장</span>
                                    <input type="checkbox" checked="checked" name="savechk" <%=save?"checked":"" %>/>
                                    <div class="control__indicator"></div>
                                </label>
                            </div>
                            <input type="submit" value="로그인" class="btn btn-block btn-primary"
                                   style="background-color: pink; border: pink;">
                        </form>
                        <!-- 네이버 로그인 버튼 -->
                        <a href="#" id="naver-login-button" class="btn btn-block btn-primary"
                           style="background-color: #1ec800; border: #1ec800;">네이버 로그인</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<!-- 네이버 로그인 API 호출 -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#naver-login-button').click(function () {
            var clientId = '8D8NHhYi_PFhnBVqI0FM';
            var redirectURI = encodeURIComponent('http://localhost:8080/SemiProject/login/naverCallback.jsp');
            var state = 'random_state'; // CSRF 방지를 위한 랜덤 상태값
            var naverLoginURL = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=' + clientId + '&redirect_uri=' + redirectURI + '&state=' + state;
            // 네이버 로그인 페이지로 리다이렉트
            window.location.href = naverLoginURL;
        });
    });
</script>
</body>
</html>
