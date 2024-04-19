<%@page import="data.dto.SemiMemberDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="data.dao.PaymentDao"%>
<%@page import="data.dto.PaymentDto"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>결제 내역</title>
</head>
<body>
<div class="container mt-3">
    <p class="heading">결제 내역</p>

    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">결제번호</th>
                <th scope="col">결제일</th>
            
            </tr>
        </thead>
        <tbody>
            <% 
            // 세션에서 로그인된 사용자 ID 가져오기
            String id = (String) session.getAttribute("myid");
            SemiMemberDao sdao = new SemiMemberDao();
            SemiMemberDto sdto = sdao.getMemberById(id);
            String num = sdto.getNum();
            
            // PaymentDao 인스턴스 생성
            PaymentDao dao = new PaymentDao();

            // 해당 회원의 결제 목록 가져오기
            List<PaymentDto> list = dao.getAllPaymentsGroupedByDate();

            // Map을 사용하여 중복된 결제일을 제거
            Map<String, PaymentDto> uniquePayments = new HashMap<>();
            for (PaymentDto pdto : list) {
                if (pdto.getNum().equals(num)) {
                    // 중복된 결제일이 없으면 해당 결제 정보를 Map에 추가
                    if (!uniquePayments.containsKey(pdto.getPayment_date().toString())) {
                        uniquePayments.put(pdto.getPayment_date().toString(), pdto);
                    }
                }
            }

            // 표에 결제 정보 출력
            int index = 1;
            for (PaymentDto pdto : uniquePayments.values()) {
             %>
                <tr>
                    <td><%= index++ %></td>
                    <td><a href="index.jsp?main=gift/paymentdetaillist.jsp?num=<%=num %>&payment_date=<%=pdto.getPayment_date()  %>"><%= pdto.getPayment_date() %></a><td>
       
                </tr>
            <% } %>
        </tbody>
    </table>
    
    
</div>
</body>
</html>
