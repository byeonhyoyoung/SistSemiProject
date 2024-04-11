<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.QuestionDto"%>
<%@page import="data.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
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
	
	span.icon{
		margin-left: 30px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//처음 시작 시 댓글 호출
		list();
		
		var qa_num=$("#q_num").val();
		//alert(q_num);
		$("#btnsend").click(function(){
			var qa_writer=$("#qa_writer").val().trim();
			var qa_content=$("#qa_content").val().trim();
			
			if(qa_writer.trim().length==0){
				alert("닉네임 입력 후 저장해주세요");
				return;
			}
			if(qa_content.trim().length==0){
				alert("댓글 입력 후 저장해주세요");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"questionanswer/insertAnswer.jsp",
				dataType:"html",
				data:{"qa_num":qa_num,"qa_writer":qa_writer,"qa_content":qa_content},
				success:function(){
					alert("success!!");
					//초기화
					$("#qa_writer").val("");
					$("#qa_content").val("");
					
					list();
				}
			})
		})
		
		//삭제
		$(document).on("click", "i.adel",function(){
			var qa_idx=$(this).attr("qa_idx");
			var a=confirm("정말 삭제하시겠습니까?");
			if(a){
				$.ajax({
					type:"get",
					url:"questionanswer/deleteAnswer.jsp",
					data:{"qa_idx":qa_idx},
					dataType:"html",
					success:function(){
						swal("삭제 성공!", "삭제가 성공했어요", "success");
						list();
					}
				})
			}
		})
		
		//수정폼에 데이터 띄우기
		$(document).on("click", "i.amod",function(){
			qa_idx=$(this).attr("qa_idx");
			//alert(idx);
	
			$.ajax({
				type:"get",
				url:"questionanswer/jsonupDateForm.jsp",
				dataType:"json",
				data:{"qa_idx":qa_idx},
				success:function(res){
					$("#uwriter").val(res.qa_writer);
					$("#ucontent").val(res.qa_content);
				}
			})
			$("#myModal").modal("show");
			
		});
		
		//수정
		$(document).on("click", "#btnupdate",function(){
			
			var qa_writer=$("#uwriter").val(); 
			var qa_content=$("#ucontent").val();
			//alert(writer+","+content);
			
			$.ajax({
				type:"get",
				url:"questionanswer/updateAnswer.jsp",
				dataType:"html",
				data:{"qa_idx":qa_idx,"qa_writer":qa_writer,"qa_content":qa_content},
				success:function(){
					
					list();
				}
			})
		})
		
		$("span.likes").click(function() {
		    var q_num = $(this).attr("q_num");
		    var c = $(this);
		    
		    if (c.hasClass("liked")) {
		        // 이미 좋아요를 누른 상태이므로 좋아요 취소
		        $.ajax({
		            type: "get",
		            url: "qusetion/decreLikes.jsp",
		            data: { "q_num": q_num },
		            dataType: "json",
		            success: function(res) {
		                c.removeClass("liked");
		                c.find("i.bi-heart-fill").removeClass("bi-heart-fill").addClass("bi-heart");
		                c.next().text(res.likes);
		            }
		        });
		    } else {
		        // 좋아요를 누르지 않은 상태이므로 좋아요 추가
		        $.ajax({
		            type: "get",
		            url: "qusetion/increLikes.jsp",
		            data: { "q_num": q_num },
		            dataType: "json",
		            success: function(res) {
		                c.addClass("liked");
		                c.find("i.bi-heart").removeClass("bi-heart").addClass("bi-heart-fill");
		                c.next().text(res.likes);
		            }
		        });
		    }
		});
		
	})

	function funcdel(q_num, currentPage){
		//alert(q_num+","+currentPage);
		var y=confirm("정말 삭제하시겠습니까?");
		if(y){
			location.href="question/delete.jsp?q_num="+q_num+"&currentPage="+currentPage;			
		}
	}
	
	function list(){
		
		//console.log("list num="+$("#num").val());
		$.ajax({
			type:"get",
			url:"questionanswer/listAnswer.jsp",
			dataType:"json",
			data:{"q_num":$("#q_num").val()},
			success:function(res){
				
				//댓글갯수 출력
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res, function(idx,ele){
					s+="<div>"+ele.qa_writer+": "+ele.qa_content;
					s+="<span class='aday'>"+ele.qa_writeday+"</span>";
					s+="<span class='icon'><i class='bi bi-trash adel' style='color: red; cursor: pointer;' qa_idx='"+ele.qa_idx+"'></i>";
					s+="<i class='bi bi-pencil-square amod' style='color: green; cursor: pointer;' qa_idx='"+ele.qa_idx+"'></i></span>";
					s+="</div>";
				})
				
				$("div.alist").html(s);
			}
		})
	}
