<%@page import="data.dao.HotelDao"%>
<%@page import="data.dto.HotelDto"%>
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
    String uploadPath=getServletContext().getRealPath("/hotel/image_hotel");
    System.out.println(uploadPath);
    
    //업로드할사이즈
    int uploadSize=1024*1024*5;//5mb
    
   
    
    try{
    	MultipartRequest multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
       
       String h_subject=multi.getParameter("h_subject");
       String h_content=multi.getParameter("h_content");
      
       String h_location=multi.getParameter("h_location");
       String h_link=multi.getParameter("h_link");
       String h_category=multi.getParameter("h_category");
       String h_googlemap=multi.getParameter("h_googlemap");
       
       
       String h_image=multi.getFilesystemName("h_image");
       
       System.out.println(h_image);
       
       //dao
       HotelDao dao=new HotelDao();
       
       //dto에 데이타담기
       HotelDto dto=new HotelDto();
       dto.setH_subject(h_subject);
       dto.setH_content(h_content);
       dto.setH_image(h_image);
       dto.setH_location(h_location);
       dto.setH_link(h_link);
       dto.setH_category(h_category);
       dto.setH_googlemap(h_googlemap);
       
       //db에추가
       dao.insertHotel(dto);
       
       //다시 상품품으로 이동
       response.sendRedirect("../index.jsp?main=hotel/hoteladdform.jsp");
    
    }catch(Exception e){
       
    }
%>
</body>
</html>