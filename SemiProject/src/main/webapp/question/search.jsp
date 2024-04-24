<%@page import="data.dao.QuestionDao"%>
<%@page import="data.dto.QuestionDto"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    
	QuestionDao dao=new QuestionDao();
	List<QuestionDto> list=dao.searchQuestions(keyword, category);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
	
	JSONArray arr=new JSONArray();
	for(QuestionDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("q_num", dto.getQ_num());
		ob.put("q_writer", dto.getQ_writer());
		ob.put("q_subject", dto.getQ_subject());
		ob.put("q_content", dto.getQ_content());
		ob.put("q_image", dto.getQ_image());
		ob.put("q_likes", dto.getQ_likes());
		ob.put("q_readcount", dto.getQ_readcount());
		ob.put("q_writeday", sdf.format(dto.getQ_writeday()).toString());
		
		arr.add(ob);
	} 
%>
<%=arr.toString()%>