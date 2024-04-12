<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.TourDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   img.photo{
      width: 400px;
      height: 230px;
      border: 0px solid gray;
      margin-bottom: 10px;
   }
   
   .tourtable{
      padding: 10px;
      height: 150px;
      
   }
   
   a.goDetail{
   
      text-decoration: none;
      color: black;
   }

   a:hover {
      text-decoration: underline;
      color: gray;
   }
</style>
<script type="text/javascript">
  $(function(){
     $("a.goDetail").click(function(){
        var t_num=$(this).attr("t_num");
        var t_category=$(this).attr("t_category");
        //alert(t_num);
        //디테일 페이지로 이동
        location.href="index.jsp?main=tour/tourdetailview.jsp?t_num="+t_num+"&t_category="+t_category;
     })
  });

</script>
</head>
<%
  TourDao dao=new TourDao();
  List<TourDto> list=dao.getAllTour();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
<div class="container mt-3">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-total" style="text-decoration: none; color:gray;">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-sawon" style="text-decoration: none; color:gray;">사원 및 신사</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-mus" style="text-decoration: none; color:gray;">박물관</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-event" style="text-decoration: none; color:gray;">축제</a>
    </li>
  </ul>

  <!-- tab panes -->
  <div class="tab-content">
    <div id="tabs-total" class="container tab-pane active"><br>
      <h3>전체</h3>
      <p>
        <table class="tourtable table " style="width: 500px;">
           <tr>
              <%
                 int i=0;
                for(TourDto dto: list)
                {
                   %>
                   <td>
                     <a t_num="<%=dto.getT_num()%>" t_category=<%=dto.getT_category() %> style="cursor: pointer;" class="goDetail">
                        <img alt="" src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
                        <br>
                        <%=dto.getT_subject() %><br></a>
                   </td>
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                    i++;
                   %>
                <%}
              %>
           </tr> 
        </table>
      </p>
    </div>
    
   <div id="tabs-sawon" class="container tab-pane fade"><br>
      <h3>호텔</h3>
      <p>
      <table class="tourtable table " style="width: 500px;">
           <tr>
              <%
                i=0;
                for(TourDto dto: list)
                {
                   if(dto.getT_category().equals("sawon")){
                   %>
                   <td>
                     <a t_num="<%=dto.getT_num()%>" t_category=<%=dto.getT_category() %> style="cursor: pointer;" class="goDetail">
                        <img alt="" src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
                        <br>
                        <%=dto.getT_subject() %><br></a>
                   </td>
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                    i++;
                   }
                   %>
                <%}
              %>
           </tr> 
        </table>
      </p>
    </div>
    
    <div id="tabs-mus" class="container tab-pane fade"><br>
      <h3>료칸</h3>
      <p>
        <table class="tourtable table" style="width: 500px;">
           <tr>
              <%
                i=0;
                for(TourDto dto: list)
                {
                   if(dto.getT_category().equals("mus")){
                   %>
                   <td>
                     <a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category() %>" style="cursor: pointer;" class="goDetail">
                        <img alt="" src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
                        <br>
                        <%=dto.getT_subject() %><br></a>
                   </td>
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                    i++;
                   }
                   %>
                <%}
              %>
           </tr> 
        </table>
      </p>
    </div>
    
    <div id="tabs-event" class="container tab-pane fade"><br>
      <h3>료칸</h3>
      <p>
        <table class="tourtable table" style="width: 500px;">
           <tr>
              <%
                i=0;
                for(TourDto dto: list)
                {
                   if(dto.getT_category().equals("event")){
                   %>
                   <td>
                     <a t_num="<%=dto.getT_num()%>" t_category=<%=dto.getT_category() %> style="cursor: pointer;" class="goDetail">
                        <img alt="" src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
                        <br>
                        <%=dto.getT_subject() %><br></a>
                   </td>
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                    i++;
                   }
                   %>
                <%}
              %>
           </tr> 
        </table>
      </p>
    </div>
  </div>
</div>
</body>
</html>