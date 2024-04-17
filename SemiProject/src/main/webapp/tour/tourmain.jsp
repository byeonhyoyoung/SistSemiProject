<%@page import="javax.swing.ListCellRenderer"%>
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
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="food_menu_design_2/dist/style.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:600,900" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
   .tour{
      padding: 10px;
      height: 150px;
   }
   
   a.goDetail{
      text-decoration: none;
      color: black;
      z-index: 999;
   }

   a:hover {
      text-decoration: underline;
      color: gray;
   }
</style>
<script type="text/javascript">
  $(function(){
    $(document).on("click", "a.goDetail", function(e){
        var t_num = $(this).attr("t_num");
        var t_category = $(this).attr("t_category");
        alert(t_num);
        //디테일 페이지로 이동
        location.href = "index.jsp?main=tour/tourdetailview.jsp?t_num=" + t_num + "&t_category=" + t_category;
     });
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
      <p class="heading">전체</p>
      
      &nbsp;&nbsp;<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=tour/addform.jsp'">등록</button>
      <button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=tour/tourlist.jsp'">목록</button>
      <div class="d-inline-flex">
      <select style="height: 30px; margin-left: 760px;">
      	<option class="" style="text-align: center;">사원</option>
      	<option class="" style="text-align: center;">박물관</option>
      	<option class="" style="text-align: center;">축제</option>
      </select>
      <input type="text" style="width: 200px; height: 30px;">
      <button type="button" class="btn btn-info" style="width: 70px; height: 30px;">검색</button>
      </div>
      <br>
      <table class="tour" style="width: 500px;">
        <% for (int i = 0; i < list.size(); i+=5) { %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
              TourDto dto = list.get(j);
              if (j == i) { %>
                 <!-- 한 행의 첫 번째 열 -->
                <td colspan="2" rowspan="2">
                  <!-- 이미지와 관광 정보 제목을 표시하며, 디테일 페이지로 이동할 수 있는 링크 -->
                  <a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer; color: white;" class="goDetail" >
                  <div class="gallery-image-lg">
                  	<div class="img-box-lg">
                    <img src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
	                    <div class="transparent-box-lg">
					        <div class="caption">
					          <p><%=dto.getT_subject()%></p>
					          <p class="opacity-low"><%=dto.getT_subject_j() %></p>
					        </div>
					    </div>
                  	</div>
                  </div>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    <!-- 다음 행으로 이동하여 다시 첫 번째 열로 시작 -->
                    </tr>
                    <tr>
                        <td>
							<a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=dto.getT_subject() %></p>
								          <p class="opacity-low"><%=dto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                       	</td>
                    <%}else if(j%5==4){
                    %>
						<td>
							<a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=dto.getT_subject() %></p>
								          <p class="opacity-low"><%=dto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                           </td>
                    <%}else{
                    %>
                       <td>
                             <a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                             <div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=dto.getT_subject() %></p>
								          <p class="opacity-low"><%=dto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
	                          </div>
                             </a>
                           </td>
                    <%}
                 }
            } %>
          </tr>
        <% } %>
   </table>
   </div>
   
    <div id="tabs-sawon" class="container tab-pane fade"><br>
      <p class="heading">사원 및 신사</p>
      <br>
      <table class="tour" style="width: 500px;">
      	<% 
        	List<TourDto> slist=dao.getAllCategory("sawon");
        for (int i = 0; i <slist.size(); i+=5) {
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
            	TourDto sdto=slist.get(j);
              if (j == i) { %>
                <td colspan="2" rowspan="2">
                  <!-- 이미지와 관광 정보 제목을 표시하며, 디테일 페이지로 이동할 수 있는 링크 -->
                  <a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                  <div class="gallery-image-lg">
                  	<div class="img-box-lg">
                    <img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo">
	                    <div class="transparent-box-lg">
					        <div class="caption">
					          <p><%=sdto.getT_subject()%></p>
					          <p class="opacity-low"><%=sdto.getT_subject_j() %></p>
					        </div>
					    </div>
                  	</div>
                  	</div>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    </tr>
                    <tr>
						<td>
							<a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=sdto.getT_subject() %></p>
								          <p class="opacity-low"><%=sdto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                       	</td>
                    <%}else if(j%5==4){
                    %>
						<td>
							<a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=sdto.getT_subject() %></p>
								          <p class="opacity-low"><%=sdto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}else{
                    %>
                       <td>
							<a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=sdto.getT_subject() %></p>
								          <p class="opacity-low"><%=sdto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}
                 }
            }
            %>
          </tr>
        <% } %>
   </table>
   </div>
   
    <div id="tabs-mus" class="container tab-pane fade"><br>
      <p class="heading">박물관</p>
      <br>
      <table class="tour" style="width: 500px;">
      	<% 
        	List<TourDto> mlist=dao.getAllCategory("mus");
        for (int i = 0; i < mlist.size(); i+=5) {
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
            	TourDto mdto=mlist.get(j);
              if (j == i) { %>
                <td colspan="2" rowspan="2">
                  <!-- 이미지와 관광 정보 제목을 표시하며, 디테일 페이지로 이동할 수 있는 링크 -->
                  <a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                  <div class="gallery-image-lg">
                  	<div class="img-box-lg">
                    <img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo">
	                    <div class="transparent-box-lg">
					        <div class="caption">
					          <p><%=mdto.getT_subject()%></p>
					          <p class="opacity-low"><%=mdto.getT_subject_j() %></p>
					        </div>
					    </div>
                  	</div>
                  	</div>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    </tr>
                    <tr>
                        <td>
							<a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=mdto.getT_subject() %></p>
								          <p class="opacity-low"><%=mdto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}else if(j%5==4){
                    %>
                       <td>
							<a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=mdto.getT_subject() %></p>
								          <p class="opacity-low"><%=mdto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}else{
                    %>
                       <td>
							<a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=mdto.getT_subject() %></p>
								          <p class="opacity-low"><%=mdto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}
                 }
            }
            %>
          </tr>
        <% } %>
   </table>
   </div>
    
    <div id="tabs-event" class="container tab-pane fade"><br>
      <p class="heading">축제</p>
      <br>
      <table class="tour" style="width: 500px;">
      	<%
        	List<TourDto> elist=dao.getAllCategory("event");
        for (int i = 0; i < elist.size(); i+=5) { 
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
            	TourDto edto=elist.get(j);
              if (j == i) { %>
                <td colspan="2" rowspan="2">
                  <!-- 이미지와 관광 정보 제목을 표시하며, 디테일 페이지로 이동할 수 있는 링크 -->
                  <a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                  <div class="gallery-image-lg">
                  	<div class="img-box-lg">
                    <img src="tour/image_tour/<%=edto.getT_image()%>" class="photo">
	                    <div class="transparent-box-lg">
					        <div class="caption">
					          <p><%=edto.getT_subject()%></p>
					          <p class="opacity-low"><%=edto.getT_subject_j() %></p>
					        </div>
					    </div>
                  	</div>
                  	</div>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    </tr>
                    <tr>
                        <td>
							<a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=edto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=edto.getT_subject() %></p>
								          <p class="opacity-low"><%=edto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}else if(j%5==4){
                    %>
                       <td>
							<a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=edto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=edto.getT_subject() %></p>
								          <p class="opacity-low"><%=edto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}else{
                    %>
                       <td>
							<a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
								<div class="gallery-image">
	                          	<div class="img-box">
	                            	<img src="tour/image_tour/<%=edto.getT_image()%>" class="photo">
	                            	<div class="transparent-box">
								        <div class="caption">
								          <p><%=edto.getT_subject() %></p>
								          <p class="opacity-low"><%=edto.getT_subject_j() %></p>
								        </div>
								    </div>
	                            </div>
								</div>
	                        </a>
                        </td>
                    <%}
                 }
            }
            %>
          </tr>
        <% } %>
   </table>
   </div>
</div>
</div>
</body>
</html>