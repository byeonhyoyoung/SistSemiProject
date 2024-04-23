<%@ page import="java.io.PrintWriter" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	String keyword=request.getParameter("keyword");
	String category=request.getParameter("category");
	
	if (keyword == null) keyword = ""; // null 값 처리
    //if (category == null) category = ""; // null 값 처리
    
	ReviewDao dao=new ReviewDao();
	List<ReviewDto> list=dao.searchReviews(keyword, category);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
	
	JSONArray arr=new JSONArray();
	for(ReviewDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("r_num", dto.getR_num());
		ob.put("r_writer", dto.getR_writer());
		ob.put("r_subject", dto.getR_subject());
		ob.put("r_content", dto.getR_content());
		ob.put("r_image", dto.getR_image());
		ob.put("r_likes", dto.getR_likes());
		ob.put("r_readcount", dto.getR_readcount());
		ob.put("r_writeday", sdf.format(dto.getR_writeday()).toString());
		
		arr.add(ob);
	} 
%>
<%=arr.toString()%>
