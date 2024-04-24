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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>Insert title here</title>
<style type="text/css">
*{
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
	
}

.nav-tabs .nav-item {
	display: inline-block;
	margin-right: 10px; /* Adjust margin between tabs */
}

.nav-tabs .nav-link {
	padding: .5rem 1.5rem; /* Increase padding */
}

.container {
    position: relative;
    max-width: 1000px;
    margin: 0 auto;
}

.lili {
    z-index: 999;
}

.pencil {
    color: green;
}

.trash {
    color: red;
}

.write-btn {

    color: black;
    background-color: #eeeeee;
    border-color: #eeeeee;
    z-index: 100;
}

.write-btn:hover {
    background-color: gray; /* 마우스를 올렸을 때 배경색을 검정색으로 유지 */
    border-color: gray; /* 마우스를 올렸을 때 테두리 색상을 검정색으로 유지 */
}

.bi-pencil {
    color: blue;
}
</style>
<script type="text/javascript">
$(function(){     
    $("a.goDetail").click(function(){
        var h_num=$(this).attr("h_num");
        var h_category=$(this).attr("h_category");
        location.href="index.jsp?main=hotel/hoteldetailview.jsp?h_num="+h_num+"&h_category="+h_category;
    })
  
    $("a.goUpdate").click(function(){
        var h_num=$(this).attr("h_num");
        location.href="index.jsp?main=hotel/hotelupdateform.jsp?h_num="+h_num;
    })
});

