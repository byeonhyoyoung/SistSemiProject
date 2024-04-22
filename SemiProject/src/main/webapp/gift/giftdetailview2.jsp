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

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Titillium+Web"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto|Roboto+Slab"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="gift_detail_design/dist/style.css">

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

.mainBackground {
	background-image: url('gift/image_gift/gift_background_01.jpg');
	/* Additional background properties */
}

.sliderBlock_positionControls {
	justify-content: center; /* Center align items horizontally */
}

.sliderBlock_items {
	margin-top: 150px;
}

.sliderBlock_controls {
	margin-top: 0 auto;
}

.sliderBlock_controls__navigatin{
margin-top: 0 auto;
}

</style>


<script type="text/javascript">
$(document).ready(function() {
    // Select the input field for quantity
    var quantityInput = $('input[name="cnt"]');

    // Select the up and down buttons
    var upButton = $('.block_quantity__button.block_quantity__up');
    var downButton = $('.block_quantity__button.block_quantity__down');

    // Add click event listener for the up button
    upButton.click(function() {
        // Increment the quantity value
        var currentValue = parseInt(quantityInput.val());
        quantityInput.val(currentValue + 1);
    });

    // Add click event listener for the down button
    downButton.click(function() {
        // Decrement the quantity value if it's greater than 1
        var currentValue = parseInt(quantityInput.val());
        if (currentValue > 1) {
            quantityInput.val(currentValue - 1);
        }
    });
});



</script>



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
<body>
	<!-- partial:index.partial.html -->
	<div style="margin: 0 auto; width: 1100px;">
		<form id="frm">

			  <!-- hidden: 장바구니 db에 넣어야 할것 -->
         <input type="hidden" name="g_num" value="<%=g_num%>">
      	 <input type="hidden" name="num" value="<%=num%>" >	


			<main class="main">
				<div class="mainWrapper">
					<div class="mainBackground clearfix">
						<div class="row">
							<div class="column small-centered">
								<div class="productCard_block">
									<div class="row">
										<div class="small-12 large-6 columns">
											<div class="productCard_leftSide clearfix">


												<div class="sliderBlock">
													<ul class="sliderBlock_items">
														<li
															class="sliderBlock_items__itemPhoto sliderBlock_items__showing">
															<img src="gift/image_gift/<%=dto.getG_image_1()%>">
														</li>
														<li class="sliderBlock_items__itemPhoto"><img
															src="gift/image_gift/<%=dto.getG_image_2()%>"></li>

													</ul>


													<div class="sliderBlock_controls">
														<div class="sliderBlock_controls__navigatin">
															<div class="sliderBlock_controls__wrapper">
																<div
																	class="sliderBlock_controls__arrow sliderBlock_controls__arrowBackward">
																	<i class="fa fa-angle-left" aria-hidden="true"></i>
																</div>


																<div
																	class="sliderBlock_controls__arrow sliderBlock_controls__arrowForward">
																	<i class="fa fa-angle-right" aria-hidden="true"></i>
																</div>
															</div>
														</div>

														<ul class="sliderBlock_positionControls">
															<li class="sliderBlock_positionControls__paginatorItem sliderBlock_positionControls__active"></li>
															<li class="sliderBlock_positionControls__paginatorItem"></li>
															<li class="sliderBlock_positionControls__paginatorItem"></li>
															<li class="sliderBlock_positionControls__paginatorItem"></li>
															<li class="sliderBlock_positionControls__paginatorItem"></li>

														</ul>
													</div>

												</div>
											</div>
										</div>
										<div class="small-12 large-6 columns">
											<div class="productCard_rightSide">


												<p class="block_model">
													<span class="block_model__text">No: </span> <span
														class="block_model__number"><%=dto.getG_num() %></span>
												</p>

												<div class="block_product">
													<h2 class="block_name block_name__mainName"><%=dto.getG_name() %></h2>
													<!-- <h2 class="block_name block_name__addName"><%=dto.getG_name() %></h2>-->

													<p class="block_product__advantagesProduct">
														<%=dto.getG_subject() %>
													</p>

													<div class="block_informationAboutDevice">



														<div class="block_descriptionInformation">
															<span> <%=dto.getG_content() %>
															</span>
														</div>

														<br> <br> <br>

														<div class="row ">
															<div class="large-6 small-12 column left-align">
																<div class="block_price">
																	<p class="block_price__currency"><%=nf.format(Integer.parseInt(dto.getG_price())*1.15) %></p>
																	<p class="block_price__shipping">Shipping and taxes
																		extra</p>
																</div>
																<div class="block_quantity clearfix">
																	<span class="text_specification">Quantity</span>
																	<div class="block_quantity__chooseBlock">
																		<input class="block_quantity__number" name="cnt"
																			type="text" min="1" value="1">
																		<button id="btn_left"
																			class="block_quantity__button block_quantity__up"></button>
																		<button id="btn_right"
																			class="block_quantity__button block_quantity__down"></button>
																	</div>
																</div>
															</div>
															<div class="large-6 small-12 column end">
																<button type="button" class="button button_addToCard"
																	onclick="location.href='index.jsp?main=gift/giftmain.jsp'">상품목록</button>


																<br>
																<button type="button" class="button button_addToCard"
																	id="btncart">장바구니</button>

															</div>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</main>
		</form>
	</div>
	<!-- partial -->
	<script src="gift_detail_design/dist/script.js"></script>

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
                      location.href = "index.jsp?main=gift/mycart.jsp";
                  }
              }
          });
      });

      </script>

</body>
</html>