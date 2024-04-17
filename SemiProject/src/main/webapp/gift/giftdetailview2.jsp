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
<body>
	<!-- partial:index.partial.html -->
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
													<li
														class="sliderBlock_positionControls__paginatorItem sliderBlock_positionControls__active"></li>
													<li class="sliderBlock_positionControls__paginatorItem"></li>

												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="small-12 large-6 columns">
									<div class="productCard_rightSide">


										<p class="block_model">
											<span class="block_model__text">Model: </span> <span
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

												<br>
												<br>
												<br>

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
                                                            <input class="block_quantity__number" name="quantityNumber"
                                                                   type="text" min="1" value="1">
                                                            <button class="block_quantity__button block_quantity__up"></button>
                                                            <button class="block_quantity__button block_quantity__down"></button>
                                                        </div>
														</div>
													</div>
													<div class="large-6 small-12 column end">


														<button type="button" class="button button_addToCard"
															id="btncart">장바구니</button>
														<button type="button" class="btn btn-success"
															onclick="location.href='index.jsp?main=gift/giftmain.jsp'">상품목록</button>

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

	<div class="aboutMe">
		<a href="https://codepen.io/BlackStar1991/pens/public/" target="_new">
			<i class='fa fa-codepen'></i> my other Pens
		</a>
	</div>
	<!-- partial -->
	<script src="gift_detail_design/dist/script.js"></script>

</body>