function delfunc(h_num) {
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
            location.href = 'hotel/hoteldelete.jsp?h_num=' + h_num;
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
        <ul class="nav nav-tabs" role="tablist" style="margin-left: 0 auto;">
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
        
        
        <!--  -->
		<div class="d-inline-flex"
			style="margin-top: 10px; margin-bottom: -300px;">
         <a href="index.jsp?main=hotel/hotelmain.jsp"><i
            class="bi bi-grid-fill fs-2 lili" data-bs-container="body"
            data-bs-toggle="popover" data-bs-placement="top"
            data-bs-content="앨범형 보기"></i></a>
            
        <% if(loginok!=null && myid.equals("admin")) { %>
        <button style="margin-left: 820px;"  class="btn btn-outline-primary bt-sm write-btn"
            onclick="location.href='index.jsp?main=hotel/hoteladdform.jsp'">게시물 작성</button>
        <% } %>
		</div>

        <!-- Tab panes -->
        <div class="tab-content">
            <div id="tabs-total" class="container tab-pane active">
            <br>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">이미지</th>
                            <th scope="col">이름(한글)</th>
                            <th scope="col">이름(영문)</th>
                            <% if(loginok!=null && myid.equals("admin")) { %>
                            <th scope="col">관리자용</th>
                            <% } %>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int total_i=1;
                        for(HotelDto dto: list) {
                        %>
                        <tr style="vertical-align: middle;">
                            <td><%= total_i %></td>
                            <td><a h_num="<%=dto.getH_num()%>" style="cursor: pointer;"
                                    class="goDetail"> <img
                                        src="hotel/image_hotel/<%= dto.getH_image() %>" width="100"
                                        height="70">
                                </a></td>
                            <td><a h_num="<%=dto.getH_num()%>"
                                    style="cursor: pointer; text-decoration: none; color: black;"
                                    class="goDetail"> <%= dto.getH_content() %>
                                </a></td>
                            <td><a h_num="<%=dto.getH_num()%>"
                                    style="cursor: pointer; text-decoration: none; color: black;"
                                    class="goDetail"> <%= dto.getH_subject() %>
                                </a></td>
                            <% if(loginok!=null && myid.equals("admin")) { %>
                            <td><a h_num="<%=dto.getH_num()%>" style="cursor: pointer; text-decoration: none;"
                                    class="goUpdate"> <i class="bi bi-pencil-square fs-4 pencil"></i>
                                </a> <a style="cursor: pointer; text-decoration: none;"
                                    onclick="delfunc('<%=dto.getH_num()%>')"><i
                                        class="bi bi-trash fs-4 trash"></i></a></td>
                            <% } %>
                        </tr>
                        <% total_i++; } %>
                    </tbody>
                </table>
            </div>

            <div id="tabs-hotel" class="container tab-pane fade">
                <table class="table table-striped">
                <br>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">이미지</th>
                            <th scope="col">한글 이름</th>
                            <th scope="col">영어 이름</th>
                            <% if(loginok!=null && myid.equals("admin")) { %>
                            <th scope="col">관리자용</th>
                            <% } %>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int hotel_i=1;
                        for(HotelDto dto: list) {
                            if(dto.getH_category().equals("hotel")) {
                        %>
                        <tr style="vertical-align: middle;">
                            <td><%= hotel_i %></td>
                            <td><a h_num="<%=dto.getH_num()%>" style="cursor: pointer;"
                                    class="goDetail"> <img
                                        src="hotel/image_hotel/<%= dto.getH_image() %>" width="100"
                                        height="70">
                                </a></td>
                            <td><a h_num="<%=dto.getH_num()%>"
                                    style="cursor: pointer; text-decoration: none; color: black;"
                                    class="goDetail"> <%= dto.getH_content() %>
                                </a></td>
                            <td><a h_num="<%=dto.getH_num()%>"
                                    style="cursor: pointer; text-decoration: none; color: black;"
                                    class="goDetail"> <%= dto.getH_subject() %>
                                </a></td>
                            <% if(loginok!=null && myid.equals("admin")) { %>
                            <td><a h_num="<%=dto.getH_num()%>" style="cursor: pointer; text-decoration: none;"
                                    class="goUpdate"> <i class="bi bi-pencil-square fs-4 pencil"></i>
                                </a> <a style="cursor: pointer; text-decoration: none;"
                                    onclick="delfunc('<%=dto.getH_num()%>')"><i
                                        class="bi bi-trash fs-4 trash"></i></a></td>
                            <% } %>
                        </tr>
                        <% hotel_i++; } } %>
                    </tbody>
                </table>
            </div>

            <div id="tabs-ryokan" class="container tab-pane fade">
                <table class="table table-striped">
                <br>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">이미지</th>
                            <th scope="col">한글 이름</th>
                            <th scope="col">영어 이름</th>
                            <% if(loginok!=null && myid.equals("admin")) { %>
                            <th scope="col">관리자용</th>
                            <% } %>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int ryokan_i=1;
                        for(HotelDto dto: list) {
                            if(dto.getH_category().equals("ryokan")) {
                        %>
                        <tr style="vertical-align: middle;">
                            <td><%= ryokan_i %></td>
                            <td><a h_num="<%=dto.getH_num()%>" style="cursor: pointer;"
                                    class="goDetail"> <img
                                        src="hotel/image_hotel/<%= dto.getH_image() %>" width="100"
                                        height="70">
                                </a></td>
                            <td><a h_num="<%=dto.getH_num()%>"
                                    style="cursor: pointer; text-decoration: none; color: black;"
                                    class="goDetail"> <%= dto.getH_content() %>
                                </a></td>
                            <td><a h_num="<%=dto.getH_num()%>"
                                    style="cursor: pointer; text-decoration: none; color: black;"
                                    class="goDetail"> <%= dto.getH_subject() %>
                                </a></td>
                            <% if(loginok!=null && myid.equals("admin")) { %>
                            <td><a h_num="<%=dto.getH_num()%>" style="cursor: pointer; text-decoration: none;"
                                    class="goUpdate"> <i class="bi bi-pencil-square fs-4 pencil"></i>
                                </a> <a style="cursor: pointer; text-decoration: none;"
                                    onclick="delfunc('<%=dto.getH_num()%>')"><i
                                        class="bi bi-trash fs-4 trash"></i></a></td>
                            <% } %>
                        </tr>
                        <% ryokan_i++; } } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>