<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
<%@page import="java.text.NumberFormat"%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- Include SweetAlert library -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Insert title here</title>
</head>

<%
   String h_num=request.getParameter("h_num");
   HotelDao sdao=new HotelDao();
   HotelDto dto=sdao.getHotel(h_num);
   NumberFormat nf=NumberFormat.getCurrencyInstance();
%>

<script type="text/javascript">

$(document).ready(function(){
     $('#hotelForm2').submit(function(e){
       e.preventDefault(); // Prevent form submission
       // Perform AJAX submission if needed, then show SweetAlert
       Swal.fire({
         position: "center",
         icon: "success",
         title: "저장되었습니다!",
         showConfirmButton: true,
       });
       this.submit();
       
       
     });
   });


</script>

<body>
   <div
      style="display: flex; justify-content: center; align-items: center; height: 100vh;">
      <div style="margin: 50px 100px; width: 600px;">
         <form id="hotelForm2" action="hotel/hotelupdateaction.jsp"
            method="post" enctype="multipart/form-data">
            <table class="table table-bordered">
               <caption align="top">
                  <b>숙박시설 수정</b>
               </caption>
               <input type="hidden" name="h_num" value="<%=h_num %>">
               <tr>
                  <td style="width: 150px;" class="table-light"><b>영어 이름</b></td>
                  <td><input type="text" name="h_subject" class="form-control"
                     style="width: 200px;" required="required"
                     value="<%=dto.getH_subject()%>"></td>
               </tr>

               <tr>
                  <td style="width: 150px;" class="table-light"><b>한글 이름</b></td>
                  <td><input type="text" name="h_content"
                     class="form-control" style="width: 200px;" required="required"
                     value="<%=dto.getH_content()%>"></td>
               </tr>

               <tr>
                  <td style="width: 150px;" class="table-light"><b>이미지</b></td>
                  <td><input type="file" name="h_image" class="form-control"
                     style="width: 300px;"
                     value="food/image_food/<%=dto.getH_image()%>"></td>
               </tr>

               <tr>
                  <td style="width: 150px;" class="table-light"><b>주소</b></td>
                  <td><input type="text" name="h_location" class="form-control"
                     style="width: 300px;" required="required"
                     value="<%=dto.getH_location()%>"></td>
               </tr>

               <tr>
                  <td style="width: 150px;" class="table-light"><b>홈페이지 주소</b></td>
                  <td><input type="text" name="h_link" class="form-control"
                     style="width: 200px;" required="required"
                     value="<%=dto.getH_link()%>"></td>
               </tr>


               <tr>
                  <td style="width: 150px;" class="table-light"><b>카테고리</b></td>
                  <td><select style="width: 200px;" class="form-control"
                     required="required" name="h_category">
                        <option value="hotel"
                           <%= dto.getH_category().equals("hotel") ? "selected" : "" %>>호텔</option>
                        <option value="ryokan"
                           <%= dto.getH_category().equals("ryokan") ? "selected" : "" %>>료칸</option>
                  </select></td>
               </tr>

               <tr>
                  <td style="width: 150px;" class="table-light"><b>구글맵링크</b></td>
                  <td><input type="text" name="h_googlemap"
                     class="form-control" style="width: 300px;" required="required"
                     value="<%=dto.getH_googlemap()%>"></td>
               </tr>


               <tr>
                  <td colspan="2" align="center">
                     <button type="submit" class="btn btn-info"
                        style="width: 100px; background-color: pink; border: pink;">내용저장</button>
                     <button type="button" class="btn btn-info"
                        style="width: 100px; background-color: #eeeeee; border: #eeeeee;"
                        onclick="location.href='index.jsp?main=hotel/hotelmain.jsp'">식당목록</button>
                  </td>
               </tr>
            </table>
         </form>
      </div>


      <div>
         <img alt="" src="hotel/image_hotel/<%=dto.getH_image()%>" width="300px">
      </div>
</body>
</html>