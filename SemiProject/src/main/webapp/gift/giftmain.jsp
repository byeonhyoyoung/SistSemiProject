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

*{
	font-family: 'Noto Sans KR';
}

.section-products #product-1 .part-1::before {

      transition: all 0.3s;
}




/* 팝업 스타일 */
.modal {
  display: none; /* 기본적으로 숨김 상태 */
  position: fixed; 
  z-index: 1; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgba(0,0,0,0.5); /* 배경색과 투명도 조절 */
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto; 
  padding: 20px;
  border: 1px solid #888;
  width: 80%; 
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}


</style>

<script type="text/javascript">

//페이지가 로드될 때 실행되는 함수
window.onload = function() {
  // 팝업 창 요소를 가져옴
  var modal = document.getElementById("myModal");
  // 팝업을 나타내는 요소를 가져옴
  var span = document.getElementsByClassName("close")[0];

  // 페이지 로드 후 0.1초 뒤에 팝업 창 표시
  setTimeout(function(){
    modal.style.display = "block";
  }, 100);

  // 사용자가 팝업을 닫기 위해 x 버튼을 클릭할 때
  span.onclick = function() {
    modal.style.display = "none";
  }

  // 사용자가 팝업 외부를 클릭하여 팝업을 닫을 때
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}



</script>



<body>
<!-- partial:index.partial.html -->
<section class="section-products">
      <div class="container">
            <div class="row justify-content-center text-center">
                  <div class="col-md-8 col-lg-6">
                        <div class="header">
                              <h3>Kyoto Product</h3>
                              <h2>Store</h2>
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
                                          <li><a href="index.jsp?main=gift/giftdetailview.jsp?g_num=<%=dto.getG_num()%>"><i class="fas fa-plus"></i></a></li>
                                            <li><a href="#"><i class="fas fa-expand"></i></a></li>
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


<!-- 팝업 창 -->
<div id="myModal" class="modal">

  <div class="modal-content" style="width: 500px;">
    <span class="close">&times;</span>
    <img alt="popup_pink" src="gift/image_gift/popup_pink.PNG">
  </div>
</div>


  
</body>
</html>