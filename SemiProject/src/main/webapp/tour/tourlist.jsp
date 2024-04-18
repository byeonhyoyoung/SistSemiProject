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
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
	i.bi{
		cursor: pointer;
	}

</style>
<script type="text/javascript">
	
</script>
</head>
<%
	TourDao dao=new TourDao();
	List<TourDto> list=dao.getAllTour();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<div style="margin: 0 auto; width: 1000px;">
	
		<h6 class="alert alert-dark" style="width: 200px; height: 50px"><b><%=list.size() %>개</b>의 글이 있습니다</h6>
		<table class="table table-bordered">
			<caption align="top"><b>글 목록</b></caption>
			<button type="button" style="width: 100px; float: right; margin-bottom: -50px;"
			onclick="location.href='index.jsp?main=tour/addform.jsp'" class="btn btn-success">글쓰기</button>
			<tr class="table-dark">
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
							<i class="bi bi-pencil-square fs-3" style="color: green;"
							onclick="location.href='index.jsp?main=tour/updateform.jsp?t_num=<%=dto.getT_num() %>'"></i>&nbsp;
							<i class="bi bi-trash fs-3" style="color: red;"
							onclick="location.href='tour/deleteaction.jsp?t_num=<%=dto.getT_num() %>'"></i>
						</td>
					</tr>
				<%}
			%>
		</table>
	</div>
</body>
</html>