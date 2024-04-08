<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	//프로젝트의 경로
	String root=request.getContextPath();

	String r_num=request.getParameter("r_num");
	String currentPage=request.getParameter("currentPage");
	ReviewDao dao=new ReviewDao();
	ReviewDto dto=dao.getData(r_num);
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
</head>
<body>
<form action="review/updateaction.jsp" method="post">

	<!-- hidden 넘겨주기(받은거 그대로 가져오기) -->
	<input type="hidden" name="r_num" value="<%=r_num%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
	
	<table style="width: 800px;margin: 0 auto;" class="table table-bordered">
		<caption align="top"><b>후기게시판 수정</b></caption>
		<tr>
			<th width="100" class="table-light" valign="middle">작성자</th>
			<td>
				<input type="text" name="r_writer" class="form-control"
				required="required" style="width: 130px;" value="<%=dto.getR_writer()%>">
			</td>
		</tr>
		<tr>
			<th width="100" class="table-light" valign="middle">제목</th>
			<td>
				<input type="text" name="r_subject" class="form-control"
				required="required" style="width: 500px;" value="<%=dto.getR_subject()%>">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea name="r_content" id="r_content"		
					required="required"			
					style="width: 100%;height: 300px;display: none;"><%=dto.getR_content() %></textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-outline-warning"
					style="width: 120px;"
					onclick="submitContents(this)">DB수정</button>
				
				<button type="button" class="btn btn-outline-success"
					style="width: 120px;"
					onclick="location.href='index.jsp?main=review/reviewlist.jsp'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "r_content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["r_content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

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
    oEditors.getById["r_content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>