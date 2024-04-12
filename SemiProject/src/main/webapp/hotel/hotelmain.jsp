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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   img.photo{
   
   width: 100%; /* 이미지의 너비를 부모 요소에 맞추기 */
   height: auto; /* 이미지의 높이 자동 조정 */
   border: 0px solid gray;
   margin-bottom: 10px;
}

   .shoptable{
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

/* 행의 스타일 */
.row {
   margin-bottom: 20px; /* 각 행 사이의 간격 조정 */
}
</style>
<script type="text/javascript">
  $(function(){
     $("a.goDetail").click(function(){
        var h_num=$(this).attr("h_num");
        var h_category=$(this).attr("h_category");
        // 디테일 페이지로 이동
        location.href="index.jsp?main=hotel/hoteldetailview.jsp?h_num="+h_num+"&h_category="+h_category;
     })
  });
</script>
</head>
<%
  HotelDao dao=new HotelDao();
  List<HotelDto> list=dao.getAllHotels();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
<div class="container mt-3">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="tab" href="#tabs-total" style="text-decoration: none; color:gray;">전체</a>
        </li>
        <!-- 다른 탭들 생략 -->
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div id="tabs-total" class="container tab-pane active"><br>
            <h3>전체</h3>
            <% int i=0;
               for(HotelDto dto: list) { %>
                <% if(i % 5 == 0) { %> <!-- 5개의 이미지마다 새로운 행 시작 -->
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6">
                            <a h_num="<%=dto.getH_num()%>" h_category="<%=dto.getH_category()%>" style="cursor: pointer;" class="goDetail">
                                <img alt="" src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo img-fluid">
                                <br>
                                <%=dto.getH_content() %><br>
                            </a>
                        </div>
                <% } else if (i % 5 == 1 || i % 5 == 2) { %>
                        <div class="col-lg-2 col-md-3 col-sm-6">
                            <a h_num="<%=dto.getH_num()%>" h_category="<%=dto.getH_category()%>" style="cursor: pointer;" class="goDetail">
                                <img alt="" src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo img-fluid">
                                <br>
                                <%=dto.getH_content() %><br>
                            </a>
                        </div>
                <% } %>
                <% i++;
                   if(i == 5) i = 0; // 5개마다 초기화
               } %>
        </div>
        <!-- 이하 생략 -->
    </div>
</div>
</body>
</html>
