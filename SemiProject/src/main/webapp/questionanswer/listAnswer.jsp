<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.QuestionAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.QuestionAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String q_num=request.getParameter("q_num");
	QuestionAnswerDao dao=new QuestionAnswerDao();
	List<QuestionAnswerDto> list=dao.getAnswerList(q_num);
	
	JSONArray arr=new JSONArray();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	for(QuestionAnswerDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("qa_idx", dto.getQa_idx());
		ob.put("qa_num", dto.getQa_num());
		ob.put("qa_writer", dto.getQa_writer());
		ob.put("qa_content", dto.getQa_content());
		ob.put("qa_writeday", sdf.format(dto.getQa_writeday()));
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>