<%@page import="data.dto.TourDto"%>
<%@page import="data.dao.TourDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway:600,900" rel="stylesheet">
<link rel="stylesheet" href="food_menu_design_2/dist/style.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Insert title here</title>
<style type="text/css">
   i.bi{
      cursor: pointer;
   }

</style>
<script type="text/javascript">

function delfunc(t_num) {
    Swal.fire({
        title: "정말로 삭제하시겠습니까?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
    }).then((result) => {
        if (result.isConfirmed) {
            // Perform deletion here
            location.href = 'tour/deleteaction.jsp?t_num=' + t_num;
            
            
                Swal.fire({
                  title: "삭제됨!",
                  text: "해당 데이터가 삭제되었습니다.",
                  icon: "success"
                });
           
        }
    });
}
   
</script>
</head>
<%
   TourDao dao=new TourDao();
   List<TourDto> list=dao.getAllTour();
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
   <div style="margin: 0 auto; width: 1000px;">
   
      <h6 class="alert alert-success" style="width: 200px; height: 50px; margin-top: 70px;"><b><%=list.size() %>개</b>의 글이 있습니다</h6>
      <table class="table table-striped">
         <caption align="top"><h5>글 목록</h5></caption>
         <button type="button" style="width: 100px; float: right; margin-bottom: -80px;"
         onclick="location.href='index.jsp?main=tour/addform.jsp'" class="btn btn-success btn-sm">글쓰기</button>
         <tr class="table table-group-divider">
            <th width="80" style="text-align: center">번호</th>
            <th width="100" style="text-align: center">카테고리</th>
            <th width="180" style="text-align: center">이미지</th>
            <th width="130" style="text-align: center">한글이름</th>
            <th width="130" style="text-align: center">영어이름</th>
            <th width="220" style="text-align: center">비고</th>
         </tr>
         
         <%
            int no=1;
            for(TourDto dto:list){
            %>   
               <tr align="center">
                  <td valign="middle"><%=no++ %></td>
                  <td valign="middle"><%=dto.getT_category() %></td>
                  <td valign="middle"><img src="./tour/image_tour/<%=dto.getT_image() %>" style="width: 100px;"></td>
                  <td valign="middle"><%=dto.getT_subject() %></td>
                  <td valign="middle"><%=dto.getT_subject_j() %></td>
                  <td valign="middle">
                     <i class="bi bi-pencil-square fs-4" style="color: green;"
                     onclick="location.href='index.jsp?main=tour/updateform.jsp?t_num=<%=dto.getT_num() %>'"></i>&nbsp;
                     <%-- <i class="bi bi-trash fs-2" style="color: red;"
                     onclick="location.href='tour/deleteaction.jsp?t_num=<%=dto.getT_num() %>'"></i> --%>
                     <i class="bi bi-trash fs-4" style="color: red; cursor: pointer;" onclick="delfunc('<%=dto.getT_num() %>')"></i>
                     
                  </td>
               </tr>
            <%}
         %>
      </table>
   </div>

</body>
</html>