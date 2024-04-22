<%@page import="data.dao.GiftDao"%>
<%@page import="java.io.Console"%>
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
<%
String num = request.getParameter("num");
String payment_date = request.getParameter("payment_date");

int totalPay = 0;

%>

<head>

<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>결제 내역</title>
<style type="text/css">
    .container {
        position: relative;
    }
    .total-payment {
        position: absolute;
        bottom: 0;
        right: 0;
        margin-bottom: 20px; /* Optional: Adjust margin as needed */
    }
</style>
</head>
<body>
<div class="container mt-3">
    <p class="heading"><%=payment_date %> 결제 내역</p>

    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">상품번호</th>
                <th scope="col">상품명</th>
                <th scope="col">상품이미지</th>
                <th scope="col">상품가격</th>
                <th scope="col">갯수</th>
                <th scope="col">총계</th>
            </tr>
        </thead>
        <tbody>
            <% 
            // 세션에서 로그인된 사용자 ID 가져오기
            String id = (String) session.getAttribute("myid");
            SemiMemberDao sdao = new SemiMemberDao();
            SemiMemberDto sdto = sdao.getMemberById(id);
            
           GiftDao gdao = new GiftDao();
       
           //GiftDto gdto = gdao.getGift(g_num);
        
           
            // PaymentDao 인스턴스 생성
            PaymentDao dao = new PaymentDao();

            // 해당 회원의 결제 목록 가져오기
            List<PaymentDto> list = dao.getAllPaymentsGroupedByDate();

           

            // 표에 결제 정보 출력
            int index = 1;
      
            for (PaymentDto pdto : list) {
               int hap = 0;
               if (pdto.getNum().equals(num) &&  (pdto.getPayment_date().equals(payment_date) ||
                      pdto.getPayment_date().getTime() == Timestamp.valueOf(payment_date).getTime())) {
  
                    
             %>
                    <tr>
                        <td><%= index++ %></td>  
                        <td><%= pdto.getG_num() %></td>
                        <td><%= gdao.getGift(pdto.getG_num()).getG_name() %></td>
                        <td><img src="gift/image_gift/<%= gdao.getGift(pdto.getG_num()).getG_image_1()%>" height="60px;"></td>
                        <td><%= gdao.getGift(pdto.getG_num()).getG_price() %>원</td>
                        <td><%= pdto.getCnt() %>개</td>
                        
                        <%
                        hap = pdto.getCnt()* Integer.parseInt(gdao.getGift(pdto.getG_num()).getG_price());
                        totalPay += hap;
                        %>
                        
                        <td><%=hap  %>원</td>
                    </tr>
                    <%
                }}
            %>
            
        </tbody>
    </table>
    <div class="button-container">
        <button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=gift/paymentlist.jsp'">결제 내역 목록으로</button>
        <div class="total-payment" style="margin-right: 30px; color: red; font-size: 20pt;">총합계: <%=totalPay %>원</div>
    </div>
</div>
</body>
</html>