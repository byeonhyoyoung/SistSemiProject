<%@page import="data.dto.FoodDto"%>
<%@page import="data.dao.FoodDao"%>
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

String realPath = getServletContext().getRealPath("/food/image_food");
System.out.println(realPath);

int uploadSize = 1024 * 1024 * 3;//3mb

MultipartRequest multi = null;

try {
   multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());

      String f_num = multi.getParameter("f_num");
      String f_subject_k=multi.getParameter("f_subject_k");
       String f_subject=multi.getParameter("f_subject");
       String f_location=multi.getParameter("f_location");
       String f_link=multi.getParameter("f_link");
       String f_time=multi.getParameter("f_time");
       String f_holiday=multi.getParameter("f_holiday");
       String f_menu=multi.getParameter("f_menu");
       String f_googlemap=multi.getParameter("f_googlemap");
       String f_content=multi.getParameter("f_content");
       
       String f_image=multi.getFilesystemName("f_image");
       
       System.out.println(f_image);

   
   //기존 포토명 가져오기
   FoodDao dao = new FoodDao();
   String old_photoname = dao.getFood(f_num).getF_image();
   
   
   
   //dto에 저장
   FoodDto dto = dao.getFood(f_num);

    dto.setF_subject(f_subject);
    dto.setF_subject_k(f_subject_k);
    dto.setF_location(f_location);
    dto.setF_content(f_content);
    dto.setF_link(f_link);
    dto.setF_time(f_time);
    dto.setF_holiday(f_holiday);
    dto.setF_menu(f_menu);
    dto.setF_googlemap(f_googlemap);
   //사진선택을 안하면 예전 사진 그대로 사용하겠다는 의미
   dto.setF_image(f_image == null?old_photoname:f_image);

   //update
   dao.updateFood(dto);
   

   //방명록 목록으로 이동(수정했던 페이지로 이동해야한다.)
   response.sendRedirect("../index.jsp?main=food/foodmainlist.jsp");

} catch (Exception e) {

}
%>


<body>

</body>
</html>