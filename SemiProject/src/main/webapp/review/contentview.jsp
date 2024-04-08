<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
		
		var ra_num=$("#r_num").val();
		//alert(r_num);
		$("#btnsend").click(function(){
			var ra_writer=$("#ra_writer").val().trim();
			var ra_content=$("#ra_content").val().trim();
			
			if(ra_writer.trim().length==0){
				alert("닉네임 입력 후 저장해주세요");
				return;
			}
			if(ra_content.trim().length==0){
				alert("댓글 입력 후 저장해주세요");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"reviewanswer/insertanswer.jsp",
				dataType:"html",
				data:{"ra_num":ra_num,"ra_writer":ra_writer,"ra_content":ra_content},
				success:function(){
					//alert("success!!");
					//초기화
					$("#ra_writer").val("");
					$("#ra_content").val("");
					
					list();
				}
			})
		})
		
		//삭제
		$(document).on("click", "i.adel",function(){
			var ra_idx=$(this).attr("ra_idx");
			var a=confirm("정말 삭제하시겠습니까?");
			if(a){
				$.ajax({
					type:"get",
					url:"reviewanswer/deleteanswer.jsp",
					data:{"ra_idx":ra_idx},
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
			ra_idx=$(this).attr("ra_idx");
			//alert(idx);
	
			$.ajax({
				type:"get",
				url:"reviewanswer/jsonupdateform.jsp",
				dataType:"json",
				data:{"ra_idx":ra_idx},
				success:function(res){
					$("#uwriter").val(res.ra_writer);
					$("#ucontent").val(res.ra_content);
				}
			})
			$("#myModal").modal("show");
			
		});
		
		//수정
		$(document).on("click", "#btnupdate",function(){
			
			var ra_writer=$("#uwriter").val();
			var ra_content=$("#ucontent").val();
			//alert(writer+","+content);
			
			$.ajax({
				type:"get",
				url:"reviewanswer/updateanswer.jsp",
				dataType:"html",
				data:{"ra_idx":ra_idx,"ra_writer":ra_writer,"ra_content":ra_content},
				success:function(){
					
					list();
				}
			})
		})
		
		$("span.likes").click(function() {
		    var r_num = $(this).attr("r_num");
		    var c = $(this);
		    
		    if (c.hasClass("liked")) {
		        // 이미 좋아요를 누른 상태이므로 좋아요 취소
		        $.ajax({
		            type: "get",
		            url: "review/decrelikes.jsp",
		            data: { "r_num": r_num },
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
		            url: "review/increlikes.jsp",
		            data: { "r_num": r_num },
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

	function funcdel(r_num, currentPage){
		//alert(r_num+","+currentPage);
		var y=confirm("정말 삭제하시겠습니까?");
		if(y){
			location.href="review/delete.jsp?r_num="+r_num+"&currentPage="+currentPage;			
		}
	}
	
	function list(){
		
		//console.log("list num="+$("#num").val());
		$.ajax({
			type:"get",
			url:"reviewanswer/listanswer.jsp",
			dataType:"json",
			data:{"r_num":$("#r_num").val()},
			success:function(res){
				
				//댓글갯수 출력
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res, function(idx,ele){
					s+="<div>"+ele.ra_writer+": "+ele.ra_content;
					s+="<span class='aday'>"+ele.ra_writeday+"</span>";
					s+="<span class='icon'><i class='bi bi-trash adel' style='color: red; cursor: pointer;' ra_idx='"+ele.ra_idx+"'></i>";
					s+="<i class='bi bi-pencil-square amod' style='color: green; cursor: pointer;' ra_idx='"+ele.ra_idx+"'></i></span>";
					s+="</div>";
				})
				
				$("div.alist").html(s);
			}
		})
	}
</script>
</head>
<%
	String num=request.getParameter("r_num");
	String currentPage=request.getParameter("currentPage");
	ReviewDao dao=new ReviewDao();
	
	//dto 내 데이터 가져오기
	ReviewDto dto=dao.getData(num);
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
				<td style="text-align: center" valign="middle"><%=dto.getR_subject() %></td>
				<td style="text-align: center" valign="middle"><%=dto.getR_writer() %></td>
				<td style="text-align: center" valign="middle"><%=dto.getR_content() %></td>  <!-- .replace("\n", "<br>") --> 
				<td style="text-align: center" valign="middle"><%=sdf.format(dto.getR_writeday()) %></td>
				<td style="text-align: center" valign="middle"><%=dto.getR_readcount() %></td>
			</tr>
			
			<tr>
				<td colspan="5" align="right">
					<span class="likes" style="margin-left: 10px; float: left; cursor: pointer;" r_num=<%=dto.getR_num() %>>
					좋아요 <i class="bi bi-heart" style="color: red"></i></span>
					<span class="likesnum" style="float: left; margin-left: 10px;"><%=dto.getR_likes() %></span>
					<i class="bi bi-heart-fill" style="font-size: 0px; color: red"></i>
					
					<button type="button" class="btn btn-success btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage%>'">목록</button>
					<button type="button" class="btn btn-primary btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=review/addform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-warning btn-sm" name="btnupdate"
					onclick="location.href='index.jsp?main=review/updateform.jsp?r_num=<%=num%>&currentPage=<%=currentPage%>'">수정</button>
					<button type="button" class="btn btn-danger btn-sm" name="btndelete"
					onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
				</td>
			</tr>
			
						<!-- 댓글 -->
			<tr>
				<td colspan="5">
					<b class="acount">댓글<span>0</span></b><br>
					
					<div class="aform d-inline-flex">
						<input type="hidden" id="r_num" value="<%=num%>">
						<input type="text" id="ra_writer" class="form-control" style="width: 100px"
						placeholder="닉네임">
						<input type="text" id="ra_content" class="form-control" style="width: 300px"
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
      	<input type="hidden" id="ra_idx">
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