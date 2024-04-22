<%@page import="data.dao.GiftDao"%>
<%@page import="data.dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");

   String g_num=request.getParameter("g_num");
   String num=request.getParameter("num");
   int cnt= Integer.parseInt(request.getParameter("cnt"));
   
   GiftDao dao=new GiftDao();
   CartDto dto=new CartDto();
   
   dto.setG_num(g_num);
   dto.setNum(num);
   dto.setCnt(cnt);
   
   dao.insertCart(dto);
%>