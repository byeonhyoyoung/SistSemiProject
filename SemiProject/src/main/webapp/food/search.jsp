<%@page import="data.dto.FoodDto"%>
<%@page import="data.dao.FoodDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword=request.getParameter("keyword");
	String category=request.getParameter("category");
	
	if (keyword == null) keyword = ""; // null 값 처리
    if (category == null) category = ""; // null 값 처리
    
	FoodDao dao=new FoodDao();
	List<FoodDto> list=dao.searchFoods(keyword, category);
	
	JSONArray arr=new JSONArray();
	for(FoodDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("f_num", dto.getF_num());
		ob.put("f_subject", dto.getF_subject());
		ob.put("f_subject_k", dto.getF_subject_k());
		ob.put("f_content", dto.getF_content());
		ob.put("f_image", dto.getF_image());
		ob.put("f_location", dto.getF_location());
		ob.put("f_link", dto.getF_link());
		ob.put("f_time", dto.getF_time());
		ob.put("f_holiday", dto.getF_holiday());
		ob.put("f_menu", dto.getF_menu());
		ob.put("f_googlemap", dto.getF_googlemap());
		ob.put("f_writeday", dto.getF_writeday().toString());
		ob.put("f_category", dto.getF_category());
		
		arr.add(ob);
	} 
%>
<%=arr.toString()%>