<%@page import="data.dao.SemiMemberDao"%>
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
#btn{
	margin-top: 20px;
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
                            <h3><strong>KyotoInside</strong>&nbsp;아이디 찾기 결과</h3>
                            <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
                        </div>

						<div>
							<%
								request.setCharacterEncoding("utf-8");	
						
								String name=request.getParameter("name");
								String email=request.getParameter("email");
								
								SemiMemberDao dao=new SemiMemberDao();
								String id=dao.findId(name, email);
								
								if(id!=null){%>
									<span><%=name %>님의 아이디는 <strong><b><%=id %></b></strong> 입니다.</span>
									
								<%} else { %>
									
									<span><%=name %>님의 아이디를 찾을 수 없습니다.</span>
								<%}
							%>
						</div>
						
						<div id="btn">
							<input type="button" value="로그인" class="btn btn-block btn-primary" style="background-color: pink; border: pink;" onclick="location.href='index.jsp?main=login/loginForm3.jsp'">
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>