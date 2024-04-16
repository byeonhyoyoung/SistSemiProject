<%@page import="data.dao.SemiMemberDao"%>
<%@page import="data.dto.FoodDto"%>
<%@page import="data.dao.FoodDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway:600,900" rel="stylesheet">
<link rel="stylesheet" href="food_menu_design_2/dist/style.css">

<title>식당 메뉴</title>
<style type="text/css">
  .container {
    position: relative;
    max-width: 1000px;
    margin: 0 auto;
  }
  .lili {
    position: absolute;
    top: 50px;
    right: 50px;
    z-index: 999;
  }
  .pencil {
    color: green;
  }
  .trash {
    color: red;
  }
  .write-btn {
  
  position: absolute;
  top: 50px;
  left: 10px;
  color: blue;

  }
  .bi-pencil{
  color: blue;
  }

</style>
</head>
 <script type="text/javascript">
$(function(){
    
    
    $("a.goDetail").click(function(){
       var f_num=$(this).attr("f_num");
       
       //디테일 페이지로 이동
       location.href="index.jsp?main=food/fooddetailview.jsp?f_num="+f_num;
    })
    
    
     $("a.goUpdate").click(function(){
       var f_num=$(this).attr("f_num");
       
       //디테일 페이지로 이동
       location.href="index.jsp?main=food/foodupdateform.jsp?f_num="+f_num;
    })
 });
</script>
<%
  FoodDao dao=new FoodDao();
  List<FoodDto> list=dao.getAllFoods();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  
  //로그인 세션얻기
  String loginok=(String)session.getAttribute("loginok");
  
  //아이디얻기
  String myid=(String)session.getAttribute("myid");
  
  SemiMemberDao sdao=new SemiMemberDao();
  String name=sdao.getName(myid);
  
%>

<body>
<div class="container mt-3" align="center">
  <p class="heading">식당</p>
  
  <% if(loginok!=null && myid.equals("admin")) { %>
  <button class="btn btn-outline-primary bt-sm write-btn" onclick="location.href='index.jsp?main=food/foodaddform.jsp'">게시물 작성</button>
  <% } %>
  
  <a href="index.jsp?main=food/foodmain.jsp"><i class="bi bi-grid-fill fs-2 lili" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="앨범형 보기"></i></a>
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">이미지</th>
        <th scope="col">한글 이름</th>
        <th scope="col">영어 이름</th>
        <% if(loginok!=null && myid.equals("admin")) { %>
          <th scope="col">관리자용</th>
        <% } %>
      </tr>
    </thead>
    <tbody>
      <% 
        int i=1;
        for(FoodDto dto: list) {
      %>
        <tr style="vertical-align: middle;">
          <td><%= i %></td>           
          
          <td>
           <a f_num="<%=dto.getF_num()%>" style="cursor: pointer;" class="goDetail" >
          <img src="food/image_food/<%= dto.getF_image() %>" alt="<%= dto.getF_subject_k() %>" width="100" height="70">
          </a>
          </td>
          <td>
          
          <a f_num="<%=dto.getF_num()%>" style="cursor: pointer; text-decoration: none; color: black;" class="goDetail" >
          <%= dto.getF_subject_k() %>
          </a>          
          </td>
          
          <td>
          <a f_num="<%=dto.getF_num()%>" style="cursor: pointer; text-decoration: none; color: black;" class="goDetail" >
          <%= dto.getF_subject() %>
          </a>
          </td>
          
        
          <% if(loginok!=null && myid.equals("admin")) { %>
            <td>
            
             <a f_num="<%=dto.getF_num()%>" style="cursor: pointer;"  class="goUpdate" >
              <i class="bi bi-pencil-square fs-4 pencil"></i>
             </a>
              
              <i class="bi bi-trash fs-4 trash"></i>
            </td>
          <% } %>
          
          
        </tr>
      <% i++; } %>
      
      
    </tbody>
  </table>
  
  

</div>

</body>
</html>
