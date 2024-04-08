<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.ReviewAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String r_num=request.getParameter("r_num");
	ReviewAnswerDao dao=new ReviewAnswerDao();
	List<ReviewAnswerDto> list=dao.getAnswerList(r_num);
	
	JSONArray arr=new JSONArray();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	for(ReviewAnswerDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("ra_idx", dto.getRa_idx());
		ob.put("ra_num", dto.getRa_num());
		ob.put("ra_writer", dto.getRa_writer());
		ob.put("ra_content", dto.getRa_content());
		ob.put("ra_writeday", sdf.format(dto.getRa_writeday()));
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>