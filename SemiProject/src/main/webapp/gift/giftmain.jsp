<%@page import="data.dto.GiftDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.GiftDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Popular Products Section Using HTML , CSS , Bootstrap</title>
  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'>
<link rel="stylesheet" href="gift_menu_design/dist/style.css">

</head>





<%
   GiftDao dao=new GiftDao();
   List<GiftDto> list=dao.getAllGifts();
   NumberFormat nf=NumberFormat.getCurrencyInstance();
%>

<style type="text/css">

.section-products #product-1 .part-1::before {
    

      transition: all 0.3s;
}

</style>

<body>
<!-- partial:index.partial.html -->
<section class="section-products">
      <div class="container">
            <div class="row justify-content-center text-center">
                  <div class="col-md-8 col-lg-6">
                        <div class="header">
                              <h3>Featured Product</h3>
                              <h2>Popular Products</h2>
                        </div>
                  </div>
            </div>
            <div class="row">
            <%
                  for(GiftDto dto: list){%>
            
                  <!-- Single Product -->
                  <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-1" class="single-product">
                              <div class="part-1" style="background-image: url('gift/image_gift/<%=dto.getG_image_1()%>'); background-size: cover; background-position: center; width: 100%; height: 250px;">

                              <span class="discount">15% off</span>
                                    <ul>
                                          <li><a href="index.jsp?main=gift/cartpay.jsp?g_num=<%=dto.getG_num()%>"><i class="fas fa-shopping-cart"></i></a></li>
                                          <li><a href="#"><i class="fas fa-heart"></i></a></li>
                                          <li><a href="index.jsp?main=gift/giftdetailview.jsp?g_num=<%=dto.getG_num()%>"><i class="fas fa-expand"></i></a></li>
                                          <li><a href="#"><i class="fas fa-plus"></i></a></li>
                                    </ul>
                              </div>
                              <div class="part-2">
                                    <h3 class="product-title"><%=dto.getG_name() %></h3>
                                    <h4 class="product-old-price"><%=nf.format(Integer.parseInt(dto.getG_price())*1.15) %></h4>
                                    <h4 class="product-price"><%=nf.format(Integer.parseInt(dto.getG_price())*1.0) %></h4>
                              </div>
                        </div>
                  </div>
                  
                   <%}%>
                  
            </div>
      </div>
</section>
<!-- partial -->
  
</body>
</html>