</script>
</head>
<%
	String num=request.getParameter("q_num");
	String currentPage=request.getParameter("currentPage");
	QuestionDao dao=new QuestionDao();
	
	//dto 내 데이터 가져오기
	QuestionDto dto=dao.getData(num);
	//조회수 1증가
	dao.updateReadcount(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<div style="margin: 0 auto; width: 1200px;">
	<form action="">
		<table class="table table-bordered">
			<caption align="top"><b>상세페이지</b></caption>
			<tr class="table-dark" style="text-align: center">
				<th width="100"><b>제목</b></th>
				<th width="80"><b>작성자</b></th>
				<th width="400"><b>내용</b></th>
				<th width="80"><b>작성일</b></th>
				<th width="60"><b>조회수</b></th>				
			</tr>
				
			<tr style="font-size: 12pt;">
				<td style="text-align: center" valign="middle"><%=dto.getQ_subject() %></td>
				<td style="text-align: center" valign="middle"><%=dto.getQ_writer() %></td>
				<td style="text-align: center" valign="middle"><%=dto.getQ_content() %></td>
				<td style="text-align: center" valign="middle"><%=sdf.format(dto.getQ_writeday()) %></td>
				<td style="text-align: center" valign="middle"><%=dto.getQ_readcount() %></td>
			</tr>
			
			<tr>
				<td colspan="5" align="right">
					<span class="likes" style="margin-left: 10px; float: left; cursor: pointer;" q_num=<%=dto.getQ_num() %>>
					좋아요 <i class="bi bi-heart" style="color: red"></i></span>
					<span class="likesnum" style="float: left; margin-left: 10px;"><%=dto.getQ_likes() %></span>
					<i class="bi bi-heart-fill" style="font-size: 0px; color: red"></i>
					
					<button type="button" class="btn btn-success btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=question/questionList.jsp?currentPage=<%=currentPage%>'">목록</button>
					<button type="button" class="btn btn-primary btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=questio/addForm.jsp'">글쓰기</button>
					<button type="button" class="btn btn-warning btn-sm" name="btnupdate"
					onclick="location.href='index.jsp?main=question/updateForm.jsp?q_num=<%=num%>&currentPage=<%=currentPage%>'">수정</button>
					<button type="button" class="btn btn-danger btn-sm" name="btndelete"
					onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
				</td>
			</tr>
			
						<!-- 댓글 -->
			<tr>
				<td colspan="5">
					<b class="acount">댓글<span>0</span></b><br>
					
					<div class="aform d-inline-flex">
						<input type="hidden" id="q_num" value="<%=num%>">
						<input type="text" id="qa_writer" class="form-control" style="width: 100px"
						placeholder="닉네임">
						<input type="text" id="qa_content" class="form-control" style="width: 300px"
						placeholder="댓글메세지">
						<button type="button" id="btnsend" class="btn btn-primary">저장</button>
					</div>
					
					<div class="alist">
						댓글목록
					</div>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<input type="hidden" id="qa_idx">
        <input type="text" id="uwriter" style="width: 100px;" placeholder="닉네임">
        <input type="text" id="ucontent" style="width: 300px;" placeholder="댓글내용">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-bs-dismiss="modal"
        id="btnupdate">댓글 수정</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>