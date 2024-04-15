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
<link rel="stylesheet" href="food/food_menu_design_2/dist/style.css">


<title>Insert title here</title>
<style type="text/css">


</style>



</head>
<%
 
  FoodDao dao=new FoodDao();
  List<FoodDto> list=dao.getAllFoods();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  

%>


<body>
  <p class="heading">CSS Gallery</p>
  <div class="gallery-image">
  
  <%
   for(FoodDto dto: list){%>
    <div class="img-box">
    
    <a f_num="<%=dto.getF_num()%>" style="cursor: pointer; color: white;" class="goDetail" >
     <img alt="" src="food/image_food/<%=dto.getF_image()%>" class="photo">
   
    
      <div class="transparent-box">
        <div class="caption">
          <p><%=dto.getF_subject_k() %></p>
          <p class="opacity-low"><%=dto.getF_subject() %></p>
        </div>
      </div> 
    </div>
    </a>
   
   <%}%>
  
  <script type="text/javascript">
$(function(){
    
    
    $("a.goDetail").click(function(){
       var f_num=$(this).attr("f_num");
       
       //디테일 페이지로 이동
       location.href="index.jsp?main=food/fooddetailview.jsp?f_num="+f_num;
    })
 });
</script>
    
  </div>
  
  
</body>
</html>

