<%@page import="data.dao.GiftDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   img.photo{
      width: 60px;
      height: 80px;
      border: 2px solid gray;
   }

div.sangpum{cursor: pointer;}
</style>
<script type="text/javascript">
  $(function(){
	  
	  $("#allcheck").click(function(){
		  
		  var chk=$(this).is(":checked");
		  
		  $(".idx").prop("checked",chk);
	  });
	  
	  
	  //상품클릭시 디테일 페이지로 이동
	  $("div.sangpum").click(function(){
		  
		  var shopnum=$(this).attr("shopnum");
		  //alert(shopnum);
		  
		  location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		  
	  });
	  
	//선택한 상품 삭제버튼
	  $("#btncartdel").click(function(){
		  var cnt=$(".idx:checked").length;
		  //alert(cnt);
		  
		  if(cnt==0){
			  alert("먼저 삭제할 상품을 1개이상 선택해 주세요");
			  return;
		  };
		  
		  $(".idx:checked").each(function(i,elt){
			  
			  var idx=$(this).attr("idx");
			 console.log(idx);
			 
			 
			    //선택한 장바구니 상품 모두 삭제하기
			    del(idx);
		  }) ;
		  
		  //현재페이지 새로고침
		  location.reload();
	  });
	  
	  //i태그 한개 삭제이벤트
	  $("i.del").click(function(){
		  var idx=$(this).attr("idx");
		  //alert(idx);
		  
		  var a=confirm("삭제하려면 [확인]을 눌러주세요");
		  if(a){
			  del(idx);
			  location.reload();
		  }
	  })
	  
	  
	  
	  
  })
  
  
  //사용자 함수
  function del(idx)
  {
	  $.ajax({
		  
		  type:"get",
		  url:"gift/cartdelete.jsp",
		  dataType:"html",
		  data:{"idx":idx},
		  success:function(){
			  
		  }
	  })
  }

</script>
</head>
<%
  String id=(String)session.getAttribute("myid");
  GiftDao dao=new GiftDao();
  List<HashMap<String,String>> list=dao.getCartList(id);
  NumberFormat nf=NumberFormat.getInstance();
%>
<body>
<h4 class="alert alert-info" style="width: 1000px;"><%=id %>님의 장바구니</h4>

<table class="table table-striped" style="width: 1000px;">
   <tr>
      <th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
      <th style="width: 200px;">상품정보</th>
      <th style="width: 200px;">상품금액</th>   
      
   </tr>
   
   <%
   int totalmoney=0;
     for(int i=0;i<list.size();i++)
     {
    	 HashMap<String,String> map=list.get(i);
    	 //사진얻기
    	 String g_image_1=map.get("g_image_1");
    	 %>
    	 
    	 <tr>
    	   <td>
    	      <input type="checkbox" name="idx" idx="<%=map.get("idx")%>" class="idx">
    	   </td>
    	   <td>
    	     <div class="sangpum"  g_num="<%=map.get("g_num")%>">
    	        <img alt="" src="gift/image_gift/<%=g_image_1%>" class="photo" align="left" hspace="20">
    	        <b>상품명: <%=map.get("g_name") %></b><br>
    	        <b>갯수: <%=map.get("cnt") %>개</b><br>
    	        <b>가격: <%=map.get("g_price") %>원</b><br>
    	        <b>날짜: <%=map.get("cartday") %></b><br>
    	     </div>
    	   </td>
    	   
    	   <td style="vertical-align: middle;">
    	      <%
    	      
    	       
    	        int g_price=Integer.parseInt(map.get("g_price"));
    	        int cnt=Integer.parseInt(map.get("cnt"));
    	        g_price*=cnt;
    	        totalmoney+=g_price;
    	      %>
    	      
    	      <h6><%=nf.format(g_price) %>원
    	          <i class="bi bi-trash del" idx="<%=map.get("idx")%>" style="color: red; margin-left: 20px;"></i>
    	      </h6>
    	   </td>
    	 </tr>
     <%}
   
   %>
   
   
   <tr>
      <td colspan="3">
        <button type="button" class="btn btn-danger btn-lg"
        style="margin-left: 100px;" id="btncartdel">선택상품삭제</button>
        
        <span style="font-size: 1.5em; float: right;">총주문금액  <b style="color: green;"> <%=nf.format(totalmoney) %>  원</b></span>
      </td>
   </tr>
</table>
</body>
</html>