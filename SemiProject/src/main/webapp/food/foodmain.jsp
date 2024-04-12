<%@page import="data.dto.FoodDto"%>
<%@page import="data.dao.FoodDao"%>
<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   img.photo{
   
   width: 400px;
   height: 230px;
   border: 0px solid gray;
   margin-bottom: 10px;
   }
   
   .shoptable{
      padding: 10px;
      height: 150px;
      
   }
   
      a.goDetail{
   
   text-decoration: none;
   color: black;
}

   a:hover {
   text-decoration: underline;
   color: gray;
}
</style>
<script type="text/javascript">
  $(function(){
     
     
     $("a.goDetail").click(function(){
        var f_num=$(this).attr("f_num");
        alert(f_num);
        
        //디테일 페이지로 이동
        location.href="index.jsp?main=food/fooddetailview.jsp?f_num="+f_num;
     })
  });

</script>
</head>
<%
 
  FoodDao dao=new FoodDao();
  List<FoodDto> list=dao.getAllFoods();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  

%>
<body>
<div class="container mt-3">
  
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-total" style="text-decoration: none; color:gray;">전체</a>
    </li>

    
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="tabs-total" class="container tab-pane active"><br>
      <h3>전체</h3>
      <p>
        <table class="shoptable table " style="width: 500px;">
           <tr>
              <%
                 int i=0;
                for(FoodDto dto: list)
                {
                   
                   %>
                   <td>
                   
                     <a f_num="<%=dto.getF_num()%>" style="cursor: pointer;" class="goDetail">
                        <img alt="" src="food/image_food/<%=dto.getF_image()%>" class="photo">
                        
                        <br>
                        <%=dto.getF_subject_k() %><br></a>
                        
                   </td>
                   
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                   
                    i++;
                   %>
                <%}
              %>
           </tr> 
        
        </table>
      
      </p>
    </div>
    
 
    
   
    
  </div>
</div>
</body>
</html>