<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.NotiDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.NotiDao"%>
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
   a:link ,a:visited{
	
	text-decoration: none;
	color: black;
}

   a:hover {
	text-decoration: underline;
	color: gray;
}

	#head{
		font-size: 1.5em;
		color: black;
		text-align: center;
	}
	
	/* .plusbtn{
		text-decoration: none;
		color: green;
		margin-left: 400px;
		border: none !important; /* 테두리 없애기 */
	    box-shadow: none !important; /* 그림자 없애기 */
	    outline: none !important; /* 아웃라인 없애기 */
	    border-color: transparent !important; /* 테두리 색상 투명으로 설정 */
	    background-color: transparent !important; /* 배경색 투명으로 설정 */
	} */
	
	 /* 테이블 오른쪽과 왼쪽 테두리 제거 */
   table.table-bordered {
       border-left: none;
       border-right: none;
   }
   
   table.table-bordered th, table.table-bordered td {
       border-right: none;
       border-left: none;
   }
	
</style>
<script type="text/javascript">
  //head단에서는 $(function)
  $(function(){
	  
	  //전체체크 클릭시 체크값 얻어서 모든체크값에 전달
	  $(".alldelcheck").click(function(){
		  
		  //전체 체크값 얻기(alldelcheck를 this라고하면)
		  var chk=$(this).is(":checked");
		  console.log(chk);
		  
		  //전체체크값을 글앞에 체크에 일괄 전달하기
		  $(".alldel").prop("checked",chk);
	  });
	  
	  //삭제버튼 클릭시 삭제(몇개인지 값 잘 넘어오는지 확인할것)
	  $("#btndel").click(function(){
		  
		  var len=$(".alldel:checked").length;
		  //alert(len); //삭제 갯수 확인
		  
		  if(len==0){
			  alert("최소 1개이상의 글을 선택해 주세요");
		  }else{
			  
			  var a=confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요"); //->체크된것의 val값 읽어야함
			  
			  //체크된 곳의 value값(num(dto.getNum심어놓음))얻기
			  var n=""; //여러개의 value값을 n에 누적시킬것이니까
			  $(".alldel:checked").each(function(idx){
				  n+=$(this).val()+","; //누적시키기..하나가 아니니까 ","
			  });
			  
			  //마지막 컴마 제거
			  n=n.substring(0,n.length-1); //n= 다시 n이 되어야지(잊지말것)
			  console.log(n);
			  
			  //삭제파일로 전송
			  location.href="noti/allDelete.jsp?nums="+n; //num을 보냈는데 여러개야
		  }
	  })
	  
  })
  
  
  

</script>
</head>
<%
NotiDao dao=new NotiDao();

//전체갯수
int totalCount=dao.getTotalCount();
int perPage=10; //한페이지당 보여질 글의 갯수
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
List<NotiDto>list=dao.getList(startNum, perPage);

//List<SimpleBoardDto>list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
//int count=list.size();



%>

<body>
<div style="margin: 50px 100px; width: 900px;">
   
   
   <h6 style="padding-bottom: 25px;" id="head"><b>공지사항</b></h6>
   <table class="table table-bordered">
   	  <caption align="top" style="padding-bottom: 15px;"><b>총 <%=totalCount %>건의 글이 있습니다</b></caption>
      <%-- <caption align="top" style="padding-bottom: 20px;"><b>공지사항</b></caption>
      <h6><b>총 <%=totalCount %>건의 글이 있습니다</b></h6> --%>
      <tr style="text-align: center;" class="table-group-divider">
         <th width="80">번호</th>
         <th width="450">제목</th>
         <!-- <th width="150">작성자</th> -->
         <th width="130">등록일</th>
         <!-- <th width="80">조회수</th> -->
      </tr>
      
      <%
        if(totalCount==0){%>
        	<tr>
        	  <td colspan="4" align="center">
        	    <h6><b>등록된 게시글이 없습니다</b></h6>
        	  </td>
        	</tr>
        <%}else{
        	for(NotiDto dto:list)
        	{%>
        		<tr>
        		  <td align="center">
        		  <input type="checkbox" value="<%=dto.getN_num()%>" class="alldel">&nbsp;&nbsp;
        		  <%=no-- %></td>
        		  <td style="font-family: 'Noto Sans KR';">
        		  
        		  <a href="index.jsp?main=noti/contentView.jsp?n_num=<%=dto.getN_num()%>&currentPage=<%=currentPage%>" >
        		  
        		  <%=dto.getN_subject() %></a>
        		  <!-- <button style="border: none !important; box-shadow: none !important;"><i class="bi bi-plus-lg plusbtn"></i></button> -->
        		  
        		  </td>
        		  <%-- <td align="center"><%=dto.getN_writer() %></td> --%>
        		  <td align="center" style="font-family: 'Noto Sans KR';"><%=sdf.format(dto.getN_writeday()) %></td>
        		  <%-- <td align="center"><%=dto.getN_readcount() %></td> --%>
        		</tr>
        	<%}%>
        	
        	<tr>
			    <td colspan="5">
			        <input type="checkbox" style="margin-left: 22px;" class="alldelcheck"> 전체선택
			        <span style="float: right;">
			            <span style="margin-right: 0px;">
			                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='index.jsp?main=noti/addForm.jsp'">글쓰기</button>
			            </span>
			            <span style="margin-right: 15px;">
			                <button type="button" class="btn btn-secondary btn-sm" id="btndel">삭제</button>&nbsp;
			            </span>
			        </span>
			    </td>
			</tr>
        	
        <%}
      %>
   </table>
</div>

<div style="margin: 50px 100px; width: 800px;">
  <!-- 페이지 번호 출력 -->
  <ul class="pagination justify-content-center">
  <%
  //이전
  if(startPage>1)
  {%>
	  <li class="page-item ">
	   <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
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
    		<a  class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=endPage+1%>"
    		style="color: black;">다음</a>
    	</li>
    <%}
  %>
  
  </ul>
  
  
</div>
</body>
</html>