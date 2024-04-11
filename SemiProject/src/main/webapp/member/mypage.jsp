<%@page import="data.dto.SemiMemberDto"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
  #mainimg{
        width:120px;
        height:120px;
        margin-top: 30px;
        margin: 0 auto;
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

    function delfunc(num){
      $("#delnum").val(num);
      $("#myModal").modal('show');
      $("button.btndel").click(function(){
        var num=$("#delnum").val();
        var pass=$("#delpass").val();
        location.href="member/deletemypage.jsp?num="+num+"&pass="+pass;
      });
    }
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
    <div  style="margin: 200px auto; width: 800px;">
       <table class="table table-bordered">
         <%
           for(SemiMemberDto dto:list)
           {
             if(loginok!=null && myid.equals(dto.getId())){
           %>
            <tr>
                <td rowspan="6" align="center" valign="middle" style="width: 200px;">
                   <img src="member/member_image/cherryblossom_logo.png" id="mainimg">
                </td>
                마이페이지
                <td style="width: 300px;">회원명: <%=dto.getName() %></td>
                <td rowspan="6" style="width: 150px;" align="center" valign="middle">
                    <button type="button" class="btn btn-outline-info btnUpdate" data-num="<%=dto.getNum()%>">수정</button><br><br>
                   <button type="button" class="btn btn-outline-danger" onclick="delfunc('<%=dto.getNum()%>')">탈퇴</button>
                </td>
              </tr>
              <tr>
                <td>아이디: <%=dto.getId() %></td>
              </tr>
              <tr>
                <td>이메일: <%=dto.getEmail() %></td>
              </tr>
              <tr>
                <td>핸드폰: <%=dto.getHp() %></td>
              </tr>
              <tr>
                <td>주소: <%=dto.getAddr() %></td>
              </tr>
              <tr>
                <td>가입일: <%=sdf.format(dto.getGaipday()) %></td>
              </tr>

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
