<%@page import="data.dto.SemiMemberDto"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.QuestionDto"%>
<%@page import="data.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-color: white;
	}
	
	#head{
		font-size: 1.5em;
		color: black;
		padding-top: 50px;
	}
	a:link, a:visited{
		text-decoration: none;
		color: black;
	}
	
	a:hover{
		text-decoration: underline;
		color: gray;
	}
	
	table.table-bordered {
        border-left: none;
        border-right: none;
    }
</style>
<script type="text/javascript">

</script>
</head>
<%
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");

QuestionDao dao=new QuestionDao();

//전체갯수
int totalCount=dao.getTotalCount();
int perPage=5; //한페이지당 보여질 글의 갯수
int perBlock=5; //한블럭당 보여질 페이지 갯수
int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
int startPage; //각블럭당 보여질 시작페이지
int endPage; //각블럭당 보여질 끝페이지
int currentPage;  //현재페이지
int totalPage; //총페이지수
int no; //각페이지당 출력할 시작번호

//현재페이지 읽는데 단 null일경우는 1페이지로 준다
if(request.getParameter("currentPage")==null)
   currentPage=1;
else
   currentPage=Integer.parseInt(request.getParameter("currentPage")); //계산해야하니까 int로 변환

//총페이지수 구한다
//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요) //로직 복사사용하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭당(하단 숫자1 2 3 4 5 6) 보여질 시작페이지
//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가1,끝페이지가 5
//현재가 13일경우 시작:11 끝:15
startPage=(currentPage-1)/perBlock*perBlock+1; //이런 공식이다..
endPage=startPage+perBlock-1;

//총페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
if(endPage>totalPage)
   endPage=totalPage;

//각페이지에서 보여질 시작번호
//1페이지:0, 2페이지:5 3페이지: 10.....
startNum=(currentPage-1)*perPage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
no=totalCount-(currentPage-1)*perPage;

//페이지에서 보여질 글만 가져오기
List<QuestionDto>list=dao.getList(startNum, perPage);

//List<SimpleBoardDto>list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
//int count=list.size();

//컨텐츠 내용 가져오기
String n_num=request.getParameter("n_num");

SemiMemberDao sdao=new SemiMemberDao();
SemiMemberDto sdto=sdao.getMemberById(myid);
%>
<body>
<div style="margin: 0 auto; width: 900px;">
	<h6 id="head"><b>Q & A</b></h6>
	<table class="table table-group-divider">
		<tr>
			<th width="80" style="text-align: center;">No</th>
			<th width="380" style="text-align: center;">제목</th>
			<th width="200" style="text-align: center;">글쓴이</th>
			<th width="200" style="text-align: center;">작성일</th>
			<th width="80" style="text-align: center;">조회</th>
		</tr>
		<%
			if(totalCount==0){%>
				<tr>
					<td colspan="5">
						<h6 style="text-align: center;"><b>등록된 게시글이 없습니다</b></h6>
					</td>
				</tr>
			<%}else{
				for(QuestionDto dto:list){%>
					<tr>
						<td align="center"><%=dto.getQ_num() %></td>
						<td align="center"><a href="index.jsp?main=question/contentView.jsp?q_num=<%=dto.getQ_num()%>&currentPage=<%=currentPage %>">
							<%=dto.getQ_subject() %>
						</a></td>
						<td align="center"><%=dto.getQ_writer() %></td>
						<td align="center"><%=sdf.format(dto.getQ_writeday()) %></td>
						<td align="center"><%=dto.getQ_readcount() %></td>
					</tr>
				<%}				
			}
		%>
	</table>
	<button type="button" class="btn btn-secondary btn-sm" style="float: right;" onclick="location.href='index.jsp?main=question/addForm.jsp'">글쓰기</button>
</div>
<div style="margin: 50px auto; width: 800px; text-align: center;">
  <!-- 페이지 번호 출력 -->
  <ul class="pagination justify-content-center">
  <%
  //이전
  if(startPage>1)
  {%>
     <li class="page-item ">
        <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=startPage-1%>">
        <img src="image/semi/left-arrow-bold.png" style="width: 13px; height: 15px;"></a>
     </li>
  <%}
    for(int pp=startPage;pp<=endPage;pp++)
    {
       if(pp==currentPage)
       {%>
          <li class="page-item active">
          <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
          </li>
       <%}else
       {%>
          <li class="page-item">
          <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
          </li>
       <%}
    }
    
    //다음
    if(endPage<totalPage)
    {%>
       <li class="page-item">
          <a  class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=endPage+1%>">
          <img src="image/semi/right-arrow-bold.png" style="width: 13px; height: 15px;"></a>
       </li>
    <%}
  %>
  </ul>
</div>
</body>
</html>