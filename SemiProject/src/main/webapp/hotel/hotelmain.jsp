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
   
   .lili{
   
  position: absolute;
  top: 280px;
    right: 250px;
    z-index: 999;
   }



.write-btn {
    color: black;
    background-color: #eeeeee;
    border-color: #eeeeee;
    z-index: 100;
}s
   
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
   

  
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
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
      
      
      <div >
        <a href="index.jsp?main=hotel/hotelmainlist.jsp"><i
            class="bi bi-list fs-2 lili" data-bs-container="body"
            data-bs-toggle="popover" data-bs-placement="top"
            data-bs-content="목록형 보기"></i></a>
   </div>

      <!-- Tab panes -->
      <div class="tab-content">
         <div id="tabs-total" class="container tab-pane active">
          <br><br>
              <div class="gallery-image">
            <p>
            
           

               <%
             
                for(HotelDto dto: list)
                {
                   
                   %>
               <div class="img-box">

            <a h_num="<%=dto.getH_num()%>" h_category=<%=dto.getH_category() %>
                  style="cursor: pointer; color: white" class="goDetail"> <img alt=""
                  src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo">

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
            <br><br>
       <div class="gallery-image">
      <p>
      
      
              <%
               
                for(HotelDto dto: list)
                {
                   
                   if(dto.getH_category().equals("hotel")){
                 
                       
                       %>
                   <div class="img-box">

                <a h_num="<%=dto.getH_num()%>" h_category=<%=dto.getH_category() %>
                      style="cursor: pointer; color: white" class="goDetail"> <img alt=""
                      src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo">

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
         <br><br>
        <div class="gallery-image">
      <p>
        
      
              <%
                 
                for(HotelDto dto: list)
                {
                   
                   if(dto.getH_category().equals("ryokan")){

                                      
                   %>
               <div class="img-box">

            <a h_num="<%=dto.getH_num()%>" h_category=<%=dto.getH_category() %>
                  style="cursor: pointer; color: white" class="goDetail"> <img alt=""
                  src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo">

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