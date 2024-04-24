<%@page import="data.dao.SemiMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

<link rel="stylesheet" href="login-form-03/fonts/icomoon/style.css">
<link rel="stylesheet" href="login-form-03/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="login-form-03/css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="login-form-03/css/style.css">
<style type="text/css">
*{
	font-family: 'Noto Sans KR';
}
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
    <div class="bg order-1 order-md-2 ">
        <!--  <div class="contents order-2 order-md-1"> -->

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-6">
                    <div class="form-block">
                        <div class="text-center mb-5">
                            <h3><strong>KyotoInside</strong>&nbsp;비밀번호 찾기 결과</h3>
                            <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
                        </div>
                        
                        <div style="text-align: center;">
							<%
								request.setCharacterEncoding("utf-8");	
						
								String id=request.getParameter("id");
								String name=request.getParameter("name");
								String email=request.getParameter("email");
								
								SemiMemberDao dao=new SemiMemberDao();
								String pass=dao.findPass(name, id, email);
								
								if(id!=null){%>
								<span><%=name %>님의 비밀번호는 <strong><b><%=pass %></b></strong> 입니다.</span>
								
								<%} else { %>
									
									<span><%=name %>님의 비밀번호를 찾을 수 없습니다.</span>
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