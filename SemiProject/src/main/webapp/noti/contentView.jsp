
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.NotiDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>상세 페이지</title>
<style type="text/css">
	*{
	font-family: 'Noto Sans KR';
}

  span.aday{
    float: right;
    font-size: 0.8em;
    color: gray;
  }
  
  div.alist{
    margin-left: 20px;
    font-size: 0.8em;
    color: gray;
  }
  
  span.day{
    color: gray;
    font-size: 0.8em;
  }

  span.icon{
   margin-left: 20px;
   color: green;
  }
  

</style>
<script type="text/javascript">
   
   
    
</script>
</head>
<body>
   <jsp:useBean id="dao" class="data.dao.NotiDao"/>
   <%
   String n_num=request.getParameter("n_num");
   String currentPage=request.getParameter("currentPage");
   
   // 조회수 1 증가
   dao.updateReadcount(n_num);
   // dto 가져오기
   NotiDto dto=dao.getData(n_num);
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
   
<div style="margin: 50px 100px; width: 900px;">
   <input type="hidden" id="n_num" value="<%=n_num%>">
   <table class="table table-bordered">
      <caption align="top"><h3><b>
          <%=dto.getN_subject() %>
      </b></h3></caption>
      
      <tr>
        <td>
           <%-- <b>작성자:  <%=dto.getN_writer() %></b><br> --%>
           <span class="day">
               <% 
                  // dto.getN_writeday()가 null이 아닌 경우에만 출력
                  if(dto.getN_writeday() != null) {
                      out.println(sdf.format(dto.getN_writeday()));
                  }
               %>
           </span>
           <%-- &nbsp;&nbsp;조회  <%=dto.getN_readcount() %> --%>
        </td>
      </tr>
      
      <tr height="150">
         <td>
           <%=dto.getN_content().replace("\n", "<br>") %>
         </td>
      </tr>
      
      <tr>
         <td style="float: right;" colspan="2">
         <div>
           <button type="button" class="btn btn-secondary btn-sm" 
           onclick="location.href='index.jsp?main=noti/addForm.jsp'">글쓰기</button>
           <button type="button" class="btn btn-secondary btn-sm" 
           onclick="location.href='index.jsp?main=noti/boardList.jsp'">목록</button>
           <button type="button" class="btn btn-secondary btn-sm" 
           onclick="location.href='index.jsp?main=noti/updateForm.jsp?n_num=<%=n_num%>&currentPage=<%=currentPage%>'">수정</button>
           <button type="button" class="btn btn-secondary btn-sm" 
           onclick="funcdel(<%=n_num%>,<%=currentPage%>)">삭제</button>
           </div>
         </td>
      </tr>
   </table>
</div>
	


</body>
</html>
