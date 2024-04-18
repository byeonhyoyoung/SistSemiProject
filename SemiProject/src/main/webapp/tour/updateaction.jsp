<%@page import="data.dao.TourDao"%>
<%@page import="data.dto.TourDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*5;
	
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
		String t_num=multi.getParameter("t_num");
		String t_category=multi.getParameter("t_category");
		String t_subject=multi.getParameter("t_subject");
		String t_subject_j=multi.getParameter("t_subject_j");
		String t_content=multi.getParameter("t_content");
		String t_image=multi.getParameter("t_image");
		String t_location=multi.getParameter("t_image");
		String t_link=multi.getParameter("t_link");
		String t_time=multi.getParameter("t_time");
		String t_tel=multi.getParameter("t_tel");
		String t_price=multi.getParameter("t_price");
		String t_googlemap=multi.getParameter("t_googlemap");
		
		//기존포토명 가져오기
		TourDao dao=new TourDao();
		String old_image=dao.getTour(t_num).getT_image();
		
		//dto에 저장
		TourDto dto=new TourDto();
		dto.setT_num(t_num);
		dto.setT_category(t_category);
       	dto.setT_subject(t_subject);
       	dto.setT_subject_j(t_subject_j);
      	dto.setT_content(t_content);
      	dto.setT_image(t_image);
       	dto.setT_location(t_location);
       	dto.setT_link(t_link);
       	dto.setT_time(t_time);
       	dto.setT_tel(t_tel);
       	dto.setT_price(t_price);
       	dto.setT_googlemap(t_googlemap);   
		
		//사진선택 안하면 기존 사진으로 저장
		dto.setT_image(t_image==null?old_image:t_image);
		
		dao.updateTour(dto);
		
		//방명록 목록으로 이동
		response.sendRedirect("../index.jsp?main=tour/tourlist.jsp");
		
	}catch(Exception e){
	}
%>
</body>
</html>