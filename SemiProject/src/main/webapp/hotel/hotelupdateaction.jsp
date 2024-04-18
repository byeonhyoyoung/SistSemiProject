<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
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

<%

//String myid = (String) session.getAttribute("myid");

String realPath = getServletContext().getRealPath("/hotel/image_hotel");
System.out.println(realPath);

int uploadSize = 1024 * 1024 * 3;//3mb

MultipartRequest multi = null;

try {
   multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());

       String h_num=multi.getParameter("h_num");
       String h_subject =multi.getParameter("h_subject");
       String h_content=multi.getParameter("h_content");
       String h_location=multi.getParameter("h_location");
       String h_link=multi.getParameter("h_link");
       String h_category=multi.getParameter("h_category");
       String h_googlemap=multi.getParameter("h_googlemap");
       
       String h_image=multi.getFilesystemName("h_image");
       
       System.out.println(h_image);

   
   //기존 포토명 가져오기
   HotelDao dao = new HotelDao();
   String old_photoname = dao.getHotel(h_num).getH_image();
   
   
   
   //dto에 저장
    HotelDto dto = dao.getHotel(h_num);

    dto.setH_subject(h_subject);
    dto.setH_content(h_content);
    dto.setH_location(h_location);
    dto.setH_link(h_link);
    dto.setH_category(h_category);
    dto.setH_googlemap(h_googlemap);
   
   //사진선택을 안하면 예전 사진 그대로 사용하겠다는 의미
   dto.setH_image(h_image == null?old_photoname:h_image);

   //update
   dao.updateHotel(dto);
   

   //방명록 목록으로 이동(수정했던 페이지로 이동해야한다.)
   response.sendRedirect("../index.jsp?main=hotel/hotelmainlist.jsp");

} catch (Exception e) {

}
%>


<body>

</body>
</html>