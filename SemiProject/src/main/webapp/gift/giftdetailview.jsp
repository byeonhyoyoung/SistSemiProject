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
<link 
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="gift_menu_design/dist/style.css">
<title>상품 상세 정보</title>
<style type="text/css">
* {
	font-family: 'Noto Sans KR';
}

img.large {
	margin: 10px 0;
	width: 300px;
	height: auto;
	transition: transform 0.3s ease-in-out; /* 호버 효과를 위한 transition */
}

img.large:hover {
	transform: scale(1.05); /* 호버 시 이미지 크기 조정 */
}

.product-info {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	padding-left: 20px;
}

.product-info h4 {
	font-family: 'Noto Sans KR';
	margin-bottom: 10px;
}

.product-info h4.price {
	color: #007bff;
}

.product-info p {
	margin-bottom: 20px;
}
</style>
</head>
<%
   String g_num=request.getParameter("g_num");
   String loginok=(String)session.getAttribute("loginok");
   String myid=(String)session.getAttribute("myid");
   //아이디에 해당하는 멤버 시퀀스
   SemiMemberDao mdao=new SemiMemberDao();
   String num=mdao.getNum(myid);
   
   //해당상품에대한 데이타
   GiftDao sdao=new GiftDao();
   GiftDto dto=sdao.getGift(g_num);
   
   NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
	<div style="margin: 0px auto; width: 1000px; position: relative;">

		<form id="frm">

			<!-- hidden: 장바구니 db에 넣어야 할것 -->
			<input type="hidden" name="g_num" value="<%=g_num%>"> <input
				type="hidden" name="num" value="<%=num%>">

			<table class="table" style="margin-top: 100px;">
				<tr>
					<td style="width: 500px;">

						<div class="col-md-6" style="padding-top: 0px;">
							<div style="color: gray">
								<a style="color: gray; text-decoration: none;" href="#">Food
									></a> <a style="color: gray; text-decoration: none;"
									href="index.jsp?main=gift/giftmain.jsp">Store</a>

							</div>


						</div>


						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel" data-bs-interval="2000">
							<!-- Add data-bs-interval attribute for automatic sliding every 2 seconds -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="gift/image_gift/<%=dto.getG_image_1()%>"
										class="d-block w-100" alt="Image 1">
								</div>
								<div class="carousel-item">
									<img src="gift/image_gift/<%=dto.getG_image_2()%>"
										class="d-block w-100" alt="Image 2">
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</td>
					<td style="width: 500px;" class="product-info">
						<h3><%=dto.getG_name() %></h3>
						<hr>
						<h6><%=dto.getG_subject() %></h6>
						<h5 class="product-old-price"
							style="color: gray; text-decoration: line-through;"><%=nf.format(Integer.parseInt(dto.getG_price())*1.15) %></h5>
						<h4 class="price"><%=nf.format(Integer.parseInt(dto.getG_price())*1.0) %></h4>

						<hr>
						<p><%=dto.getG_content()%></p> <!-- 갯수 --> <input type="number"
						min="1" max="50" value="1" step="1" name="cnt" id="cnt"
						class="form-control" style="width: 100px; display: inline-block;">
						<h5 style="display: inline-block;">개</h5>
						<div class="d-grid gap-2" style="width: 150px; margin-left: auto;">
                <button type="button" class="btn btn-secondary" id="btncart">장바구니에 추가</button>
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
              url: "gift/detailprocess.jsp",
              success: function(){
                  // Confirmation message
                  var a = confirm("장바구니에 저장하였습니다.\n장바구니로 이동하려면 [확인]을 눌려주세요.");
                  if(a){
                      // Redirect to mycart.jsp
                      location.href = "index.jsp?main=gift/cartpay.jsp";
                  }
              }
          });
      });

      </script>

	</div>
</body>
</html>