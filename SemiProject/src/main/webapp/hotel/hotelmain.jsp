<%@page import="data.dao.SemiMemberDao"%>
<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
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

a.goDetail {
   text-decoration: none;
   color: black;
}

a:hover {
   text-decoration: underline;
   color: gray;
}

.nav-tabs {
   width: 1100px; /* Adjust the width as needed */
}

.nav-tabs .nav-item {
   display: inline-block;
   margin-right: 10px; /* Adjust margin between tabs */
}

.nav-tabs .nav-link {
   padding: .5rem 1.5rem; /* Increase padding */
}

.lili {
   z-index: 999;
}

.write-btn {
   color: black;
   background-color: #eeeeee;
   border-color: #eeeeee;
   z-index: 100;
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
   width: 80px;
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
<script type="text/javascript">
  $(function(){
     $("a.goDetail").click(function(){
        var h_num=$(this).attr("h_num");
        var h_category=$(this).attr("h_category");
        //alert(h_num);
        
        //디테일 페이지로 이동
        location.href="index.jsp?main=hotel/hoteldetailview.jsp?h_num="+h_num+"&h_category="+h_category;
     })
     
    // Replace existing event listener setup for a.goDetail with the modified code snippet
    $(document).on("click", "a.goDetail", function() {
        var h_num = $(this).attr("h_num");
        var h_category = $(this).attr("h_category");
        location.href = "index.jsp?main=hotel/hoteldetailview.jsp?h_num=" + h_num + "&h_category=" + h_category;
    });
    
     
    //검색기능
    $("button.search").click(function(){
       
       var keyword=$("#keyword").val();
       var category=$("#category").val();
       //alert(keyword+","+category);
       $.ajax({
          type:"get",
          url:"hotel/search.jsp",
          data:{"keyword":keyword, "category":category},
          dataType:"json",
          success:function(res){
             //console.log(res); // 콘솔에서 응답 확인
             var s="<div class='gallery-image'><p>";
             $.each(res, function(i, ele){
                s+="<div class='img-box'>";
                s+="<a h_num='"+ele.h_num+"' h_category='"+ele.h_category+"' style='cursor: pointer; color: white' class='goDetail'>";
                s+="<img src='hotel/image_hotel/"+ele.h_image+"' class='photo'>";
                s+="<div class='transparent-box'>";
                s+="<div class='caption'>";
                s+="<p>"+ele.h_content+"</p>";
                s+="<p class='opacity-low'>"+ele.h_subject+"</p>";
                s+="</div></div></a></div>";
             })
             s+="</p></div>";
             $("div.searchlist").html(s);
             
             $("#tabs-total").hide();
             $("#tabs-hotel").hide();
             $("#tabs-ryokan").hide();
             
             $("li.nav-item").click(function(){
                location.reload();
             })
          }
       });
    })
    
    
  });
</script>
</head>
<%
 
  HotelDao dao=new HotelDao();
  List<HotelDto> list=dao.getAllHotels();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  
  String loginok=(String)session.getAttribute("loginok");
  String myid=(String)session.getAttribute("myid");
  SemiMemberDao sdao=new SemiMemberDao();
  String name=sdao.getName(myid);
  

%>
<body>
   <div class="container mt-3" align="center">

      <div>


         <!-- Nav tabs -->
         <ul class="nav nav-tabs" role="tablist"
            style="width: 1100px; margin-left: 0 auto;">
            <li class="nav-item"><a class="nav-link active"
               data-bs-toggle="tab" href="#tabs-total"
               style="text-decoration: none; color: gray;">전체</a></li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
               href="#tabs-hotel" style="text-decoration: none; color: gray;">호텔</a>
            </li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
               href="#tabs-ryokan" style="text-decoration: none; color: gray;">료칸</a>
            </li>

         </ul>

      </div>

      <!-- 검색기능 -->
      <div class="d-inline-flex"
         style="margin-top: 10px; margin-bottom: -300px; width: 1100px;">

         <div>
            <a href="index.jsp?main=hotel/hotelmainlist.jsp"><i
               class="bi bi-list fs-2 lili" data-bs-container="body"
               data-bs-toggle="popover" data-bs-placement="top"
               data-bs-content="목록형 보기"></i></a>
         </div>


         <select name="category" id="category" style="margin-left: 780px;">
            <option class="option" style="text-align: center;" value="hotel">호텔</option>
            <option class="option" style="text-align: center;" value="ryokan">료칸</option>
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

      <!-- Tab panes -->
      <div class="tab-content">
         <div id="tabs-total" class="container tab-pane active">

            <div class="gallery-image">
               <p>
                  <%
                for(HotelDto dto: list)
                {
                   
                   %>
               
               <div class="img-box">

                  <a h_num="<%=dto.getH_num()%>"
                     h_category=<%=dto.getH_category() %>
                     style="cursor: pointer; color: white" class="goDetail"> <img
                     alt="" src="hotel/image_hotel/<%=dto.getH_image()%>"
                     class="photo">

                     <div class="transparent-box">
                        <div class="caption">
                           <p><%=dto.getH_content() %></p>
                           <p class="opacity-low"><%=dto.getH_subject() %></p>
                        </div>
                     </div>
                  </a>
               </div>


               <%}%>}


               </p>
            </div>
         </div>



         <div id="tabs-hotel" class="container tab-pane fade">

            <div class="gallery-image">
               <p>


                  <%
               
                for(HotelDto dto: list)
                {
                   
                   if(dto.getH_category().equals("hotel")){
                 
                       
                       %>
               
               <div class="img-box">

                  <a h_num="<%=dto.getH_num()%>"
                     h_category=<%=dto.getH_category() %>
                     style="cursor: pointer; color: white" class="goDetail"> <img
                     alt="" src="hotel/image_hotel/<%=dto.getH_image()%>"
                     class="photo">

                     <div class="transparent-box">
                        <div class="caption">
                           <p><%=dto.getH_content() %></p>
                           <p class="opacity-low"><%=dto.getH_subject() %></p>
                        </div>
                     </div>
                  </a>
               </div>


               <%}}%>


               </p>
            </div>
         </div>
         <div id="tabs-ryokan" class="container tab-pane fade">

            <div class="gallery-image">
               <p>


                  <%
                 
                for(HotelDto dto: list)
                {
                   
                   if(dto.getH_category().equals("ryokan")){

                                      
                   %>
               
               <div class="img-box">

                  <a h_num="<%=dto.getH_num()%>"
                     h_category=<%=dto.getH_category() %>
                     style="cursor: pointer; color: white" class="goDetail"> <img
                     alt="" src="hotel/image_hotel/<%=dto.getH_image()%>"
                     class="photo">

                     <div class="transparent-box">
                        <div class="caption">
                           <p><%=dto.getH_content() %></p>
                           <p class="opacity-low"><%=dto.getH_subject() %></p>
                        </div>
                     </div>
                  </a>
               </div>


               <%}}%>

               </p>
            </div>
         </div>



      </div>
   </div>
</body>
</html>