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
<link rel="stylesheet" href="tour_menu_design_2/dist/style.css">
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
   }

   a:hover {
      text-decoration: underline;
      color: gray;
   }
   
   /* 검색기능 css */
   .searching {
      width: 250px; 
      height: 45px; 
      border:1px solid rgb(25,206,96);  
      position:relative;
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
     border-color: rgb(25,206,96);
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
    $(document).on("click", "a.goDetail", function(e){
        var t_num = $(this).attr("t_num");
        var t_category = $(this).attr("t_category");
        //alert(t_num);
        //디테일 페이지로 이동
        location.href = "index.jsp?main=tour/tourdetailview.jsp?t_num=" + t_num + "&t_category=" + t_category;
     });
    
    //검색기능
    $("button.search").click(function(){
    	
    	var keyword=$("#keyword").val();
    	var category=$("#category").val();
    	//alert(keyword+","+category);
    	$.ajax({
    		type:"get",
    		url:"tour/search.jsp",
    		data:{"keyword":keyword, "category":category},
    		dataType:"json",
    		success:function(res){
    			//console.log(res); // 콘솔에서 응답 확인
    			var s="<table style='width: 500px;margin: 20px;'><tr>";
    			$.each(res, function(i, ele){
    				// 새로운 행을 시작 (짝수 인덱스에서)
                	if (i % 2 === 0 && i !== 0) { // 첫 번째 행에서 <tr> 태그를 삽입하지 않도록 변경
                        s += "<tr>";
                    }
    				s+="<td><a t_num='"+ele.t_num+"' t_category='"+ele.t_category+"' style='cursor: pointer; color: white;' class='goDetail' style='margin-left: 50px; margin-right: -10px;'>";
    				s+="<div class='gallery-image-lg'>";
    				s+="<div class='img-box-lg'>";
    				s+="<img src='tour/image_tour/"+ele.t_image+"' class='photo'>";
    				s+="<div class='transparent-box-lg'>";	
    				s+="<div class='caption'>";
    				s+="<p>"+ele.t_subject+"</p>";
    				s+="<p class='opacity-low'>"+ele.t_subject_j+"</p>";
                    s+="</div></div></div></div></a></td>"
                   
	               	// 행을 닫음 (홀수 인덱스에서 또는 배열의 마지막 요소에서)
	               	if (i % 2 === 1 || i === res.length - 1) {
	                	s += "</tr>";
	                }
    			})
    			s+="</table>";
    			$("div.searchlist").html(s);
    			
    			$("#tabs-total").hide();
    			$("#tabs-sawon").hide();
    			$("#tabs-mus").hide();
    			$("#tabs-event").hide();
    			
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
	<br>
  <!-- tab panes -->
  <div class="tab-content">
  
  <!-- 검색기능 -->
  	<div class="d-inline-flex">
      <button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=tour/addform.jsp'"
      style="margin-left: 20px;">등록</button>
      <button type="button" class="btn btn-outline-info" onclick="location.href='index.jsp?main=tour/tourlist.jsp'">목록</button>
      <select name="category" id="category" style="margin-left: 780px;">
      	<option class="option" style="text-align: center;" value="sawon">사원</option>
      	<option class="option" style="text-align: center;" value="mus">박물관</option>
      	<option class="option" style="text-align: center;" value="event">축제</option>
      </select>
	  <div class="searching">
		<input type="text" name="keyword" id="keyword" placeholder="검색하세요." maxlength="10">
		<button type="button" class="search"><i class="bi bi-search searchicon"></i></button>
	  </div>
    </div>
    <div class="searchlist"></div>
      
    <div id="tabs-total" class="container tab-pane active">
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
                  <div class="gallery-image-lg" style="z-index: 999;">
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
   
    <div id="tabs-sawon" class="container tab-pane fade">
      <table class="tour" style="width: 500px;">
      	<% 
        	List<TourDto> slist=dao.getAllCategory("sawon");
        for (int i = 0; i <slist.size(); i+=5) {
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < slist.size(); j++) {
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
   
    <div id="tabs-mus" class="container tab-pane fade">
      <table class="tour" style="width: 500px;">
      	<% 
        	List<TourDto> mlist=dao.getAllCategory("mus");
        for (int i = 0; i < mlist.size(); i+=5) {
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < mlist.size(); j++) {
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
    
    <div id="tabs-event" class="container tab-pane fade">
      <table class="tour" style="width: 500px;">
      	<%
        	List<TourDto> elist=dao.getAllCategory("event");
        for (int i = 0; i < elist.size(); i+=5) { 
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < elist.size(); j++) {
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