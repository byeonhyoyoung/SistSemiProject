<%@page import="data.dto.TourDto"%>
<%@page import="data.dao.TourDao"%>
<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
<%@page import="java.text.NumberFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
img.large {
   height: 400px;
}

i.loc {
   color: green;
}

i.globe {
   color: green;
}

i.telephone {
   color: blue;
}

i.clock {
   color: brown;
}

i.coin {
   color: gold;
}
</style>
</head>
<%
   String t_num=request.getParameter("t_num");
   String loginok=(String)session.getAttribute("loginok");
   String myid=(String)session.getAttribute("myid");
   TourDao sdao=new TourDao();
   TourDto dto=sdao.getTour(t_num);
   NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
   <div style="margin: 50px 100px;">
      <form id="frm">
         <div class="row">
            <div class="col-md-6" style="padding-top: 50px;">
               <div style="color: gray">
                  <a style="color: gray; text-decoration: none;"
                     href="index.jsp?main=layout/main.jsp">홈></a> 
                   <a
                     style="color: gray; text-decoration: none;"
                     href="index.jsp?main=tour/tourmain.jsp">교토 관광></a>
                  <%
                     if(dto.getT_category().equals("sawon")){
                     %>
                        <a style="color: gray; text-decoration: none;"
                        href="index.jsp?main=tour/tourmain.jsp#tabs-sawon">사원 및 신사</a>
                     <%}
                  %>
                  <%
                     if(dto.getT_category().equals("mus")){
                     %>
                        <a style="color: gray; text-decoration: none;"
                        href="index.jsp?main=tour/tourmain.jsp#tabs-mus">박물관</a>
                     <%}
                  %>
                  <%
                     if(dto.getT_category().equals("event")){
                     %>
                        <a style="color: gray; text-decoration: none;"
                        href="index.jsp?main=tour/tourmain.jsp#tabs-mus">축제</a>
                     <%}
                  %>
                   <%=dto.getT_subject() %>
               </div>
               <img alt="" src="tour/image_tour/<%=dto.getT_image()%>"
                  class="large img-thumbnail">
               <br><br>
               <h1 style="font-weight: bold;"><%=dto.getT_subject() %></h1>
               <h6 style="color: gray;"><%=dto.getT_subject_j() %></h6>
               <hr>
               <h5><%=dto.getT_content()%></h5>
               <hr>
               <h6>
                  <i class="bi bi-globe2 globe"></i> <a href="<%=dto.getT_link()%>"
                     target='_blank' style="color: gray;"><%=dto.getT_link()%></a>
               </h6>
               <h6>
                  <i class="bi bi-geo-alt-fill loc"></i>
                  <%=dto.getT_location() %></h6>
               <h6>
                  <i class="bi bi-clock clock"></i>
                  <%=dto.getT_time() %></h6>
               <h6>
                  <i class="bi bi-telephone telephone"></i>
                  <%=dto.getT_tel() %></h6>
               <%
               if(dto.getT_content() != null){
               %>
               <h6>
                  <i class="bi bi-coin coin"></i>
                  <%=dto.getT_price() %></h6>
               <%
               }
               %>
            </div>
            <div class="col-md-6" style="padding-top: 50px;">
               <br>
               <iframe src="<%=dto.getT_googlemap() %>" width="500" height="810"
                  style="border: 0;" allowfullscreen="" loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
         </div>
      </form>
   </div>
</body>
</html>