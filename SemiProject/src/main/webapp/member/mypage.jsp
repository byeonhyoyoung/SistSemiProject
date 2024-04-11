<%@page import="data.dto.SemiMemberDto"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>My Page</title>
<style type="text/css">
  #mainimg {
        width:120px;
        height:120px;
        margin-top: 30px;
        margin: 0 auto;
  }
  
  .btnUpdate {
    background-color: white; /* transparent background */
    color: gray; /* gray text */
    border: 1px solid gray; /* gray border */
}

.btnUpdate:hover {
    background-color: #eeeeee; /* gray background on hover */
    border: 1px solid gray; /* gray border on hover */
}

</style>
<script type="text/javascript">
$(document).ready(function(){
    $(".btnUpdate").click(function(){
        var num = $(this).data('num');
        $("#updateNum").val(num);
        $("#updatePasswordModal").modal('show');
    });

    $(".btnUpdatePassword").click(function(){
        var num = $("#updateNum").val();
        var pass = $("#updatePass").val();
        location.href = "member/updatepassaction.jsp?num=" + num + "&pass=" + pass;
    });

    $(".btndel").click(function(){
        var num=$("#delnum").val();
        var pass=$("#delpass").val();
        location.href="member/deletemypage.jsp?num="+num+"&pass="+pass;
    });

    $(".btnDelete").click(function(){
        var num = $(this).data('num');
        $("#delnum").val(num);
        $("#myModal").modal('show');
    });
});

</script>
</head>
<%
  SemiMemberDao dao=new SemiMemberDao();
  List<SemiMemberDto> list=dao.getAllMembers();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
  
  String loginok=(String)session.getAttribute("loginok");
  String myid=(String)session.getAttribute("myid");
%>
<body>
    <div  style="margin: 70px auto; width: 800px;">
    <div style="font-size: 15pt;">마이페이지</div>
       <table class="table table-bordered">
         <%
           for(SemiMemberDto dto:list)
           {
             if(loginok!=null && myid.equals(dto.getId())){
           %>
            <tr>
                <td  rowspan="6" align="center" valign="middle" style="width: 130px;">
                   <img src="member/member_image/cherryblossom_logo.png" id="mainimg">
                   
                 
                 
                </td>

                <td style="width: 100px;">회원명</td> <td> <%=dto.getName() %></td>
              </tr>
              
              <tr>
                <td width="100px;">아이디</td> <td width="150px;"><%=dto.getId() %></td>
              </tr>
              <tr>
                <td width="100px;">이메일</td> <td width="150px;"> <%=dto.getEmail() %></td>
              </tr>
              <tr>
                <td width="100px;">핸드폰</td> <td width="150px;"> <%=dto.getHp() %></td>
              </tr>
              <tr>
                <td width="100px;">주소</td> <td width="150px;"> <%=dto.getAddr() %></td>
              </tr>
              <tr>
                <td width="100px;">가입일</td> <td width="150px;"> <%=sdf.format(dto.getGaipday()) %></td>
              </tr>
              
              
              <td colspan="3" align="center">
              
              
                   <button type="button"  class="btn btn-outline-info btnUpdate" data-num="<%=dto.getNum()%>"><i class="bi bi-pencil-square"></i> 수정</button>&nbsp;
                   <button type="button" class="btn btn-outline-danger btnDelete" data-num="<%=dto.getNum()%>"><i class="bi bi-trash3" style="color: red;"></i> 탈퇴</button>
              </td>

           <%}
         %>
        <%  }%>
       </table>
    </div>
    
    <!-- Update Password Modal -->
    <div class="modal fade" id="updatePasswordModal">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">비밀번호 확인</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body d-inline-flex">
            <input type="hidden" id="updateNum">
            <b>비밀번호: </b>
            <input type="password" id="updatePass" class="form-control" style="width: 120px; margin-left: 10px;">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary btnUpdatePassword" data-bs-dismiss="modal">확인</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="myModal">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">삭제확인</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body d-inline-flex">
            <input type="hidden" id="delnum">
            <b>삭제비밀번호: </b>
            <input type="password" id="delpass" class="form-control" style="width: 120px; margin-left: 10px;">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger btndel" data-bs-dismiss="modal">삭제</button>
          </div>
        </div>
      </div>
    </div>
</body>
</html>