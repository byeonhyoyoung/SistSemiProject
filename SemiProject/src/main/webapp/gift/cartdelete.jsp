<%@page import="data.dao.GiftDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String idx=request.getParameter("idx");
    GiftDao dao=new GiftDao();
    dao.deleteCart(idx);
%>