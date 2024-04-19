<%-- <%@page import="java.sql.Timestamp"%>
<%@page import="data.dao.PaymentDao"%>
<%@page import="data.dto.PaymentDto"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway:600,900" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>식당 메뉴</title>
<style type="text/css">
  .container {
    position: relative;
    max-width: 1000px;
    margin: 0 auto;
  }
  .lili {
    position: absolute;
    top: 50px;
    right: 50px;
    z-index: 999;
  }
  .pencil {
    color: green;
  }
  .trash {
    color: red;
  }
  .write-btn {
  
  position: absolute;
  top: 50px;
  left: 10px;
  color: black;
  background-color: #eeeeee;
  border-color: #eeeeee;

  }
  .write-btn:hover {
    background-color: gray; /* 마우스를 올렸을 때 배경색을 검정색으로 유지 */
    border-color: gray; /* 마우스를 올렸을 때 테두리 색상을 검정색으로 유지 */
  }
  
  
  .bi-pencil{
  color: blue;
  }

</style>
</head>
 <script type="text/javascript">
$(function(){
    
    
    $("a.goDetail").click(function(){
       var f_num=$(this).attr("f_num");
       
       //디테일 페이지로 이동
       location.href="index.jsp?main=food/fooddetailview.jsp?f_num="+f_num;
    })
    
    
     $("a.goUpdate").click(function(){
       var f_num=$(this).attr("f_num");
       
       //디테일 페이지로 이동
       location.href="index.jsp?main=food/foodupdateform.jsp?f_num="+f_num;
    })
 });

function delfunc(f_num) {
    Swal.fire({
        title: "정말로 삭제하시겠습니까?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
    }).then((result) => {
        if (result.isConfirmed) {
            // Perform deletion here
            location.href = 'food/fooddelete.jsp?f_num=' + f_num;
            
            
                Swal.fire({
                  title: "삭제됨!",
                  text: "해당 데이터가 삭제되었습니다.",
                  icon: "success"
                });
           
        }
    });
}

</script>
<%

 
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  
  //로그인 세션얻기
  String loginok=(String)session.getAttribute("loginok");
  
  //아이디얻기
  String id=(String)session.getAttribute("myid");
  
  
  PaymentDao dao=new PaymentDao();

  //PaymentDto dto= dao.getPayment(id);
  
  //Timestamp paymenttime= dto.getPayment_date();
 
  //List<PaymentDto> list=dao.getAllPaymentsGroupedByDate(paymenttime);
  
  SemiMemberDao sdao=new SemiMemberDao();
  String name=sdao.getName(id);
  
%>

<body>
<div class="container mt-3" align="center">
  <p class="heading">결제 내역</p>
  

  
  <a href="index.jsp?main=food/foodmain.jsp"><i class="bi bi-grid-fill fs-2 lili" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="앨범형 보기"></i></a>
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">결제일</th>
        
      </tr>
    </thead>
    <tbody>
      <% 
        int i=1;
        for(PaymentDto a: list) {
      %>
        <tr style="vertical-align: middle;">
          <td><%= i %></td>           
          
          <td>
           <a  style="cursor: pointer;" class="goDetail" >
         
          </a>
          </td>
          <td>

          
          
        </tr>
      <% i++; } %>
      
          </tbody>
  </table>
</div>

</body>
</html>
       --%>