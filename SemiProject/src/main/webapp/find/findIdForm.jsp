<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

<link rel="stylesheet" href="login-form-03/fonts/icomoon/style.css">
<link rel="stylesheet" href="login-form-03/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="login-form-03/css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="login-form-03/css/style.css">
<title>Insert title here</title>
<style type="text/css">
body{
	background-color: white;
}
</style>
</head>
<body>
<div class="half" style="margin-top: 50px; margin-left: 100px; margin-right: 100px;">
    <div class="bg order-1 order-md-2 " style="background-image: url('login-form-03/images/bg_5.jpg');">
        <!--  <div class="contents order-2 order-md-1"> -->

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-6">
                    <div class="form-block">
                        <div class="text-center mb-5">
                            <h3><strong>KyotoInside</strong>&nbsp;아이디 찾기</h3>
                            <p style="font-size: 14px;">아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
                            <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
                        </div>
                        <form name="findIdForm" method="post" action="find/findIdAction.jsp">
							<section>
								<div class="form-group first">
									<label>이름</label>
									<input type="text" id="name" name="name" class="form-control" placeholder="등록한 이름">
								</div >
								<div class="form-group second">
									<label>이메일</label>
									<input type="text" id="email" name="email" class="form-control" placeholder="등록한 이메일">
								</div>
							</section>
							
							<div class="form-group">
								<div class="row">
									<div class="col">
										<input type="submit" value="찾기" name="find" class="btn btn-block btn-primary" style="background-color: pink; border: pink;">
									</div>
									<div class="col">
										<input type="button" value="뒤로76" name="cancel" class="btn btn-block btn-primary" style="background-color: pink; border: pink;" onclick="history.back()">
									</div>
								</div>
							</div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>