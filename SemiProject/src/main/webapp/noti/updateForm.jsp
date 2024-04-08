<%@page import="data.dto.NotiDto"%>
<%@page import="data.dao.NotiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
	//프로젝트의 경로
	String root=request.getContextPath();
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
</head>
<%
  String n_num=request.getParameter("n_num");
  String currentPage=request.getParameter("currentPage");
  
  NotiDao dao=new NotiDao();
  NotiDto dto=dao.getData(n_num);
%>


<body>

<form action="noti/updateAction.jsp" method="post">
	 <!-- hidden으로 넘겨줄것 2개있음 -->
     <input type="hidden" name="n_num" value="<%=n_num%>">
     <input type="hidden" name="currentPage" value="<%=currentPage%>">
	<table style="width: 800px;margin-left: 100px;" class="table table-bordered">
		<caption align="top" style="padding: 20px 0 20px 0;"><b>공지사항 수정</b></caption>
		
		
		<%-- <tr>
		  <th width="100" class="table-light">작성자</th>
		  <td>
		    <input type="text" name="writer" class="form-control"
		    required="required" style="width: 130px;"
		    value="<%=dto.getN_writer()%>">
		  </td>
		</tr> --%>
		
		<tr>
		  <th width="100" class="table-light">제목</th>
		  <td>
		    <input type="text" name="n_subject" class="form-control"
		    required="required" style="width: 500px;"
		    value="<%=dto.getN_subject()%>">
		  </td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea name="n_content" id="n_content"		
					required="required"			
					style="width: 100%;height: 300px; display: none;">
					<%=dto.getN_content() %>
					</textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-secondary btn-sm"
					style="width: 100px;"
					onclick="submitContents(this)" >수정</button>
				
				<button type="button" class="btn btn-secondary btn-sm"
					style="width: 100px;"
					onclick="location.href='index.jsp?main=noti/boardList.jsp'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "n_content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["n_content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["n_content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>