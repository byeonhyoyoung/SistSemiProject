<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
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
    
	HotelDao dao=new HotelDao();
	List<HotelDto> list=dao.searchHotels(keyword, category);
	
	JSONArray arr=new JSONArray();
	for(HotelDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("h_num", dto.getH_num());
		ob.put("h_subject", dto.getH_subject());
		ob.put("h_content", dto.getH_content());
		ob.put("h_image", dto.getH_image());
		ob.put("h_location", dto.getH_location());
		ob.put("h_link", dto.getH_link());
		ob.put("h_writeday", dto.getH_writeday().toString());
		ob.put("h_category", dto.getH_category());
		ob.put("h_googlemap", dto.getH_googlemap());
		
		arr.add(ob);
	} 
%>
<%=arr.toString()%>