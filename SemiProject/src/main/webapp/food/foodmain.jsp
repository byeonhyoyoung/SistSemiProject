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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway:600,900"
   rel="stylesheet">
<link rel="stylesheet" href="food_menu_design_2/dist/style.css">


<title>Insert title here</title>
<style type="text/css">
* {
   font-family: 'Noto Sans KR';
}

.container {
   position: relative;
}

.lili {
   z-index: 999;
}

/* 검색기능 css */
.searching {
   width: 250px;
   height: 45px;
   border: 1px solid rgb(173, 173, 173);
   position: relative;
   border-radius: 30px;
   display: inline-block;
}

#keyword {
   height: 35px;
   width: calc(100% - 50px);
   position: absolute;
   top: 5px;
   left: 10px;
   border: none;
   font-size: 17px;
   padding-right: 40px;
}

#keyword:focus {
   outline: none;
}

/* input[name="query"]{height: 35px; width: 420px; position: absolute;
      top: 5px; left: 10px; border: none; font-size: 17px;}
    input[name="query"]:focus{outline: none;} */
.search {
   width: 45px;
   height: 46px;
   background: none;
   position: absolute;
   right: 0;
   top: 0;
   border: none;
   font-size: 1.5em; /* 검색 아이콘 사이즈 */
   font-weight: bold;
   color: black; /* 아이콘 색상 */
}

/* 검색 아이콘 위치 조정 */
.searchicon {
   position: absolute;
   right: 20px;
   top: 50%;
   transform: translateY(-50%);
}

select {
   box-sizing: border-box;
   width: 83px;
   height: 46px;
   padding: 4px;
   font-size: 1em;
   border-radius: 30px;
   border-color: rgb(173, 173, 173);
}

.option {
   padding: 4px;
   font-size: 14px;
   color: black;
   background: white;
}
</style>



</head>
<%
  FoodDao dao=new FoodDao();
  List<FoodDto> list=dao.getAllFoods();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
%>


<body>

   <div class="container mt-3" align="center">
      <p class="heading">Restaurant</p>

      <!-- 검색기능 -->
      <div class="d-inline-flex"
         style="margin-top: 10px; margin-bottom: -300px; width: 1100px;">

         <div>
            <a href="index.jsp?main=food/foodmainlist.jsp"><i
               class="bi bi-list fs-2 lili" data-bs-container="body"
               data-bs-toggle="popover" data-bs-placement="top"
               data-bs-content="목록형 보기"></i></a>
         </div>
         <select name="category" id="category" style="margin-left: 780px;">
            <option class="option" style="text-align: center;" value="east">동부</option>
            <option class="option" style="text-align: center;" value="west">서부</option>
            <option class="option" style="text-align: center;" value="south">남부</option>
            <option class="option" style="text-align: center;" value="north">북부</option>
            <option class="option" style="text-align: center;" value="central">중부</option>
         </select>
         <div class="searching">
            <input type="text" name="keyword" id="keyword" placeholder="검색하세요."
               maxlength="10">
            <button type="button" class="search">
               <i class="bi bi-search searchicon"></i>
            </button>
         </div>
      </div>
      <div class="searchlist"></div>

      <div class="gallery-image list">
         <%
   for(FoodDto dto: list){%>
         <div class="img-box">

            <a f_num="<%=dto.getF_num()%>"
               style="cursor: pointer; color: white;" class="goDetail"> <img
               alt="" src="food/image_food/<%=dto.getF_image()%>" class="photo">


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
    
    
 // Replace existing event listener setup for a.goDetail with the modified code snippet
    $(document).on("click", "a.goDetail", function() {
        var f_num = $(this).attr("f_num");
        location.href="index.jsp?main=food/fooddetailview.jsp?f_num="+f_num;
    });
    
 });

//검색기능
$("button.search").click(function(){
   
   var keyword=$("#keyword").val();
   var category=$("#category").val();
   //alert(keyword+","+category);
   $.ajax({
      type:"get",
      url:"food/search.jsp",
      data:{"keyword":keyword, "category":category},
      dataType:"json",
      success:function(res){
         //console.log(res); // 콘솔에서 응답 확인
         var s="<div class='gallery-image'><p>";
         $.each(res, function(i, ele){
            s+="<div class='img-box'>";
            s+="<a f_num='"+ele.f_num+"' f_category='"+ele.f_category+"' style='cursor: pointer; color: white' class='goDetail'>";
            s+="<img src='food/image_food/"+ele.f_image+"' class='photo'>";
            s+="<div class='transparent-box'>";
            s+="<div class='caption'>";
            s+="<p>"+ele.f_subject_k+"</p>";
            s+="<p class='opacity-low'>"+ele.f_subject+"</p>";
            s+="</div></div></a></div>";
         })
         s+="</p></div>";
         $("div.searchlist").html(s);
         
         $("div.list").hide();
/*          $("#tabs-total").hide();
         $("#tabs-hotel").hide(); */
         
         /* $("li.nav-item").click(function(){
            location.reload();
         }) */
      }
   });
})
</script>
      </div>

   </div>
</body>
</html>