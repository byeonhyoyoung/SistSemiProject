<%@page import="data.dto.TourDto"%>
<%@page import="data.dao.TourDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
</head>
<body>
<%
   //업로드할 경로
   String uploadPath=getServletContext().getRealPath("/save");
   System.out.println(uploadPath);
   //업로드할 사이즈
   int uploadSize=1024*1024*5;
    
    MultipartRequest multi=null;
    
    try{
       multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
       
       String t_category=multi.getParameter("t_category");
       String t_subject=multi.getParameter("t_subject");
       String t_subject_j=multi.getParameter("t_subject_j");
       String t_content=multi.getParameter("t_content");
       String t_image=multi.getFilesystemName("t_image");
       String t_location=multi.getParameter("t_location");
       String t_link=multi.getParameter("t_link");
       String t_time=multi.getParameter("t_time");
       String t_tel=multi.getParameter("t_tel");
       String t_price=multi.getParameter("t_price");
       String t_googlemap=multi.getParameter("t_googlemap");
       
       TourDao dao=new TourDao();
       
       //dto에 데이터담기
       TourDto dto=new TourDto();
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
       
       //db에 추가
       dao.insertTour(dto);
       
       //다시 addform으로 이동
       response.sendRedirect("../index.jsp?main=tour/tourlist.jsp");
       
    }catch(Exception e){
    }
%>
</body>
</html>