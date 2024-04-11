<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.NotiDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.NotiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
 	String searchKeyword=request.getParameter("searchKeyword");
	
  	NotiDao dao=new NotiDao();
  	List<NotiDto> list=dao.getSearch(searchKeyword);
  	
	JSONArray arr=new JSONArray();
	
	for(NotiDto dto:list){
		JSONObject ob =new JSONObject();
		ob.put("n_num", dto.getN_num());
		ob.put("n_writer", dto.getN_writer());
		ob.put("n_subject", dto.getN_subject());
		ob.put("n_content", dto.getN_content());
		ob.put("n_juje", dto.getN_juje());
		ob.put("n_readcount", dto.getN_readcount());
		ob.put("n_writeday", dto.getN_writeday());
		
		arr.add(ob);	
	}
%>
<%=arr.toString()%>