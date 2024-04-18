<%@page import="data.dto.GiftDto"%>
<%@page import="data.dao.GiftDao"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>상품 상세 정보</title>
<style type="text/css">
    img.large {
        margin: 10px 0;
        width: 400px;
        height: auto; 
        transition: transform 0.3s ease-in-out; /* 호버 효과를 위한 transition */
    }

    img.large:hover {
        transform: scale(1.05); /* 호버 시 이미지 크기 조정 */
    }

    .product-info {
        margin-top: 20px;
    }

    .product-info h4 {
        font-family: 'Noto Sans KR', sans-serif;
        margin-bottom: 10px;
    }

    .product-info h4.price {
        color: #007bff;
    }

    .product-info p {
        margin-bottom: 20px;
    }

    .btn-group {
        margin-top: 20px;
    }
</style>
</head>
<%
   String g_num=request.getParameter("g_num");
   String loginok=(String)session.getAttribute("loginok");
   String myid=(String)session.getAttribute("myid");
   //아이디에 해당하는 멤버 시퀀스
   SemiMemberDao mdao=new SemiMemberDao();

   //해당상품에대한 데이타
   GiftDao sdao=new GiftDao();
   GiftDto dto=sdao.getGift(g_num);
   
   NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
   <div style="margin: 0px auto; width: 1000px;">
      <form id="frm" >

         <!-- hidden: 장바구니 db에 넣어야 할것 -->
         <input type="hidden" name="g_num" value="<%=g_num%>">
      

         <table class="table">
            <tr>
               <td style="width: 500px;">
                  <img alt="" src="gift/image_gift/<%=dto.getG_image_1()%>" class="large img-thumbnail">
                  <img alt="" src="gift/image_gift/<%=dto.getG_image_2()%>" class="large img-thumbnail">
               </td>
               <td style="width: 500px; padding-top: 50px;" class="product-info">
                  <h4>상품명: <%=dto.getG_name() %></h4>
                  <h6>"<%=dto.getG_subject() %>"</h6>
                  <h4 class="price">가격: <%=nf.format(Integer.parseInt(dto.getG_price())*1.15) %></h4>
                  <p><%=dto.getG_content()%></p>
                  <!-- 갯수 -->
                  <h4>갯수: <input type="number" min="1" max="10" value="1" step="1" name="cnt"></h4>

                  <div class="btn-group">
                     <button type="button" class="btn btn-info" style="background: pink; border: pink; color: white;" id="btncart">장바구니</button>
                     <button type="button" class="btn btn-success" style="background: gray; border: gray; color: white;" onclick="location.href='index.jsp?main=gift/giftmain.jsp'">상품목록</button>
                  </div>
               </td>
            </tr>
         </table>
      </form>

      <script type="text/javascript">
      $("#btncart").click(function(){
          var login = "<%=loginok%>";
          
          if(login == "null"){
              alert("먼저 로그인을 해주세요");
              return;
          }
          
          // Form data serialization
          var cartdata = $("#frm").serialize();
          
          // Log serialized data to console for debugging
          console.log(cartdata);
          
          // AJAX request to insert data
          $.ajax({
              type: "post",
              dataType: "html",
              data: cartdata,
              url: "shop/detailprocess.jsp",
              success: function(){
                  // Confirmation message
                  var a = confirm("장바구니에 저장하였습니다.\n장바구니로 이동하려면 [확인]을 눌려주세요.");
                  if(a){
                      // Redirect to mycart.jsp
                      location.href = "index.jsp?main=shop/mycart.jsp";
                  }
              }
          });
      });

      </script>

   </div>
</body>
</html>
