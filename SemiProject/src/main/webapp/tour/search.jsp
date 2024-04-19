<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourDao"%>
<%@page import="data.dto.TourDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword=request.getParameter("keyword");
	String category=request.getParameter("category");
	
	if (keyword == null) keyword = ""; // null 값 처리
    if (category == null) category = ""; // null 값 처리
    
	TourDao dao=new TourDao();
	List<TourDto> list=dao.searchTours(keyword, category);
	
	JSONArray arr=new JSONArray();
	for(TourDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("t_num", dto.getT_num());
		ob.put("t_category", dto.getT_category());
		ob.put("t_subject", dto.getT_subject());
		ob.put("t_subject_j", dto.getT_subject_j());
		ob.put("t_content", dto.getT_content());
		ob.put("t_image", dto.getT_image());
		ob.put("t_location", dto.getT_location());
		ob.put("t_link", dto.getT_link());
		ob.put("t_time", dto.getT_time());
		ob.put("t_tel", dto.getT_tel());
		ob.put("t_price", dto.getT_price());
		ob.put("t_googlemap", dto.getT_googlemap());
		ob.put("t_writeday", dto.getT_writeday().toString());
		
		arr.add(ob);
	} 
%>
<%=arr.toString()%>